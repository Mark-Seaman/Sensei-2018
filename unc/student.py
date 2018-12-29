# Import list of students
from unc.models import Student


def import_students():
    '''
    usage:   dj shell
         $ from unc.student import *
         $ import_students()
    '''

    print('import_students')
    print(open('data/students.csv').read())


def list_students():
    '''
    usage:   dj shell
         $ from unc.student import *
         $ list_students()
    '''

    print('list_students')
    for s in Student.objects.all():
        print(str(s))


def delete_students():
    '''
    usage:   dj shell
         $ from unc.student import *
         $ delete_students()
    '''

    print('delete_students')
    Student.objects.all().delete()
