from django.http import HttpResponseRedirect
from django.views.generic import RedirectView, TemplateView
from os import listdir
from os.path import join
from random import choice

from tool.document import doc_page, domain_doc
from tool.log import log, log_page

from .mybook import shrinking_world_menu
from .mybook import document_text, page_settings


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
