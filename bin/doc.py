from os import environ, listdir
from os.path import join, isfile, exists, isdir
from random import choice

from shell import file_path, file_tree_list, line_count, read_file, shell,  word_count, write_file, dir_list
from log import log
from pandoc import file_to_html


# ----------------------------
# Command Interpreter

def doc_command(options):

    log('doc command %s' % options)
    if options:
        cmd = options[0]
        args = options[1:]

        if cmd == 'edit':
            doc_edit(args)

        elif cmd == 'fix':
            doc_fix()

        elif cmd == 'list':
            doc_list(args)

        elif cmd == 'length':
            doc_length(args)

        elif cmd == 'pick':
            print(doc_pick(args))

        elif cmd == 'show':
            doc_show(args)

        elif cmd == 'score':
            doc_score(args)

        elif cmd == 'search':
            doc_search(args)

        elif cmd == 'send':
            doc_send(args)

        elif cmd == 'stats':
            doc_stats(args)

        elif cmd == 'summary':
            doc_summary(args)

        elif cmd == 'test':
            doc_test(args)

        elif cmd == 'words':
            doc_words(args)

        else:
            doc_help()
    else:
        doc_help()


def doc_help():
    print('''
        usage: x doc command

        command:
            edit        # Edit a specific document file
            fix         # Repair the encoding in every bad file
            help        # Show the doc commands
            list        # List the available documents
            length      # Measure the lines in each documents
            pick        # Select a document from the tree
            read        # Show the text from all documents
            search      # Search for text in docs
            send        # Send me a copy of this doc (markdown)
            send-text   # Send me a copy of this doc (text)
            summary     # Show the stats for the documents
            test        # Test the doc for char encoding

        ''')


# ----------------------------
# Function


def doc_content(args):
    if args:
        path = file_path('Documents', args[0])
        return read_file (path)
    else:
        files = list_documents()
        for f in files:
            path = file_path('Documents', f)
            return read_file(path)   # TODO: return all file text


def doc_count(dir):
    return len(file_tree_list(dir))


def doc_directories():
    return [d for d in dir_list(doc_path()) if d!='.git']


def doc_edit(args):
    path = file_path('Documents', args[0])
    print(shell('e %s' % path))


def doc_fix():
    for path in list_documents():
        try:
            filepath = doc_path(path)
            text = file_to_html(filepath)
            open('/tmp/doc_test','w').write(text)
        except:
            text = open(filepath).read()
            text = fix_chars(text)
            text = text.decode(encoding='UTF-8').encode('ascii', 'ignore')
            if path != 'mybook/test/encoding-test':
                open(filepath,'w').write(text)
            print('fix bad document: '+path)


def doc_length(args=None):
    if args:
        d = args[0]
    else:
        d = None
    for f in list_documents(d):
        fp = doc_path(f)
        print('%s : %d' % (f, line_count(fp)))


def doc_list(args=None):
    if args:
        print('\n'.join(list_documents(args[0])))
    else:
        print('\n'.join(list_documents()))


def doc_path(doc=None):
    if doc:
        return file_path('Documents', doc)
    else:
        return file_path('Documents')


def doc_pick(args):
    if args:
        d = args[0]
        f = choice(list_documents(d))
    else:
        d = None
        f = choice(list_documents())
    return f


def doc_random_select(directory):
    '''Select content from a random file in the directory'''
    from hammer.settings import BASE_DIR
    path = join(BASE_DIR, doc_path(directory))
    log('doc_random_select -- dir', path)
    select = choice(listdir(path))
    path = join('/' + directory, select)
    log('doc_random_select',  path)
    return path


def doc_redirect(page):
    log('doc_redirect', page)
    from hammer.settings import BASE_DIR
    path = join(BASE_DIR, doc_path(page))
    if exists(path) and isdir(path) and \
        (exists(path + '/Index') and isfile(path + '/Index')) or \
        (exists(path + '/Index.md') and isfile(path + '/Index.md')):
        if page:
            new_page = '/'+ page + '/Index'
        else:
            new_page = '/Index'
        log('doc_redirect --> %s' % new_page)
        return new_page


def doc_score(args):
    if args:
        for x in args:
            if x!='.':
                label = x
                header=False
            else:
                label = 'Documents'
                header=True
            words = word_count(doc_show_directory(x))/1000
            lines = line_count(doc_show_directory(x))
            files = len(list_documents(x))
            if header:
                print('\nDoc Summary                       Files       Lines        Words\n')
            print('    %-25s  %8s  %10s %10s K' % (label, files, lines, words))
    else:
        doc_score(['.'])


def doc_search(args):
    docs = join(environ['p'], 'Documents')
    grep = 'grep %s --exclude-dir %s/.git -r %s' % (args[0],docs,docs)
    matches = shell(grep).replace(docs+'/','')
    try:
        print(matches)
    except:
        print('**ERROR** doc_search file=%s' % grep)
        print(matches)


def doc_send(args):
    if args:
        path = doc_path('send/me')
        text = file_to_html(doc_path(args[0]))
        # TODO: notify_send_doc(text)
    else:
        print('usage: doc send doc-path')


def doc_send_text(args):
    if args:
        path = doc_path('send/me')
        text = open(doc_path(args[0])).read()
        open(path,'w').write(text+'\n')
        print(shell('x send dispatch'))
    else:
        print('usage: doc send doc-path')


def doc_show(args=None):
    print('show %s' % args)
    if args:
        for f in args:
            if isfile(doc_path(f)):
                print('file: %s' % doc_path(f))
                text = read_file(doc_path(f))
            else:
                print('dir: %s' % doc_path(f))
                text = doc_show_directory(f)
            print(text)
    else:
        doc_show(dir_list(doc_path()))


def doc_show_directory(dir=None):
    text = ''
    for f in list_documents(dir):
        #path = join(dir,f)
        text += read_file(doc_path(f))
    return text


def doc_stats(args):
    print('Document Summary')
    if args:
        dir = join(environ['p'], 'Documents', args[0])
        d = args[0]
    else:
        dir = join(environ['p'], 'Documents')
        d = None
    files = file_tree_list(dir)
    stats = {}
    print('\n%-48s %8s %8s\n' % ('file', 'lines', 'words'))
    lines,words = 0,0
    for doc in files:
        if d:
            doc = doc.replace(dir, d)
        else:
            doc = doc.replace(dir+'/', '')
        path = join(environ['p'], 'Documents', doc)
        text = read_file(path)
        stats[doc] = [len(text.split('\n')), len(text.split())]
        print('%-50s%8s%8s' % (doc, stats[doc][0], stats[doc][1]))
        lines += stats[doc][0]
        words += stats[doc][1]
    print('\n     Totals:  %s %-20s %8s lines %8s words\n' % (len(files), 'files', lines, words))


def doc_summary(args=None):
    if args:
        doc_score(args)
    else:
        doc_score(['.'])
        for d in doc_directories():
            doc_score([d])


def fix_chars(text):
    text = text.replace('\xe2\x80\x94', "-")
    text = text.replace('\xe2\x80\x98', "'")
    text = text.replace('\xe2\x80\x99', "'")
    text = text.replace('\xe2\x80\x9c', '"')
    text = text.replace('\xe2\x80\x9d', '"')
    return text


def doc_test(args):
    if args:
        path = args[0]
        text = 'No File Read'
        try:
            text = file_to_html(doc_path(path))
            open('/tmp/doc_test','w').write(text)
        except:
            print('\nbad document: '+path)
            print(path, len(text))
    else:
        print('test doc - %d documents found' % len(list_documents()))
        for f in list_documents():
            doc_test([f])
 

def doc_word_count(directory):
    total = 0
    for f in list_documents(directory):
        fp = doc_path(f) if directory else doc_path(f)
        text = read_file(fp)
        words = word_count(text)
        total += words
    return total


def doc_words(args=None):
    if args:
        if type(args)==type([]):
            d = args[0]
        else:
            d = args
    else:
        d = None
    total = 0
    for f in list_documents(d):
        fp = doc_path(f) if d else doc_path(f)
        text = read_file(fp)
        words = word_count(text)
        total += words
        print('%6s %s' % (words, f))
    print('%6s' % total)


def list_documents(dir=None):
    log('list_documents', dir)
    if dir:
        d = join(environ['p'], 'Documents', dir)
    else:
        d = join(environ['p'], 'Documents')
    files = file_tree_list(d)
    files = [f for f in files if not '.git' in f]
    files = [ f.replace(join(environ['p'], 'Documents')+'/','') for f in files]
    return files
