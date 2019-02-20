from django.conf.urls import url

from .views import HealthEdit, HealthList,  HealthView

urlpatterns = (

    # Default view
    url(r'^$', HealthView.as_view()),
    url(r'^history$', HealthList.as_view()),
    url(r'(?P<pk>\d+)$', HealthEdit.as_view())

    # Document
    # url(r'^(?P<title>[\w/\-_.]*)$', health_doc),

)
