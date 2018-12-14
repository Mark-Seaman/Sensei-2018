# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.core.validators import MinLengthValidator
from django.utils.timezone import now
from django.db import models


students = '''
Curly
Larry
Moe
'''.split('\n')[1:-1]


def student_choices():
    return [(s, s) for s in students]


class Course(models.Model):
    name = models.CharField(max_length=20)
    title = models.CharField(max_length=20)


class Student(models.Model):
    course = models.ForeignKey(Course, default=1)
    name    = models.CharField(max_length=100)
    email   = models.CharField(max_length=40)
    domain  = models.CharField(max_length=100)
    reviewer_score = models.IntegerField(default=100)
    designer_score = models.IntegerField(default=100)

    def __unicode__(self):
        return '%s, %s, %s' % (self.email, self.name, self.domain)


class Review(models.Model):
    reviewer    = models.ForeignKey(Student, editable=False)
    designer    = models.ForeignKey(Student, related_name='designer', default=1, editable=False)
    page        = models.CharField(max_length=100, editable=False)
    score       = models.IntegerField(default=-1)
    date        = models.DateTimeField(default=now, editable=False)
    due         = models.DateTimeField(default='2018-09-01', editable=False)
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
    notes       = models.TextField(default='You must type a summary of problems.')
    # , validators=[MinLengthValidator(100)])


class ReviewScore(models.Model):
    date        = models.DateTimeField(default=now, editable=False)
    score       = models.IntegerField()
    designer    = models.CharField(max_length=20, choices=student_choices())
    reviewer    = models.CharField(max_length=20, choices=student_choices())
    notes       = models.TextField(validators=[MinLengthValidator(500)])


class ReviewerScore(models.Model):
    date        = models.DateTimeField(default=now, editable=False)
    score       = models.IntegerField()
    designer    = models.CharField(max_length=20, choices=student_choices())
    reviewer    = models.CharField(max_length=20, choices=student_choices())
    notes       = models.TextField()



# Test Cases

# score_add(50, 'seam1870', 'seam1870', 'some notes')
