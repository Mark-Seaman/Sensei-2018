from django.contrib.auth.mixins import LoginRequiredMixin
from django.core.urlresolvers import reverse_lazy
from django.views.generic import CreateView, DeleteView, DetailView, ListView, TemplateView, UpdateView
from os.path import basename, dirname, exists

from doc import doc_breadcrumbs, doc_html, doc_table
from models import Doc
from tool.log import log


def doc_context(context, data):
    settings = {
        'color': 'blue',
        'site': ('Documents', 'Workshop for WebDev'),
    }
    context.update(data)
    context.update(settings)
    return context


# Add view
class DocAdd(LoginRequiredMixin, CreateView):
    model = Doc
    fields = ['title', 'path', 'user']
    template_name = 'doc_add.html'
    success_url = '/doc/doc_list'

    def get_context_data(self, **kwargs):
        log('DocAdd page', kwargs)
        context = super(DocAdd, self).get_context_data(**kwargs)
        data = {'title': 'Add Doc'}
        return doc_context(context, data)


# Detail view
class DocDetail(LoginRequiredMixin, DetailView):
    model = Doc
    template_name = 'doc_detail.html'

    def get_context_data(self, **kwargs):
        log('DocDetail page', kwargs)
        context = super(DocDetail, self).get_context_data(**kwargs)
        data = {
            'title': 'Doc Details',
            'values': self.object.values()
        }
        return doc_context(context, data)


def doc_menu(page):

    def menu_active(page, menu_item):
        if page.startswith(menu_item):
            return 'class=active'

    def menu_entry(page, x):
        icon, label, url = x
        return url, "zmdi-" + icon, label, menu_active(page, url)

    def menu_read(page):
        dir = dirname(page)
        page = basename(page)
        menu_file = 'Documents/%s/Menu' % dir
        if exists(menu_file):
            menu_items = open(menu_file).read().split('\n')
            menu_data = [m.split(',') for m in menu_items if m]
            return [menu_entry(page, x) for x in menu_data]

    return menu_read(page)


class DocDisplay(LoginRequiredMixin, TemplateView):
    template_name = 'doc_display.html'

    def get_context_data(self, **kwargs):
        title = kwargs.get('title')
        log('DocDisplay', title)
        data = {
            'title': title,
            'text': doc_html(title),
            'menu': doc_menu(title),
            'breadcrumbs': doc_breadcrumbs(title),
            'dir': 'DIR',
        }
        return doc_context({}, data)


# Edit view
class DocEdit(LoginRequiredMixin, UpdateView):
    model = Doc
    fields = ['title', 'path', 'user']
    template_name = 'doc_edit.html'
    success_url = '/doc/doc_list'

    def get_context_data(self, **kwargs):
        log('DocEdit page', kwargs)
        context = super(DocEdit, self).get_context_data(**kwargs)
        data = {
            'title': self.object.title,
        }
        return doc_context(context, data)


# Delete view
class DocDelete(LoginRequiredMixin, DeleteView):
    model = Doc
    success_url = reverse_lazy('doc_list')
    template_name = 'doc_delete.html'

    def get_context_data(self, **kwargs):
        log('DocDelete page', kwargs)
        context = super(DocDelete, self).get_context_data(**kwargs)
        data = {'title': 'Doc Delete'}
        return doc_context(context, data)


# List view
class DocList(LoginRequiredMixin, ListView):
    model = Doc
    template_name = 'doc_list.html'

    def get_context_data(self, **kwargs):
        log('DocList page')
        context = super(DocList, self).get_context_data(**kwargs)
        data = {
            'title': 'Doc List',
        }
        return doc_context(context, data)

    def get_queryset(self):
        return doc_table()


