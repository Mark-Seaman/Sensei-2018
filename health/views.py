from django.views.generic import ListView, UpdateView
from django.views.generic.base import TemplateView

from .models import HealthScore
from tool.document import doc_html_text
from tool.log import log


# def health_menu(page):
#     menu_data = [
#         ['home',        "zmdi-home",                "Home",             '/health'],
#         ['history',     "zmdi-storage",             'History',          '/health/history'],
#         ['test',        "zmdi-comment-outline",     'Test',             '/health/test'],
#     ]
#     return create_menu(page, menu_data)


def health_settings(page='home'):
    return {
        'title': 'Health Scorecard',
        'subtitle': 'What you measure improves',
        'label': '',
        'color': 'teal',
        'footer': True,
    }


# Home
class HealthView(TemplateView):
    template_name = 'health.html'

    def get_context_data(self, **kwargs):
        log('HealthView page')
        text = doc_html_text('MarkSeaman/Health')
        context = super(HealthView, self).get_context_data(**kwargs)
        context['settings'] = health_settings()
        context['title'] = 'Health Data File'
        context['doc_html_text'] = str(text)
        return context


# List
class HealthList(ListView):
    model = HealthScore
    template_name = 'health_list.html'

    def get_queryset(self):
        return HealthScore.objects.order_by('-date')

    def get_context_data(self, **kwargs):
        log('HealthScore page')
        context = super(HealthList, self).get_context_data(**kwargs)
        context['settings'] = health_settings('history')
        context['title'] = 'Health History'
        context['labels'] = ['Date'] + HealthScore.labels()[3:]
        context['values'] = health_scores(self.object_list)
        return context


class HealthEdit(UpdateView):
    model = HealthScore
    fields = ['sleep', 'weight', 'eat', 'exercise']
    template_name = 'health_edit.html'
    success_url = '/health/history'

    def get_context_data(self, **kwargs):
        log('HealthView page')
        context = super(HealthEdit, self).get_context_data(**kwargs)
        context['settings'] = health_settings()
        context['title'] = 'Health Score Edit'
        context['labels'] = HealthScore.labels()
        return context


def health_scores(objects):

    def average(num_list):
        return int(round(sum(num_list) / float(len(num_list))))

    def five_star(rating):
        return '<i class="zmdi zmdi-star"></i>'*rating

    def scores(row):
        r = row.as_row()
        id = (r[0], r[2])
        values = r[3:7] + [average(r[3:7])]

        return (id, [five_star(x) for x in values])

    return [scores(o) for o in objects[:7]]
