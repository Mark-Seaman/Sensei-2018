from os import environ, system
from os.path import join

from doc import doc_pick, doc_path, doc_format
from log import log
from shell import banner, file_tree_list, line_count, read_file, shell
from switches import SERVER_TYPE
from web import web


# ----------------------------
# Command Interpreter

def spiritual_command(args):
    if args:
        cmd = args[0]

        if cmd=='article':
            spiritual_article(args[1:])

        elif cmd=='edit':
            spiritual_edit(args)

        elif cmd=='list':
            spiritual_list()

        elif cmd=='pick':
            print(spiritual_pick(args[1:]))

        elif cmd=='search':
            spiritual_search(args[1:])

        elif cmd=='send':
            spiritual_send(args[1:])

        elif cmd=='show':
            spiritual_show(args[1:])

        elif cmd=='summary':
            spiritual_summary()

        elif cmd=='test':
            spiritual_test()

        elif cmd=='web':
            spiritual_web()

        else:
            spiritual_help()
    else:
        spiritual_help()


def spiritual_help():
    print('''
        usage:  x spiritual spiritual_command

        command:
            article         - send an article to Evernote
            list            - list the available documents
            pick            - select an item at random
            search text     - search for the text in documents
            send [doc]      - send a doc to subscribers  
            show 
            summary      # Show stats for spiritual project      
            test
            web
        ''')


# ----------------------------
# Function

def spiritual_article(args):

    def article_text(path):
        heading = '# Spiritual Things\n\n\n\n'
        web = 'http://spiritual-things.org/%s' % doc
        link = '\n\n\n\nRead more at %s\n\n' % web
        text = heading + read_file(path) + link
        text = doc_format(text)
        #print(text)
        return text

    if SERVER_TYPE=='production':
        if args:
            doc = args[0]
        else:
            doc = doc_pick(['spiritual'])
        log('spiritual send (doc = %s)' % doc)
        path = join(environ['p'], 'Documents', doc)
        text = article_text(path)
        # TODO: notify_spiritual(text)
    else:
        print('Must be run on server to send email')


def spiritual_doc_path(doc):
    path = join(environ['p'], 'Documents', 'spiritual')
    if doc:
        path = join(path, doc)
    return path


def spiritual_edit(args):
    if args:
        system('e '+ spiritual_doc_path(args[1]))
    else:
        system('e '+ spiritual_doc_path())
          

def spiritual_list():
    print('Spiritual List')
    for f in spiritual_list_files():
        print(f)


def spiritual_list_files(dir=None):
    log('list_documents', dir)
    if dir:
        d = join(environ['p'], 'Documents', 'spiritual', dir)
    else:
        d = join(environ['p'], 'Documents', 'spiritual')
    files = file_tree_list(d)
    files = [ f.replace(d+'/','') for f in files]
    return files


def spiritual_pick(args):
    if args:
        area = ['spiritual/'+args[0]]
    else:
        area = ['spiritual']
    doc = doc_pick(area)
    log('spiritual pick', doc)
    text = open(doc_path(doc)).read()
    return text+'\n     -- '+doc


def spiritual_send(args):
    if args:
        doc = args[0]
    else:
        doc = doc_pick(['spiritual'])
    log('spiritual send (doc = %s)' % doc)
    if SERVER_TYPE=='production':
        system('x send doc %s spiritual' % doc)
        system('x send dispatch')
    else:
        print('Must be run on server to send email')


def spiritual_search(args):
    print('search', args)
    docs = join(environ['p'], 'Documents', 'spiritual')
    grep = 'grep %s --exclude-dir %s/.git -r %s' % (args[0],docs,docs)
    matches = shell(grep).replace(docs+'/','')
    matches = matches.encode('ascii', 'ignore')
    print(matches)


def spiritual_show(args):
    if args:
        path =  join('Documents', 'spiritual', args[0])
    else:
        path = join( 'Documents', 'spiritual')
    for f in file_tree_list(path):
        print(f)
        print(banner(f.replace(path+'/', '')))
        print(read_file(f))


def spiritual_summary():
    print ( ''.join([
        shell ('x doc summary spiritual/bible'),
        shell ('x doc summary spiritual/reflect'),
        shell ('x doc summary spiritual/prayers'),
        shell ('x doc summary spiritual/teaching'),
        shell ('x doc summary spiritual')
    ]))


def spiritual_test():
    for x in range(1000):
        doc = doc_pick(['spiritual'])
        lines = line_count(doc_path(doc))
        if lines<3:
            text = read_file(doc_path(doc))
            print('%3d  %s' % (lines, doc))
            if len(text)<30:
                print(text)


def spiritual_web():
    web('spiritual-things.org/teaching')
