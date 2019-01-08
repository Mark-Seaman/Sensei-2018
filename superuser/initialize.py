from os import system
from django.contrib.auth.models import User


'''
Super Users
    dj createsuperuser --username MarkSeaman --email mark.b.seaman@gmail.com
    password: xxx

from tool.initialize import user_reset

user_reset('Mark Seaman', 'Mark.B.Seaman@gmail.com', 'MS1959-sws')
'''


def user_reset(name, email, password):
    User.objects.all().delete()

    username = name.replace(' ', '')
    print('Set password to %s' % password)
    system('dj createsuperuser --username %s --email %s' % (username, email))
    u = User.objects.get(username=username)
    x = name.split(' ')
    u.first_name = x[0]
    u.last_name = x[1]
    u.set_password(password)
    u.save()
