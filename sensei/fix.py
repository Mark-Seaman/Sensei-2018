
#########################
# Create Course

'''
Title:  UNC BACS 200 - Web Dev for Small Business

Description:
University of Northern Colorado
Monfort College of Business
Business Administration Computer Science
BACS 200
Web Design and Development for Small Business
'''


#########################
# Lessons

from sensei.sensei import add_lesson
add_lesson ('bacs200', '13', 'Test & Debug', '2019-02-06')
add_lesson ('bacs200', '14', 'Cascading Stylesheets', '2019-02-11')
add_lesson ('bacs200', '15', 'CSS Color', '2019-02-13')
add_lesson ('bacs200', '16', 'CSS Spacing & Borders', '2019-02-15')
add_lesson ('bacs200', '17', 'Page Layout', '2019-02-18')
add_lesson ('bacs200', '18', 'Page Structure', '2019-02-20')
add_lesson ('bacs200', '19', 'Menus', '2019-02-22')
add_lesson ('bacs200', '20', 'Page Template', '2019-02-25')
add_lesson ('bacs200', '21', 'Bootstrap', '2019-02-27')
add_lesson ('bacs200', '22', 'Forms', '2019-03-01')
add_lesson ('bacs200', '23', 'Tab Views', '2019-03-04')
add_lesson ('bacs200', '24', 'Accordion Views', '2019-03-06')
add_lesson ('bacs200', '25', 'Carousel Views', '2019-03-08')
add_lesson ('bacs200', '26', 'Organizing Info', '2019-03-18')
add_lesson ('bacs200', '27', 'Documentation Tools', '2019-03-20')
add_lesson ('bacs200', '28', 'Business Blog', '2019-03-25')
add_lesson ('bacs200', '29', 'Photoshop', '2019-03-27')
add_lesson ('bacs200', '30', 'Illustrator', '2019-03-29')
add_lesson ('bacs200', '31', 'W3Schools', '2019-04-01')


from sensei.sensei import add_lesson
add_lesson ('bacs200', '32', 'Development Workflow', '2019-04-03')


#########################
# Review assignment

from sensei.models import *
from sensei.review import *

def assign_new_reviews():

    # Project #11
    requirements = '''Description of how to implement the feature
HTML listing
CSS listing
JavaScript listing
Easy to reproduce the result
Page is located at proper URL
Page must validate (HTML, CSS, links)
Visual Appearance (no issues)
Link to W3Schools demo
Use source code widget for HTML display
'''
    project_url = 'https://shrinking-world.com/unc/bacs200/projects/11'
    req = Requirements.objects.create(labels=requirements, url=project_url)
    print('Assign %d' % assign_reviews('bacs200/projects/skill.html', '2019-04-03', req.pk))
    print("%s reviews assigned" % len(Review.objects.all()))


assign_new_reviews()


def list_requirements():
    for r in Requirements.objects.all():
        print('%s %s \n %s' % (r.pk, r.url, r.labels))

list_requirements()



#########################
# Fix student records

from sensei.models import *
from sensei.student import *

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

def stud(id):
    return Student.objects.get(pk=id)

def name(name):
    return Student.objects.filter(name__contains=name)

def fix_reviews():
    for r in Review.objects.filter(page=''):
        print(r.reviewer.name, r.designer.name,  r.page, r.score)
        r.page = 'index.php'
        r.save()

fix_reviews()

def fix_reviews():
    for r in Review.objects.filter(score__lt=5):
        print (r.designer, r.score)
        
fix_reviews()        

#########################
# Export all the students to a file

from sensei.student import *
list_students()
export_students()


#########################
# Design review logic

from sensei.models import *
from sensei.review import *


def list_reviews():
    for r in Review.objects.all():
        print(r.designer.name, r.page, r.due, r.requirement_labels.labels)


def clear_reviews():
    Review.objects.all().delete()


def test_reviews():
    student = Student.objects.get(name='Test Student')
    assert(student.name == 'Test Student')
    # clear_reviews()
    r  = create_review(student, student, 'bacs200/index.html', '2019-01-22')
    assert(r.designer == student)
    # assert(len(Review.objects.all()) == 1)
    create_review(student, student, '', '2019-01-20')
    create_review(student, student, 'bacs200/inspire.html', '2019-01-21')
    list_reviews()
    test_groups()

test_reviews()


def test_groups():
    pairs = review_pairs(review_groups())
    for p in pairs:
       print(p[0].name, p[1].name)
    print(len(pairs))

test_groups()


from sensei.review import *

def list_groups():
    for g in review_groups():
        print(',  '.join([x.name for x in g]))

list_groups()





#########################
# URL Game
from sensei.models import *
from sensei.student import *

def assign_url_game():
    for s in students():
        UrlGame.objects.create(student=s)

assign_url_game()

def url_game_results():
    for u in UrlGame.objects.all():
        print(u.student.name, u.answered, u.left)

url_game_results()
