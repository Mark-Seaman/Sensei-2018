from django.contrib.auth.mixins import LoginRequiredMixin
from django.http import HttpResponseRedirect
from django.views.generic import RedirectView, TemplateView
from os.path import join

from .brain import doc_html, doc_redirect, doc_tree, list_files, page_settings
from .score import writing_score


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


# Display the document that matches the URL
class ScorecardView(TemplateView):
    template_name = 'score.html'

    def get_context_data(self, **kwargs):
        title = "Writer's Scorecard"
        score = writing_score(self.kwargs.get('title'))
        return page_settings(title=title, score=score)


# Display the list of document files in a directory tree
class TreeView(TemplateView):
    template_name = 'filetree.html'

    def get_context_data(self, **kwargs):
        title = self.kwargs.get('title')
        text = doc_tree(title)
        return page_settings(title=title, text=text)



