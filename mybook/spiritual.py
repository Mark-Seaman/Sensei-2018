from os import listdir
from os.path import join
from random import choice

from django.views.generic import TemplateView, RedirectView

from tool.document import domain_doc, doc_html_text
from tool.log import log_page

from .mybook import header_info


def spiritual():
    return [('Index', 'Home'),
            ('reflect', 'Reflect'),
            ('bible', 'Meditate'),
            ('teaching', 'Learn'),
            ('walkabout', 'Journey'),
            ('prayers', 'Pray')]


def spiritual_header():
    return dict(title='Spiritual Things', subtitle='Daily Inspiration', logo="/static/images/MarkSeaman.100.png", logo_text='Mark Seaman')


def spiritual_menu(title):
    def is_active(title, topic):
        return ' active' if title.startswith(topic) else ''

    menu_items = [dict(url='/spiritual/'+i[0], label=i[1], active=is_active(title,i[0])) for i in spiritual()]

    return "Spiritual Things", menu_items

    # return "Spiritual Things", [
    #     dict(url='/spiritual/Index', label='Home', active=is_active(title,'Index')),
    #     dict(url='/spiritual/reflect', label='Reflect', active=is_active(title,'reflect')),
    #     dict(url='/spiritual/prayers', label='Pray', active=is_active(title, 'prayers')),
    #     dict(url='/spiritual/bible', label='Meditate', active=is_active(title, 'bible')),
    #     dict(url='/spiritual/teaching', label='Learn', active=is_active(title, 'teaching')),
    #     dict(url='/spiritual/walkabout', label='Journey', active=is_active(title, 'walkabout')),
    # ]


class SpiritualDoc(TemplateView):
    template_name = 'spiritual_theme.html'

    def get_context_data(self, **kwargs):
        log_page(self.request)
        title = self.kwargs.get('title', 'Index')
        domdoc = domain_doc(self.request.get_host(), title)
        text = doc_html_text(domdoc, '/static/images')
        menu = spiritual_menu(title)
        return dict(title=title, text=text, menu=menu, header=spiritual_header())


class SpiritualSelect(RedirectView):
    permanent = False

    def get_redirect_url(self, *args, **kwargs):
        title = kwargs.get('title')
        if not title:
            title = choice(['reflect', 'teaching', 'prayers', 'bible', 'walkabout'])
        files = listdir(join('Documents', 'spiritual', title))
        file = choice(files)
        return '/spiritual/%s/%s' % (title, file)


