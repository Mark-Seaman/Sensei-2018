from __future__ import unicode_literals

from django.db import models
from django.contrib.auth.models import User
from django.core.urlresolvers import reverse


# WikiDoc
#    user *
#    title
#    body

class WikiDoc(models.Model):
    user  = models.ForeignKey(User, related_name='WikiUser', editable=False)
    title = models.CharField(max_length=100)
    path = models.CharField(max_length=100, editable=False)
    body  = models.TextField(default="No Body Text")
    slug = models.SlugField(max_length=100, null=True)

    def __unicode__(self):
        return self.title

    def get_absolute_url(self):
        return reverse('detail', kwargs={'pk': self.pk})

    # def as_row(self):
    #     return [self.pk, self.title, self.path]
    #
    # @staticmethod
    # def labels():
    #     return ['ID', 'Name', 'Path']
    #
    # def values(self):
    #     return zip(WikiDoc.labels(), self.as_row())
