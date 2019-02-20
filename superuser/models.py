from __future__ import unicode_literals
from django.contrib.auth.models import User
from django.db import models


# Administrator
#
#     surrogate
#     user

class Administrator(models.Model):
    surrogate = models.ForeignKey(User, on_delete=models.CASCADE, related_name='+', null=True)
    user      = models.ForeignKey(User, on_delete=models.CASCADE)

    def __unicode__(self):
        return self.user.username

    def as_row(self):
        return [self.pk, self.user.username, self.surrogate_id, self.surrogate]

    @staticmethod
    def labels():
        return ['Superuser ID', 'Superuser', 'Proxy ID', 'Proxy For']

    def values(self):
        return zip(Administrator.labels(), self.as_row())
