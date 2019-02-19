from django.conf.urls import url

from .admin_views import AdminView, DatabaseView, DocView, LogView, MaterialView, SurrogateView, TestView, UsersView


urlpatterns = (

    # Home
    url(r'^$',                      AdminView.as_view()),
    url(r'^log',                    LogView.as_view()),
    url(r'^doc/(?P<doc>[\w/\-_.]+)$', DocView.as_view()),
    url(r'^material',               MaterialView.as_view()),
    url(r'^test',                   TestView.as_view()),
    url(r'^users$',                 UsersView.as_view()),
    url(r'^surrogate/(?P<pk>\d+)$', SurrogateView.as_view()),
    url(r'^database$',              DatabaseView.as_view()),

)
