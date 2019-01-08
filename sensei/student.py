from csv import reader
from traceback import format_exc

from .models import Student
from tool.log import log_exception
from tool.user import user_add


def import_students():
    '''
    usage:   dj shell
         $ from sensei.student import *
         $ import_students()
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
         $ from sensei.student import *
         $ list_students()
    '''

    print('list_students')
    for s in Student.objects.all():
        print(str(s))


def delete_students():
    '''
    usage:   dj shell
         $ from sensei.student import *
         $ delete_students()
    '''

    print('delete_students')
    Student.objects.all().delete()
