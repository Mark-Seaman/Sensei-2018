from django.conf.urls import url

from guide.views import *

urlpatterns = [

    # Guide
    url(r'^(?P<course>\w+)/(?P<title>[\w/\-_.]*).php$', GuidePhpTemplates.as_view()),
    url(r'^(?P<course>\w+)/(?P<title>[\w/\-_.]*).html$', GuideHtmlTemplates.as_view()),
    url(r'^(?P<course>\w+)/templates/(?P<title>[\w/\-_.]*)$', GuideTemplates.as_view()),
    # url(r'^(?P<course>\w+)/Schedule$', ClassScheduleView.as_view()),
    url(r'^(?P<course>\w+)/Lesson(?P<lesson>\d+)$', ClassLessonView.as_view()),
    url(r'^(?P<course>\w+)/Slides(?P<lesson>\d+)$', SlideView.as_view()),
    url(r'^(?P<course>\w+)/Test$',  GuideTestView.as_view()),
    url(r'^(?P<title>[\w/\-_.]*)/Missing$', MissingDocView.as_view()),
    url(r'^(?P<title>[\w/\-_.]*).md$', GuideDocDisplay.as_view()),
    url(r'^(?P<title>[\w/\-_.]*)$', GuideDocView.as_view()),
    url(r'^$', GuideDocDisplay.as_view()),
]
