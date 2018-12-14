# event_views.py -- created by datatype factory script

from django.core.urlresolvers import reverse_lazy
from django.views.generic import CreateView, DeleteView, DetailView, ListView, UpdateView

from church import church_context
from event import connect_score, event_dates, hours_table, lead_score, event_hours
from models import Church, ChurchEvent
from tool.document import doc_html_text
from tool.log import log
#from score import set_score


# List view
class ChurchEventList(ListView):
    model = ChurchEvent
    template_name = 'church_event_list.html'

    def get_context_data(self, **kwargs):
        log('ChurchEventList page')
        date = self.kwargs.get('date', None)
        if date:
            weeks = None
            lead_table = hours_table(date, True)
            connect_table = hours_table(date, False)
            lead_hours = event_hours(date, True)
            connect_hours = event_hours(date, False)
        else:
            weeks = event_dates()
            lead_table = None
            connect_table = None
            lead_hours = None
            connect_hours = None

        context = super(ChurchEventList, self).get_context_data(**kwargs)
        data = {
            'lead_hours': lead_hours,
            'connect_hours': connect_hours,
            'lead_score': lead_score(lead_hours),
            'connect_score': connect_score(connect_hours),
            'date': date,
            'weeks': weeks,
            'leadership': lead_table,
            'connect': connect_table,
            'card_text': doc_html_text('church/Meetings'),

        }
        return church_context(context, data, 'events', 'Church Event Meetings')

    def get_queryset(self):
        date = self.kwargs.get('date', None)
        if date:
            return ChurchEvent.objects.filter(date=date, leadership=False).order_by('-date')


# Add view
class ChurchEventAdd(CreateView):
    model = ChurchEvent
    fields = ['name', 'leadership', 'participants', 'duration']
    template_name = 'church_event_add.html'

    def get_context_data(self, **kwargs):
        log('ChurchEventAdd page')
        date = self.kwargs.get('date', None)
        context = super(ChurchEventAdd, self).get_context_data(**kwargs)
        return church_context(context, {'date': date}, 'events', 'Add Church Event %s' % date)

    def form_valid(self, form):
        form.instance.church = Church.objects.get(name='Greeley Vineyard')
        form.instance.date = self.kwargs.get('date', None)
        result = super(ChurchEventAdd, self).form_valid(form)
        #set_score(form.instance.church, form.instance.date)
        return result


# Detail view
class ChurchEventDetail(DetailView):
    model = ChurchEvent
    template_name = 'church_event_detail.html'

    def get_context_data(self, **kwargs):
        log('ChurchEventDetail page')
        context = super(ChurchEventDetail, self).get_context_data(**kwargs)
        data = {
            'hours': self.object.duration * self.object.participants,
            'date': str(self.object.date),
        }
        return church_context(context, data, 'events', 'Church Event Details')


# Edit view
class ChurchEventEdit(UpdateView):
    model = ChurchEvent
    fields = ['name', 'leadership', 'date', 'participants', 'duration']
    template_name = 'church_event_edit.html'

    def get_context_data(self, **kwargs):
        log('ChurchEventEdit page')
        context = super(ChurchEventEdit, self).get_context_data(**kwargs)
        return church_context(context, {}, 'events', 'Church Event Edit')

    def form_valid(self, form):
        form.instance.church = Church.objects.get(name='Greeley Vineyard')
        result = super(ChurchEventEdit, self).form_valid(form)
        #set_score(form.instance.church, str(form.instance.date))
        return result


# Delete view
class ChurchEventDelete(DeleteView):
    model = ChurchEvent
    success_url = reverse_lazy('church_event_list')
    template_name = 'church_event_delete.html'

    def get_context_data(self, **kwargs):
        log('ChurchEventDelete page')
        context = super(ChurchEventDelete, self).get_context_data(**kwargs)
        return church_context(context, {}, 'events', 'Church Event Delete')
