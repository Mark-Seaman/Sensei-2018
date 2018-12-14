from django.contrib.auth.mixins import LoginRequiredMixin
from django.core.urlresolvers import reverse_lazy
from django.utils.text import slugify
from django.views.generic import CreateView, DeleteView, DetailView, ListView, RedirectView, TemplateView, UpdateView
from os.path import basename, dirname, exists

from bin.pandoc import text_to_html
from doc import doc_breadcrumbs, doc_html
from models import WikiDoc
from tool.log import log


def doc_context(context, data):
    settings = {
        'color': 'blue',
        'site': ('Seaman Wiki', 'Workshop for WebDev'),
    }
    context.update(data)
    context.update(settings)
    return context


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


def set_slugs():
    for page in WikiDoc.objects.all():
        page.slug = slugify(page.title)
        page.save()


# Add view
class DocAdd(LoginRequiredMixin, CreateView):
    model = WikiDoc
    fields = ['title', 'body']
    template_name = 'wiki_add.html'
    success_url = '/wiki/list'

    def get_context_data(self, **kwargs):
        log('DocAdd page', kwargs)
        context = super(DocAdd, self).get_context_data(**kwargs)
        data = {'title': 'Add Doc'}
        return doc_context(context, data)

    def form_valid(self, form):
        title = form.cleaned_data['title']
        body = form.cleaned_data['body']
        user = self.request.user
        slug = slugify(title)
        form.instance = WikiDoc.objects.create(title=title, body=body, slug=slug, path='No path', user=user)
        return super(DocAdd, self).form_valid(form)


# Delete view
class DocDelete(LoginRequiredMixin, DeleteView):
    model = WikiDoc
    success_url = reverse_lazy('list')
    template_name = 'wiki_delete.html'

    def get_context_data(self, **kwargs):
        log('DocDelete page', kwargs)
        context = super(DocDelete, self).get_context_data(**kwargs)
        data = dict (title='Delete Page', page=self.object.title)
        return doc_context(context, data)


# Detail view
class DocDetail(LoginRequiredMixin, DetailView):
    model = WikiDoc
    template_name = 'wiki_detail.html'

    def get_context_data(self, **kwargs):
        context = super(DocDetail, self).get_context_data(**kwargs)
        data = {
            'title': 'Doc Details',
            'text': text_to_html(self.object.body)
        }
        return doc_context(context, data)


class DocDisplay(LoginRequiredMixin, TemplateView):
    template_name = 'wiki_display.html'

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
    model = WikiDoc
    template_name = 'wiki_edit.html'
    fields = ['title', 'body']

    def get_context_data(self, **kwargs):
        log('DocEdit page', kwargs)
        context = super(DocEdit, self).get_context_data(**kwargs)
        data = {
            'title': self.object.title,
        }
        return doc_context(context, data)

    def form_valid(self, form):
        title = form.cleaned_data['title']
        self.object.slug = slugify(title)
        return super(DocEdit, self).form_valid(form)


# List view
class DocList(LoginRequiredMixin, ListView):
    model = WikiDoc
    template_name = 'wiki_list.html'

    def get_context_data(self, **kwargs):
        context = super(DocList, self).get_context_data(**kwargs)
        data = {
            'title': 'Wiki Pages',
        }
        return doc_context(context, data)


# Doc view
class DocView(RedirectView):

    def get_redirect_url(self, *args, **kwargs):
        set_slugs()
        x = WikiDoc.objects.filter(slug=slugify(kwargs.get('title')))
        if x:
            pk = x[0].pk
            return '/wiki/detail/%s' % pk
        else:
            user = self.request.user
            title = self.kwargs.get('title')
            x = WikiDoc.objects.create(title=title, slug=title, user=user)
            return '/wiki/edit/%d' % x.pk

