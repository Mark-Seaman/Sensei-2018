from django.conf.urls import url

from .views import ExperienceView, LifeAdd, LifeEdit, LifeView, YearView

urlpatterns = (

    # Default view
    url(r'^$', LifeView.as_view()),
    url(r'^experience$', ExperienceView.as_view()),
    url(r'^year/(?P<age>[-\d]+)$', YearView.as_view()),
    url(r'^(?P<age>[-\d]+)/(?P<aspect>[\W\w]+)/add$', LifeAdd.as_view(), name='add'),
    url(r'^(?P<pk>\d+)/edit$', LifeEdit.as_view(), name='edit'),

    # Document
    # url(r'^(?P<title>[\w/\-_.]*)$', health_doc),

)
