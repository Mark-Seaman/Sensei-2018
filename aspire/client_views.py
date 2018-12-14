# client_views.py

from django.core.urlresolvers import reverse_lazy
from django.forms import Form, CharField, EmailField
from django.shortcuts import redirect
from django.views.generic import FormView, DeleteView, DetailView, ListView, UpdateView

from client import client_add
from models import Client
from views import AspireContext


# List view
class ClientList(AspireContext, ListView):
    model = Client
    template_name = 'client_list.html'

    def get_context_data(self, **kwargs):
        kwargs = super(ClientList, self).get_context_data(**kwargs)
        kwargs.update(dict(title='Client List'))
        return kwargs


# Add view
class ClientAdd(AspireContext, FormView):

    class SignupForm(Form):
        name = CharField(label=' Name', max_length=200)
        email = EmailField(label='Email', max_length=100)
        organization = CharField(label='Organization', max_length=200)

    template_name = 'client_add.html'
    form_class = SignupForm

    def get_context_data(self, **kwargs):
        kwargs = super(ClientAdd, self).get_context_data(**kwargs)
        kwargs.update(dict(title='Add Client'))
        return kwargs

    def form_valid(self, form):
        name = form.cleaned_data['name']
        email = form.cleaned_data['email']
        organization = form.cleaned_data['organization']
        client_add(name, email, organization)
        return redirect('/aspire')


# Detail view
class ClientDetail(AspireContext, DetailView):
    model = Client
    template_name = 'client_detail.html'

    def get_context_data(self, **kwargs):
        kwargs = super(ClientDetail, self).get_context_data(**kwargs)
        title = self.object.user.username + 'Profile'
        values = self.object.values()
        kwargs.update(dict(title=title, values=values))
        return kwargs


# Edit view
class ClientEdit(AspireContext, UpdateView):
    model = Client
    fields = ['name', 'notes']
    template_name = 'client_edit.html'

    def get_context_data(self, **kwargs):
        kwargs = super(ClientEdit, self).get_context_data(**kwargs)
        kwargs.update(dict(title='Client Edit'))
        return kwargs


# Delete view
class ClientDelete(AspireContext, DeleteView):
    model = Client
    success_url = reverse_lazy('client_list')
    template_name = 'client_delete.html'

    def get_context_data(self, **kwargs):
        kwargs = super(ClientDelete, self).get_context_data(**kwargs)
        kwargs.update(dict(title='Client Delete'))
        return kwargs
