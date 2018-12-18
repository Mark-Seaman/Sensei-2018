from django.contrib.auth.mixins import LoginRequiredMixin
from django.views.generic import RedirectView, TemplateView
from os import listdir
from os.path import join
from random import choice

from mybook import main_menu, mybook_site_title
from mybook import booknotes_excerpt
from outline import outline, read_cards, tabs_data
from tool.document import doc_html_text


class MyBookDocDisplay(TemplateView, RedirectView):
    template_name = 'mybook_public.html'

    def get_context_data(self, **kwargs):
        title = self.kwargs.get('title', 'Index')
        course = title.split('/')[0] if title.split('/')[:1] else ''
        text = doc_html_text(title, '/static/images/' + course)
        return dict(title=title, course=course, text=text)


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


class Staff(TemplateView):
    template_name = 'shrinking_world_staff.html'

    def get_context_data(self, **kwargs):
        return {
            'title': 'Shrinking World Staff',
            'menu': main_menu('shrinking-world', '/shrinking-world/Staff'),
            'site': mybook_site_title('shrinking-world')
        }


class SpiritualSelect(RedirectView):
    permanent = False

    def get_redirect_url(self, *args, **kwargs):
        return '/spiritual'


class TestDoc(TemplateView):
    template_name = 'mybook_test.html'


class TabsView(MyBookDocDisplay):
    template_name = 'mybook_tabs.html'

    def get_context_data(self, **kwargs):
        doc = self.kwargs.get('title')
        tabs = tabs_data(doc)
        kwargs = dict(title=tabs[0][1], doc=doc, tabs=tabs)
        return super(TabsView, self).get_context_data(**kwargs)


class TodayView(LoginRequiredMixin, MyBookDocDisplay):

    def get_context_data(self, **kwargs):
        context = super(TodayView, self).get_context_data(**kwargs)
        context.update({
            'site': ('Today', 'Next Step'),
            'title': 'Today Matters Most',
            'text': doc_html_text('spiritual/Home'),
            'menu': main_menu('brain', 'brain/Index'),
        })
        return context
