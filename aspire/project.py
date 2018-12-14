# project.py - Query and data type manipulation
from django.db.models import Sum

from tool.log import log
from models import Goal, Project, Role
from role import role_get


# Add
def project_add(name, role, hours=0):
    log('project_add', name)
    o = Project.objects.get_or_create(name=name)[0]
    o.role = role
    o.hours = hours
    o.save()


# Delete
def project_delete(pk):
    log('Project delete', pk)
    Project.objects.filter(pk=pk).delete()


# Edit
def project_edit(pk, name, role, hours):
    log('project_add', name)
    o = Project.objects.get(pk=pk)
    o.name = name
    o.role = role
    o.hours = hours
    o.save()


# Read
def project_lookup(pk):
    return Project.objects.get(pk=pk)


# Read
def project_get(client, name):
    return Project.objects.get(role__client=client, name=name)


# Goals
def project_goals(project):
    return Goal.objects.filter(parent__name='project/%s' % project.pk)


# Projects List
def project_list(client, role=None):
    if role:
        role = role_get(client, role)
        if role:
            return [(role, Project.objects.filter(role=role))]
    else:
        roles = Role.objects.filter(client=client)
        return [(r,Project.objects.filter(role=r)) for r in roles]


# Print List
def project_print(objects):
    print('\n\n' % ''.join(Project.labels()))
    for x in objects:
        print('\n    project %s. ' % s.pk)
        fields = [('%-15s' % f) for f in objects.as_row()]
        print(''.join(fields))


# List
def project_query(role=None):
    if role:
        projects = Project.objects.filter(role=role)
    else:
        projects = Project.objects.all()
    return [x.as_row() for x in projects.order_by('-hours')]


# Table
def project_table(role=None):
    role_hours = Project.objects.filter(role=role).aggregate(Sum('hours'))['hours__sum']
    all_hours = Project.objects.all().aggregate(Sum('hours'))['hours__sum']
    return Project.labels(), project_query(role), role_hours, all_hours


