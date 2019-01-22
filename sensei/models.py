# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.core.validators import MinLengthValidator
from django.utils.timezone import now
from django.db import models


class Course(models.Model):
    name = models.CharField(max_length=20)
    title = models.CharField(max_length=200)
    author = models.CharField(null=True, max_length=100)
    teacher = models.CharField(null=True, max_length=100)
    description = models.TextField(null=True)

    # , default='You must type a description of the course', validators=[MinLengthValidator(100)])

    def __str__(self):
        return 'Course: %s - %s' % (self.name, self.title)


class Student(models.Model):
    course  = models.ForeignKey(Course, default=1)
    name    = models.CharField(max_length=100)
    email   = models.CharField(max_length=40)
    domain  = models.CharField(max_length=100)
    zbooks  = models.CharField(max_length=100, null=True)

    def __unicode__(self):
        return '%s, %s, %s' % (self.email, self.name, self.domain)


class Lesson(models.Model):
    lesson = models.IntegerField()
    title = models.CharField(max_length=40)
    content = models.CharField(max_length=200)
    date = models.DateField()
    course = models.ForeignKey(Course, default=1)

    def __str__(self):
        return 'Lesson %02d. %s - %s' % (self.lesson, self.title, self.date)


class Review(models.Model):
    reviewer    = models.ForeignKey(Student, editable=False)
    designer    = models.ForeignKey(Student, related_name='designer', default=1, editable=False)
    page        = models.CharField(max_length=100, editable=False)
    score       = models.IntegerField(default=-1)
    date        = models.DateTimeField(null=True, editable=False)
    due         = models.DateTimeField(editable=False)
    requirements = models.TextField(default='NONE')
    requirement_1 = models.BooleanField(default=False)
    requirement_2 = models.BooleanField(default=False)
    requirement_3 = models.BooleanField(default=False)
    requirement_4 = models.BooleanField(default=False)
    requirement_5 = models.BooleanField(default=False)
    requirement_6 = models.BooleanField(default=False)
    requirement_7 = models.BooleanField(default=False)
    requirement_8 = models.BooleanField(default=False)
    requirement_9 = models.BooleanField(default=False)
    requirement_10 = models.BooleanField(default=False)
    notes       = models.TextField()
    #, validators=[MinLengthValidator(100)])


class Requirements(models.Model):
    labels = models.TextField(default='NONE')
    url = models.URLField()


