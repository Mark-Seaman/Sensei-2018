from django.conf.urls import url

from tool.user_views import UserList, UserCreate, UserDetail, UserEdit, UserDelete


urlpatterns = [

    # User
    url(r'^user_add$',                   UserCreate.as_view(), name='user_add'),
    url(r'^user_delete/(?P<pk>\d+)$',    UserDelete.as_view(), name='user-delete'),
    url(r'^user_detail/(?P<pk>\d+)$',    UserDetail.as_view(), name='user-detail'),
    url(r'^user_edit/(?P<pk>\d+)$',      UserEdit.as_view(),   name='user-edit'),
    url(r'^user_list$',                  UserList.as_view(),   name='user_list'),

]
