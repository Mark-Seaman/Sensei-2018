from django import forms
from django.forms import Form
from django.views.generic.base import ContextMixin
from django.views.generic import FormView, TemplateView, RedirectView
from os import listdir, mkdir, system
from os.path import join, dirname, exists

from hammer.settings import BASE_DIR, MEDIA_ROOT
from mybook.mybook import mybook_site_title, main_menu
from tool.document import doc_cards, doc_exists, doc_html_text
from tool.log import log, log_page
from tool.email import send_support_request


class WorkshopBase(ContextMixin):
    def get_context_data(self, **kwargs):
        log_page(self.request)
        kwargs  = super(WorkshopBase, self).get_context_data(**kwargs)
        kwargs.update({
            'site': mybook_site_title('workshop'),
            'title': self.request.path,
            'menu': main_menu('workshop', 'workshop/1'),
            'text': 'Workshop Base',
        })
        return kwargs


class WorkshopCards(WorkshopBase, TemplateView):
    template_name = 'template_cards.html'

    def get_context_data(self, **kwargs):
        title = kwargs.get('title', '')
        cards = doc_cards('workshop/'+title)
        kwargs = super(WorkshopCards, self).get_context_data(**kwargs)
        kwargs.update({
            'title': 'Workshop Card Display',
            'cards': cards,
        })
        return kwargs


class WorkshopDemo(TemplateView):
    def get_context_data(self, **kwargs):
        return {
            'site': mybook_site_title('workshop'),
            'title': 'Workshop Demo Page (%s)' % kwargs['pk'],
            'menu': main_menu('workshop','workshop/demo/' + kwargs['pk']),
        }

    def get_template_names(self):
        return ['workshop_demo%s.html' % self.kwargs['pk']]


class WorkshopDoc(ContextMixin):
    def get_context_data(self, **kwargs):
        title = kwargs.get('title', 'Index')
        if title == 'doc':
            title = self.request.GET.get('doc','xxx')
        title = join('workshop', title)
        kwargs = super(WorkshopDoc, self).get_context_data(**kwargs)

        if doc_exists(title):
            text = doc_html_text(title)
        else:
            text = 'No Document found, %s' % title

        kwargs.update({
            'text': text,
        })
        return kwargs


class WorkshopView(WorkshopDoc, WorkshopBase, TemplateView):
    template_name = 'workshop_theme.html'


class WorkshopForm(FormView):

    class EditDocForm(Form):
        title = forms.CharField()
        text = forms.CharField(widget=forms.Textarea)

    template_name = 'workshop_form.html'
    form_class = EditDocForm
    success_url = '/workshop/views/FormView'

    def get_context_data(self, **kwargs):
        context = super(WorkshopForm, self).get_context_data(**kwargs)
        context.update({
            'site': mybook_site_title('workshop'),
            'title': 'Workshop Form View',
            'private': False,
            'menu': main_menu('workshop', 'workshop/1'),
        })
        return context

    def form_valid(self, form):
        title = form.data.get('title')
        text = form.data.get('text', 'No input given')
        text = text.decode(encoding='UTF-8').encode('ascii', 'ignore')
        log('Workshop title: %s, text: %s' % (title,text))
        return super(WorkshopForm, self).form_valid(form)


def save_uploaded_file(client_file, server_file):
    log('save_uploaded_file: client=%s, server=%s' % (client_file, server_file))
    path = join(MEDIA_ROOT, server_file)
    d = dirname(path)
    if not exists(d):
        d2 = dirname(d)
        if not exists(d2):
            mkdir(d2)
        mkdir(d)
    with open(path, 'wb+') as destination:
        for chunk in client_file.chunks():
            destination.write(chunk)
    log('cptree %s/client-files %s/static/client-files' % (BASE_DIR, BASE_DIR))
    system('%s/bin/cptree %s/client-files %s/static/client-files' % (BASE_DIR, BASE_DIR, BASE_DIR))


def uploaded_files():
    x = listdir(join(BASE_DIR, 'static', 'client-files', 'upload'))
    if x:
        return x
    return ['No file uploaded']


class WorkshopFileUpload(FormView):

    class UploadForm(Form):
        filename = forms.FileField()

    template_name = 'workshop_file_upload.html'
    form_class = UploadForm
    success_url = '/workshop/upload'

    def get_context_data(self, **kwargs):
        context = super(WorkshopFileUpload, self).get_context_data(**kwargs)
        context.update({
            'site': mybook_site_title('workshop'),
            'title': 'File Upload View',
            'private': True,
            'menu': main_menu('workshop', 'workshop/1'),
            'upload': uploaded_files(),
        })
        return context

    def form_valid(self, form):
        filename = self.request.FILES.get('filename')
        if filename:
            save_uploaded_file(filename, 'upload/'+filename.name)
        return super(WorkshopFileUpload, self).form_valid(form)


class WorkshopTemplate(WorkshopBase, TemplateView):

    def get_template_names(self):
        template = self.kwargs['title']
        return [template + '.html']


class EmailView(FormView):

    class EmailForm(Form):
        title = forms.CharField()
        text = forms.CharField(widget=forms.Textarea)

    template_name = 'workshop_email.html'
    form_class = EmailForm
    success_url = '/workshop/views/EmailView'

    def get_context_data(self, **kwargs):
        log_page(self.request, 'Workshop')
        title = kwargs.get('title', 'Index')
        page = title
        if doc_exists('workshop/'+title):
            text = doc_html_text('workshop/' + title)
        else:
            text = 'No Document found, %s' % title
        context = super(EmailView, self).get_context_data(**kwargs)
        context.update({
            'site': mybook_site_title('workshop'),
            'title': 'Email View',
            'text': text,
            'private': True,
            'menu': main_menu('workshop', 'workshop/' + page),
        })
        return context

    def form_valid(self, form):
        title = form.data.get('title', 'No title')
        text  = form.data.get('text', 'No input given')
        send_support_request(title, text)
        return super(EmailView, self).form_valid(form)


class MaterialForms(TemplateView):
    template_name = 'material_upload.html'


class WorkshopRedirect(RedirectView):

    def get_redirect_url(self, *args, **kwargs):
        if kwargs['pk'] == '0':
            return 'no-active-customer'
        else:
            return 'active-customer'


class WorkshopWrapperRedirect(RedirectView):

    permanent = False
    pattern_name = 'workshop'

    def get_redirect_url(self, *args, **kwargs):
        log_page(self.request, 'WorkshopWrapperRedirect')
        return '/workshop/views/FormView'


class MyTest(TemplateView):
    template_name = 'workshop_test.html'

    def get_context_data(self, **kwargs):
        return {
            'title': 'Workshop Test',
            'site': mybook_site_title('workshop'),
            'menu': main_menu('workshop', 'workshop/Index'),
        }


