from sensei.models import Student


def fix_reading_names():
    for s in Student.objects.all():
        if not s.zbooks:
            s.zbooks = s.name
            s.save()


def fix_email_names():
    for s in Student.objects.all():
        if s.email != s.email.lower():
            s.email = s.email.lower()
            s.save()


'''
Title:  UNC BACS 200 - Web Dev for Small Business

Description:
University of Northern Colorado
Monfort College of Business
Business Administration Computer Science
BACS 200
Web Design and Development for Small Business
'''

