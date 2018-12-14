# leader_views.py -- created by factory script

from django.core.urlresolvers import reverse_lazy
from django.views.generic import CreateView, DeleteView, DetailView, ListView, UpdateView

from church import church_context
from models import Leader
from tool.log import log


# List view
class LeaderList(ListView):
    model = Leader
    template_name = 'leader_list.html'

    def get_context_data(self, **kwargs):
        log('LeaderList page')
        context = super(LeaderList, self).get_context_data(**kwargs)
        return church_context(context, {}, '', 'Leader List')


# Add view
class LeaderAdd(CreateView):
    model = Leader
    fields = ['name', 'notes']
    template_name = 'leader_add.html'

    def get_context_data(self, **kwargs):
        log('LeaderAdd page')
        context = super(LeaderAdd, self).get_context_data(**kwargs)
        return church_context(context, {}, '', 'Add Leader')


# Detail view
class LeaderDetail(DetailView):
    model = Leader
    template_name = 'leader_detail.html'

    def get_context_data(self, **kwargs):
        log('LeaderDetail page')
        context = super(LeaderDetail, self).get_context_data(**kwargs)
        return church_context(context, {'values': self.object.values()}, '', 'Leader Details')


# Edit view
class LeaderEdit(UpdateView):
    model = Leader
    fields = ['name', 'notes']
    template_name = 'leader_edit.html'

    def get_context_data(self, **kwargs):
        log('LeaderEdit page')
        context = super(LeaderEdit, self).get_context_data(**kwargs)
        return church_context(context, {}, '', 'Leader Edit')


# Delete view
class LeaderDelete(DeleteView):
    model = Leader
    success_url = reverse_lazy('leader_list')
    template_name = 'leader_delete.html'

    def get_context_data(self, **kwargs):
        log('LeaderDelete page')
        context = super(LeaderDelete, self).get_context_data(**kwargs)
        return church_context(context, {}, '', 'Leader Delete')


