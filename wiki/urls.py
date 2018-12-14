from django.conf.urls import url

from views import DocAdd, DocDelete, DocDetail, DocDisplay, DocEdit, DocList, DocView


urlpatterns = (

    # Doc
    url(r'^add$', DocAdd.as_view(), name='add'),
    url(r'^delete/(?P<pk>\d+)$', DocDelete.as_view(), name='delete'),
    url(r'^detail/(?P<pk>\d+)$', DocDetail.as_view(), name='detail'),
    url(r'^edit/(?P<pk>\d+)$', DocEdit.as_view(), name='edit'),
    url(r'^list$', DocList.as_view(), name='list'),
    url(r'^(?P<title>[\w/\-_.]*)$', DocView.as_view()),
    # url(r'^(?P<title>[\w/\-_.]*)$', DocDisplay.as_view()),
)
