from csv import reader
from django.utils.timezone import now
from os.path import join
from re import findall

from tool.document import  read_markdown

from .models import  Course, Lesson, Student
from .student import fix_images


def add_student(course, name, email, domain):
    Student.objects.create(course=course, name=name, email=email, domain=domain)


def add_lesson(course, lesson, title, date):
    url = 'https://shrinking-world.com/unc/bacs200/%02d' % int(lesson)
    Lesson.objects.get_or_create(course__name=course, lesson=lesson, title=title, date=date, content=url)


def add_course(name, title):
    Course.objects.create(name=name, title=title, author='Mark Seaman', teacher='Mark Seaman', description="None")


# def course_lessons(course, page):
#     if not course.startswith('bacs'):
#         return []
#     if page == course or page == '%s/Index' % course :
#         return [x for x in Lesson.objects.filter(course__name=course).order_by('date')][-1:]
#     elif page == '%s/Lessons' % course:
#         return [x for x in Lesson.objects.filter(course__name=course).order_by('date')]
#     else:
#         return []
#
#
# def home_link(title):
#     if title:
#         course = title.split('/')[0]
#         return ('%s' % course, '/guide/%s/Index.md' % course)


def query_students(course, student=None):
    s = Student.objects.filter(course=course).order_by('email')
    if student:
        s = s.filter(pk=student)
    return s


def get_course(id):
    return Course.objects.get(pk=id)


def get_course_name(name):
    return Course.objects.get(name=name)


def get_student(id):
    return Student.objects.get(pk=id)


def get_student_email(email):
    return Student.objects.get(email=email)


def link(url, title=None):
    if not title:
        title = url
    url = '/guide%s' % url.replace('Lesson', title)
    lesson = findall('(\d\d)-Lesson', url)
    if lesson:
        title = 'Lesson #' + lesson[0]
    return (title, url)


def list_lessons(course):
    doc = join('Documents', 'unc', course, 'lessons.csv')
    s = []
    with open(doc) as f:
        for row in reader(f):
            s.append(row)
    return s


def make_link(href, text=None):
    if not text:
        text = href
    return '<a href="%s">%s</a>' % (href, text)


def schedule(course):
    data_file = 'Documents/unc/%s/schedule.csv' % course
    s = []
    with open(data_file) as f:
        for row in reader(f):
            s.append(row)
    return s[0], s[1], s[2:]


def slide_content_data(course, lesson):
    def adjust_markdown_headings(markdown):
        markdown = markdown.replace('\n### ', '\n\n--\n\n#### ')
        markdown = markdown.replace('\n## ', '\n\n---\n\n![](img/Bear_Logo.png)\n\n### ')
        markdown = markdown.replace('\n# ', '\n')
        return markdown

    def format_slides(course, lesson):
        doc = 'Documents/guide/%s/lesson/%s-%s.md' % (course, lesson, 'Lesson')
        text = read_markdown(doc)
        text = adjust_markdown_headings(text)
        return text.replace('img/', '/static/images/guide/%s/' % course)

    title = 'UNC - BACS 350' if course == 'PhpApps' else 'UNC - BACS 200'
    text = format_slides(course, lesson)
    return dict(course=title, lesson=lesson, title='Setup web hosting', markdown=text)


def slides_markdown(page):
    course = page[:7]
    doc = 'Documents/unc/' + page
    text = fix_images(read_markdown(doc), '/static/images/unc/%s' % course)
    bear = '\n\n---\n\n<img src="/static/images/unc/bacs200/Bear_Logo.png">\n\n---\n\n'
    return bear + text + bear


def unc_menu(course):
    return 'UNC Course', [
        dict(url='/unc/%s/lesson/' % course,     label='Lessons',    active=''),
        dict(url='/unc/%s/projects/' % course,   label='Projects',   active=''),
        dict(url='/unc/%s/docs/' % course,       label='Resources',  active=''),
        dict(url='/unc/%s/student/' % course,    label='Dashboard',  active=''),
        dict(url='https://markseaman.info/info/Test/UNC', label='Test', active=' active'),
    ]


def site_settings(**kwargs):
    course = kwargs.get('course')
    if course:
        menu = unc_menu(course)
        title = get_course_name(course).title
        home = '/unc/%s/' % course
        site = ('UNC Digital Classroom', title, home)
        settings = dict(site=site, menu=menu, time=now())
    else:
        settings = {}
    settings.update(kwargs)
    return settings

