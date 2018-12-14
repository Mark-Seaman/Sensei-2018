from django.contrib.auth.mixins import LoginRequiredMixin
from django.db.models import  TextField
from django.shortcuts import redirect
from os.path import join
from django.views.generic import FormView, TemplateView
from django.forms import Form

from mybook.mybook import mybook_site_title, main_menu
from tool.log import log_page
from workshop.models import Thot
from workshop.thot import thotbook_links, thotbook_add, thot_doc_file, thot_html, thot_objects, thot_parent, thot_text
from wiki.doc import doc_read,  doc_remove, doc_write


class ThotView(LoginRequiredMixin, TemplateView):
    template_name = 'thot.html'

    def get_context_data(self, **kwargs):
        log_page(self.request, 'Thot')
        pk = kwargs.get('pk', '')
        # if pk:
        thot = Thot.objects.get(pk=pk)
        # thots = thot_html(thot)
        title = thot.title
        text = thot_text(thot)
        if thot.thotbook.rootid != thot.pk:
            parent = thot_parent(thot)
        else:
            parent = None

        return {
            'site': mybook_site_title('workshop'),
            'title': title,
            'id': id,
            'text': text,
            'private': True,
            'parent': parent,
            'menu': main_menu('thot', 'thot/%s' % id),
            # 'thots': thots,
            'thot': thot,
            'objects': thot_objects(thot),
        }

    def get(self, args, **kwargs):
        title = kwargs.get('pk', '')
        if title == '1':
            return redirect('/thotbook')
        return super(ThotView, self).get(self, args, **kwargs)


class ThotDocEdit(LoginRequiredMixin, FormView):

    class EditDocForm(Form):
        text = TextField()

    template_name = 'thot_edit.html'
    form_class = EditDocForm

    def get_context_data(self, **kwargs):
        log_page(self.request, 'ThotDocEdit')
        context = super(ThotDocEdit, self).get_context_data(**kwargs)
        pk = self.kwargs.get('pk')
        thot = Thot.objects.get(pk=pk)
        path = thot_doc_file(thot)
        context.update({
            'site': mybook_site_title('thot'),
            'title': '%s' % thot.title,
            'menu': main_menu('thot', 'thot/1'),
            'text': doc_read(path),
            'private': True,

        })
        return context

    def form_valid(self, form):
        text = form.data.get('text', 'No input given')
        text = text.decode(encoding='UTF-8').encode('ascii', 'ignore')
        pk = self.kwargs.get('pk')
        thot = Thot.objects.get(pk=pk)
        path = thot_doc_file(thot)
        doc_remove(path)
        doc_write(path, text)
        if thot:
            return redirect('/thot/%s' % thot.pk)


class ThotBookView(LoginRequiredMixin, TemplateView):
    template_name = 'thotbook.html'

    def get_context_data(self, **kwargs):

        log_page(self.request, 'ThotBook')
        title = kwargs.get('title', '')
        text = ''

        if title:
            book = thotbook_add(title)
            books = None
            title = 'Thot Book: %s' % book.title
            path = join('thot', book.title, 'Index')
            text = doc_read(path)
        else:
            book = None
            books = thotbook_links()
            title = 'Open a Thot Book'

        return {
            'site': mybook_site_title('thot'),
            'title': title,
            'private': True,
            'menu': main_menu('thot', 'thot/1'),
            'text': text,
            'books': books,
            'book': book,
        }