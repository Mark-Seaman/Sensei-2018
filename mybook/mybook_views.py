from django.contrib.auth.mixins import LoginRequiredMixin
from django.shortcuts import redirect
from django.views.generic import RedirectView, TemplateView
from os import listdir
from os.path import join
from random import choice

from mybook import main_menu, mybook_redirect, mybook_site_title
from mybook import booknotes_excerpt
from outline import outline, read_cards, tabs_data
from tool.document import doc_html_text
from tool.log import log_page


class MissingDoc(TemplateView):
    template_name = 'mybook_missing.html'


class MyBookDocDisplay(TemplateView):
    template_name = 'mybook_public.html'

    def get_context_data(self, **kwargs):
        log_page(self.request)
        title = kwargs.get('title', 'Index')
        site = mybook_site_title(title.replace('Index', ''))
        page = title
        text = kwargs.get('text')
        if not text:
            text = doc_html_text(title, '/static/images')
        menu = main_menu(site, page)
        settings = dict(title=title, site=site, menu=menu, text=text, page=page)
        kwargs.update(settings)
        return kwargs

# TODO: replace with RedirectView
class MyBookDoc(MyBookDocDisplay, TemplateView):

    def get(self, args, **kwargs):
        title = kwargs.get('title', '')
        r = mybook_redirect(self.request.get_host(), title, self.request.user)
        if r:
            return redirect(r)
        return super(MyBookDoc, self).get(self, args, **kwargs)

# class MyBookDoc(MyBookDocDisplay, RedirectView):
#     def get_redirect_url(self, *args, **kwargs):
#         title = kwargs.get('title', '')
#         r = mybook_redirect(self.request.get_host(), title, self.request.user)
#         if r:
#             return redirect(r)
#         # if not guide_file(None, doc):
#         #     return '/guide/%s/Missing' % doc
#         # return '/guide/%s.md' % doc
#

# class InfoDocDisplay(LoginRequiredMixin, ContextMixin):
#     def get_context_data(self, **kwargs):
#         kwargs = super(TaskBase, self).get_context_data(**kwargs)
#         kwargs.update({
#             'site': mybook_site_title('info'),
#             'title': "No title set",
#             'menu': main_menu('info', 'info/Index'),
#             'text': 'Task Base',
#         })
#         return kwargs


class MyBookPrivateDoc(LoginRequiredMixin, MyBookDoc):
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


# class ContainerView(MyBookDocDisplay):
#     template_name = "mybook_containers.html"
#
#     def get_context_data(self, **kwargs):
#         doc = self.kwargs.get('title')
#         text = open(join('Documents', doc)).read()
#         cards = outline(text)[0][1]
#         kwargs = dict(title=cards[0][0], doc=doc, cards=cards)
#         return super(ContainerView, self).get_context_data(**kwargs)


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
