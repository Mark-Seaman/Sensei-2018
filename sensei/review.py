from random import shuffle

from .models import Course, Review
from .sensei import get_student, query_students


def allow_review(reviewer, designer, page):
    # page = assignment_page(reviewer. course.title, page)
    return len(Review.objects.filter(reviewer_id=reviewer, designer_id=designer, page=page)) < 2


def calculate_points(student):
    review = student.reviewer_score * 20 / 100
    design = student.designer_score * 80 / 100
    return dict(review=review, design=design, total=review + design)


def course_list():
    for c in Course.objects.all():
        print ('%d. %s - %s' % (c.pk, c.name, c.title))


def create_review(reviewer, designer, page):
    Review.objects.create(reviewer_id=reviewer, designer_id=designer, page=page)


def create_reviews(page, groups):
    for p in review_pairs(groups):
        create_review(p[0], p[1], page)


def create_sample_courses():
    Course.objects.create(name='bacs200', title='HtmlApps')
    Course.objects.create(name='bacs350', title='PhpApps')

    
def requirements(course):
    if course == 'HtmlApps':
        return requirements_bacs200()
    else:
        return requirements_bacs350()

    
def requirements_bacs200():
    return '''Correct URL for page
Valid HTML
Correct Page Content
CSS Styling
Visual Appeal
Images
Java Script Controls
Banner, Main, Footer
Navigation
Business Purpose'''.split('\n')


def requirements_bacs350():
    return '''Correct URL
Valid HTML
Common page design
Visual Appeal
User Auth
Data structure and logic
Views - List, Detail, Add, Edit, Delete
Controller - proper User Experience (UX)
Meets Business Purpose
No Defects'''.split('\n')


def count_score(r):
    requirements = [r.requirement_1, r.requirement_2, r.requirement_3, r.requirement_4, r.requirement_5,
                    r.requirement_6, r.requirement_7, r.requirement_8, r.requirement_9, r.requirement_10]
    return len([x for x in requirements if x])


def review_groups():
    course = Course.objects.get(name='bacs350')
    ids = [s.pk for s in query_students(course)]
    shuffle(ids)
    x = 0
    while ids[x:x + 6]:
        print(str(ids[x:x + 6]) + ',')
        x += 6


bacs_200_groups = [
    [30, 35, 10, 28, 15, 9],
    [39, 23, 24, 8, 36, 19],
    [5, 3, 17, 33, 26],
    [37, 14, 18, 42, 2],
    [22, 41, 34, 12, 13],
    [31, 11, 4, 21, 6],
    [1, 38, 7, 16, 29],
    [20, 27, 40, 25, 32],
    ]


bacs_350_groups = [
    [43, 54, 53, 44, 52, 47],
    [45, 50, 49, 51, 48, 46],
]


def review_pairs(groups):
    x = []
    for team in groups:
        for reviewer in team:
            for designer in team:
                if reviewer != designer:
                    x.append((designer, reviewer))
    print(len(x))
    return x


def reviewer_query(reviewer_id):
    return Review.objects.filter(reviewer_id=reviewer_id)


def designer_query(designer_id):
    return Review.objects.filter(designer_id=designer_id)


def designer_score(designer_id):
    reviews = Review.objects.filter(designer_id=designer_id, score__gt=0)
    reviews = [r.score for r in reviews]
    if not reviews:
        return 0
    score = sum(reviews)
    total = 10 * len(reviews)
    return score * 100 / total


def designer_scores(designer_id, assignments=None):
    if not assignments:
        assignments = projects(designer_id.course)
    scores = []
    reviews = Review.objects.filter(designer_id=designer_id, score__gt=0)
    for a in assignments:
        s = [r.score for r in reviews.filter(page=assignment_page('PhpApps', a))]
        assignments = ', '.join([str(i) for i in s])
        if s:
            points = avg(s)/5
            scores.append((a, avg(s), assignments, points))
    return scores


def avg(s):
    if s:
        return sum(s) * 10 / len(s)


def projects(course):
    if course.title == 'HtmlApps':
        return ['index', 'blog/2', 'blog/3', 'blog/4', 'blog/5', 'blog/6', 'blog/7']
    else:
        return ['brain', 'brain/notes.php', 'brain/review.php', 'brain/slides.php']


def reviews_completed(student_id):
    todo = reviews_to_do(student_id)
    done = reviews_done(student_id)
    if (len(done) + len(todo)) > 0:
        return len(done) * 100 / (len(todo) + len(done)), len(done), len(todo) + len(done)
    else:
        return 0, 0, 0


def reviews_done(student_id):
    return Review.objects.filter(reviewer_id=student_id, score__gt=0)


def reviews_feedback(student_id, page):
    return Review.objects.filter(designer_id=student_id, score__gte=0, page=page)


def review_tabs(student_id):
    tabs = []
    course = get_student(student_id).course
    for i, page in enumerate(projects(course)):
        reviews = reviews_feedback(student_id, assignment_page(course.title, page))
        active = 'active' if i == 0 else ''
        tabs.append(dict(label='tab%d' % i, title=page, reviews=reviews, active=active))
    return tabs


def reviews_to_do(student_id):
    reviews = Review.objects.filter(reviewer_id=student_id, score__lt=1)
    return reviews


def reviewer_score(reviewer_id):
    completed = reviews_completed(reviewer_id)
    return completed[0]


def assignment_page(course, page):
    if course == 'HtmlApps':
        return page + '.html'
    else:
        return page


def reviewer_scores(reviewer_id, assignments):
    scores = []
    reviews = Review.objects.filter(reviewer_id=reviewer_id, score__gte=0)
    for a in assignments:
        s = [r.score for r in reviews.filter(page=assignment_page('PhpApps', a))]
        scores.append((a, avg(s), s))
    return scores


def gather_review_scores(course, student=None):
    scores = []
    update_review_scores(course)
    # assignments = projects(course)
    scores = [student_review_data(s.pk) for s in query_students(course, student)]
        # c = reviews_completed(s.pk)
        # r = reviewer_scores(s.pk, assignments)
        # d = designer_scores(s.pk, assignments)
        # scores.append((s.id, s.email, c, r, d))
    return scores


def student_review_data(student_id):
    student = get_student(student_id)
    todo = reviews_to_do(student_id)
    done = reviews_done(student_id)
    completed = len(done), len(todo) + len(done)
    scores = designer_scores(student)
    points = calculate_points(student)
    return {
        'reviewer':         student,
        'reviews_to_do':    todo,
        'reviews_done':     done,
        'completed':        completed,
        'scores':           scores,
        'points':           points,
    }


def update_review_scores(course):
    for s in query_students(course):
        s.reviewer_score = reviewer_score(s.pk)
        s.designer_score = designer_score(s.pk)
        s.save()

