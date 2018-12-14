from django.contrib.auth.models import User
from os.path import join

from hammer.settings import BASE_DIR
from tool.tst import tst_diff
from tool.models import Test
from models import Administrator


def admin_print_list():
    for a in admin_list():
        print ('Administrator: %s,  Surrogate for: %s' % (a.user, a.surrogate))


def admin_list():
    return Administrator.objects.all()


def admin_table():
    return [a.as_row() for a in admin_list()]


def admin_detail(a):
    return a.values()


def admin_get(pk):
    return Administrator.objects.get(user__pk=pk)


def database_info():
    return (
        ('Company ', len(Company.objects.all())),
        ('Opening ', len(Opening.objects.all())),
        ('Candidate ', len(Candidate.objects.all())),
        ('Interviewer', len(Interviewer.objects.all())),
        ('Interview ', len(Interview.objects.all())),
        ('Interview Response', len(InterviewResponse.objects.all())),
        ('Skill', len(Skill.objects.all())),
    )


def get_detail_data():
    labels = ['Documents', 'System Log', 'Test Results', 'Django Users', 'Database', 'Material Template']
    links  = ['doc/Index', 'log', 'tests', 'users', 'database', 'material']
    text   = ['Documents', 'Log', 'Tests', 'Users', 'Database', 'Material Demo Page']
    return zip(labels, links, text)


def is_superuser(user):
    return user.is_staff and (user.username == 'StacieSeaman' or user.username == 'ChristineSeaman' or user.username == 'MarkSeaman')


def log_text():
    return '\n'.join(open(join(BASE_DIR, 'log', 'hammer.log')).read().split('\n')[-100:])


def requesting_user(user):
    if not user.username:
        return None
    if is_superuser(user):
        admin = Administrator.objects.filter(user=user)
        if admin:
            return admin[0].surrogate
    return user


def test_list():
    return Test.objects.all().order_by('name')


def test_labels():
    return ['Test name', 'Test Results']


def test_results():
    results = [test_text(t) for t in Test.objects.order_by('name')]
    return [t for t in results if t[1]]


def test_table():
    return [test_text(t) for t in test_list()]


def test_text(t):
    diff = tst_diff(t.name)
    return t.name, text_head(diff,10)


def text_head(text, lines=3):
    if text:
        return text_lines(text.split('\n')[:lines], 50)
    else:
        return None


def text_lines(lines, columns=30):
    lines = [x[:columns] for x in lines]
    return '\n'.join(lines)


def user_detail(user):
    return user.pk, user.username, user.first_name, user.last_name, user.email


def user_labels():
    return ['ID', 'User name', 'First', 'Last', 'Email']


def user_table(users):
    return [(user_detail(user)) for user in users]


