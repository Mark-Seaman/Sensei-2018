from __future__ import unicode_literals

from django.contrib.auth.models import User
# from django.core.urlresolvers import reverse
from django.db import models
from django.core.validators import MaxValueValidator, MinValueValidator


MONTH_CHOICES = (('2018-01','2018-01'), ('2018-02','2018-02'), ('2018-03','2018-03'),)

# Money
class Money(models.Model):
    month       = models.CharField(unique=True, choices=MONTH_CHOICES, max_length=10)
    giving      = models.IntegerField(default=0, validators=[MinValueValidator(0), MaxValueValidator(20000)], verbose_name="Regular Giving")
    designated  = models.IntegerField(default=0, validators=[MinValueValidator(0), MaxValueValidator(20000)], verbose_name="Designated Giving")
    staff       = models.IntegerField(default=0, validators=[MinValueValidator(0), MaxValueValidator(20000)], verbose_name="Staff")
    operations  = models.IntegerField(default=0, validators=[MinValueValidator(0), MaxValueValidator(20000)], verbose_name="Operations")
    ministry    = models.IntegerField(default=0, validators=[MinValueValidator(0), MaxValueValidator(20000)], verbose_name="Ministry")
    rent        = models.IntegerField(default=0, validators=[MinValueValidator(0), MaxValueValidator(20000)], verbose_name="Rental Income")
    # mortgage    = models.IntegerField(default=0, validators=[MinValueValidator(0), MaxValueValidator(20000)], verbose_name="")
    building    = models.IntegerField(default=0, validators=[MinValueValidator(0), MaxValueValidator(20000)], verbose_name="Other Income")
    other_revenue = models.IntegerField(default=0, validators=[MinValueValidator(0), MaxValueValidator(20000)], verbose_name="Improvements")


# Church
class Church(models.Model):
    name = models.CharField(max_length=100)

    def __unicode__(self):
        return self.name


# Budget Category
class BudgetCategory(models.Model):
    church = models.ForeignKey(Church)
    name = models.CharField(max_length=100)
    is_cumulative = models.BooleanField()
    is_expense = models.BooleanField()


# Budget
class Budget(models.Model):
    category = models.ForeignKey(BudgetCategory)
    dollars = models.IntegerField(default=0)
    date = models.DateField()


# ChurchEvent
# class ChurchEvent(models.Model):
#     name        = models.CharField(max_length=100, null=True, blank=True)
#     participants = models.IntegerField(default=1)
#     duration    = models.IntegerField(default=1)
#     date        = models.DateField()
#     leadership  = models.BooleanField()
#     score = models.ForeignKey(ChurchScore, null=True)
#
#     def __unicode__(self):
#         return ', '.join([str(s) for s in self.as_row()])
#
#     def get_absolute_url(self):
#         return reverse('church-event-detail', kwargs={'pk': self.pk})
#
#     def as_row(self):
#         return [self.pk, self.name, self.date, self.participants, self.duration, self.leadership]
#
#     @staticmethod
#     def labels():
#         return ['ID', 'Name', 'Date', 'Participants', 'Duration', 'Leadership']



# Leader
class Leader(models.Model):
    church = models.ForeignKey(Church)
    user = models.ForeignKey(User)

    def __unicode__(self):
        return self.user.username + '@' + self.church.name

    def as_row(self):
        return [self.pk, self.user.first_name+' '+self.user.last_name, self.church, self.user.email, self.user]

    @staticmethod
    def labels():
        return ['ID', 'Name', 'Church', 'Email', 'User']

    def values(self):
        return zip(Leader.labels(), self.as_row())


# ChurchScore
#
#     church
#     date
#     connect_hours
#     connect_score
#     lead_hours
#     lead_score
#     give_dollars
#     give_score
#     invest_difference
#     invest_score

# class ChurchScore(models.Model):
#     church          = models.ForeignKey(Church, null=True, blank=True)
#     date            = models.DateField()
#     connect_hours   = models.IntegerField(default=0)
#     connect_score   = models.IntegerField(default=0)
#     lead_hours      = models.IntegerField(default=0)
#     lead_score      = models.IntegerField(default=0)
#     give_dollars    = models.IntegerField(default=0)
#     give_score      = models.IntegerField(default=0)
#     invest_difference = models.IntegerField(default=0)
#     invest_score    = models.IntegerField(default=0)
#
#     def __unicode__(self):
#         return self.church.name + ', ' + str(self.date)
#
#     def get_absolute_url(self):
#         return reverse('church-score-detail', kwargs={'pk': self.pk})
#
#     def as_row(self):
#         return [self.pk, self.church.name, self.date, self.connect_score, self.lead_score, self.give_score, self.invest_score]
#
#     @staticmethod
#     def labels():
#         return ['ID', 'Church', 'Date', 'Connect', 'Lead', 'Give', 'Invest']




# Church Budget
#
#     church
#     date
#     giving
#     earned
#     staff
#     operations
#     ministry
#     outreach

# class ChurchBudget(models.Model):
#     church      = models.ForeignKey(Church, null=True)
#     score       = models.ForeignKey(ChurchScore, null=True)
#     date        = models.DateField()
#     giving      = models.IntegerField(default=0)
#     earned      = models.IntegerField(default=0)
#     staff       = models.IntegerField(default=0)
#     operations  = models.IntegerField(default=0)
#     ministry    = models.IntegerField(default=0)
#     outreach    = models.IntegerField(default=0)
#
#     def __unicode__(self):
#         return self.church.name + ', ' + str(self.date)
#
#     def get_absolute_url(self):
#         return reverse('church-budget-detail', kwargs={'pk': self.pk})
#
#     def as_row(self):
#         return [self.pk, self.church.name, self.date, self.giving, self.earned, self.staff, self.operations, self.ministry, self.outreach]
#
#     @staticmethod
#     def labels():
#         return ['ID', 'Church', 'Date', 'Giving', 'Earned', 'Staff', 'Operations', 'Ministry', 'Outreach']
#
#     def values(self):
#         return zip(ChurchBudget.labels(), self.as_row())


# class ChurchBudgetTarget(models.Model):
#     church      = models.ForeignKey(Church)
#     date        = models.DateField()
#     giving      = models.IntegerField()
#     earned      = models.IntegerField()
#     staff       = models.IntegerField()
#     operations  = models.IntegerField()
#     ministry    = models.IntegerField()
#     outreach    = models.IntegerField()
#
#     def __unicode__(self):
#         return 'Target:' + self.church.name + ', ' + str(self.date)


# Score Threshold
# *Five
# *Four
# *Three
# *Two

# from church.models import *
# def fix_money_months():
#     for m in Money.objects.all():
#         if m.date:
#             m.month = m.date.strftime("%Y-%m")
#             m.save()
#             print(m.month)

# Money.objects.get(pk=14)

