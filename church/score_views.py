# church_score.py -- created by factory script

from datetime import timedelta
from django.core.urlresolvers import reverse_lazy
from django.views.generic import CreateView, DeleteView, DetailView, ListView, UpdateView

from church import church_context
from score import all_scores, score_details, score_history, scorecard_data
from models import ChurchBudget, ChurchEvent, ChurchScore
from tool.log import log


# List view
class ChurchScoreList(ListView):
    model = ChurchScore
    template_name = 'church_score_list.html'

    def get_context_data(self, **kwargs):
        log('ChurchScoreList page')
        scores = ChurchScore.objects.all().order_by('-date')
        if scores:
            score = scores[0]
            end = score.date
            start = end - timedelta(days=7)
            x = scorecard_data(score)

        else:
            score = None
            start = None
            end = None
            x = None
        context = super(ChurchScoreList, self).get_context_data(**kwargs)
        data = {
            'score': score,
            'date': (start, end),
            'scorecard': x,
            'labels': ChurchScore.labels()[2:] + ['Score'],
            'values': score_history(self.object_list),
        }
        return church_context(context, data, 'history', 'Church Health Scorecard')

    def get_queryset(self):
        # return my_scores(self.request.user)
        return all_scores()


# Add view
class ChurchScoreAdd(CreateView):
    model = ChurchScore
    fields = ['church', 'date', 'connect_score', 'lead_score', 'give_score', 'invest_score']
    template_name = 'church_score_add.html'

    def get_context_data(self, **kwargs):
        log('ChurchScoreCreate page')
        context = super(ChurchScoreAdd, self).get_context_data(**kwargs)
        return church_context(context, {}, 'history', 'Add Church Score')

    def form_valid(self, form):
        # form.instance.connect_hours = 4
        date = form.cleaned_data['date']
        ChurchEvent.objects.get_or_create(date=date, name='Sunday Service', leadership=False)
        ChurchBudget.objects.get_or_create(date=date, church_id=1)
        return super(ChurchScoreAdd, self).form_valid(form)


# Detail view
class ChurchScoreDetail(DetailView):
    model = ChurchScore
    template_name = 'church_score_detail.html'

    def get_context_data(self, **kwargs):
        log('ChurchScoreDetail page')
        context = super(ChurchScoreDetail, self).get_context_data(**kwargs)
        score = score_details(self.object)
        return church_context(context, {'score': score}, 'history', 'Church Score Details')


# Edit view
class ChurchScoreEdit(UpdateView):
    model = ChurchScore
    fields = ['church', 'date', 'connect_score', 'lead_score', 'give_score', 'invest_score',
              'connect_hours', 'lead_hours', 'give_dollars', 'invest_difference']
    template_name = 'church_score_edit.html'

    def get_context_data(self, **kwargs):
        log('ChurchScoreEdit page')
        context = super(ChurchScoreEdit, self).get_context_data(**kwargs)
        return church_context(context, {}, 'history', 'Church Score Edit')


# Delete view
class ChurchScoreDelete(DeleteView):
    model = ChurchScore
    success_url = reverse_lazy('church_score_list')
    template_name = 'church_score_delete.html'

    def get_context_data(self, **kwargs):
        log('ChurchScoreDelete page')
        context = super(ChurchScoreDelete, self).get_context_data(**kwargs)
        return church_context(context, {}, 'history', 'Church Score Delete')

