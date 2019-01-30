from django import forms
from django.forms import Form
from django.views.generic import FormView, ListView, TemplateView, UpdateView
from django.utils.timezone import now

from tool.document import domain_doc, doc_html_text

from .models import Review, Student
from .review import count_score, get_review, review_feedback, student_reviews, student_reviews_done
from .sensei import course_lessons, slides_markdown
from .student import student_scores, site_settings, student, student_totals, students, register_user_domain
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
        title = 'Lesson %s' % title[-2:] if title[-3:-2]=='/' else 'UNC BACS %s' % course[-3:]
        text = doc_html_text(doc, '/static/images/unc/%s' % course)
        return site_settings(title=title, text=text, lessons=lessons)


class UncEditReview(UpdateView):
    model = Review
    fields = ['requirement_1', 'requirement_2', 'requirement_3', 'requirement_4', 'requirement_5',
              'requirement_6', 'requirement_7', 'requirement_8', 'requirement_9', 'requirement_10', 'notes']
    template_name = 'unc_review.html'

    def get_context_data(self, **kwargs):
        kwargs = dict(title='Design Review', requirements = requirements())
        return super(UncEditReview, self).get_context_data(**kwargs)

    def form_valid(self, form):
        self.object.score = count_score(self.object)
        self.object.date = now()
        return super(UncEditReview, self).form_valid(form)

    def get_success_url(self):
        student_id = self.object.reviewer.pk
        return '/unc/student/%s' % student_id
        # return '/unc/reviews'


def requirements():
    return '''Page appears at correct URL, "bacs200/inspire.html"
WordPress blog is still visible at the top of the domain
Article describes an inspirational figure
Users can follow a hyperlink to learn more
Writing is compelling and well thought out
Technical Requirements
Title is set properly on the browser tab
Page has appropriate headline
Image is properly displayed
Text content is properly formatted
Page contains valid HTML'''.split('\n')


class UncReviewFeedback(TemplateView):
    template_name = 'unc_feedback.html'

    def get_context_data(self, **kwargs):
        pk = kwargs.get('pk')
        review = get_review(pk)
        title = 'Design Review Feedback'
        return site_settings(title=title, review=review, requirements=requirements())


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
        # reviews = Review.objects.filter(score=-1)
        # designers = Review.objects.exclude(score=-1)
        reviews = [(s, student_reviews_done(s.pk)) for s in students()]
        designers = [(s, review_feedback(s.pk)) for s in students()]
        return site_settings(title='Design Reviews', reviews=reviews, designers=designers)


class UncSlidesDisplay(TemplateView):
    template_name = 'unc_slides.html'

    def get_context_data(self, **kwargs):
        title = self.kwargs.get('title')
        text = slides_markdown(title)
        return site_settings(title=title, markdown=text)


class UncStudent(TemplateView):
    template_name = 'unc_student.html'

    def get_context_data(self, **kwargs):
        student_id  = self.kwargs.get('id')
        title       = 'Student Dashboard'
        reading     = student_scores(student_id)
        reviews     = student_reviews(student_id)
        done        = student_reviews_done(student_id)
        feedback    = review_feedback(student_id)
        return site_settings(title=title, student=student(student_id), reading=reading,
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
        title = 'URL Crusher - Answer'
        self.answer = self.request.GET.get('answer', "None")
        self.answered = self.request.GET.get('answered', "0")
        self.left = self.request.GET.get('left', "10")
        self.page = self.request.GET.get('page', "None")
        self.url = self.request.GET.get('url', "None")
        self.url_type = self.request.GET.get('url_type', "None")
        self.correct = self.request.GET.get('correct','None')
        self.image = self.request.GET.get('image')
        answer = dict(answer=self.answer, url=self.url, correct=self.correct, image=self.image,
                      page=self.page, url_type=self.url_type)
        return site_settings(title=title, a=answer,
                             answered=self.answered, left=self.left)

    def form_valid(self, form):
        self.url = form.data.get('url')
        self.answer = form.data.get('answer')
        self.answered = form.data.get('answered')
        self.left = form.data.get('left')
        self.correct = form.data.get('correct')
        self.page = form.data.get('page')
        self.url_type = form.data.get('url_type')
        self.answered = str(int(self.answered) + 1)
        if self.correct == self.url:
            self.left = str(int(self.left) - 1)
        else:
            self.left = '10'
        return super(UncUrlGameAnswer, self).form_valid(form)

    def get_success_url(self):
        parms = '&'.join([
            "answer=%s"  % self.answer,
            "answered=%s"  % self.answered,
            "left=%s" % self.left,
            "url=%s" % self.url,
            "correct=%s" % self.correct,
            "page=%s" % self.page,
            "url_type=%s" % self.url_type,
            "image=%s" % url_feedback(self.answer, self.correct),
        ])
        return '/unc/url-answer?%s' % parms


def url_feedback(answer, correct):
    if answer == correct:
        return 'smiley1.jpg'
    else:
        return 'sad1.jpg'


class UncUrlGameQuestion(FormView):
    class UrlForm(Form):
        url = forms.CharField()
        correct = forms.CharField()
        answered = forms.IntegerField()
        left = forms.IntegerField()

    form_class = UrlForm
    template_name = 'unc_urlgame.html'

    def get_context_data(self, **kwargs):
        title = 'URL Crusher - Question'
        self.answered = self.request.GET.get('answered', "0")
        self.left = self.request.GET.get('left', "10")
        return site_settings(title=title, q=generate_url_question(), url='google.com', answered=self.answered, left=self.left)

    def form_valid(self, form):
        url = form.data.get('url')
        self.answered = form.data.get('answered')
        self.left = form.data.get('left')
        correct = form.data.get('correct')
        self.answered = str(int(self.answered) + 1)
        if correct == url:
            self.left = str(int(self.left) - 1)
        else:
            self.left = '10'
        return super(UncUrlGameQuestion, self).form_valid(form)

    def get_success_url(self):
        return '/unc/url-answer?answered=%s&left=%s' % (self.answered, self.left)

