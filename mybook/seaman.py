from django.contrib.auth.mixins import LoginRequiredMixin
from django.views.generic import TemplateView

from tool.document import doc_file_index, doc_list
from tool.log import log_page

from .mybook import *
from .views import DocDisplay


class BookNotes(DocDisplay):
    template_name = 'mybook_theme.html'

    def get_context_data(self, **kwargs):
        title = join('booknotes', self.kwargs.get('title', 'Index'))
        photo = 'MarkSeaman.100.png'
        excerpt, url = booknotes_excerpt(self.kwargs.get('title'))
        kwargs = dict(title=title, photo=photo, text=excerpt, readmore=(url, url), excerpt=excerpt)
        return super(BookNotes, self).get_context_data(**kwargs)


class MarkSeaman(DocDisplay):

    def get_context_data(self, **kwargs):
        log_page(self.request)
        domain = self.request.get_host()
        title = self.request.path[1:]
        site_title = 'Mark Seaman', 'Inventor - Teacher - Writer'
        logo = "/static/images/MarkSeaman.100.png", 'Mark Seaman'
        text = document_text(domain_doc(domain,title))
        return page_settings(title, site_title, logo, mark_seaman_menu(title), text)


class PrivateDoc(LoginRequiredMixin, DocDisplay):

    def get_context_data(self, **kwargs):
        log_page(self.request)
        domain = self.request.get_host()
        title = self.kwargs.get('title', 'Index')
        site_title = "Shrinking World", 'Software Development Training'
        logo = "/static/images/SWS_Logo_200.jpg", 'Shrinking World Solutions'
        text = document_text(domain_doc(domain, self.request.path[1:]))
        return page_settings(title, site_title, logo, info_menu(title), text)


def seamans_log_menu(title):
    def menu_items(title):
        return [('List', 'Articles', title == 'Index'),
                ('Random', 'Read', title != 'List' and title != 'Index'),
                ('https://markseaman.org', 'Mark Seaman')]

    return topic_menu(menu_items(title), '/seamanslog/', "Seaman's Log")


class SeamansLog(DocDisplay):

    def get_context_data(self, **kwargs):

        def logo():
            return "/static/images/MarkSeaman.100.png", 'Mark Seaman'

        domain = self.request.get_host()
        title = self.kwargs.get('title', 'Index')
        site_title = "Seaman's Log", 'Big Ideas & Deep Thoughts'
        text = page_text(domain, self.request.path[1:])
        menu = seamans_log_menu(title)
        return page_settings(title, site_title, logo(), menu, text['text'], text['url'])


class DocFileIndex(TemplateView):
    template_name = 'mybook_list.html'

    def get_context_data(self, **kwargs):
        log_page(self.request)
        title = self.request.path[1:-6]
        site_title = "Shrinking World", 'Software Development Training'
        logo = "/static/images/SWS_Logo_200.jpg", 'Shrinking World Solutions'
        menu = seamans_log_menu(title)
        settings = page_settings(title, site_title, logo, menu, 'no text')
        settings['list'] = doc_file_index(title)
        return settings


class DocList(TemplateView):
    template_name = 'mybook_list.html'

    def get_context_data(self, **kwargs):
        log_page(self.request)
        title = self.request.path[1:-5]
        site_title = "Shrinking World", 'Software Development Training'
        logo = "/static/images/SWS_Logo_200.jpg", 'Shrinking World Solutions'
        menu = seamans_log_menu(title)
        settings = page_settings(title, site_title, logo, menu, 'no text')
        settings['list'] = doc_list(title)
        return settings

