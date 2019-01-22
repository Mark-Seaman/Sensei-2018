from csv import reader, writer
from traceback import format_exc

from django.contrib.auth.models import User

from mybook.mybook import mybook_site_title, main_menu

from .models import Student
from tool.log import log, log_exception
from tool.user import user_add


def delete_students():
    '''
    usage:   dj shell
          from sensei.student import *
          delete_students()
    '''

    print('delete_students')
    Student.objects.all().delete()


def export_students():
    data_file = 'data/students.csv'
    print("Exporting Students to %s" % data_file)
    with open(data_file, 'w') as f:
        w = writer(f)
        for s in Student.objects.all():
            row = [s.name, s.email, s.domain]
            print(','.join(row))
            w.writerow(row)


def fix_images(text, image_path):
    return text.replace('![](img/', '![](%s/' % image_path)


def import_students():
    '''
    usage:   dj shell
          from sensei.student import *
          import_students()
    '''
    data_file = 'data/students.csv'
    print('Import students from %s')
    with open(data_file) as f:
        for row in reader(f):
            try:
                print("Import user %s " % row)
                user_add(row[0], row[1], row[2])
            except:
                print("*** %s ***" % row)
                log_exception()
                print(format_exc())
    list_students()


def list_students():
    '''
    usage:   dj shell
          from sensei.student import *
          list_students()
    '''

    print('list_students')
    for s in Student.objects.all():
        print(str(s))


def reading_scores_table():
    data_file = 'Documents/unc/bacs200/zybooks.csv'
    log('Import students reading scores from %s')
    scores = []
    with open(data_file) as f:
        for row in reader(f):
            try:
                log("Import user %s " % row)
                scores.append(row)
            except:
                print("*** %s ***" % row)
                log_exception()
                print(format_exc())
    return scores


def reading_table(scores):
    table = []
    labels = scores[0][7:-7]
    table.append(labels)
    for s in scores[1:]:
        values = [v for v in s[7:-7]]
        table.append(['%s %s' % (s[1], s[0])] + ['%s' % int(float(v)) for v in values])
    return table


def reading_scores():
    table = reading_table(reading_scores_table())
    log('READING: ' + '   '.join(table[0]))
    scores = {}
    for row in table[1:]:
        name = '%s' % (row[0])
        student = Student.objects.filter(zbooks=name)
        if student:
            scores[student[0]] = row
        else:
            log('Student record missing: '+name)
    return scores


def register_user_domain(name, email, password, domain):
    log('name: %s, email: %s, domain: %s' % (name, email, domain))
    assert ' ' in name
    first = name.split()[0]
    last = name.split()[-1]
    username = email
    u = User.objects.get_or_create(username=username)[0]
    u.first_name = first
    u.last_name = last
    u.email = email
    u.is_staff = True
    u.set_password(password)
    u.save()
    s = Student.objects.get_or_create(course_id=1, name=name, email=email, domain=domain)[0]
    return s


def student_scores(student_id):
    reading = reading_scores()
    s = student(student_id)
    scores = reading.get(s, [])
    return scores


def student_totals():
    return reading_table(reading_scores_table())


def site_settings(**kwargs):
    doc = kwargs.get('doc', 'unc/bacs200')
    site = mybook_site_title(doc)
    menu = main_menu(site, doc)
    settings = dict(site=site, menu=menu)
    settings.update(kwargs)
    return settings


def students():
    return Student.objects.all().order_by('email')


def student(id):
    return Student.objects.get(pk=id)


