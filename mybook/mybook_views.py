from django.contrib.auth.mixins import LoginRequiredMixin
from django.views.generic import RedirectView, TemplateView
from os import listdir
from os.path import join
from random import choice

from .mybook import booknotes_excerpt, theme
from .outline import outline, read_cards, tabs_data
from tool.document import doc_html_text, domain_doc


class DomainRedirect(RedirectView):

    def get_redirect_url(self, *args, **kwargs):
        return '/%s/' % domain_doc(self.request.get_host(),'')



class MyBookRandom(RedirectView):
    permanent = False

    def get_redirect_url(self, *args, **kwargs):
        title = self.kwargs.get('title')
        files = listdir(join('Documents', title))
        file = choice(files)
        return '/%s/%s' % (title, file)



class MyBookDocDisplay(TemplateView):

    def get_context_data(self, **kwargs):
        title = self.kwargs.get('title', 'Index')
        domdoc = domain_doc(self.request.get_host(), title)
        text = doc_html_text(domdoc, '/static/images')
        menu = [False, True, False, False]
        return dict(title=title, text=text, menu=menu)

    def get_template_names(self):
        # title = self.kwargs.get('title')
        return [theme(self.request.get_host())]



class MyBookPrivateDoc(LoginRequiredMixin, MyBookDocDisplay):

    def get_context_data(self, **kwargs):
        title = self.kwargs.get('title', 'Index')
        domdoc = domain_doc(self.request.get_host(), title)
        text = doc_html_text(domdoc, '/static/images')
        past = title.startswith('task/')
        present = (title == 'info/Aspire.md')
        future = not present and not past
        menu = [past, present, future, False]
        return dict(title=title, text=text, menu=menu, aspire_menu=True)


class BookNotes(MyBookDocDisplay):
    template_name = 'mybook_theme.html'

    def get_context_data(self, **kwargs):
        title = join('booknotes', self.kwargs.get('title', 'Index'))
        photo = 'MarkSeaman.100.png'
        excerpt, url = booknotes_excerpt(self.kwargs.get('title'))
        kwargs = dict(title=title, photo=photo, text=excerpt, readmore=(url, url), excerpt=excerpt)
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


# class SeamansLog(MyBookDocDisplay):
#
#     def get_context_data(self, **kwargs):
#         title = join('seamanslog', self.kwargs['title'])
#         photo = 'MarkSeaman.100.png'
#         url = join('https://seamanslog.com', self.request.path[1:])
#         readmore = url, url
#         kwargs = dict(title=title, photo=photo, readmore=readmore)
#         return super(SeamansLog, self).get_context_data(**kwargs)


class SeamansLog(RedirectView):
    permanent = False
    url = '/seamanslog/Random'

    # def get_redirect_url(self, *args, **kwargs):
    #     files = listdir(join('Documents', 'seamanslog'))
    #     file = choice(files)
    #     return  % (file)


def spiritual():
    return ['reflect', 'teaching', 'prayers', 'bible', 'walkabout']


class SpiritualDoc(TemplateView):
    template_name = 'spiritual_theme.html'

    def get_context_data(self, **kwargs):
        title = self.kwargs.get('title', 'Index')
        domdoc = domain_doc(self.request.get_host(), title)
        text = doc_html_text(domdoc, '/static/images')
        menu = [title.startswith(i) for i in spiritual()]
        #menu = [True, False, False, False, False]
        return dict(title=title, text=text, menu=menu)


class SpiritualSelect(RedirectView):
    permanent = False

    def get_redirect_url(self, *args, **kwargs):
        title = kwargs.get('title')
        if not title:
            title = choice(['reflect', 'teaching', 'prayers', 'bible', 'walkabout'])
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
