from django.conf.urls import url

from .views import DirectoryView, DocView, FilesView, MissingView, RedirectRoot, SiteIndexView


# URL Routes
urlpatterns = [
    url(r'^$',                              RedirectRoot.as_view()),
    url(r'^(?P<title>[\w/\-.]*)/Files$',    FilesView.as_view()),
    url(r'^(?P<title>[\w/\-.]*)/Index$',    SiteIndexView.as_view()),
    url(r'^(?P<title>[\w/\-.]*)/Directory$', DirectoryView.as_view()),
    url(r'^(?P<title>[\w/\-.]*)/Missing$',  MissingView.as_view()),
    url(r'^(?P<title>[\w/\-.]*)$',          DocView.as_view()),
]
