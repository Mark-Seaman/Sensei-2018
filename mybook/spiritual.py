from django.views.generic import TemplateView, RedirectView
from os import listdir
from os.path import join
from random import choice

from tool.log import log_page

from .mybook import topic_menu, page_settings



def spiritual_page_settings(request, title):
    domain = request.get_host()
    menu = topic_menu(title, spiritual_topics(), '/spiritual/', "Spiritual Things")
    site_title = ('Spiritual Things', 'Daily Inspiration')
    return page_settings(domain, title, site_title, menu)

    # return dict(title=title, text=text, menu=menu, url=url, header=header)


def spiritual_topics():
    return [('Index',       'Home'),
            ('reflect',     'Reflect'),
            ('bible',       'Meditate'),
            ('teaching',    'Learn'),
            ('walkabout',   'Journey'),
            ('prayers',     'Pray')]


class SpiritualDoc(TemplateView):
    template_name = 'spiritual_theme.html'

    def get_context_data(self, **kwargs):
        log_page(self.request)
        title = self.kwargs.get('title', 'Index')
        return spiritual_page_settings(self.request, title)

        # page_settings(self.request.get_host(),
        #                      title,
        #                      ('Spiritual Things', 'Daily Inspiration'),
        #                      spiritual_topics())


class SpiritualSelect(RedirectView):
    permanent = False

    def get_redirect_url(self, *args, **kwargs):
        title = kwargs.get('title')
        if not title:
            title = choice(['reflect', 'teaching', 'prayers', 'bible', 'walkabout'])
        files = listdir(join('Documents', 'spiritual', title))
        file = choice(files)
        return '/spiritual/%s/%s' % (title, file)


