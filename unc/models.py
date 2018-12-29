# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.core.validators import MinLengthValidator
from django.utils.timezone import now
from django.db import models


class Course(models.Model):
    name = models.CharField(max_length=20)
    title = models.CharField(max_length=20)


class Student(models.Model):
    course  = models.ForeignKey(Course, default=1)
    name    = models.CharField(max_length=100)
    email   = models.CharField(max_length=40)
    domain  = models.CharField(max_length=100)

    def __unicode__(self):
        return '%s, %s, %s' % (self.email, self.name, self.domain)


class Review(models.Model):
    reviewer    = models.ForeignKey(Student, editable=False)
    designer    = models.ForeignKey(Student, related_name='designer', default=1, editable=False)
    page        = models.CharField(max_length=100, editable=False)
    score       = models.IntegerField(default=-1)
    date        = models.DateTimeField(default=now, editable=False)
    due         = models.DateTimeField(default='2018-09-01', editable=False)
    requirements = models.TextField(default='NONE')
    notes       = models.TextField(default='You must type a summary of problems.', validators=[MinLengthValidator(100)])


