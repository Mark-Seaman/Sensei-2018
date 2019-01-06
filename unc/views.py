from django.views.generic import TemplateView

from bin.pandoc import read_markdown
from mybook.mybook import mybook_site_title, main_menu
from tool.document import domain_doc, doc_html_text


class UncDocDisplay(TemplateView):
    template_name = 'unc_doc.html'

    def get_context_data(self, **kwargs):
        title = self.kwargs.get('title')
        doc = domain_doc(self.request.get_host(), 'unc/' + title)
        text = doc_html_text(doc, '/static/images')
        site = mybook_site_title(doc)
        menu = main_menu(site, doc)
        return dict(site=site, title='Lesson %s' % title[-2:], text=text, menu=menu)


class UncSlidesDisplay(TemplateView):
    template_name = 'unc_slides.html'

    def get_context_data(self, **kwargs):
        title = self.kwargs.get('title')
        doc = 'Documents/unc' + title
        text = read_markdown(doc)
        return dict(markdown=text)

