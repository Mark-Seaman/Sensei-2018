from django.conf.urls import url
from django.contrib.auth.views import login, logout

from .mybook_views import BookNotes, DomainRedirect, MyBookDocDisplay, MyBookPrivateDoc, SeamansLog, SpiritualSelect

urlpatterns = [


    # Authentication
    url(r'^login',                              login, {'template_name': 'mybook_login.html'}, name='login'),
    url(r'^logout$',                            logout, {'next_page': '/login'}),

    # Custom Pages
    #url(r'^MarkSeaman/booknotes/(?P<title>[\w/\-.]*)$',    BookNotes.as_view()),

    url(r'^info/(?P<title>[\w/\-_.]*)$',        MyBookPrivateDoc.as_view()),

    url(r'^seamanslog$',                        SeamansLog.as_view()),

    url(r'^spiritual/(?P<title>[\w\-_.]*)$',    SpiritualSelect.as_view()),

    # Documents
    url(r'^(?P<title>[\w/\-_.]*)$',             MyBookDocDisplay.as_view()),
    url(r'^',                                   DomainRedirect.as_view()),
]
