from csv import reader
from django.utils.text import slugify
from glob import glob
from os.path import exists, join
from re import findall

from bin.pandoc import read_markdown, text_to_html
from hammer.settings import DOC_ROOT
from tool.document import doc_html_text
from unc.models import Student, Course


def content_lessons(course):
    path = guide_doc_path(course + '/' + 'lesson/*-Lesson.md')
    files = glob(path)
    x = len(guide_doc_path())
    return [f[x:] for f in files]


def guide_doc_path(doc=None):
    path = join(DOC_ROOT, 'guide')
    if doc:
        return join(path, doc)
    return path


def guide_file(course, doc):
    if course:
        path = guide_doc_path(join(course, doc))
    else:
        path = guide_doc_path(doc)
    if exists(path):
        return path
    if exists(path + '.md'):
        return path + '.md'


def guide_schedule(lesson):
    table = []
    course = lesson.split('/')[0]
    path = guide_doc_path(join(course, 'Schedule.csv'))
    with open(path) as f:
        for row in reader(f):
            table.append(row[:7])
    return [r for r in table[3:] if r]


def register_students():
    c = Course.objects.get(name='bacs350')
    print('%d. %s - %s' % (c.pk, c.name, c.title))
    for s in domain_data('PhpApps'):
        add_student(c, s[2], s[1], s[0])
        print(s)


def add_student(course, name, email, domain):
    Student.objects.create(course=course, name=name, email=email, domain=domain)


def query_students(course, student=None):
    s = Student.objects.filter(course=course).order_by('email')
    if student:
        s = s.filter(pk=student)
    return s


def get_student(id):
    return Student.objects.get(pk=id)


def get_student_email(email):
    return Student.objects.get(email=email)


def domain_data(course):

    def domains(course):
        table = []
        path = guide_doc_path(join(course, 'students.csv'))
        with open(path) as f:
            for row in reader(f):
                if len(row) == 3:
                    table.append((row[2], row[1], row[0]))
        return table

    return domains(course)


def read_student_list():
    domains = {}
    path = guide_doc_path(join('HtmlApps', 'students.csv'))
    with open(path) as f:
        for row in reader(f):
            if len(row) == 3:
                domains[row[1]] = row[2]
    return domains


def student_test_links(student):

    def url(student, page=''):
        return 'http://' + student.domain + page

    if student.course.title == 'HtmlApps':
        return [
            (url(student), 'Home'),
            (url(student, "/project/index.html"), 'Projects'),
            (url(student, "/blog/1.html"), 'Blog 1'),
            (url(student, "/blog/2.html"), 'Blog 2'),
            (url(student, "/blog/3.html"), 'Blog 3'),
            (url(student, "/blog/4.html"), 'Blog 4'),
            (url(student, "/blog/5.html"), 'Blog 5'),
            (url(student, "/blog/6.html"), 'Blog 6'),
            (url(student, "/blog/7.html"), 'Blog 7'),
        ]
    else:
        return [
            (url(student), 'Home'),
            (url(student, "/brain"), 'Brain'),
            (url(student, "/brain/notes.php"), 'Notes'),
            (url(student, "/brain/review.php"), 'Review'),
            (url(student, "/brain/slides.php"), 'Slides'),
        ]


def home_link(title):
    if title:
        course = title.split('/')[0]
        return ('%s' % course, '/guide/%s/Index.md' % course)


def lesson_cards(course, lesson):

    def fix_images(text):
        image_path = '/static/images/guide/' + course
        return text.replace('![](img/', '![](%s/' % image_path)

    def lesson_markdown(path):
        if exists(path):
            return fix_images(read_markdown(path))
        else:
            return 'No file found, ' + path

    def card_text(tab_title, tab_text):
        lines = tab_text.split('\n')
        text = '\n'.join(lines[1:])
        text = text_to_html(text)
        return dict(title=tab_title, text=text)

    def card_title(tab_text):
        lines = tab_text.split('\n')
        return lines[0]

    if lesson:
        title = course + '/' + 'Lesson ' + lesson
        doc = 'Documents/guide/%s/lesson/%s-%s.md' % (course, lesson, 'Lesson')
        text = lesson_markdown(doc)
        tab_text = text.split('\n\n## ')
        tabs = [card_text(card_title(x),  x) for x in tab_text]
        return tabs


def lesson_data(course, lesson, text):

    def tab_choice(i, tab):
        return ('tab%d' % i, tab['title'], tab['text'], 'active' if i == 0 else '')

    def lesson_tabs_data(course, lesson):
        tabs = lesson_cards(course, lesson)
        return [tab_choice(i, tab) for i, tab in enumerate(tabs)]

    next = "%02d" % (int(lesson) + 1)
    previous = "%02d" % (int(lesson) - 1)
    if previous == '00': previous = '01'
    return dict(text=text, tabs=lesson_tabs_data(course, lesson), lesson=(lesson, previous, next))


def lesson_info(lesson):
    if 'Lesson' in lesson:
        x = lesson.split('/')[1]
        table = guide_schedule(lesson)
        for row in table:
            if row[3] == x:
                return row


def link(url, title=None):
    if not title:
        title = url
    url = '/guide%s' % url.replace('Lesson', title)
    lesson = findall('(\d\d)-Lesson', url)
    if lesson:
        title = 'Lesson #'+lesson[0]
    return (title, url)


def make_link(href, text=None):
    if not text:
        text = href
    return '<a href="%s">%s</a>' % (href, text)


def main_menu(course, page=None):

    def menu_active(page, menu_item):
        return 'class="active"' if page.startswith(menu_item) else ''

    def menu_entry(page, x):
        icon, label, url = x
        return url, "zmdi-" + icon, label, menu_active('/'+page, url)

    def menu_read(menu_file):
        menu_items = open(menu_file).read().split('\n')
        menu_data = [m.split(',') for m in menu_items if m]
        return [menu_entry(page, x) for x in menu_data]

    if course == 'Index':
        return menu_read(join('Documents', 'guide', 'Menu'))
    else:
        return menu_read(join('Documents', 'guide', course, 'Menu'))


def missing_page_info(title):
    # text = lesson_info(lesson)
    return dict(title=title,  home=home_link(title))


def page_info(course, title):
    doc = 'guide/%s/%s.md' % (course, title)
    site = site_titles(course)
    menu = main_menu(course, doc)
    return dict(site=site, menu=menu, title=title, page=doc, home=home_link(course+'/'+title))


def read_file(course, doc):
    def no_blank_lines(text):
        return [x for x in text.split('\n') if x != '']

    path = guide_file(course, doc)
    if path and exists(path):
        return no_blank_lines(open(path).read())
    else:
        return []


def schedule_data(course, table):
    def course_part_data(title, table, first, last):
        return {'title': title, 'slug': slugify(title), 'table': table[first:last]}

    def lesson_link(lesson):
        if not lesson:
            return ''
        return make_link("Lesson%02d" % int(lesson))

    def set_links(table):
        return [row[:3] + [lesson_link(row[3])] + row[4:] for row in table]

    def course_parts(table, course):
        if course == 'PhpApps':
            p1 = course_part_data('Part 1 - Core', table, 0, 10)
            p2 = course_part_data('Part 2 - Views', table, 10, 21)
            p3 = course_part_data('Part 3 - Data', table, 21, 32)
            p4 = course_part_data('Part 4 - JavaScript', table, 32, 50)
            return [p1, p2, p3, p4]
        else:
            p1 = course_part_data('Part 1 - HTML', table, 0, 15)
            p2 = course_part_data('Part 2 - CSS', table, 15, 30)
            p3 = course_part_data('Part 3 - Design', table, 30, 50)
            return [p1, p2, p3]

    table = set_links(table)
    return dict(parts=course_parts(table, course))


def site_titles(course):
    if course == 'Index':
        titles =join('Documents', 'guide', 'SiteTitle')
    else:
        titles = join('Documents', 'guide', course, 'SiteTitle')
    return open(titles).read().split('\n')


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


def test_links(course):
    pages = read_file(course,'Test')
    return [link for link in pages]


def view_info(kwargs):
    def view_data(course, title, lesson):
        text = doc_html_text(guide_doc_path(title) + ".md", '/static/images/guide/' + course)
        if lesson:
            return lesson_data(course, lesson, text)
        else:
            return dict(text=text, home=home_link(course + '/' + title))

    # log_page(self.request)
    course = kwargs.get('course')
    title = kwargs.get('title', 'Missing')
    settings = page_info(course, title)
    kwargs.update(settings)
    lesson = kwargs.get('lesson')
    settings = view_data(course, title, lesson)
    kwargs.update(settings)
    return kwargs


