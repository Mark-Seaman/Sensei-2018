from django.contrib.auth.models import User
from django.urls import reverse_lazy
from django.views.generic import ListView, CreateView, DetailView, UpdateView, DeleteView

from tool.log import log


class UserList(ListView):
    model = User
    template_name = 'user_list.html'

    def get_context_data(self, **kwargs):
        log('UserList page')
        context = super(UserList, self).get_context_data(**kwargs)
        context['title'] = 'User List'
        return context


class UserCreate(CreateView):
    model = User
    fields = ['first_name', 'last_name']
    template_name = 'user_add.html'

    def get_context_data(self, **kwargs):
        log('UserCreate page')
        context = super(UserCreate, self).get_context_data(**kwargs)
        context['title'] = 'Add User'
        return context


class UserDetail(DetailView):
    model = User
    template_name = 'user_detail.html'

    def get_context_data(self, **kwargs):
        log('UserDetail page')
        context = super(UserDetail, self).get_context_data(**kwargs)
        context['title'] = 'User Details'
        return context


class UserEdit(UpdateView):
    model = User
    fields = ['first_name', 'last_name']
    template_name = 'user_edit.html'

    def get_context_data(self, **kwargs):
        log('UserEdit page')
        context = super(UserEdit, self).get_context_data(**kwargs)
        context['title'] = 'User Edit'
        return context


class UserDelete(DeleteView):
    model = User
    success_url = reverse_lazy('user_list')
    template_name = 'user_delete.html'

    def get_context_data(self, **kwargs):
        log('UserDelete page')
        context = super(UserDelete, self).get_context_data(**kwargs)
        context['title'] = 'User Delete'
        return context

