# Hammer URL Configuration

from django.conf.urls import url, include
from django.contrib import admin
from django.contrib.staticfiles.storage import staticfiles_storage
from django.views.generic.base import RedirectView

import brain.urls
import life.urls
import mybook.urls
import tasks.urls
import tool.urls
import health.urls
import superuser.urls
import sensei.urls

from mybook.views import SeamanFamily


urlpatterns = [

    url(r'^robots.txt$',  RedirectView.as_view(url=staticfiles_storage.url('robots.txt'),  permanent=True), name="robots"),
    url(r'^favicon.ico$', RedirectView.as_view(url=staticfiles_storage.url('favicon.ico'), permanent=True), name="favicon"),

    # Admin
    url(r'^admin/',      admin.site.urls),

    # SeamanFamily
    url(r'^', SeamanFamily.as_view()),

    # Brain
    url(r'^brain/',    include(brain.urls)),

    # Health
    url(r'^health/',    include(health.urls)),
    url(r'^health',     include(health.urls)),

    # Life
    url(r'^life/',      include(life.urls)),
    url(r'^life',       include(life.urls)),

    # Super User
    url(r'^superuser/', include(superuser.urls)),
    url(r'^superuser',  include(superuser.urls)),

    # Task
    url(r'^task/',      include(tasks.urls)),

    # Tool
    url(r'^',           include(tool.urls)),

    # UNC
    url(r'^unc/',       include(sensei.urls)),
    url(r'^unc',        include(sensei.urls)),

    # MyBook
    url(r'^',           include(mybook.urls)),

]
