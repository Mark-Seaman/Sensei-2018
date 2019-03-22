from django.conf.urls import url

from .urlgame import UncUrlGameAnswer, UncUrlGameQuestion, UncUrlGameDone
from .views import *

urlpatterns = [

    url(r'^schedule/(?P<id>[\d]+)$', UncSchedule.as_view()),
    url(r'^students/(?P<id>[\d]+)$', UncStudents.as_view()),

    url(r'^register$', UncRegister.as_view()),
    url(r'^registered$', UncStudentDomains.as_view()),
    url(r'^reviews$', UncReviews.as_view()),

    url(r'^review/(?P<pk>[\d]+)$', UncEditReview.as_view()),
    url(r'^feedback/(?P<pk>[\d]+)$', UncReviewFeedback.as_view()),
    url(r'^student/(?P<id>[\d]+)$', UncStudent.as_view()),
    url(r'^student-old/(?P<id>[\d]+)$', UncStudentOld.as_view()),

    url(r'^url-question/(?P<id>[\d]+)$', UncUrlGameQuestion.as_view()),
    url(r'^url-answer/(?P<id>[\d]+)$', UncUrlGameAnswer.as_view()),
    url(r'^url-game-done/(?P<id>[\d]+)$', UncUrlGameDone.as_view()),


    url(r'^(?P<title>[\w/\-_.]*)/slides$', UncSlidesDisplay.as_view()),
    url(r'^(?P<title>[\w/\-_.]*)$', UncDocDisplay.as_view()),

]
