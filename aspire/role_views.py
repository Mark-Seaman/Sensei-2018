# role_views.py -- created by factory script

from django.core.urlresolvers import reverse_lazy
from django.shortcuts import redirect
from django.views.generic import CreateView, DeleteView, DetailView, ListView, RedirectView, UpdateView
from django.contrib.auth.mixins import LoginRequiredMixin

from aspire import aspire_context
from client import client_user
from models import Role
from role import role_add, role_get, role_query
from project import project_table
from tool.log import log


# List view
class RoleList(LoginRequiredMixin, ListView):
    model = Role
    template_name = 'role_list.html'

    def get_context_data(self, **kwargs):
        kwargs = super(RoleList, self).get_context_data(**kwargs)
        labels = Role.labels()
        table = role_query(0)
        kwargs.update(dict(title='Role List', labels=labels, table=table))
        return kwargs


# Add view
class RoleAdd(CreateView):
    model = Role
    fields = ['name']
    template_name = 'role_add.html'

    def get_context_data(self, **kwargs):
        kwargs = super(RoleAdd, self).get_context_data(**kwargs)
        client = client_user(self.request.user)
        kwargs.update(dict(title='Add Role', client=client))
        return kwargs

    def form_valid(self, form):
        name = form.cleaned_data['name']
        client = client_user(self.request.user)
        role_add(name, client)
        return redirect('/aspire/role_list')


# Detail view
class RoleDetail(LoginRequiredMixin, DetailView):
    model = Role
    template_name = 'role_detail.html'

    def get_context_data(self, **kwargs):
        kwargs = super(RoleDetail, self).get_context_data(**kwargs)
        title = '%s - Role Details' % self.object.name
        values = self.object.values()
        projects = project_table(self.object)
        kwargs.update(dict(title=title, values=values, projects=projects))
        return kwargs


# Edit view
class RoleEdit(UpdateView):
    model = Role
    fields = ['name']
    template_name = 'role_edit.html'

    def get_context_data(self, **kwargs):
        kwargs = super(RoleEdit, self).get_context_data(**kwargs)
        kwargs.update(dict(title='Role Edit', fields=self.object.fields()))
        return kwargs

    def form_valid(self, form):
        super(RoleEdit, self).form_valid(form)
        return redirect('/aspire/role_list')


# Delete view
class RoleDelete(DeleteView):
    model = Role
    success_url = reverse_lazy('role_list')
    template_name = 'role_delete.html'

    def get_context_data(self, **kwargs):
        kwargs = super(RoleDelete, self).get_context_data(**kwargs)
        kwargs.update(dict(title='Role Delete'))
        return kwargs


class RoleView(LoginRequiredMixin, RedirectView):

    def get(self, args, **kwargs):
        title = self.kwargs.get('title', None)
        if title == 'Home':
            self.url = '/aspire/Index'
        else:
            role = role_get(client_user(self.request.user), title)
            self.url = '/aspire/role_detail/%s' % role.pk
        return super(RoleView, self).get(args, **kwargs)
