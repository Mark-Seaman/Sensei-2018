from django import forms
from django.forms import Form
from django.views.generic import FormView, ListView, TemplateView, UpdateView
from django.utils.timezone import now

from tool.document import domain_doc, doc_html_text

from .models import Review, Student, UrlGame
from .review import count_score, get_review, review_feedback, student_reviews, student_reviews_done
from .sensei import course_lessons, schedule, slides_markdown
from .student import site_settings, student, student_totals, students, register_user_domain
from .urlgame import generate_url_question


class GuideDoc(TemplateView):
    template_name = 'guide_doc.html'

    def get_context_data(self, **kwargs):
        title = self.kwargs.get('title')
        return site_settings(title=title, doc='guide')


class UncDocDisplay(TemplateView):
    template_name = 'unc_doc.html'

    def get_context_data(self, **kwargs):
        title = self.kwargs.get('title')
        course = title[:7]
        lessons = course_lessons(course, title)
        doc = domain_doc(self.request.get_host(), 'unc/' + title)
        title = 'Lesson %s' % title[-2:] if title[-3:-2] == '/' else 'UNC BACS %s' % course[-3:]
        text = doc_html_text(doc, '/static/images/unc/%s' % course)
        return site_settings(title=title, text=text, lessons=lessons)


class UncEditReview(UpdateView):
    model = Review
    fields = ['requirement_1', 'requirement_2', 'requirement_3', 'requirement_4', 'requirement_5',
              'requirement_6', 'requirement_7', 'requirement_8', 'requirement_9', 'requirement_10', 'notes']
    template_name = 'unc_review.html'

    def get_context_data(self, **kwargs):
        pk = self.kwargs.get('pk')
        review = get_review(pk)
        requirements = review.requirement_labels.labels.split('\n')
        kwargs = dict(title='Design Review', requirements=requirements)
        return super(UncEditReview, self).get_context_data(**kwargs)

    def form_valid(self, form):
        self.object.score = count_score(self.object)
        self.object.date = now()
        return super(UncEditReview, self).form_valid(form)

    def get_success_url(self):
        student_id = self.object.reviewer.pk
        return '/unc/student/%s' % student_id


class UncReviewFeedback(TemplateView):
    template_name = 'unc_feedback.html'

    def get_context_data(self, **kwargs):
        pk = self.kwargs.get('pk')
        review = get_review(pk)
        requirements = review.requirement_labels.labels.split('\n')
        title = 'Design Review Feedback'
        return site_settings(title=title, review=review, requirements=requirements)


class UncReading(TemplateView):
    template_name = 'unc_reading.html'

    def get_context_data(self, **kwargs):
        return site_settings(title='Reading Scores', students=student_totals())


class UncRegister(FormView):
    class EditDocForm(Form):
        name = forms.CharField()
        email = forms.CharField()
        password = forms.CharField()
        domain = forms.CharField()

    form_class = EditDocForm
    template_name = 'unc_register.html'
    success_url = '/unc/registered'

    def form_valid(self, form):
        name = form.data.get('name')
        email = form.data.get('email')
        password = form.data.get('password')
        domain = form.data.get('domain')
        register_user_domain(name, email, password, domain)
        return super(UncRegister, self).form_valid(form)


class UncRegistered(ListView):
    template_name = 'unc_registered.html'
    model = Student

    def get_context_data(self, **kwargs):
        students = Student.objects.all().order_by('email')
        return site_settings(title='BACS 200 - Registered Domains', students=students)


class UncReviews(TemplateView):
    template_name = 'unc_reviews.html'

    def get_context_data(self, **kwargs):
        reviews = [(s, Review.objects.filter(reviewer=s.pk)) for s in students()]
        designers = [(s, review_feedback(s.pk)) for s in students()]
        return site_settings(title='Design Reviews', reviews=reviews, designers=designers)


class UncSchedule(TemplateView):
    template_name = 'unc_schedule.html'

    def get_context_data(self, **kwargs):
        return site_settings(title='BACS 200 Schedule', schedule=schedule())


class UncSlidesDisplay(TemplateView):
    template_name = 'unc_slides.html'

    def get_context_data(self, **kwargs):
        title = self.kwargs.get('title')
        text = slides_markdown(title)
        return site_settings(title=title, markdown=text)


class UncStudent(TemplateView):
    template_name = 'unc_student.html'

    def get_context_data(self, **kwargs):
        student_id = self.kwargs.get('id')
        s = Student.objects.get(pk=student_id)
        game = UrlGame.objects.get(student=s)
        reviews = student_reviews(student_id)
        done = student_reviews_done(student_id)
        feedback = review_feedback(student_id)
        title = 'Student Dashboard'
        return site_settings(title=title, student=student(student_id), game=game,
                             reviews=reviews, feedback=feedback, done=done)


class UncUrlGameAnswer(FormView):

    class UrlForm(Form):
        answer = forms.CharField()
        url = forms.CharField()
        url_type = forms.CharField()
        page = forms.CharField()
        correct = forms.CharField()
        answered = forms.IntegerField()
        left = forms.IntegerField()

    form_class = UrlForm
    template_name = 'unc_urlgame.html'

    def get_context_data(self, **kwargs):
        id = self.kwargs.get('id', '1')
        student = Student.objects.get(pk=id)
        game = UrlGame.objects.get(student=student)
        title = 'URL Crusher - Answer'

        self.answer = self.request.GET.get('answer', "None")
        self.page = self.request.GET.get('page', "None")
        self.url = self.request.GET.get('url', "None")
        self.url_type = self.request.GET.get('url_type', "None")
        self.correct = self.request.GET.get('correct', 'None')
        self.iscorrect = (self.request.GET.get('iscorrect') == u'True')
        self.image = self.request.GET.get('image')

        answer = dict(answer=self.answer, url=self.url, correct=self.correct, image=self.image,
                      page=self.page, url_type=self.url_type, iscorrect=self.iscorrect)
        return site_settings(title=title, student=student, a=answer, answered=game.answered, left=game.left)

    def form_valid(self, form):
        id = self.kwargs.get('id', '1')
        student = Student.objects.get(pk=id)
        game = UrlGame.objects.get(student=student)

        self.url = form.data.get('url')
        self.answer = form.data.get('answer')
        self.correct = form.data.get('correct')
        self.page = form.data.get('page')
        self.url_type = form.data.get('url_type')

        self.iscorrect = (self.correct == self.answer)
        if self.iscorrect:
            game.left = game.left - 1
        else:
            game.left = 10
        game.answered = game.answered + 1
        game.save()

        return super(UncUrlGameAnswer, self).form_valid(form)

    def get_success_url(self):
        id = self.kwargs.get('id', '1')
        student = Student.objects.get(pk=id)
        game = UrlGame.objects.get(student=student)
        if game.left < 1:
            return '/unc/url-game-done/%s' % id
        else:
            parms = '&'.join([
                "answer=%s" % self.answer,
                "url=%s" % self.url,
                "correct=%s" % self.correct,
                "page=%s" % self.page,
                "url_type=%s" % self.url_type,
                "image=%s" % url_feedback(self.answer, self.correct),
                "iscorrect=%s" % self.iscorrect,
            ])
            return '/unc/url-answer/%s?%s' % (id, parms)


def url_feedback(answer, correct):
    if answer == correct:
        return 'smiley1.jpg'
    else:
        return 'sad1.jpg'


class UncUrlGameQuestion(TemplateView):
    template_name = 'unc_urlgame.html'

    def get_context_data(self, **kwargs):
        id = self.kwargs.get('id', '1')
        student = Student.objects.get(pk=id)
        game = UrlGame.objects.get(student=student)
        title = 'URL Crusher - Question'
        return site_settings(title=title, student=student, q=generate_url_question(), answered=game.answered, left=game.left)


class UncUrlGameDone(TemplateView):
    template_name = 'unc_urlgame_done.html'

    def get_context_data(self, **kwargs):
        id = self.kwargs.get('id', '1')
        student = Student.objects.get(pk=id)
        game = UrlGame.objects.get(student=student)
        title = 'URL Crusher'
        return site_settings(title=title, student=student, answered=game.answered, left=game.left)
