from django.conf.urls import url
from django.contrib.auth.views import login, logout

from .views import BookNotes, DomainRedirect, MyBookDocDisplay, MyBookPrivateDoc, MyBookRandom, SeamansLog
from .spiritual import SpiritualDoc, SpiritualSelect

urlpatterns = [


    # Authentication
    url(r'^login',                              login, {'template_name': 'mybook_login.html'}, name='login'),
    url(r'^logout$',                            logout, {'next_page': '/login'}),

    # Booknotes
    #url(r'^MarkSeaman/booknotes/(?P<title>[\w/\-.]*)$',    BookNotes.as_view()),

    # Private Pages
    url(r'^info/(?P<title>[\w/\-_.]*)$',        MyBookPrivateDoc.as_view()),

    # Seaman's Log
    url(r'^seamanslog/Index$',                  SeamansLog.as_view()),

    # Spiritual
    url(r'^spiritual/Index$',                   SpiritualDoc.as_view()),
    url(r'^spiritual/(?P<title>[\w\-_.]*)$',    SpiritualSelect.as_view()),
    url(r'^spiritual/(?P<title>[\w/\-_.]*)$',   SpiritualDoc.as_view()),

    # Documents
    url(r'^$',                                  DomainRedirect.as_view()),
    url(r'^(?P<title>[\w/\-_.]*)/Random$',      MyBookRandom.as_view()),
    url(r'^(?P<title>[\w/\-_.]*)$',             MyBookDocDisplay.as_view()),
]
