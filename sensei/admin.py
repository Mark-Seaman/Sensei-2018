# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.contrib import admin
from .models import Course, Lesson, Student, Requirements

admin.site.register(Course)
admin.site.register(Student)
admin.site.register(Lesson)
admin.site.register(Requirements)

