from __future__ import unicode_literals

from django.db import models
from django.contrib.auth.models import User
from django.core.urlresolvers import reverse


# Doc
#    user *
#    title
#    path

class Doc(models.Model):
    user  = models.ForeignKey(User)
    title = models.CharField(max_length=100)
    path  = models.CharField(max_length=100)

    def __unicode__(self):
        return self.title

    def get_absolute_url(self):
        return reverse('doc-detail', kwargs={'pk': self.pk})

    def as_row(self):
        return [self.pk, self.title, self.path, self.user]

    @staticmethod
    def labels():
        return ['ID', 'Name', 'Path', 'User']

    def values(self):
        return zip(Doc.labels(), self.as_row())
