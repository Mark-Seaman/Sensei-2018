from os import listdir
from os.path import join
from random import choice

from django.views.generic import TemplateView, RedirectView

from tool.document import domain_doc, doc_html_text
from tool.log import log_page


def spiritual_topics():
    return [('Index', 'Home'),
            ('reflect', 'Reflect'),
            ('bible', 'Meditate'),
            ('teaching', 'Learn'),
            ('walkabout', 'Journey'),
            ('prayers', 'Pray')]


def spiritual_header():
    return dict(title='Spiritual Things', subtitle='Daily Inspiration', logo=None)


def spiritual_menu(title):
    def is_active(title, topic):
        return ' active' if title.startswith(topic) else ''

    menu_items = [dict(url='/spiritual/'+i[0], label=i[1], active=is_active(title,i[0])) for i in spiritual_topics()]

    return "Spiritual Things", menu_items


def page_settings(domain, title):
    domdoc = domain_doc(domain, title)
    text = doc_html_text(domdoc, '/static/images')
    menu = spiritual_menu(title)
    url = join(domain, title)
    return dict(title=title, text=text, menu=menu, url=url, header=spiritual_header())


class SpiritualDoc(TemplateView):
    template_name = 'spiritual_theme.html'

    def get_context_data(self, **kwargs):
        log_page(self.request)
        title = self.kwargs.get('title', 'Index')
        domdoc = domain_doc(self.request.get_host(), title)
        text = doc_html_text(domdoc, '/static/images')
        menu = spiritual_menu(title)
        url = self.request.get_raw_uri()
        return dict(title=title, text=text, menu=menu, url=url, header=spiritual_header())
        # page_settings(self.request.get_host(), title)


class SpiritualSelect(RedirectView):
    permanent = False

    def get_redirect_url(self, *args, **kwargs):
        title = kwargs.get('title')
        if not title:
            title = choice(['reflect', 'teaching', 'prayers', 'bible', 'walkabout'])
        files = listdir(join('Documents', 'spiritual', title))
        file = choice(files)
        return '/spiritual/%s/%s' % (title, file)


