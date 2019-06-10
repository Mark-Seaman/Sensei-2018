from django.contrib.auth.mixins import LoginRequiredMixin
from django.http import HttpResponseRedirect
from django.views.generic import RedirectView, TemplateView
from os.path import join

from .brain import create_tree_index, doc_html, doc_list, doc_redirect, doc_tree, list_files, page_settings


# Todo: New feature - DirectoryView - Display a directory of doc links for direct access to docs

# Display the document that matches the URL
class DocView(LoginRequiredMixin, TemplateView):
    template_name = 'doc.html'

    def get(self, request, *args, **kwargs):
        doc = self.kwargs.get('title')
        url = doc_redirect(doc)
        if url:
            return HttpResponseRedirect(url)
        return self.render_to_response(self.get_context_data(**kwargs))

    def get_context_data(self, **kwargs):
        title = self.kwargs.get('title')
        return page_settings(title=title, text=doc_html(title))


# Display the list of document files in a directory
class DirectoryView(TemplateView):
    template_name = 'folder.html'

    def get_context_data(self, **kwargs):
        title = self.kwargs.get('title')
        files = doc_tree(title)
        return page_settings(title=('Directory - ' + title), docs=files)


# Display the list of document files in a directory
class FilesView(TemplateView):
    template_name = 'files.html'

    def get_context_data(self, **kwargs):
        title = self.kwargs.get('title')
        files = list_files(title)
        return page_settings(title=title, files=files)


# Display the list of document files in a directory tree
class SiteIndexView(TemplateView):
    template_name = 'doc.html'

    def get_context_data(self, **kwargs):
        title = self.kwargs.get('title')
        # files = list_files(title)
        # text = 'Site Index Content'
        text = create_tree_index('Documents/%s' % title)
        return page_settings(title=title, text=text)


# Display the document that matches the URL
class MissingView(TemplateView):
    template_name = 'missing.html'

    def get_context_data(self, **kwargs):
        title = 'Missing Document'
        doc = self.kwargs.get('title')
        path = join('Documents', doc)
        return page_settings(title=title, doc=doc, path=path)


# Forward from / to /brain/info
class RedirectRoot(RedirectView):
    url = '/brain/info'



