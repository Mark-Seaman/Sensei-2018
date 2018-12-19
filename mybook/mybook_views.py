from django.contrib.auth.mixins import LoginRequiredMixin
from django.views.generic import RedirectView, TemplateView
from os import listdir
from os.path import join
from random import choice

from mybook import booknotes_excerpt, main_menu, mybook_site_title
from outline import outline, read_cards, tabs_data
from tool.document import doc_html_text, domain_doc


def domain_menu(domain, page):
    domdoc = domain_doc(domain, page)
    site = mybook_site_title(domdoc)
    return main_menu(site, domdoc)


class MyBookDocDisplay(TemplateView):
    template_name = 'mybook_public.html'

    def get_context_data(self, **kwargs):
        title = self.kwargs.get('title', 'Index')
        domdoc = domain_doc(self.request.get_host(), title)
        text = doc_html_text(domdoc, '/static/images')
        site = mybook_site_title(domdoc)
        menu = main_menu(site, domdoc)
        # site = mybook_site_title(title)
        # menu = main_menu(site, title)
        return dict(site=site, title=title, text=text, menu=menu)


class MyBookPrivateDoc(LoginRequiredMixin, MyBookDocDisplay):
    pass


class BookNotes(MyBookDocDisplay):

    template_name = 'mybook_public.html'

    def get_context_data(self, **kwargs):
        title = join('booknotes', self.kwargs.get('title','Index'))
        photo = 'MarkSeaman.100.png'
        excerpt,url = booknotes_excerpt(self.kwargs.get('title'))
        kwargs = dict(title=title, photo=photo, text=excerpt, readmore=(url,url), excerpt=excerpt)
        return super(BookNotes, self).get_context_data(**kwargs)


class CardView(MyBookDocDisplay):
    template_name = "mybook_cards.html"

    def get_context_data(self, **kwargs):
        doc = self.kwargs.get('title')
        kwargs = dict(title="Card View", doc=doc, cards=read_cards(doc))
        return super(CardView, self).get_context_data(**kwargs)


class OutlineView(MyBookDocDisplay):
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


class SeamansLog(MyBookDocDisplay):

    def get_context_data(self, **kwargs):
        title = join('seamanslog', self.kwargs['title'])
        photo = 'MarkSeaman.100.png'
        url = join('https://seamanslog.com', self.request.path[1:])
        readmore = url, url
        kwargs = dict(title=title, photo=photo, readmore=readmore)
        return super(SeamansLog, self).get_context_data(**kwargs)


class SpiritualSelect(RedirectView):
    permanent = False

    def get_redirect_url(self, *args, **kwargs):
        title = kwargs.get('title')
        if not title:
            title = choice(['reflect', 'teaching', 'prayers', 'bible'])
        files = listdir(join('Documents', 'spiritual', title))
        file = choice(files)
        return '/spiritual/%s/%s' % (title, file)


class TabsView(MyBookDocDisplay):
    template_name = 'mybook_tabs.html'

    def get_context_data(self, **kwargs):
        doc = self.kwargs.get('title')
        tabs = tabs_data(doc)
        kwargs = dict(title=tabs[0][1], doc=doc, tabs=tabs)
        return super(TabsView, self).get_context_data(**kwargs)

