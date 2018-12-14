# role.py - Query and data type manipulation

from tool.log import log
from models import Role


# Add
def role_add(name, client):
    log('role_add', client.name()+'/'+name)
    return Role.objects.get_or_create(name=name, client=client)[0]


# Delete
def role_delete(pk):
    log('Role delete', pk)
    Role.objects.filter(pk=pk).delete()


# Read
def role_lookup(pk):
    return Role.objects.get(pk=pk)


# Read
def role_get(client, name):
    r = Role.objects.filter(client=client, name=name)
    if r:
        return r[0]


# Print List
def role_print(objects):
    print('\n\n' % ''.join(Role.labels))
    for x in objects:
        print('\n    role %s. ' % s.pk)
        fields = [('%-15s' % f) for f in objects.as_row()]
        print(''.join(fields))


# List
def role_query(client):
    return [x.as_row() for x in Role.objects.filter(client=client)]

