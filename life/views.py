from django.views.generic import RedirectView, ListView, TemplateView, UpdateView
from django.contrib.auth.mixins import LoginRequiredMixin

from life import query_labels, query_get, query_year, query_experiences
from models import Experience
from tool.log import log


class LifeView(TemplateView):
    template_name = 'life.html'


class ExperienceView(ListView):
    template_name = 'experience.html'
    model = Experience

    def get_context_data(self, **kwargs):
        labels = query_labels()
        table = query_experiences()
        kwargs.update(dict(title='Life Experiences', labels=labels, table=table))
        return kwargs


class YearView(ListView):
    model = Experience
    template_name = 'year.html'

    def get_context_data(self, **kwargs):
        age = int(self.kwargs.get('age'))
        labels = query_labels()
        table = query_experiences(age)
        year = '%d/%d' % (1959 + age, 1960 + age)
        settings = dict(
            title='Yearly Experiences', labels=labels, table=table, age=age, year=year, x=query_year(age),
            next=age + 1, prev=age - 1
        )
        kwargs.update(settings)
        return kwargs


class LifeAdd(LoginRequiredMixin, RedirectView):

    def get_redirect_url(self, *args, **kwargs):
        age = self.kwargs.get('age')
        aspect = self.kwargs.get('aspect')
        e = Experience.objects.create(age=age, aspect_id=aspect, summary="None")
        return '/life/%s/edit' % e.pk


class LifeEdit(UpdateView):
    model = Experience
    fields = ['summary']
    template_name = 'life_edit.html'

    def get_context_data(self, **kwargs):
        pk = self.kwargs.get('pk')
        age = query_get(pk).age
        aspect = query_get(pk).aspect
        year = 1959 + age, 1960 + age
        title = 'Age %s - %d/%d - %s' % (age, year[0], year[1], aspect)
        kwargs['title'] = title
        log('LifeEdit page', title)
        return super(LifeEdit, self).get_context_data(**kwargs)
