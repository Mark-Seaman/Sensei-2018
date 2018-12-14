from django.contrib.auth.mixins import UserPassesTestMixin
from django.contrib.auth.models import User
from django.views.generic import ListView, TemplateView

from superuser.admin import admin_detail, database_info, get_detail_data, is_superuser, \
    log_text, test_labels, test_results, user_labels, user_table
from tool.models import Test
from tool.document import doc_html_text


class AdminView(UserPassesTestMixin, TemplateView):

    template_name = 'admin.html'
    login_url = '/mybook/login/'

    def get_context_data(self, **kwargs):
        return {
            'card_title': 'System Admin',
            'detail': get_detail_data()
        }

    def test_func(self):
        user = self.request.user
        return is_superuser(user)


class DatabaseView(UserPassesTestMixin, TemplateView):

    template_name = 'database.html'
    login_url = '/mybook/login/'

    def get_context_data(self, **kwargs):
        return {
            'card_title': 'Records in Database',
            'detail': database_info()
        }

    def test_func(self):
        user = self.request.user
        return is_superuser(user)


class DocView(UserPassesTestMixin, TemplateView):

    template_name = 'admin_doc.html'
    login_url = '/mybook/login/'

    def get_context_data(self, **kwargs):

        return {
            'doc': doc_html_text('hire/' + kwargs['doc']),
        }

    def test_func(self):
        user = self.request.user
        return is_superuser(user)


class LogView(UserPassesTestMixin, TemplateView):

    template_name = 'log.html'
    login_url = '/mybook/login/'

    def get_context_data(self, **kwargs):
        return {
            'card_title': 'System Log Text',
            'text': log_text()
        }

    def test_func(self):
        user = self.request.user
        return is_superuser(user)


class MaterialView(TemplateView):

    template_name = 'material.html'

    def get_context_data(self, **kwargs):
        return {
            'card_title': 'Material Page Layout',
            'detail': get_detail_data()
        }


class SurrogateView(UserPassesTestMixin, TemplateView):

    template_name = 'surrogate.html'
    login_url = '/mybook/login/'

    def get_context_data(self, **kwargs):
        surrogate = User.objects.get(pk=kwargs['pk'])
        a = admin_surrogate(self.request.user.username, surrogate.username)
        return {
            'card_title': 'Superuser Proxy',
            'detail': admin_detail(a),
            'id': kwargs.get('pk')
        }

    def test_func(self):
        user = self.request.user
        return is_superuser(user)


class TestView(UserPassesTestMixin, ListView):

    model = Test
    template_name = 'tests.html'
    login_url = '/mybook/login/'

    def get_queryset(self):
        return test_results()

    def get_context_data(self, **kwargs):
        context = super(TestView, self).get_context_data(**kwargs)
        context.update({
            'card_title': 'Test Results',
            'labels': test_labels(),
            'private': True,
        })
        return context

    def test_func(self):
        user = self.request.user
        return is_superuser(user)


class UsersView(UserPassesTestMixin, ListView):

    model = User
    template_name = 'users.html'
    login_url = '/mybook/login/'

    def get_context_data(self, **kwargs):
        context = super(UsersView, self).get_context_data(**kwargs)
        context.update({
            'card_title': 'Django User Logins',
            'table': user_table(self.object_list),
            'labels': user_labels(),
        })
        return context

    def test_func(self):
        user = self.request.user
        return is_superuser(user)
