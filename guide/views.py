from django.views.generic import RedirectView, TemplateView

from unc.sensei import *


class GuideDocView(RedirectView):
    def get_redirect_url(self, *args, **kwargs):
        doc = self.kwargs.get('title')
        if not guide_file(None, doc):
            return '/guide/%s/Missing' % doc
        return '/guide/%s.md' % doc


class GuideDocDisplay(TemplateView):
    template_name = 'guide_doc.html'

    def get_context_data(self, **kwargs):
        title = self.kwargs.get('title', 'Index')
        course = title.split('/')[0] if title.split('/')[:1] else ''
        return view_info(dict(title=title, course=course))

    def get_redirect_url(self, *args, **kwargs):
        return super(GuideDocDisplay, self).get_redirect_url(**kwargs)


class ClassLessonView(TemplateView):
    template_name = 'guide_lesson.html'

    def get_context_data(self, **kwargs):
        course = kwargs.get('course')
        lesson = kwargs.get('lesson')
        return view_info(dict(title= 'Lesson%s' % lesson, course=course, lesson=lesson))


class ClassScheduleView(GuideDocDisplay):
    template_name = 'guide_schedule.html'

    def get_context_data(self, **kwargs):
        course = kwargs.get('course')
        table = guide_schedule(course)
        title = 'Schedule for %s' % 'BACS 200' if course=='HtmlApps' else 'BACS 350'
        return view_info(dict(title=title, course=course, data=schedule_data(course, table)))


class MissingDocView(TemplateView):
    template_name = 'guide_missing.html'

    def get_context_data(self, **kwargs):
        title = self.kwargs.get('title')
        info = lesson_info(title)
        return missing_page_info(title)


class GuideTestView(TemplateView):
    template_name = 'guide_test.html'

    def get_context_data(self, **kwargs):
        course = kwargs.get('course')
        return view_info(dict(title='Test page for '+course, course=course, tests=test_links(course)))


class GuidePhpTemplates(TemplateView):
    template_name = 'guide_php.html'

    def get_context_data(self, **kwargs):
        title = kwargs.get('title')
        course = kwargs.get('course')
        if course=='PhpApps':
            url = 'bacs_350'
        else:
            url = 'bacs_200'
        doc = 'https://unco-bacs.org/%s/%s.php' % (url,title)
        html = '\n'.join(read_file(course,'web-root/%s.php' % title))
        return dict(title='PHP Source Code', doc=doc, html=html)


class GuideHtmlTemplates(TemplateView):
    template_name = 'guide_php.html'

    def get_context_data(self, **kwargs):
        title = kwargs.get('title')
        course = kwargs.get('course')
        if course=='PhpApps':
            url = 'bacs_350'
        else:
            url = 'bacs_200'
        doc = 'https://unco-bacs.org/%s/%s.html' % (url, title)
        html = '\n'.join(read_file(course,'web-root/%s.html' % title))
        return dict(title='HTML Source Code', doc=doc, html=html)


class GuideTemplates(TemplateView):
    template_name = 'guide_html.html'

    def get_context_data(self, **kwargs):
        title = kwargs.get('title')
        course = kwargs.get('course')
        return dict(html=''.join(read_file(course, 'templates/%s' % title)))


class SlideView(GuideDocDisplay):
    template_name = 'guide_slides.html'

    def get_context_data(self, **kwargs):
        course = kwargs.get('course')
        lesson = kwargs.get('lesson')
        return slide_content_data(course, lesson)


