from django.views.generic import TemplateView, RedirectView
from django.utils.timezone import now
from os import listdir
from os.path import join
from random import choice

from .views import DocDisplay
from .mybook import topic_menu, page_settings, page_text


class SpiritualDoc(DocDisplay):

    def get_context_data(self, **kwargs):

        def menu(title):
            def spiritual_topics():
                return [('Index', 'Home', title.startswith('Index')),
                        ('reflect', 'Reflect', title.startswith('reflect')),
                        ('bible', 'Meditate', title.startswith('bible')),
                        ('teaching', 'Learn', title.startswith('teaching')),
                        ('walkabout', 'Journey', title.startswith('walkabout')),
                        ('prayers', 'Pray', title.startswith('prayers'))]

            return topic_menu(spiritual_topics(), '/spiritual/', "Spiritual Things")

        domain = self.request.get_host()
        title = self.kwargs.get('title', 'Index')
        site_title = ('Spiritual Things', 'Daily Inspiration')
        text = page_text(domain, 'spiritual/' + title)
        return page_settings(title, site_title, None, menu(title), text)

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


