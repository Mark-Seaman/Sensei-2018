from django.conf.urls import url

from .views import UncDocDisplay, UncSlidesDisplay


urlpatterns = [

    url(r'^(?P<title>[\w/\-_.]*)/slides$',  UncSlidesDisplay.as_view()),
    url(r'^(?P<title>[\w/\-_.]*)$',         UncDocDisplay.as_view()),

]
