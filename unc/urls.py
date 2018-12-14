from django.conf.urls import url

from views import DesignReviewForm, DesignReviews,  ReviewFeedback, ReviewRequest, ReviewScores, StudentTest, UncHTML, UncStudents, UncStudents350

urlpatterns = (

    url(r'^review/(?P<pk>\d+)$',     DesignReviewForm.as_view()),
    url(r'^reviews/(?P<pk>\d+)$',    DesignReviews.as_view()),
    url(r'^review-request/(?P<pk>\d+)$', ReviewRequest.as_view()),
    url(r'^students_350',            UncStudents350.as_view()),
    url(r'^students',                UncStudents.as_view()),
    url(r'^student/(?P<pk>\w+)$',    StudentTest.as_view()),
    url(r'^feedback/(?P<pk>\w+)$',   ReviewFeedback.as_view()),
    url(r'^review-scores/(?P<course>\w+)$', ReviewScores.as_view()),

    url(r'^(?P<title>[\w/\-_.]*)$', UncHTML.as_view()),

)
