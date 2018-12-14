from csv import reader, writer
from os import environ, listdir, mkdir, system
from os.path import dirname, exists, join, isdir

from bin.shell import banner, read_file
from bin.web import web
from models import Thot, ThotBook
from tool.document import doc_exists, doc_html_text
from tool.log import log


# ------------------------------
# Command Interpreter

def thot_command(options):
    if options:
        cmd = options[0]
        args = options[1:]
        if cmd == 'add':
            thot_add_file(args[0])
        if cmd == 'edit':
            thot_edit(args[0])
        elif cmd == 'import':
            thot_import(args[0])
        elif cmd == 'list':
            thot_list(args)
        elif cmd == 'print':
            thot_print_outline(int(args[0]))
        elif cmd == 'show':
            thot_show(args)
        elif cmd == 'view':
            thot_view(args)
        elif cmd == 'web':
            thot_web(args)
        else:
            thot_help(args)
    else:
        thot_help()


def thot_help(args=None):
    print('''
        thot Command

        usage: x thot COMMAND

        COMMAND:

            add   - add a thotbook file
            edit  - edit a doc file
            list  - list the document files
            print - print out the outline structure
            show  - show the doc content
            web   - show the website for the thot book
        ''')


# ------------------------------
# Functions


def thot_import(title):
    thotbook_add(title)


def thotbook_add(title):

    path = thot_doc_path(title)
    if exists(path):

        book = ThotBook.objects.get_or_create(title=title)[0]

        thot_clear()

        lines = open(path).read().split('\n')
        title = lines[0].replace('# ', '')
        root = Thot.objects.get_or_create(thotbook=book, parent_id=None, title=title)[0]

        book.rootid = root.pk
        book.save()
        log('Thot Book', book.rootid)
        thot_outline(book, lines, book.rootid)
        return book


def thot_add_file(doc):
    path = thot_doc_path(doc)
    if not exists(dirname(path)):
        mkdir(dirname(path))
    system('e '+path)


def thotbook_links():
    def link(book):
        return '<a href="/thotbook/%s">%s</a>' % (book, book)
    return [link(book) for book in thotbooks()]


def thotbooks():
    path = thot_doc_path()
    for book in listdir(path):
        if isdir(join(path, book)):
            ThotBook.objects.get_or_create(title=book)
    return ThotBook.objects.all()


def thot_add(book, parent, title, id=None):
    assert parent == 0 or Thot.objects.filter(pk=parent)
    if id:
         node = Thot.objects.get_or_create(thotbook=book, pk=id, parent_id=parent, title=title)[0]
    else:
        node = Thot.objects.get_or_create(thotbook=book, parent_id=parent, title=title)[0]
    log('%s. %s (parent=%d. %s)' % (node.pk, node.title, node.parent.pk, node.parent.title))
    return node


def thot_children(thot, tree=True):
    children = Thot.objects.filter(parent_id=thot['id']).values()
    if not tree:
        return children
    results = []
    for c in children:
        c['children'] = thot_children(c)
        results.append(c)
    return results


def thot_clear():
    Thot.objects.all().delete()


def thot_delete():
    pass


def thot_dict():
    thots = Thot.objects.all().values()
    return {key: value for (key, value) in [(t.get('id'), t) for t in thots]}


def thot_doc_file(thot):
    return join('thot', thot.thotbook.title, thot.title).replace(' ', '_')


def thot_doc_path(doc=None):
    path = join('Documents', 'thot')
    if doc:
        path = join(path, join(doc,'Index'))
    return path


def thot_edit(doc):
    system('e ' + thot_doc_path(doc))


def thot_export(path, root_node):
    tree = thot_tree(root_node)
    thot_tree_write(open(path, 'wt'),tree, 0)


def thot_first():
    return Thot.objects.filter(parent_id=1)[0]


def thot_link_html(url, text):
    return '<a href="/thot/%s">%s</a>' % (url, text)


def thot_html(thot):
    html = []
    thots = thot_tree(thot.pk)
    if thots['parent_id'] != 0:
        x = '<p>%s' % thot_link_html(thot.pk, thot.title)
        y = '%s</p>' % '<div class="pull-right"><a class="btn palette-Green bg" href="/thot-edit/%s">%s</a></div>' % (thots['id'], 'Edit Note')
        html.append(x + ' - ' + y)
    html.append('<ul>')
    for t in thots['children']:
        html.append('<li>%s</li>' % thot_link_html(t['id'], t['title']))
        html.append('<ul>')
        for grandkid in t.get('children'):
            html.append('<li>%s</li>' % thot_link_html(grandkid['id'], grandkid['title']))
        html.append('</ul>')
    html.append('</ul>')
    return '\n'.join(html)


def thot_list(args):
    for b in thotbooks():
        path = thot_doc_path(b.title)
        #print(path)
        lines = read_file(path).split("\n")
        print('%s: %s Lines, Root: %s' % (b, len(lines), b.rootid))


def thot_objects(thot):
    return [thot, [[t, [x for x in Thot.objects.filter(parent=t)]] for t in Thot.objects.filter(parent=thot)]]


def thot_outline(book, lines, id):

    def indent(line):
        for i, c in enumerate(line.rstrip()):
            if c != ' ':
                return i+1
        return 0

    def outdent(line):
        while line and line[0] == ' ':
            line = line[1:]
        return line

    i = 1
    nodes = [0 for r in range(10)]
    nodes[0] = id
    while lines:
        line = lines[0].rstrip()
        lines = lines[1:]
        if line:
            d = indent(line)/4
            line = outdent(line)
            if i > d+1:
                x = thot_add(book, nodes[d], line).pk
            elif i == d+1:
                x = thot_add(book, nodes[d], line).pk
            else:
                x = thot_add(book, nodes[d], line).pk
            nodes[d+1] = x
            i = d
            #print('Line: %s, Nodes: %s' % (line, nodes))
    return nodes[1]


def thot_parent(thot):
    parents = []
    while thot.pk != thot.thotbook.rootid:
        parents.append(thot)
        thot = thot.parent
    return reversed(parents)


def thot_print(thot):
    print(thot_tree(thot))


def thot_print_outline(id):
    thot_tree_print(thot_tree(id))


def thot_read(filename, clear=True):
    if clear:
        thot_clear()

    path = join('Documents', filename)
    print('Importing Thots from %s' % path)
    try:
        with open(path) as f:
            for row in reader(f):
                thot_add(int(row[1]), row[2], int(row[0]))
    except:
        log_exception()
        log("*** Import Row = %s ***" % row)
        print(traceback.format_exc())


def thot_show(args):
    for b in thotbooks():
        path = thot_doc_path(b.title)
        print(banner(b))
        print(read_file(path))


def thot_text(thot):
    path = thot_doc_file(thot)
    if doc_exists(path):
        return doc_html_text(path)


def thot_tree(thot=1):
    d = thot_dict()
    thot = d[thot]
    thot['children'] = thot_children(thot)
    return thot


def thot_tree_print(tree, depth=0):
    print('%s%s' % ('    '*depth, tree.get('title', 'NONE')))
    children = tree.get('children', [])
    for c in children:
        thot_tree_print(c, depth+1)


def thot_tree_write(file, tree, depth=0):
    file.write('%s%s\n' % ('    '*depth, tree.get('title', 'NONE')))
    children = tree.get('children', [])
    for c in children:
        thot_tree_write(file, c, depth+1)


def thot_web(args):
    if args:
        web('http://shrinking-world.com/thotbook/' + args[0])
    else:
        web('http://shrinking-world.com/thotbook')


def thot_view(args):
    if args:
        web('http://localhost:8001/thotbook/' + args[0])
    else:
        web('http://localhost:8001/thotbook')


def thot_write(filename):
    path = join('Documents', filename)
    print('Exporting Thots to %s' % path)

    with open(path, 'w') as f:
        w = writer(f)
        for t in Thot.objects.all():
            print(t.pk, t.parent_id, t.title)
            w.writerow([t.pk, t.parent_id, t.title])

#     with open(data_file, 'w') as f:
#         w = writer(f)
#         for u in User.objects.all():
#             name = u.first_name + ' ' + u.last_name
#             row = [name, u.username, u.email]
#             self.stdout.write(','.join(row))
#             w.writerow(row)
