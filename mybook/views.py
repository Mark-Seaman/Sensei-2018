from django.contrib.auth.mixins import LoginRequiredMixin
from django.http import HttpResponseRedirect
from django.views.generic import RedirectView, TemplateView
from os import listdir
from os.path import join
from random import choice

from .mybook import shrinking_world_menu, info_menu, mark_seaman_menu
from tool.document import doc_file_index, doc_list, doc_page, domain_doc
from tool.log import log, log_page

from .mybook import booknotes_excerpt, document_text, page_settings


class DocDisplay(TemplateView):

    def get_template_names(self):
        return ['seaman_theme.html']

    def get_context_data(self, **kwargs):
        log_page(self.request)
        domain = self.request.get_host()
        title = self.request.path[1:]
        site_title = "Shrinking World", 'Software Development Training'
        logo = "/static/images/SWS_Logo_200.jpg", 'Shrinking World Solutions'
        text = document_text(domain_doc(domain,title))
        return page_settings(title, site_title, logo, shrinking_world_menu(title), text)


    def get(self, request, *args, **kwargs):
        title = self.kwargs.get('title', 'Index')

        # Wrong Domain Document
        # domdoc = domain_doc(self.request.get_host(), title)
        # if title != domdoc:
        #     log('REDIRECT DOMAIN: %s --> %s' % (title, domdoc))
        #     return HttpResponseRedirect('/Index')

        # Index or Directory or .md
        url = doc_page(self.request.path[1:])
        if url:
            log('REDIRECT: %s --> %s' % (title, url))
            return HttpResponseRedirect('/' + url)

        return self.render_to_response(self.get_context_data(**kwargs))


class DocFileIndex(TemplateView):
    template_name = 'mybook_list.html'

    def get_context_data(self, **kwargs):
        log_page(self.request)
        title = self.request.path[1:-6]
        site_title = "Shrinking World", 'Software Development Training'
        logo = "/static/images/SWS_Logo_200.jpg", 'Shrinking World Solutions'
        menu = shrinking_world_menu(title)
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
        menu = shrinking_world_menu(title)
        settings = page_settings(title, site_title, logo, menu, 'no text')
        settings['list'] = doc_list(title)
        return settings


class DocMissing(TemplateView):
    template_name = 'mybook_missing.html'

    def get_context_data(self, **kwargs):
        title = self.request.path[1:]
        site_title = "Shrinking World", 'Software Development Training'
        logo = "/static/images/SWS_Logo_200.jpg", 'Shrinking World Solutions'
        settings = page_settings(title, site_title, logo, shrinking_world_menu(title), 'missing doc')
        return settings


class DocRandom(RedirectView):
    permanent = False

    def get_redirect_url(self, *args, **kwargs):
        title = self.kwargs.get('title')
        files = listdir(join('Documents', title))
        file = choice(files)
        return '/%s/%s' % (title, file)


class DocRoot(RedirectView):
    def get_redirect_url(self, *args, **kwargs):
        log_page(self.request, 'Redirect Index')
        return '/%s' % domain_doc(self.request.get_host(),'Index')


class PrivateDoc(LoginRequiredMixin, DocDisplay):

    def get_context_data(self, **kwargs):
        log_page(self.request)
        domain = self.request.get_host()
        title = self.kwargs.get('title', 'Index')
        site_title = "Shrinking World", 'Software Development Training'
        logo = "/static/images/SWS_Logo_200.jpg", 'Shrinking World Solutions'
        text = document_text(domain_doc(domain, 'info/' + title))
        return page_settings(title, site_title, logo, info_menu(title), text)


# --------------------------------------

class BookNotes(DocDisplay):
    template_name = 'mybook_theme.html'

    def get_context_data(self, **kwargs):
        title = join('booknotes', self.kwargs.get('title', 'Index'))
        photo = 'MarkSeaman.100.png'
        excerpt, url = booknotes_excerpt(self.kwargs.get('title'))
        kwargs = dict(title=title, photo=photo, text=excerpt, readmore=(url, url), excerpt=excerpt)
        return super(BookNotes, self).get_context_data(**kwargs)


# class DailyTask(RedirectView):
#
#     def get_redirect_url(self, *args, **kwargs):
#         path = 'Documents/info/daily'
#         return '/info/daily/%s' % choice(listdir(path))
#

class MarkSeaman(DocDisplay):

    def get_context_data(self, **kwargs):
        log_page(self.request)
        domain = self.request.get_host()
        title = self.request.path[1:]  # self.kwargs.get('title', 'Index')
        site_title = 'Mark Seaman', 'Inventor - Teacher - Writer'
        logo = "/static/images/MarkSeaman.100.png", 'Mark Seaman'
        text = document_text(domain_doc(domain,title))
        return page_settings(title, site_title, logo, mark_seaman_menu(title), text)


