from os import environ, mkdir, system
from os.path import exists, join

from shell import file_tree_list, read_file
from text import match_lines


# ----------------------------
# Command Interpreter

def guide_command(options):
    if options:
        cmd,args = options[0],options[1:]
        if cmd == 'add':
            guide_add(args)
        elif cmd == 'lesson':
            course, lesson = args[:2]
            guide_create_lesson(course, lesson)
        elif cmd=='edit':
            course, doc = args[:2]
            guide_edit(course, doc)
        elif cmd=='list':
            guide_list(args)
        elif cmd == 'outline':
            guide_outline(args[0],args[1])
        else:
            guide_help(args)
    else:
        guide_help()


def guide_help(args=None):
    print('''
        guide Command

        usage: x guide COMMAND

        COMMAND:

            add     - Create a new GitBook
            edit    - edit all documents in a GitBook
            lesson  - edit or create the lesson file
            list    - list the document files
            publish - send the files to the GitBook server

        ''')


# ----------------------------
# Function

def guide_add(args):
    name = args[0]
    d = guide_doc_path(name)
    if not exists(d):
        mkdir(d)
    f = guide_doc_path(join(name,'SUMMARY.md'))
    if not exists(f):
        text = '# %s\n## Table of Contents\n' % name
        open(f, 'w').write(text)
    guide_edit(name)


def guide_doc_path(course=None, doc=None):
    if course:
        path = join(environ['p'], 'Documents', 'guide', course)
        if doc:
            return join(path, doc)
        return path
    else:
        return join(environ['p'], 'Documents', 'guide')


def guide_create_lesson(course, lesson):
    print(course, lesson)

    # outline = guide_doc_path(join(course, 'lesson/%s-%s' % (lesson,'outline')))
    # if not exists(outline):
    #     open(outline, 'w').write(open('Documents/Test/LessonTemplate').read())

    path = guide_doc_path(join(course, 'lesson/%s-%s.md' % (lesson,'Lesson')))
    if not exists(path):
    #     text = read_file(outline)
    #     text = lesson_text(text)
        with open(path, 'w') as f:
            f.write("Lesson goes here")
    guide_edit(course, lesson)


def lesson_text(outline):
    results = []
    for line in outline.split('\n'):
        x = line.rstrip()
        y = line.strip()
        if not x:
            results.append(line)
        elif y.startswith('`'):
            results.append(y.replace('`','\n\n```\n\n'))
        elif x.startswith('        '):
            results.append("* "+y)
        elif x.startswith('    '):
                results.append("### " + y)
        else:
            results.append("\n## " + y)
    return '\n'.join(results)


def guide_edit(course, lesson):
    doc = lesson_parts(course, lesson)
    print ('Edit '+doc)
    system('brackets '+doc)


def guide_list(args):
    d = args[0]
    path = guide_doc_path(d)
    for f in file_tree_list(path):
        print(f.replace(path+'/', ''))


def guide_outline(course, lesson):

    def build_outline(text):
        text = match_lines(text, '^#')
        text = text.replace('\n### ', '\n    ')
        text = text.replace('## ', '\n')
        return text

    doc = 'lesson/%s-%s' % (lesson, 'outline')
    path = guide_doc_path(course, doc)
    if not exists(path):
        print ('Create Outline'+path)
        text = read_lesson(course, lesson)
        if not text:
            with open(path, 'w') as f:
                f.write(open('Documents/Test/LessonOutline').read())
        else:
            text = build_outline(text)
            with open(path, 'w') as f:
                f.write(text + '\n')
    else:
        print('Found '+path)
    system('brackets ' + join('Documents/guide', course, doc))


def read_lesson(course, lesson):
    doc = join(course, 'lesson/%s-Lesson.md' % lesson)
    path = guide_doc_path(doc)
    if exists(path):
        return read_file(path)


def lesson_parts(course,lesson):
    results = []
    for topic in ['Lesson']:
        doc = join(course, 'lesson/%s-%s.md' % (lesson,topic))
        path = guide_doc_path(doc)
        if not exists(path):
            print ('Create '+path)
            open(path, 'w')
        results.append(join('Documents', 'guide', doc))
    return ' '.join(results)


def read_lines(course, f):
    path = guide_doc_path(join(course, f))
    return [x for x in open(path).read().split('\n') if x!='']


