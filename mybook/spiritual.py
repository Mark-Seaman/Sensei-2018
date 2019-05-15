from os import listdir
from os.path import join
from random import choice

from django.views.generic import TemplateView, RedirectView

from tool.document import domain_doc, doc_html_text


def spiritual():
    return ['reflect', 'bible', 'teaching', 'walkabout', 'prayers']


def spiritual_menu(title):
    return [title == 'Index'] + [title.startswith(i) for i in spiritual()]


class SpiritualDoc(TemplateView):
    template_name = 'spiritual_theme.html'

    def get_context_data(self, **kwargs):
        title = self.kwargs.get('title', 'Index')
        domdoc = domain_doc(self.request.get_host(), title)
        text = doc_html_text(domdoc, '/static/images')
        menu = spiritual_menu(title)
        return dict(title=title, text=text, menu=menu)


class SpiritualMissing(TemplateView):
    template_name = 'spiritual_theme.html'

    def get_context_data(self, **kwargs):
        title = self.kwargs.get('title', 'Index')
        return dict(title="Missing Document",
                    text='We are sorry but the document you were looking for could not be found',
                    menu= spiritual_menu(title))


class SpiritualSelect(RedirectView):
    permanent = False

    def get_redirect_url(self, *args, **kwargs):
        title = kwargs.get('title')
        if not title:
            title = choice(['reflect', 'teaching', 'prayers', 'bible', 'walkabout'])
        files = listdir(join('Documents', 'spiritual', title))
        file = choice(files)
        return '/spiritual/%s/%s' % (title, file)


