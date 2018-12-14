# node.py -- created by factory script



# Views

from django.core.urlresolvers import reverse_lazy
from django.views.generic import CreateView, DeleteView, DetailView, ListView, UpdateView

from models import Node
#from views import aspire_settings
from tool.log import log


def aspire_context(data, page, title):
    #data['settings'] = aspire_settings(page)
    data['title'] = title
    return data


# List view
class NodeList(ListView):
    model = Node
    template_name = 'node_list.html'

    def get_context_data(self, **kwargs):
        log('NodeList page')
        context = super(NodeList, self).get_context_data(**kwargs)
        return aspire_context({}, '', 'Node List')


# Add view
class NodeAdd(CreateView):
    model = Node
    fields = ['name', 'notes']
    template_name = 'node_add.html'

    def get_context_data(self, **kwargs):
        log('NodeAdd page')
        context = super(NodeAdd, self).get_context_data(**kwargs)
        return aspire_context({}, '', 'Add Node')


# Detail view
class NodeDetail(DetailView):
    model = Node
    template_name = 'node_detail.html'

    def get_context_data(self, **kwargs):
        log('NodeDetail page')
        context = super(NodeDetail, self).get_context_data(**kwargs)
        return aspire_context({}, '', 'Node Details')


# Edit view
class NodeEdit(UpdateView):
    model = Node
    fields = ['name', 'notes']
    template_name = 'node_edit.html'

    def get_context_data(self, **kwargs):
        log('NodeEdit page')
        context = super(NodeEdit, self).get_context_data(**kwargs)
        return aspire_context({}, '', 'Node Edit')


# Delete view
class NodeDelete(DeleteView):
    model = Node
    success_url = reverse_lazy('node_list')
    template_name = 'node_delete.html'

    def get_context_data(self, **kwargs):
        log('NodeDelete page')
        context = super(NodeDelete, self).get_context_data(**kwargs)
        return aspire_context({}, '', 'Node Delete')


