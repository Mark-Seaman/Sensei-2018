from django import forms
from django.forms import Form
from django.views.generic import FormView, ListView, TemplateView, UpdateView
from django.utils.timezone import now

from tool.document import domain_doc, doc_html_text

from .review import count_score, get_review, review_feedback, review_groups, student_reviews, student_reviews_done
from .sensei import course_lessons, slides_markdown
from .student import student_scores, site_settings, student, student_totals, register_user_domain
from .models import Review, Student


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
        reviews = Review.objects.filter(score=-1)
        designers = Review.objects.exclude(score=-1)
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

