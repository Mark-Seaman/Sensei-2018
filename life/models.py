from __future__ import unicode_literals

from django.db import models


class Year(models.Model):
    age = models.IntegerField()
    contribute = models.TextField()
    relate = models.TextField()
    learn = models.TextField()
    enjoy = models.TextField()

    def __unicode__(self):
        return str(self.age)


class Aspect(models.Model):
    name = models.CharField(max_length=100)

    def __unicode__(self):
        return str(self.name)


class Experience(models.Model):
    age = models.IntegerField(editable=False)
    aspect = models.ForeignKey(Aspect, editable=False)
    summary = models.TextField()

    def __unicode__(self):
        return "age %s - %s" % (self.age, self.aspect.name)

    def get_absolute_url(self):
        return '/life/year/%s' % self.age


def initialize():
    Aspect.objects.create(name='Contribute')
    Aspect.objects.create(name='Relate')
    Aspect.objects.create(name='Learn')
    Aspect.objects.create(name='Enjoy')
    for a in Aspect.objects.all():
        print(a)

