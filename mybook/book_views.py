# book.py -- created by factory script

from django.core.urlresolvers import reverse_lazy
from django.shortcuts import redirect
from django.views.generic import CreateView, DeleteView, DetailView, ListView, UpdateView

from author import author_user
from book import book_query, book_stats
from models import Book
from tool.log import log
from mybook import main_menu


def book_context(context, data):
    settings = {
        'color': 'green',
        'site': ('MyBook', 'Book'),
        'menu': main_menu('mybook','/mybook/book_list'),
    }
    context.update(data)
    context.update(settings)
    return context


# List view
class BookList(ListView):
    model = Book
    template_name = 'book_list.html'

    def get_context_data(self, **kwargs):
        log('BookList page')
        context = super(BookList, self).get_context_data(**kwargs)
        data = {
            'title': 'Book List',
            'labels': Book.labels(),
            'table': book_query(0),
        }
        return book_context(context, data)


# Add view
class BookAdd(CreateView):
    model = Book
    fields = ['title', 'doc']
    template_name = 'book_add.html'

    def get_context_data(self, **kwargs):
        log('BookAdd page', kwargs)
        context = super(BookAdd, self).get_context_data(**kwargs)
        return book_context(context, {'title': 'Add Book'})

    def form_valid(self, form):
        title = form.cleaned_data['title']
        doc = form.cleaned_data['doc']
        author = author_user(self.request.user)
        Book.objects.create(title=title, doc=doc, author=author)
        return redirect('/mybook/Index')


# Detail view
class BookDetail(DetailView):
    model = Book
    template_name = 'book_detail.html'

    def get_context_data(self, **kwargs):
        log('BookDetail page', kwargs)
        context = super(BookDetail, self).get_context_data(**kwargs)
        data = {
            'title': 'Book Details',
            'stats': book_stats(self.object)
        }
        return book_context(context, data)


# Edit view
class BookEdit(UpdateView):
    model = Book
    fields = ['title', 'published', 'doc', 'hours']
    template_name = 'book_edit.html'

    def get_context_data(self, **kwargs):
        log('BookEdit page', kwargs)
        context = super(BookEdit, self).get_context_data(**kwargs)
        return book_context(context, {'title': 'Book Edit'})


# Delete view
class BookDelete(DeleteView):
    model = Book
    success_url = reverse_lazy('book_list')
    template_name = 'book_delete.html'

    def get_context_data(self, **kwargs):
        log('BookDelete page', kwargs)
        context = super(BookDelete, self).get_context_data(**kwargs)
        return book_context(context, {'title': 'Book Delete'})
