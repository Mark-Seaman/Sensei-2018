from __future__ import unicode_literals

from django.views.generic import TemplateView
from tool.document import doc_html_text, domain_doc
from mybook.mybook import mybook_site_title, main_menu


class UncDocDisplay(TemplateView):
    template_name = 'guide_doc.html'

    def get_context_data(self, **kwargs):
        title = 'unc' + self.kwargs.get('title')
        domdoc = domain_doc(self.request.get_host(), title)
        text = doc_html_text(domdoc, '/static/images')
        site = mybook_site_title(domdoc)
        menu = main_menu(site, domdoc)
        return dict(site=site, title=title, text=text, menu=menu)



# class ReviewRequest(RedirectView):
#     def get_redirect_url(self, *args, **kwargs):
#         if kwargs['pk'] == '0':
#             return '/unc/students'
#         else:
#             r = Review.objects.get(pk=kwargs['pk'])
#             student_pk = r.designer.pk
#             if allow_review(r.reviewer.pk, r.designer.pk, r.page):
#                 create_review(r.reviewer.pk, r.designer.pk, r.page)
#             return '/unc/feedback/%s' % student_pk
#
#
# class ReviewFeedback(TemplateView):
#     template_name = 'feedback.html'
#
#     def get_context_data(self, **kwargs):
#         pk = kwargs.get('pk')
#         todo = reviews_to_do(pk)
#         done = reviews_done(pk)
#         completed = len(done), len(todo) + len(done)
#         student = get_student(pk)
#         scores = designer_scores(student)
#         title = "Review Feedback"
#         settings = page_info(student.course.title, title)
#         settings['designer'] = get_student(pk)
#         settings['completed'] = completed
#         settings['scores'] = scores
#         settings['projects'] = review_tabs(pk)
#         settings['requirements'] = requirements(student.course.title)
#         return settings
#



# class UncStudents(TemplateView):
#     template_name = 'bacs200_students.html'
#
#     def get_context_data(self, **kwargs):
#         course = Course.objects.get(title='HtmlApps')
#         title = "BACS 200 Student Websites"
#         settings = page_info(course.title, title)
#         settings['students'] = query_students(course)
#         return settings
#
#
# class UncStudents350(TemplateView):
#     template_name = 'bacs350_students.html'
#
#     def get_context_data(self, **kwargs):
#         course = Course.objects.get(title='PhpApps')
#         title = "BACS 350 Student Websites"
#         settings = page_info(course.title, title)
#         settings['students'] = query_students(course)
#         return settings
#
#
# class DesignReviewForm(UpdateView):
#     model = Review
#     fields = ['requirement_1', 'requirement_2', 'requirement_3', 'requirement_4', 'requirement_5',
#               'requirement_6', 'requirement_7', 'requirement_8', 'requirement_9', 'requirement_10', 'notes']
#     template_name = 'review.html'
#
#     def get_context_data(self, **kwargs):
#         course = self.object.reviewer.course.title
#         kwargs['requirements'] = requirements(course)
#         return super(DesignReviewForm, self).get_context_data(**kwargs)
#
#     def form_valid(self, form):
#         self.object.score = count_score(self.object)
#         return super(DesignReviewForm, self).form_valid(form)
#
#     def get_success_url(self):
#         student_id = self.object.reviewer.pk
#         return '/unc/reviews/%s' % student_id
#
#
# class DesignReviews(ListView):
#     model = Review
#     fields = ['score', 'reviewer']
#     template_name = 'review_list.html'
#
#     def get_context_data(self, **kwargs):
#         pk = self.kwargs.get('pk')
#         return student_review_data(pk)
#
#
# class ReviewScores(TemplateView):
#     template_name = 'review_scores.html'
#
#     def get_context_data(self, **kwargs):
#         title = self.kwargs.get('course')
#         course = Course.objects.get(title=title)
#         title = "Student Reviews Score"
#
#         scores = gather_review_scores(course)
#         settings = page_info(course.title, title)
#         settings['students'] = query_students(course)
#         settings['scores'] = scores
#
#         return settings
#
#
# class StudentTest(GuideDocDisplay):
#     template_name = 'guide_student.html'
#
#     def get_context_data(self, **kwargs):
#         student = get_student(kwargs.get('pk'))
#         title = 'Student Test Links'
#         links = student_test_links(student)
#         return view_info(dict(title=title, course=student.course.title, student=student, links=links))
