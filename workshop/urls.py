from django.conf.urls import url

from views import *
from thot_views import ThotBookView, ThotDocEdit, ThotView


urlpatterns = [

    # Thot
    url(r'^thot/(?P<pk>\d+)$', ThotView.as_view()),
    url(r'^thot-edit/(?P<pk>\d+)$', ThotDocEdit.as_view()),
    url(r'^thotbook/(?P<title>[\w/\-_.]*)$', ThotBookView.as_view()),
    url(r'^thotbook$', ThotBookView.as_view()),

    # Templates
    url(r'^templates/(?P<title>[\w/\-_.]*)$', WorkshopTemplate.as_view()),
    url(r'^material$', MaterialForms.as_view()),

    # Workshop
    url(r'^workshop$', WorkshopView.as_view(), name='workshop'),
    url(r'^workshop/div$', TemplateView.as_view(template_name='workshop_div.html')),
    url(r'^workshop/cards/(?P<title>[\w/\-_.]*)$', WorkshopCards.as_view()),
    url(r'^workshop/demo/(?P<pk>\d+)$', WorkshopDemo.as_view()),
    url(r'workshop/email$', EmailView.as_view()),
    url(r'^workshop/form$', WorkshopForm.as_view()),
    url(r'^workshop/log$', WorkshopWrapperRedirect.as_view()),
    url(r'^workshop/redirect/(?P<pk>\d+)$', WorkshopRedirect.as_view()),
    url(r'^workshop/test$', MyTest.as_view()),
    url(r'^workshop/upload$', WorkshopFileUpload.as_view()),
    url(r'^workshop/(?P<title>[\w/\-_.]*)$', WorkshopView.as_view()),
    #url(r'^workshop/doc/(?P<title>[\w/\-_.]*)$', WorkshopDoc.as_view()),

]
