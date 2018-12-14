
from os import environ, system
from os.path import join

from switches import SERVER_TYPE
from doc import doc_pick, doc_path, doc_words
from log import log
from shell import banner, file_tree_list, read_file, shell
from web import web


# ----------------------------
# Command Interpreter

def seamanslog_command(options):
    if options:
        cmd = options[0]
        args = options[1:]
        
        if cmd=='article':
            seamanslog_article(args)
        
        elif cmd=='edit':
            seamanslog_edit(args[0])
        
        elif cmd=='list':
            seamanslog_list(args)
        
        elif cmd=='pick':
            seamanslog_pick()
        
        elif cmd=='show':
            seamanslog_show(args)

        elif cmd=='summary':
            print(seamanslog_summary())

        elif cmd=='view':
            seamanslog_view(args)

        elif cmd=='web':
            seamanslog_web(args)

        elif cmd=='words':
            seamanslog_words(args)

        else:
            seamanslog_help(args)
    else:
        seamanslog_help()
            

def seamanslog_help(args=None):
    print('''
        Seamans Log Command

        usage: x seamanslog COMMAND

        COMMAND:

            article - Send an article to post
            edit    - Edit a document
            list    - list the document files
            pick    - Pick a random article
            show    - show the doc content
            summary - Show a summary of documents in Seaman's log
            view    - Show a local web page
            web     - Show the remote web page
            words   - Show the word counts of articles
        ''')


# ----------------------------
# Function

def seamanslog_article(args):

    def article_text(path):
        web = 'http://seamanslog.com/%s' % doc
        link = '\n\n\n\nRead more at %s\n\n' % web
        text = read_file(path) + link
        # TODO: text = doc_format(text)
        return text

    if SERVER_TYPE!='production':
        if args:
            doc = args[0]
        else:
            doc = doc_pick(['seamanslog'])
        log('seamanslog send (doc = %s)' % doc)
        path = join(environ['p'], 'Documents', doc)
        text = article_text(path)
        print(path)
        print(text)
        # TODO: notify_seamans_log(text)
    else:
        print('Must be run on server to send email')


def seamanslog_doc_path(doc=None):
    path = join('Documents', 'seamanslog')
    if doc:
        path = join(path, doc)
    return path


def seamanslog_edit(doc):
    system('e '+seamanslog_doc_path(doc))


def seamanslog_list(args):
    path = seamanslog_doc_path()
    for f in file_tree_list(path):
        print(f.replace(path+'/', ''))


def seamanslog_pick():
    doc = doc_pick(['seamanslog'])
    print(doc)
    print(open(doc_path(doc)).read())


def seamanslog_show(args):
    print('Xxx Show')
    path = seamanslog_doc_path()
    for f in file_tree_list(path):
        print(banner(f.replace(path+'/', '')))
        print(read_file(f))


def seamanslog_summary():
    return shell ('x doc summary seamanslog')


def seamanslog_view(args):
    if args:
        web('http://localhost:8001/seamanslog/%s' % args[0])
    else:
        web('http://localhost:8001/seamanslog')


def seamanslog_web(args):
    if args:
        web('seamanslog.com/%s' % args[0])
    else:
        web('seamanslog.com')


def seamanslog_words(args):
    path ='seamanslog'
    if args:
        for f in args:
            doc_words(join(path, f))
    else:
        doc_words(path)
