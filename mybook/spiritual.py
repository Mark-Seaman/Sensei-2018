from os import listdir
from os.path import join
from random import choice

from django.views.generic import TemplateView, RedirectView

from tool.document import domain_doc, doc_html_text
from tool.log import log_page


def spiritual():
    return ['reflect', 'bible', 'teaching', 'walkabout', 'prayers']


def spiritual_menu(title):
    def is_active(title, topic):
        return ' active' if title.startswith(topic) else ''

    return "Spiritual Things", [
        dict(url='/spiritual/Index', label='Home', active=is_active(title,'Index')),
        dict(url='/spiritual/reflect', label='Reflect', active=is_active(title,'reflect')),
        dict(url='/spiritual/prayers', label='Pray', active=is_active(title, 'prayers')),
        dict(url='/spiritual/bible', label='Meditate', active=is_active(title, 'bible')),
        dict(url='/spiritual/teaching', label='Learn', active=is_active(title, 'teaching')),
        dict(url='/spiritual/walkabout', label='Journey', active=is_active(title, 'walkabout')),
    ]

'''
{% block menu %}

    <nav class="navbar navbar-expand-md navbar-dark bg-dark mb-4">

        <a class="navbar-brand" href="#">Spiritual Things</a>

        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarCollapse"
                aria-controls="navbarCollapse" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse" id="navbarCollapse">

            <ul class="navbar-nav mr-auto">
                <li class="nav-item{% if menu.0 %} active{% endif %}">
                    <a class="nav-link" href="">Home</a>
                </li>
                <li class="nav-item{% if menu.1 %} active{% endif %}">
                    <a class="nav-link" href="">Reflect</a>
                </li>
                <li class="nav-item{% if menu.2 %} active{% endif %}">
                    <a class="nav-link" href="/spiritual/bible">Mediate</a>
                </li>
                <li class="nav-item{% if menu.3 %} active{% endif %}">
                    <a class="nav-link" href="/spiritual/teaching">Learn</a>
                </li>
                <li class="nav-item{% if menu.4 %} active{% endif %}">
                    <a class="nav-link" href="/spiritual/walkabout">Journey</a>
                </li>
                <li class="nav-item{% if menu.5 %} active{% endif %}">
                    <a class="nav-link" href="/spiritual/prayers">Pray</a>
                </li>
            </ul>
        </div>

    </nav>

{% endblock %}
'''


class SpiritualDoc(TemplateView):
    template_name = 'spiritual_theme.html'

    def get_context_data(self, **kwargs):
        log_page(self.request)
        title = self.kwargs.get('title', 'Index')
        domdoc = domain_doc(self.request.get_host(), title)
        text = doc_html_text(domdoc, '/static/images')
        menu = spiritual_menu(title)
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


