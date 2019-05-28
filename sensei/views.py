# from django import forms
# from django.forms import Form
from os.path import join
from django.views.generic import DetailView, FormView, ListView, RedirectView, TemplateView, UpdateView
from django.utils.timezone import now

from tool.document import doc_html_text
from tool.log import log_page

from .models import Lesson, Review, Student, UrlGame
from .review import count_score, get_review, query_reviewers, query_designers, review_feedback, student_reviews, student_reviews_done
from .sensei import course_lessons, get_course_name, schedule, slides_markdown, unc_menu
from .student import site_settings, student, students, register_user_domain


class UncRedirect(RedirectView):
    permanent = False

    def get_redirect_url(self, *args, **kwargs):
        course = self.kwargs.get('course')
        # TODO: Fix this  #+self.request.path+'/'
        return '/unc/%s/Index' % course


class UncDocDisplay(TemplateView):
    template_name = 'unc_doc.html'

    def get_context_data(self, **kwargs):
        title = self.kwargs.get('title','Index')
        course = self.kwargs.get('course', 'bacs200')
        log_page(self.request, 'course = %s, title = %s' % (course,title))
        doc = join('unc', title)
        text = doc_html_text(doc, '/static/images/unc/%s' % course)
        menu = unc_menu()
        return site_settings(menu=menu, title=title, text=text, course=course)


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

class UncLessonList(ListView):
    model = Lesson
    template_name = 'unc_lesson_list.html'

    def get_context_data(self, **kwargs):
        course = get_course_name(self.kwargs.get('course'))
        title = "Lessons for %s" % course.name
        lessons = Lesson.objects.filter(course=course).order_by('date')
        menu = unc_menu()
        return site_settings(menu=menu, title=title, course=course.name,  lessons=lessons)

    def get_queryset(self):
        course  = self.kwargs.get('course')
        return Lesson.objects.filter(course__name=course)


class UncSchedule(TemplateView):
    template_name = 'unc_schedule.html'

    def get_context_data(self, **kwargs):
        course = self.kwargs.get('course')
        menu = unc_menu()
        return site_settings(menu=menu, title=title, course=course, schedule=schedule(course))


class UncSlidesDisplay(TemplateView):
    template_name = 'unc_slides.html'

    def get_context_data(self, **kwargs):
        title = self.kwargs.get('title')
        text = slides_markdown(title)
        return site_settings(title=title, markdown=text)


# class UncStudentDetail(TemplateView):
#     template_name = 'unc_dashboard.html'
#
#     def get_context_data(self, **kwargs):
#         student_id = self.kwargs.get('id')
#         s = Student.objects.get(pk=student_id)
#         game = UrlGame.objects.get(student=s)
#         reviews = student_reviews(student_id)
#         done = student_reviews_done(student_id)
#         feedback = review_feedback(student_id)
#         title = 'Student Dashboard'
#         return site_settings(student_active='active',
#                              title=title, student=student(student_id), game=game,
#                              reviews=reviews, feedback=feedback, done=done)
#
# class UncStudentList(TemplateView):
#     template_name = 'unc_dashboard.html'
#
#     def get_context_data(self, **kwargs):
#         student_id = self.kwargs.get('id')
#         s = Student.objects.get(pk=student_id)
#         game = UrlGame.objects.get(student=s)
#         reviews = student_reviews(student_id)
#         done = student_reviews_done(student_id)
#         feedback = review_feedback(student_id)
#         title = 'Student Dashboard'
#         return site_settings(student_active='active',
#                              title=title, student=student(student_id), game=game,
#                              reviews=reviews, feedback=feedback, done=done)

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
#
#
# class UncReviewFeedback(TemplateView):
#     template_name = 'unc_feedback.html'
#
#     def get_context_data(self, **kwargs):
#         pk = self.kwargs.get('pk')
#         review = get_review(pk)
#         requirements = review.requirement_labels.labels.split('\n')
#         title = 'Design Review Feedback'
#         return site_settings(student_active='active', title=title, review=review, requirements=requirements)
#
#
# class UncReviews(TemplateView):
#     template_name = 'unc_reviews.html'
#
#     def get_context_data(self, **kwargs):
#         course = '1'
#         reviews = query_reviewers(course)
#         designers = query_designers(course)
#         return site_settings(student_active='active', title='Design Reviews', reviews=reviews, designers=designers)

# class UncStudentDomains(RedirectView):
#     url = '/unc/students/1'
#

# class UncStudents(ListView):
#     template_name = 'unc_registered.html'
#     model = Student
#
#     def get_context_data(self, **kwargs):
#         course = self.kwargs.get(id, '1')
#         return site_settings(student_active='active',
#                              title='BACS 200 - Student Domains',
#                              students=[])  # students(course)
#
#

