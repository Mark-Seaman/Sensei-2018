from django.conf.urls import url

from mybook.mybook_views import UncDocDisplay

urlpatterns = [

    url(r'^(?P<title>[\w/\-_.]*)$',         UncDocDisplay.as_view()),

]
