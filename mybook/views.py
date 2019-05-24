from django.contrib.auth.mixins import LoginRequiredMixin
from django.utils.timezone import now
from django.views.generic import RedirectView, TemplateView
from os import listdir
from os.path import join
from random import choice

from tool.document import doc_html_text, doc_list, doc_page, domain_doc
from tool.log import log_page

from .mybook import booknotes_excerpt, get_menu, header_info, theme
from .outline import outline, read_cards, tabs_data


class DocList(TemplateView):
    template_name = 'mybook_list.html'

    def get_context_data(self, **kwargs):
        title = self.request.path[1:-5]
        log_page(self.request, title)
        doclist = doc_list(title)
        menu = get_menu (title)
        return dict(title=title, list=doclist, menu=menu, url=self.request.get_raw_uri(), header=header_info(self.request.get_host()))


class DocMissing(TemplateView):
    template_name = 'mybook_missing.html'

    def get_context_data(self, **kwargs):
        title = self.kwargs.get('title', 'Index')
        menu = get_menu(title)
        header = header_info(self.request.get_host())
        return dict(title=title, menu=menu, header=header, time=now())


class DocRandom(RedirectView):
    permanent = False

    def get_redirect_url(self, *args, **kwargs):
        title = self.kwargs.get('title')
        files = listdir(join('Documents', title))
        file = choice(files)
        return '/%s/%s' % (title, file)


class DocDisplay(TemplateView):

    def get_context_data(self, **kwargs):
        title = self.kwargs.get('title', 'Index')
        domdoc = domain_doc(self.request.get_host(), title)
        log_page(self.request, domdoc)
        text = doc_html_text(domdoc, '/static/images')
        menu = get_menu(title)
        url = self.request.get_raw_uri()
        header = header_info(self.request.get_host())
        return dict(title=title, text=text, menu=menu, url=url, header=header, time=now())

    def get_template_names(self):
        return [theme(self.request.get_host())]


class DocRedirect(RedirectView):
    permanent = False

    def get_redirect_url(self, *args, **kwargs):
        title = self.kwargs.get('title')
        log_page(self.request, 'DocRedirect.get_redirect_url')
        if not title:
            return '/%s' % domain_doc(self.request.get_host(),'Index')
        if title.endswith('/'):
            return title+'/Index'
        if doc_page(title):
            return doc_page(title)


class DocPageDisplay(DocDisplay, DocRedirect):

    def get_context_data(self, **kwargs):
        log_page(self.request, 'DocPageDisplay.get_context_data')
        return super(DocRedirect, self).get_context_data(**kwargs)

    def get_redirect_url(self, *args, **kwargs):
        log_page(self.request, 'DocPageDisplay.get_redirect_url')
        return super(DocRedirect, self).get_redirect_url(**kwargs)


class PrivateDoc(LoginRequiredMixin, DocDisplay):

    def get_context_data(self, **kwargs):
        title = self.kwargs.get('title', 'Index')
        domdoc = domain_doc(self.request.get_host(), title)
        text = doc_html_text(domdoc, '/static/images')
        menu = get_menu('info/'+title)
        return dict(title=title, text=text, menu=menu, header=header_info(self.request.get_host()), time=now())

# --------------------------------------

class BookNotes(DocDisplay):
    template_name = 'mybook_theme.html'

    def get_context_data(self, **kwargs):
        title = join('booknotes', self.kwargs.get('title', 'Index'))
        photo = 'MarkSeaman.100.png'
        excerpt, url = booknotes_excerpt(self.kwargs.get('title'))
        kwargs = dict(title=title, photo=photo, text=excerpt, readmore=(url, url), excerpt=excerpt)
        return super(BookNotes, self).get_context_data(**kwargs)


class CardView(DocDisplay):
    template_name = "mybook_cards.html"

    def get_context_data(self, **kwargs):
        doc = self.kwargs.get('title')
        kwargs = dict(title="Card View", doc=doc, cards=read_cards(doc))
        return super(CardView, self).get_context_data(**kwargs)


class OutlineView(DocDisplay):
    template_name = "mybook_outline.html"

    def get_context_data(self, **kwargs):
        doc = self.kwargs.get('title')
        text = open(join('Documents', doc)).read()
        cards = outline(text)[0][1]
        kwargs = dict(title=cards[0][0], doc=doc, cards=cards)
        return super(OutlineView, self).get_context_data(**kwargs)


class DailyTask(RedirectView):

    def get_redirect_url(self, *args, **kwargs):
        path = 'Documents/info/daily'
        return '/info/daily/%s' % choice(listdir(path))


class SeamansLog(RedirectView):
    permanent = False
    url = '/seamanslog/Random'


class TabsView(DocDisplay):
    template_name = 'mybook_tabs.html'

    def get_context_data(self, **kwargs):
        doc = self.kwargs.get('title')
        tabs = tabs_data(doc)
        kwargs = dict(title=tabs[0][1], doc=doc, tabs=tabs)
        return super(TabsView, self).get_context_data(**kwargs)
