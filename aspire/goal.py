# goal.py - Query and data type manipulation

from tool.log import log
from models import Goal


# Add
def goal_add(name, parent):
    log('goal_add', name)
    return Goal.objects.get_or_create(name=name, parent=parent)[0]


# Delete
def project_delete(pk):
    log('Goal delete', pk)
    Goal.objects.filter(pk=pk).delete()


# Edit
def project_edit(pk, name):
    log('project_add', name)
    o = Goal.objects.get(pk=pk)
    o.name = name
    o.save()


# Get
def goal_lookup(pk):
    return Goal.objects.get(pk=pk)


# Get
def goal_get(client, name):
    return Goal.objects.get(client=client, name=name)


# Print List
def goal_print(objects):
    print('\n\n' % ''.join(Goal.labels))
    for x in objects:
        print('\n    goal %s. ' % s.pk)
        fields = [('%-15s' % f) for f in objects.as_row()]
        print(''.join(fields))


# List
def goal_query(client=None):
    if client:
        objects = Goal.objects.filter(project__role__client=client)
    else:
        objects = Goal.objects.all()
    return [x.as_row() for x in objects.order_by('-pk')]


# Table
def goal_table(client=None):
    # role_hours = Goal.objects.filter(role=role).aggregate(Sum('hours'))['hours__sum']
    # all_hours = Goal.objects.all().aggregate(Sum('hours'))['hours__sum']
    # return Goal.labels(), goal_query(role), role_hours, all_hours
    return Goal.labels(), goal_query(client)

