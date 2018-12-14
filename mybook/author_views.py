# author.py -- created by factory script

from django.core.urlresolvers import reverse_lazy
from django.views.generic import CreateView, DeleteView, DetailView, ListView, UpdateView

from models import Author
from mybook import main_menu
from tool.log import log
from book import book_query


def author_context(context, data):
    settings = {
        'color': 'green',
        'site': ('MyBook', 'Author'),
        'menu': main_menu('mybook', '/mybook/author_list'),
    }
    context.update(data)
    context.update(settings)
    return context


# List view
class AuthorList(ListView):
    model = Author
    template_name = 'author_list.html'

    def get_context_data(self, **kwargs):
        log('AuthorList page')
        context = super(AuthorList, self).get_context_data(**kwargs)
        return author_context(context, {'title': 'Author List'})


# Add view
class AuthorAdd(CreateView):
    model = Author
    fields = ['user', 'organization']
    template_name = 'author_add.html'

    def get_context_data(self, **kwargs):
        log('AuthorAdd page', kwargs)
        context = super(AuthorAdd, self).get_context_data(**kwargs)
        return author_context(context, {'title':  'Add Author'})


# Detail view
class AuthorDetail(DetailView):
    model = Author
    template_name = 'author_detail.html'

    def get_context_data(self, **kwargs):
        log('AuthorDetail page', kwargs)
        context = super(AuthorDetail, self).get_context_data(**kwargs)
        data = {
            'title':  self.object.name(),
            'books': book_query(self.object)
        }
        return author_context(context, data)


# Edit view
class AuthorEdit(UpdateView):
    model = Author
    fields = ['user', 'organization']
    template_name = 'author_edit.html'

    def get_context_data(self, **kwargs):
        log('AuthorEdit page', kwargs)
        context = super(AuthorEdit, self).get_context_data(**kwargs)
        return author_context(context, {'title': 'Author Edit'})


# Delete view
class AuthorDelete(DeleteView):
    model = Author
    success_url = reverse_lazy('author_list')
    template_name = 'author_delete.html'

    def get_context_data(self, **kwargs):
        log('AuthorDelete page', kwargs)
        context = super(AuthorDelete, self).get_context_data(**kwargs)
        return author_context(context, {'title': 'Author Delete'})


