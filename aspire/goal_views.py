# goal.py -- created by factory script

from django.shortcuts import redirect
from django.core.urlresolvers import reverse_lazy
from django.views.generic import CreateView, DeleteView, DetailView, ListView, UpdateView

from aspire import aspire_context
from client import client_user
from goal import goal_add, goal_query, goal_table
from models import Goal
from tool.log import log


# List view
class GoalList(ListView):
    model = Goal
    template_name = 'goal_list.html'

    def get_context_data(self, **kwargs):
        log('GoalList page')
        context = super(GoalList, self).get_context_data(**kwargs)
        data = {
            'title': 'Goal List',
        }
        return aspire_context(context, data)

    def get_queryset(self):
        return goal_table(client_user(self.request.user))


# Add view
class GoalAdd(CreateView):
    model = Goal
    fields = ['name', 'parent']
    template_name = 'goal_add.html'
    success_url = '/aspire/goal_list'

    def get_context_data(self, **kwargs):
        log('GoalAdd page', kwargs)
        context = super(GoalAdd, self).get_context_data(**kwargs)
        data = {
            'title': 'Add Goal',
        }
        return aspire_context(context, data)

    def form_valid(self, form):
        name = form.cleaned_data['name']
        parent = form.cleaned_data['parent']
        goal_add(name, parent)
        return redirect('/aspire/goal_list')
        #return super(GoalAdd, self).form_valid(form)


# Detail view
class GoalDetail(DetailView):
    model = Goal
    template_name = 'goal_detail.html'

    def get_context_data(self, **kwargs):
        log('GoalDetail page', kwargs)
        context = super(GoalDetail, self).get_context_data(**kwargs)
        data = {
            'title': 'Goal Details',
            'values': self.object.values()
        }
        return aspire_context(context, data)


# Edit view
class GoalEdit(UpdateView):
    model = Goal
    fields = ['name', 'parent']
    template_name = 'goal_edit.html'
    success_url = '/aspire/goal_list'

    def get_context_data(self, **kwargs):
        log('GoalEdit page', kwargs)
        context = super(GoalEdit, self).get_context_data(**kwargs)
        data = {'title': 'Goal Edit'}
        return aspire_context(context, data)

    # def form_valid(self, form):
    #     name = form.cleaned_data['name']
    #     role = form.cleaned_data['role']
    #     hours = form.cleaned_data['hours']
    #     project_edit(self.object.pk, name, role, hours)
    #     return redirect('/aspire/project_list')


# Delete view
class GoalDelete(DeleteView):
    model = Goal
    success_url = reverse_lazy('goal_list')
    template_name = 'goal_delete.html'

    def get_context_data(self, **kwargs):
        log('GoalDelete page', kwargs)
        context = super(GoalDelete, self).get_context_data(**kwargs)
        data = {'title': 'Goal Delete'}
        return aspire_context(context, data)
