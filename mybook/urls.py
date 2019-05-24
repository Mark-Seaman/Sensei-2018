from django.conf.urls import url
from django.contrib.auth.views import login, logout

from .views import BookNotes, DocList, DocMissing, DocRandom, DocRedirect, DomainRedirect, DocDisplay, PrivateDoc, SeamansLog
from .spiritual import SpiritualDoc, SpiritualSelect

urlpatterns = [

    # Redirect
    url(r'^$',                                  DomainRedirect.as_view()),
    url(r'^(?P<title>[\w/\-_.]*)/Missing$',     DocMissing.as_view()),
    url(r'^redir/(?P<title>[\w/\-_.]*)$',       DocRedirect.as_view()),

    # Authentication
    url(r'^login',                              login, {'template_name': 'mybook_login.html'}, name='login'),
    url(r'^logout$',                            logout, {'next_page': '/login'}),

    # Booknotes
    #url(r'^MarkSeaman/booknotes/(?P<title>[\w/\-.]*)$',    BookNotes.as_view()),

    # Private Pages
    url(r'^info/(?P<title>[\w/\-_.]*)$', PrivateDoc.as_view()),

    # Seaman's Log
    url(r'^seamanslog$',                        SeamansLog.as_view()),
    url(r'^seamanslog/List$',                   DocList.as_view()),

    # Spiritual
    url(r'^spiritual/Index$',                   SpiritualDoc.as_view()),
    url(r'^spiritual/(?P<title>[\w\-_.]*)$',    SpiritualSelect.as_view()),
    url(r'^spiritual/(?P<title>[\w/\-_.]*)$',   SpiritualDoc.as_view()),

    # Documents
    url(r'^(?P<title>[\w/\-_.]*)/Random$', DocRandom.as_view()),
    url(r'^(?P<title>[\w/\-_.]*)$', DocDisplay.as_view()),
]
