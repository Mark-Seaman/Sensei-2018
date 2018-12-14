from django.conf.urls import url
from django.views.generic import TemplateView

from contact.views import ContactList, ContactDetail, MyContactList
from contact.views import ContactCreate, ContactUpdate, ContactDelete


urlpatterns = [

    # Home view
    url(r'^$', TemplateView.as_view(template_name="contact.html")),
   
    # Detail view
    url(r'^(?P<pk>\d+)$', ContactDetail.as_view(), name='contact-detail'),

    # List view
    url(r'^all$', ContactList.as_view(), name='contact_list'),
    url(r'^my-contacts/$', MyContactList.as_view()),

    # Add view
    url(r'add$', ContactCreate.as_view(), name='contact_add'),

    # Update view
    url(r'(?P<pk>\d+)/edit$', ContactUpdate.as_view(), name='contact_update'),

    # Delete view
    url(r'(?P<pk>\d+)/delete$', ContactDelete.as_view(), name='contact_delete'),
]
