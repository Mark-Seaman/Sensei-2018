from django.conf.urls import url
from django.contrib.auth.views import login, logout

from admin_views import AdminView, DatabaseView, DocView, LogView, MaterialView, SurrogateView, TestView, UsersView


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

    # Authentication

    #url(r'^login',          login, {'template_name': 'aspire_login.html'}),
    #url(r'^logout$',        logout, {'next_page': '/aspire/login'}),
    #url(r'^no_account$',    aspire_no_account),

    #url(r'^signup$',        Signup.as_view()),


)
