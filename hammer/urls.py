# Hammer URL Configuration

from django.conf.urls import url, include
from django.contrib import admin
from django.contrib.staticfiles.storage import staticfiles_storage
from django.views.generic.base import RedirectView


import aspire.urls
import guide.urls
import life.urls
import mybook.urls
import tasks.urls
import tool.urls
import health.urls
import superuser.urls
# import unc.urls


urlpatterns = [

    url(r'^robots.txt$',  RedirectView.as_view(url=staticfiles_storage.url('robots.txt'),  permanent=True), name="robots"),
    url(r'^favicon.ico$', RedirectView.as_view(url=staticfiles_storage.url('favicon.ico'), permanent=True), name="favicon"),

    # Admin
    url(r'^admin',      admin.site.urls),

    # Aspire
    url(r'^aspire/',    include(aspire.urls)),
    url(r'^aspire',     include(aspire.urls)),

    # Guide
    url(r'^guide/',    include(guide.urls)),
    url(r'^guide',     include(guide.urls)),

    # Health
    url(r'^health/', include(health.urls)),
    url(r'^health', include(health.urls)),

    # Life
    url(r'^life/', include(life.urls)),
    url(r'^life', include(life.urls)),

    # Super User
    url(r'^superuser/', include(superuser.urls)),
    url(r'^superuser',  include(superuser.urls)),

    # Task
    url(r'^task/',      include(tasks.urls)),
    url(r'^task',       include(tasks.urls)),

    # url(r'^unc/',       include(unc.urls)),
    # url(r'^unc',        include(unc.urls)),

    # Tool
    url(r'^',           include(tool.urls)),

    # MyBook
    url(r'^',           include(mybook.urls)),

]
