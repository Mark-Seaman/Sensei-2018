from __future__ import unicode_literals
from __future__ import unicode_literals
from django.core.urlresolvers import reverse
from django.db import models
from django.contrib.auth.models import User
from os.path import join

from hammer.settings import BASE_DIR


# Client
#
#   user *
#   organization

class Client(models.Model):
    user = models.OneToOneField(User)
    organization = models.CharField(max_length=100, default='Human Race')

    def __unicode__(self):
        return self.user.username

    def get_absolute_url(self):
        return reverse('client-detail', kwargs={'pk': self.pk})

    def as_row(self):
        return [self.pk, self.user.username, self.user.email, self.organization]

    @staticmethod
    def labels():
        return ['ID', 'User Name', 'Email', 'Organization']

    def values(self):
        return zip(Client.labels(), self.as_row())

    def name(self):
        return '%s-%s' % (self.user.first_name, self.user.last_name)

    def doc_path(self, doc=None):
        if doc:
            return join(BASE_DIR, 'Documents', 'aspire', 'clients', self.name(), doc)
        else:
            return join(BASE_DIR, 'Documents', 'aspire', 'clients', self.name())


# Role
#
#   client
#   name

class Role(models.Model):
    name = models.CharField(max_length=100)
    client = models.ForeignKey(Client, editable=False)

    def __unicode__(self):
        return self.client.name() + '/' + self.name

    def get_absolute_url(self):
        return reverse('role-detail', kwargs={'pk': self.pk})

    def as_row(self):
        return [self.pk, self.name, self.client.name()]

    @staticmethod
    def labels():
        return ['ID', 'Role Name', 'Client']

    def values(self):
        return zip(Role.labels(), self.as_row())

    def fields(self):
        return zip(
            ['Role', 'Client'],
            ['name', 'client'],
            [self.name, self.client],
        )


# Project
#
#      role *
#      name
#      hours

class Project(models.Model):
    role = models.ForeignKey(Role, null=True)
    name = models.CharField(max_length=100)
    hours = models.IntegerField(default=0)

    def __unicode__(self):
        return str(self.role) + '/' + self.name

    def get_absolute_url(self):
        return reverse('/aspire/project-detail', kwargs={'pk': self.pk})

    def as_row(self):
        return [self.pk, self.name, self.role.name, self.role.client.name(), self.hours]

    @staticmethod
    def labels():
        return ['ID', 'Project Name', 'Role', 'Client', 'Weekly Hours']

    def values(self):
        return zip(Project.labels(), self.as_row())


# Goal
#       name
#       parent *
#       project *

class Goal(models.Model):
    name = models.CharField(max_length=100)
    parent = models.ForeignKey('self', editable=True, null=True)

    def __unicode__(self):
        return self.name

    def get_absolute_url(self):
        return reverse('goal-detail', kwargs={'pk': self.pk})

    def as_row(self):
        return [self.pk, self.name, self.parent]

    @staticmethod
    def labels():
        return ['ID', 'Name', 'Parent']

    def values(self):
        return zip(Goal.labels(), self.as_row())

    # def fields(self):
    #     return zip(
    #         ['Name', 'User'],
    #         ['name', 'user'],
    #         [self.name, self.user],
    #     )


# Node
#
#       title
#       text
#       parent *
#       order

# class Node(models.Model):
#     title = models.CharField(max_length=100)
#     text = models.TextField()
#     parent = models.ForeignKey('self', editable=False, null=True)
#     order = models.IntegerField(default=0)
#
#     def __unicode__(self):
#         return '%d_%s' %(self.pk, self.title.replace(' ', '_'))
#
#     def get_absolute_url(self):
#         return reverse('node-detail', kwargs={'pk': self.pk})
#
#     def as_row(self):
#         return [self.pk, self.title, self.text, self.parent, self.order]
#
#     @staticmethod
#     def labels():
#         return ['ID', 'Title', 'Text', 'Parent', 'Order']
#
#     def values(self):
#         return zip(Node.labels(), self.as_row())


