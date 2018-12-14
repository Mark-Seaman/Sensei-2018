# -*- coding: utf-8 -*-
from __future__ import unicode_literals
from django.db import models
from django.contrib.auth.models import User
from django.core.urlresolvers import reverse


class ThotBook(models.Model):
    title = models.CharField(max_length=100)
    rootid = models.IntegerField(default=0, null=True)

    def __unicode__(self):
        return self.title


class Thot(models.Model):
    title = models.CharField(max_length=100)
    parent = models.ForeignKey('self', null=True)
    thotbook = models.ForeignKey(ThotBook, null=True)

    def as_row(self):
        if self.parent:
            return [self.pk, self.parent, self.title]
        else:
            return [self.pk, None, self.title]

    def __unicode__(self):
        return self.title


class MoneyClient(models.Model):
    user = models.OneToOneField(User)
    organization = models.CharField(max_length=100)

    def __unicode__(self):
        return self.user.username

    def get_absolute_url(self):
        return reverse('client-detail', kwargs={'pk': self.pk})

    def name(self):
        return '%s-%s' % (self.user.first_name, self.user.last_name)


class Category(models.Model):
    name = models.CharField(max_length=100)
    client = models.ForeignKey(MoneyClient)
    cumulative = models.BooleanField(default=False)

    def get_absolute_url(self):
        return reverse('category-detail', kwargs={'pk': self.pk})


class Money(models.Model):
    category = models.ForeignKey(Category, editable=False)
    dollars = models.IntegerField()
    date = models.DateField()

    def get_absolute_url(self):
        return reverse('money-detail', kwargs={'pk': self.pk})

