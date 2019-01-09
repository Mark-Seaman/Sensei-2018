from django.conf.urls import url

from .views import UncDocDisplay, UncRegister, UncRegistered, UncSlidesDisplay


urlpatterns = [

    url(r'^register$',      UncRegister.as_view()),
    url(r'^registered$',    UncRegistered.as_view()),

    url(r'^(?P<title>[\w/\-_.]*)/slides$',  UncSlidesDisplay.as_view()),
    url(r'^(?P<title>[\w/\-_.]*)$',         UncDocDisplay.as_view()),

]
