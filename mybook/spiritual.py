from django.views.generic import TemplateView, RedirectView
from django.utils.timezone import now
from os import listdir
from os.path import join
from random import choice

from tool.log import log_page

from .views import DocDisplay
from .mybook import topic_menu, header_settings, page_text


def spiritual_menu(title):

    def spiritual_topics():
        return [('Index',       'Home'),
                ('reflect',     'Reflect'),
                ('bible',       'Meditate'),
                ('teaching',    'Learn'),
                ('walkabout',   'Journey'),
                ('prayers',     'Pray')]

    return topic_menu(title, spiritual_topics(), '/spiritual/', "Spiritual Things")


def spiritual_page_settings(domain, title):
    site_title = ('Spiritual Things', 'Daily Inspiration')
    menu = spiritual_menu(title)
    header = header_settings(site_title)
    theme = 'spiritual_theme.html'
    time = now()
    text = page_text(domain, 'spiritual/' + title)
    return dict(title=title, menu=menu, header=header, theme=theme, text=text, time=time)


class SpiritualDoc(DocDisplay):

    def get_settings(self):
        title = self.kwargs.get('title', 'Index')
        return spiritual_page_settings(self.request.get_host(), title)

    def get_template_names(self):
        return ['spiritual_theme.html']


class SpiritualSelect(RedirectView):
    permanent = False

    def get_redirect_url(self, *args, **kwargs):
        title = kwargs.get('title')
        if not title:
            title = choice(['reflect', 'teaching', 'prayers', 'bible', 'walkabout'])
        files = listdir(join('Documents', 'spiritual', title))
        file = choice(files)
        return '/spiritual/%s/%s' % (title, file)


