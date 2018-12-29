# user.py -- created by factory script
import traceback
from csv import reader, writer
from os import system

from django.contrib.auth.models import User

from tool.log import log_exception


def user_command(self, options):
    '''
    Execute a command script from scriptor.  Parse off command and args and dispatch it.
    '''
    #print('options', options)
    cmd = options[0]
    args = options[1:]
    if cmd == 'add':
        user_add(args[0], args[1])
    elif cmd == 'delete':
        user_delete(args)
    elif cmd == 'fix':
        user_fix_name(args)
    elif cmd == 'list':
        user_list()
    elif cmd == 'import':
        user_import(self, args)
    elif cmd == 'export':
        user_export(self, args)
    elif cmd == 'reset':
        user_reset(self)
    else:
        user_help()

def user_help():
    print ('''
    usage: x user command

    command:

        add     - Add a new user
        delete  - Remove a user
        fix     - Reset the first and last name fields
        list    - Display a list of users
        import  - Import several users from a CSV file
        export  - Create a CSV with the current list of users
        reset   - Destroy existing users and start over

    ''')


def user_add(name, email, password='test'):
    '''Add a user login ID'''
    assert ' ' in name
    first = name.split()[0]
    last = name.split()[-1]
    username = name.replace(' ', '')
    u = User.objects.get_or_create(username=username)[0]
    u.first_name = first
    u.last_name = last
    u.email = email
    u.is_staff = True
    u.set_password(password)
    u.save()
    return u


def user_delete(args):
    '''Delete one user record'''
    if args:
        print('Deleting User record: %s' % args[0])
        for u in User.objects.filter(pk=args[0]):
            print('Delete %s' % u.username)
            u.delete()


def user_export(self, args):
    '''Export all of the users to a CSV file'''
    data_file = user_file_path(args)
    self.stdout.write("Exporting Users to %s" % data_file)
    with open(data_file, 'w') as f:
        w = writer(f)
        for u in User.objects.all():
            name = u.first_name + ' ' + u.last_name
            row = [name, u.username, u.email]
            self.stdout.write(','.join(row))
            w.writerow(row)


def user_get(pk):
    return User.objects.get(pk=pk)


def user_import(self, args):
    '''Read a csv file and insert the records into the database'''
    data_file = user_file_path(args)
    print('Importing Users from %s' % data_file)
    with open(data_file) as f:
        for row in reader(f):
            try:
                self.stdout.write("Import user %s " % row)
                user_add(row)
            except:
                self.stdout.write("*** %s ***" % row)
                log_exception()
                self.stdout.write(traceback.format_exc())


def user_list():
    '''Print the list of configured users'''
    print('List All Users')
    heading = 'ID %-20s %-20s %-30s' % ('Name', 'User', 'Email')
    print(heading)
    for u in User.objects.all():
        name = u.first_name + ' ' + u.last_name
        line = '%-2d %-20s %-20s %-30s ' % (u.pk, name, u.username, u.email)
        print(line)


def user_reset(self):
    User.objects.all().delete()
    self.stdout.write('Use x for superuser passwords')
    add_super_user('Stacie Seaman', 'stacie.seaman@shrinking-world.com', 'scs759-sws')
    add_super_user('Mark Seaman', 'mark.seaman@gmail.com', 'MS1959-sws')


def add_super_user(name, email, password):
    '''
    dj createsuperuser --username MarkSeaman --email mark.seaman@gmail.com
    password: MS1959-sws
    '''
    username = name.replace(' ', '')
    print('Set password to %s' % password)
    system('dj createsuperuser --username %s --email %s' % (username, email))
    u = User.objects.get(username=username)
    x = name.split(' ')
    u.first_name = x[0]
    u.last_name = x[1]
    u.set_password(password)
    u.save()


def user_password(username, password):
    u = User.objects.get(username=username)
    u.set_password(password)
    u.save()


def user_lookup(name, email=None):
    if email:
        return User.objects.get(username=name.replace(' ', ''), email=email)
    else:
        return User.objects.get(username=name.replace(' ', ''))


def user_file_path(args):
    if args[0] == 'production':
        return 'data/production-users.csv'
    if args[0] == 'test':
        return 'data/test-users.csv'
    if args[0] == 'dev':
        return 'data/dev-users.csv'


def user_fix_name(args):
    username, first, last = args
    print('username: %s' % username)
    print('first_name: %s' % first)
    print('last_name: %s' % last)
    u = User.objects.get(username=username)
    u.first_name = first
    u.last_name = last
    u.save()
    name = u.first_name + ' ' + u.last_name
    line = '%-2d %-20s %-20s %-30s ' % (u.pk, name, u.username, u.email)
    print(line)


def show_users():
    print('Users \n\nID %-20s %-20s %-30s' % ('Name', 'User', 'Email'))
    for u in User.objects.all():
        name = u.first_name + ' ' + u.last_name
        print('%-2d %-20s %-20s %-30s ' % (u.pk, name, u.username, u.email))


def reset_passwords():
    for u in User.objects.all():
        print(u.username)
        user_password(u.username, 'test')