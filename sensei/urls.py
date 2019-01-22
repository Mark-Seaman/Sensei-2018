from django.conf.urls import url

from .views import *

urlpatterns = [

    url(r'^register$',              UncRegister.as_view()),
    url(r'^registered$',            UncRegistered.as_view()),
    url(r'^reading$',               UncReading.as_view()),
    url(r'reviews$',                UncReviews.as_view()),
    url(r'^student/(?P<id>[\d]+)$', UncStudent.as_view()),

    url(r'^guide/(?P<title>[\w/\-_.]*)$', GuideDoc.as_view()),

    url(r'^(?P<title>[\w/\-_.]*)/slides$', UncSlidesDisplay.as_view()),
    url(r'^(?P<title>[\w/\-_.]*)$', UncDocDisplay.as_view()),

]
