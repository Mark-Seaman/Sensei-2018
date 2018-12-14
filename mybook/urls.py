from django.conf.urls import url
from django.contrib.auth.views import login, logout

# InfoPageDisplay, InfoPageRedirect,
from mybook_views import BookNotes, CardView, ContainerView, DailyTask, MissingDoc, MyBookDoc,  \
    MyBookPrivateDoc, OutlineView, SeamansLog, SpiritualSelect, Staff, TabsView, TestDoc, TodayView
from author_views import AuthorAdd, AuthorDelete, AuthorDetail, AuthorEdit, AuthorList
from book_views import BookAdd, BookDelete, BookDetail, BookEdit, BookList
from info import InfoRedirect, InfoView


urlpatterns = [
    url(r'^test/(?P<title>[\w/\-_.]*)$', TestDoc.as_view()),

    # url(r'^info-page/(?P<title>[\w/_\.\-]+)$', InfoPageDisplay.as_view()),
    url(r'^info/(?P<title>[\w/_\.\-]+)$',           InfoView.as_view()),
    url(r'^inforedir/(?P<title>[\w/_\.\-]+)$',      InfoRedirect.as_view()),
    url(r'^info/daily$',                            DailyTask.as_view()),
    url(r'^container/(?P<title>[\w/\-_.]*)$',       ContainerView.as_view()),
    url(r'^card/(?P<title>[\w/\-_.]*)$',            CardView.as_view()),
    url(r'^outline/(?P<title>[\w/\-_.]*)',          OutlineView.as_view()),
    url(r'^tabs/(?P<title>[\w/\-_.]*)$',            TabsView.as_view()),

    # Authentication
    url(r'^login', login, {'template_name': 'mybook_login.html'}, name='login'),
    url(r'^logout$', logout, {'next_page': '/login'}),

    # Author
    url(r'^mybook/author_add$',                     AuthorAdd.as_view(),    name='author_add'),
    url(r'^mybook/author_delete/(?P<pk>\d+)$',      AuthorDelete.as_view(), name='author-delete'),
    url(r'^mybook/author_detail/(?P<pk>\d+)$',      AuthorDetail.as_view(), name='author-detail'),
    url(r'^mybook/author_edit/(?P<pk>\d+)$',        AuthorEdit.as_view(),   name='author-edit'),
    url(r'^mybook/author_list$',                    AuthorList.as_view(),   name='author_list'),

    # Book
    url(r'^mybook/book_add$',                   BookAdd.as_view(),    name='book_add'),
    url(r'^mybook/book_delete/(?P<pk>\d+)$',    BookDelete.as_view(), name='book-delete'),
    url(r'^mybook/book_detail/(?P<pk>\d+)$',    BookDetail.as_view(), name='book-detail'),
    url(r'^mybook/book_edit/(?P<pk>\d+)$',      BookEdit.as_view(),   name='book-edit'),
    url(r'^mybook/book_list$',                  BookList.as_view(),   name='book_list'),

    # Custom Pages
    url(r'^booknotes/(?P<title>[\w/\-.]*)$', BookNotes.as_view()),
    url(r'^Today$', TodayView.as_view()),
    url(r'^shrinking-world/Staff$', Staff.as_view()),
    url(r'^spiritual/inspire', SpiritualSelect.as_view()),
    url(r'^seamanslog/(?P<title>[\w/\-.]*)', SeamansLog.as_view()),

    # Documents
    url(r'^missing/(?P<title>[\w/\-_.]*)$', MissingDoc.as_view()),
    url(r'^mybook/(?P<title>[\w/\-_.]*)$', MyBookPrivateDoc.as_view()),
    url(r'^(?P<title>[\w/\-_.]*)$', MyBookDoc.as_view()),

]
