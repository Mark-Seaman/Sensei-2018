# models.py - Default model code for code generator

# from django.core.urlresolvers import reverse
# from django.db import models
# from django.contrib.auth.models import User
#
#
# # Xxx
# #    Name
# #    User *
#
# class Xxx(models.Model):
#     name = models.CharField(max_length=100, unique=True)
#     user = models.ForeignKey(User, null=True)
#
#     def __unicode__(self):
#         return self.name
#
#     def get_absolute_url(self):
#         return reverse('xxx-detail', kwargs={'pk': self.pk})
#
#     def as_row(self):
#         return [self.pk, self.name, self.user]
#
#     @staticmethod
#     def labels():
#         return ['ID', 'Name', 'User']
#
#     def values(self):
#         return zip(Xxx.labels(), self.as_row())
#
#     # def fields(self):
#     #     return zip(
#     #         ['Name', 'User'],
#     #         ['name', 'user'],
#     #         [self.name, self.user],
#     #     )



# xxx.py - Query and data type manipulation

from tool.log import log
from models import Xxx


# Add
def xxx_add(name):
    log('xxx_add', name)
    o = Xxx.objects.get_or_create(name=name)[0]
    #o.abc = abc
    o.save()


# Delete
def xxx_delete(pk):
    log('Xxx delete', pk)
    Xxx.objects.filter(pk=pk).delete()


# Edit
def xxx_edit(pk, name):
    log('project_add', name)
    o = Xxx.objects.get(pk=pk)
    o.name = name
    o.save()


# Get
def xxx_lookup(pk):
    return Xxx.objects.get(pk=pk)


# Get
def xxx_get(client, name):
    return Xxx.objects.get(client=client, name=name)


# Print List
def xxx_print(objects):
    print('\n\n' % ''.join(Xxx.labels))
    for x in objects:
        print('\n    xxx %s. ' % s.pk)
        fields = [('%-15s' % f) for f in objects.as_row()]
        print(''.join(fields))


# List
def xxx_query(select=None):
    if select:
        objects = Xxx.objects.filter(client=select)
    else:
        objects = Xxx.objects.all()
    return [x.as_row() for x in objects.order_by('-pk')]


# Table
def xxx_table(select=None):
    # role_hours = Xxx.objects.filter(role=role).aggregate(Sum('hours'))['hours__sum']
    # all_hours = Xxx.objects.all().aggregate(Sum('hours'))['hours__sum']
    # return Xxx.labels(), xxx_query(role), role_hours, all_hours
    return Xxx.labels(), xxx_query(select)

