from __future__ import unicode_literals
from django.db import models
from django.contrib.auth.models import User
from django.core.urlresolvers import reverse


# HealthScore
#
#     user
#     date
#     sleep
#     weight
#     eat
#     exercise

class HealthScore(models.Model):
    user      = models.ForeignKey(User, editable=False)
    date      = models.DateField(editable=False)
    sleep     = models.IntegerField()
    weight    = models.IntegerField()
    eat       = models.IntegerField()
    exercise  = models.IntegerField()

    def __unicode__(self):
        return self.user.username + ', ' + str(self.date)

    def get_absolute_url(self):
        return reverse('health-score-detail', kwargs={'pk': self.pk})

    def as_row(self):
        return [self.pk, self.user.username, self.date, self.sleep, self.weight, self.eat, self.exercise]

    @staticmethod
    def labels():
        return ['ID', 'Name', 'Date', 'Sleep', 'Weight', 'Eat', 'Excercise', 'Score']
