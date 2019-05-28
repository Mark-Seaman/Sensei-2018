# from django import forms
# from django.forms import Form
from os.path import join
from django.views.generic import DetailView, FormView, ListView, RedirectView, TemplateView, UpdateView

from tool.document import doc_html_text
from tool.log import log_page

from .models import Lesson, Student
from .sensei import get_course_name, schedule, slides_markdown, unc_menu
from sensei.sensei import site_settings


class UncRedirect(RedirectView):
    permanent = False

    def get_redirect_url(self, *args, **kwargs):
        course = self.kwargs.get('course')
        return '/unc/%s/Index' % course


class UncDocDisplay(TemplateView):
    template_name = 'unc_doc.html'

    def get_context_data(self, **kwargs):
        title = self.kwargs.get('title','Index')
        course = self.kwargs.get('course', 'bacs200')
        log_page(self.request, 'course = %s, title = %s' % (course,title))
        doc = join('unc', course, title)
        text = doc_html_text(doc, '/static/images/unc/%s' % course)
        return site_settings(title=title, text=text, course=course)


class UncLessonList(ListView):
    model = Lesson
    template_name = 'unc_lesson_list.html'

    def get_context_data(self, **kwargs):
        course = get_course_name(self.kwargs.get('course'))
        title = "Lessons for %s" % course.name
        return site_settings(title=title, course=course.name)

    def get_queryset(self):
        course  = self.kwargs.get('course')
        return Lesson.objects.filter(course__name=course).order_by('date')


class UncSchedule(TemplateView):
    template_name = 'unc_schedule.html'

    def get_context_data(self, **kwargs):
        course = self.kwargs.get('course')
        title = 'Schedule for ' + course
        return site_settings(title=title, course=course, schedule=schedule(course))


class UncSlidesDisplay(TemplateView):
    template_name = 'unc_slides.html'

    def get_context_data(self, **kwargs):
        title = self.kwargs.get('title')
        course  = self.kwargs.get('course')
        text = slides_markdown(title)
        return site_settings(title=title, course=course, markdown=text)


class UncStudentList(TemplateView):
    template_name = 'unc_dashboard.html'

    def get_context_data(self, **kwargs):
        title = 'Student Dashboards'
        course  = self.kwargs.get('course')
        return site_settings(title=title, course=course)

    def get_queryset(self):
        course  = self.kwargs.get('course')
        return Student.objects.filter(course__name=course)




# class UncLessonDetail(DetailView):
#     model = Lesson
#     template_name = 'unc_lesson_details.html'
#
#     def get_context_data(self, **kwargs):
#         course = self.kwargs.get('course')
#         menu = unc_menu()
#         title = 'LESSON #%s' % id
#         kwargs.update(site_settings(menu=menu, title=title, course=course))
#         return super(UncLessonDetail, self).get_context_data(kwargs)
#
# class UncRegister(FormView):
#     class EditDocForm(Form):
#         name = forms.CharField()
#         email = forms.CharField()
#         password = forms.CharField()
#         domain = forms.CharField()
#
#     form_class = EditDocForm
#     template_name = 'unc_register.html'
#     success_url = '/unc/registered'
#
#     def form_valid(self, form):
#         name = form.data.get('name')
#         email = form.data.get('email')
#         password = form.data.get('password')
#         domain = form.data.get('domain')
#         register_user_domain(name, email, password, domain)
#         return super(UncRegister, self).form_valid(form)
