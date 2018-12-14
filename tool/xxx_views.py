# xxx.py -- created by factory script

# URLs

# from xxx_views import XxxAdd, XxxDelete, XxxDetail, XxxEdit, XxxList
# # Xxx
# url(r'^xxx_add$',                   XxxAdd.as_view(),    name='xxx_add'),
# url(r'^xxx_delete/(?P<pk>\d+)$',    XxxDelete.as_view(), name='xxx-delete'),
# url(r'^xxx_detail/(?P<pk>\d+)$',    XxxDetail.as_view(), name='xxx-detail'),
# url(r'^xxx_edit/(?P<pk>\d+)$',      XxxEdit.as_view(),   name='xxx-edit'),
# url(r'^xxx_list$',                  XxxList.as_view(),   name='xxx_list'),


# Views

from django.core.urlresolvers import reverse_lazy
from django.views.generic import CreateView, DeleteView, DetailView, ListView, UpdateView
from django.views.generic.base import ContextMixin

from models import Xxx
from mybook.mybook import mybook_site_title, main_menu
from tool.log import log_page


class yyyBase(ContextMixin):
    def get_context_data(self, **kwargs):
        log_page(self.request)
        kwargs  = super(yyyBase, self).get_context_data(**kwargs)
        kwargs.update({
            'site': mybook_site_title('yyy'),
            'title': self.request.path,
            'menu': main_menu('yyy', 'yyy/1'),
            'text': 'yyy Base',
        })
        return kwargs


# Add view
class XxxAdd(yyyBase, CreateView):
    model = Xxx
    fields = ['name']
    template_name = 'xxx_add.html'
    success_url = '/yyy/xxx_list'


# Delete view
class XxxDelete(yyyBase, DeleteView):
    model = Xxx
    success_url = reverse_lazy('xxx_list')
    template_name = 'xxx_delete.html'


# Detail view
class XxxDetail(yyyBase, DetailView):
    model = Xxx
    template_name = 'xxx_detail.html'


# Edit view
class XxxEdit(yyyBase, UpdateView):
    model = Xxx
    fields = ['name']
    template_name = 'xxx_edit.html'
    success_url = '/yyy/xxx_list'


# List view
class XxxList(yyyBase, ListView):
    model = Xxx
    template_name = 'xxx_list.html'

    def get_context_data(self, **kwargs):
        kwargs = super(XxxList, self).get_context_data(**kwargs)
        kwargs.update({
            'text': 'Xxx List',
        })
        return kwargs


