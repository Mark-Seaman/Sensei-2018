from django.contrib.auth.mixins import LoginRequiredMixin
from django.db.models import CharField, TextField
from django.forms import Form
from django.shortcuts import redirect
from django.views.generic import FormView, RedirectView, TemplateView
from django.views.generic.base import ContextMixin
from os.path import basename, dirname, join

from aspire import aspire_context, doc_redirect
from client import client_user
from doc import doc_delete, doc_directory, doc_folder, doc_html, doc_index, doc_path, doc_read,  doc_remove, doc_write
from mybook.mybook import main_menu, mybook_site_title
from project import project_list
from tool.document import doc_html_text
from tool.log import log, log_page


class AspireContext(ContextMixin, LoginRequiredMixin):

    def get_context_data(self, **kwargs):
        title = kwargs.get('title', '')
        log_page(self.request, 'AspireView:' + title)
        data = {
            'site': mybook_site_title('aspire'),
            'menu': main_menu('aspire', 'aspire/1'),
            'title': 'ASPIRE CONTEXT MIXIN',
        }
        return data


class AspireDocDisplay(TemplateView):
    template_name = 'mybook_public.html'

    def get_context_data(self, **kwargs):
        title = kwargs.get('title','')
        # title = self.request.path
        kwargs = super(AspireDocDisplay, self).get_context_data(**kwargs)
        text = doc_html_text(title)
        kwargs.update(dict(text=text, title=title))
        return kwargs


# Anonymous
class AspireAnonymous(TemplateView):
    template_name = 'aspire_home.html'

    def get_context_data(self, **kwargs):
        log_page(self.request, 'AspireAnonymous context')
        return dict(title="Welcome to Aspire", site=mybook_site_title('aspire'))


# Delete
class AspireDelete(LoginRequiredMixin, RedirectView):

    def get(self, args, **kwargs):
        title = kwargs.get('title')
        path = doc_path(self.request.user, title)
        doc_delete(path)
        return redirect('/aspire/%s' % dirname(title))


# Dir
class AspireDir(LoginRequiredMixin, TemplateView):
    template_name = 'aspire_dir.html'

    def get_context_data(self, **kwargs):
        title = kwargs.get('title')
        log_page(self.request, 'AspireDir:'+title)
        path = doc_path(self.request.user, title)
        folders = title.split('/')

        data = {
            'title': title,
            'folders': folders,
            'files': doc_directory(path),
        }
        return aspire_context({}, data)


# Doc
class AspireDoc(TemplateView):
    template_name = 'aspire_doc.html'

    def get_context_data(self, **kwargs):
        title = kwargs.get('title')
        log_page(self.request, 'AspireDoc:'+title)
        path = doc_path(self.request.user, title)
        data = {
            'site': mybook_site_title('aspire'),
            'menu': main_menu('aspire', 'aspire/1'),
            'title': title,
            'text': doc_html(path),
            'dir': dirname(title),
            'pdir': dirname(dirname(title)),
            'files': doc_index(path),
            'projects': project_list(client_user(self.request.user),title),
        }
        return aspire_context({}, data)

    def get(self, args, **kwargs):
        title = kwargs.get('title')
        #log_page(self.request, 'AspireDoc - get %s' % title)
        r = doc_redirect(title, self.request.user)
        if r:
            log_page(self.request, 'redirect --> %s' % r)
            return redirect(r)
        else:
            return super(AspireDoc, self).get(self, args, **kwargs)


# Delete view
class AspireDocDelete(LoginRequiredMixin, TemplateView):
    template_name = 'aspire_delete.html'

    def get_context_data(self, **kwargs):
        log('AspireDocDelete page', kwargs)
        data = {
            'title': 'Doc Delete',
            'id': kwargs.get('title'),
        }
        return aspire_context({}, data)


# Add view
class AspireDocEdit(LoginRequiredMixin, FormView):

    class EditDocForm(Form):
        topic = CharField(max_length=100)
        body = TextField()

    template_name = 'aspire_edit.html'
    form_class = EditDocForm

    def get_context_data(self, **kwargs):
        log('AspireDocEdit page')
        context = super(AspireDocEdit, self).get_context_data(**kwargs)
        title = self.kwargs.get('title')
        path = doc_path(self.request.user, title)
        data = {
            'title': 'Edit',
            'doc': title,
            'topic': basename(path),
            'text': doc_read(path),
        }
        return aspire_context(context, data)

    def form_valid(self, form):
        text = form.data.get('body', 'No input given')
        text = text.decode(encoding='UTF-8').encode('ascii', 'ignore')
        title = self.kwargs.get('title')
        topic = form.data.get('topic', 'NewTopic')
        path = doc_path(self.request.user, title)
        doc_remove(path)
        title = join(dirname(title), topic)
        path = doc_path(self.request.user, title)
        doc_write(path,text)
        return redirect('/aspire/%s' % title)


# Error
class AspireError(TemplateView):
    template_name = 'aspire_error.html'


# Folder
class AspireFolder(LoginRequiredMixin, RedirectView):

    def get(self, args, **kwargs):
        title = kwargs.get('title')
        path = doc_path(self.request.user, title)
        doc_folder(path)
        return redirect('/aspire/%s' % title)


class AspireClient(AspireContext,  TemplateView):

    template_name = 'aspire_client.html'

    def get_context_data(self, **kwargs):
        title = kwargs.get('title','')
        kwargs = super(AspireClient, self).get_context_data(**kwargs)
        projects = project_list(client_user(self.request.user), title)
        kwargs.update(dict(projects=projects, title='Client View'))
        return kwargs
