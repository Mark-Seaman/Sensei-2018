from django import forms
from django.forms import Form
from django.views.generic import FormView, ListView, TemplateView

from tool.document import domain_doc, doc_html_text

from .sensei import course_lessons, slides_markdown
from .student import student_scores, site_settings, student, student_totals, register_user_domain
from .models import Student


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
        title = 'Student Dashboard'
        reading = student_scores(student_id)
        return site_settings(title=title, student=student(student_id), scores=reading)

