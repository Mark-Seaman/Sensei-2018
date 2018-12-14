from django.conf.urls import url

from doc_views import DocAdd, DocDelete, DocDetail, DocDisplay, DocEdit, DocList


urlpatterns = (

    # Doc
    url(r'^doc_add$', DocAdd.as_view(), name='doc_add'),
    url(r'^doc_delete/(?P<pk>\d+)$', DocDelete.as_view(), name='doc-delete'),
    url(r'^doc_detail/(?P<pk>\d+)$', DocDetail.as_view(), name='doc-detail'),
    url(r'^doc_edit/(?P<pk>\d+)$', DocEdit.as_view(), name='doc-edit'),
    url(r'^doc_list$', DocList.as_view(), name='doc_list'),
    url(r'^(?P<title>[\w/\-_.]*)$', DocDisplay.as_view()),

)
