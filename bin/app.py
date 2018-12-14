from os import environ, listdir, system
from os.path import join, isdir
from re import compile

from shell import shell, file_tree_list, read_file, line_count
from log import log
from switches import APP_DIR, APP_PORT
from text import text_match, find_classes, find_functions, find_signatures


# ----------------------------------
# Command Interpreter

def app_command(options):
    '''Execute all of the app specific apps'''
    log('app command output %s' % options)
    if options:
        cmd = options[0]
        args = options[1:]

        if cmd == 'classes':
            app_classes(args)

        elif cmd == 'dirs':
            print '\n'.join(app_directories())

        elif cmd == 'edit':
            shell('e %s' % app_path(APP_DIR + '/' + args[0] + '.py'))

        elif cmd == 'functions':
            app_functions(args)

        elif cmd == 'kill':
            kill_server()

        elif cmd == 'list':
            print ('\n'.join(app_source()))

        elif cmd == 'path':
            print(app_path(args[0]))

        elif cmd == 'run':
            run_server()

        elif cmd == 'score':
            app_score()

        elif cmd == 'search':
            app_search(args)

        elif cmd == 'show':
            print(app_show(args))

        elif cmd == 'signature':
            app_signature(args)

        elif cmd == 'summary':
            app_summary(args)

        elif cmd == 'template':
            shell('e %s' % app_path('templates/%s.html' % args[0]))

        elif cmd == 'urls':
            app_urls()
        else:
            print('No app command found, ' + cmd)
            app_help()
    else:
        print('No arguments given')
        app_help()


def app_help():
    print('''
    usage:  app cmd [args]

    cmd:

        classes   [file] - List the classes in the code
        edit      file   - Edit the app
        functions [file] - List the function names
        kill             - Kill the local web server
        list      [file] - List all app source code files
        path      [file] - Lookup the path for the file
        run              - Run the local web server
        search    text   - Find text in the source code
        signature        - List the function signatures
        summary          - Show the summary stats of this project
        template  [file] - Edit the template
            ''')


# ----------------------------------
# Command Functions


def app_functions(args):
    files = app_source(args)
    app_search_code(files, lambda text: find_functions(text))


def app_classes(args):
    files = app_source(args)
    app_search_code(files, lambda text: find_classes(text))


def app_signature(args):
    files = app_source(args)
    app_search_code(files, lambda text: find_signatures(text))


def app_search_code(files, search_function):
    def print_indented(outline):
        def app_print(filename, children):
            print('%s' % filename)
            for x in children:
                print('    ' + x)

        for filename in outline:
            app_print(filename[0], filename[1])

    print_indented([(f, search_function(read_file(f))) for f in files])


def app_directories():
    exceptions =['.git', '.idea', 'client-files', 'data', 'Documents', 'log', 'static', 'templates',]
    x = [d for d in listdir('.') if isdir(d) and d not in exceptions]
    return x


def app_path(topic=None):
    path = environ['p']
    if topic:
        path = join(path, topic)
    return path


def app_score():
    label = 'App'
    lines = line_count(app_show())
    files = len(app_source())
    print('\nCode Summary            Files     Lines\n')
    print('    %-15s  %8s  %8s' % (label, files, lines))


def app_search(args):
    system('grep %s $p/*/*.py' % args[0])
    system('grep %s $p/*/templates/*.html' % args[0])


def app_show(args=None):
    text = ''
    for f in app_source(args):
        text += read_file(f)
    return text


def app_source(args=None):
    if not args:
        args = app_directories()
    files = []
    for d in args:
        files += file_tree_list(app_path(d), '.py')
    files = sorted([f.replace(app_path() + '/', '') for f in files if 'migrations' not in f])
    return files


def app_summary(args=None):
    if args:
        label = args[0]
    else:
        label = 'App'
    lines = line_count(app_show(args))
    files = len(app_source(args))
    if not args:
        print('\nCode Summary            Files     Lines\n')
    print('    %-15s  %8s  %8s' % (label, files, lines))
    if not args:
        for d in 'bin', 'test':
            app_summary([d])


def kill_server():
    cmd = '''x=`ps -ef | grep -v grep | grep runserver | awk '{ print $2 }'`
        [ ! -z "$x" ]  && echo kill $x   && kill $x'''
    system(cmd)


def app_urls():

    def simplify(url):
        match_pattern = r'^ *url\(r\'\^(.*)\),$'
        replace_pattern = r'    \1'
        url = compile(match_pattern).sub(replace_pattern, url)
        url = compile(r', *name=.*').sub('', url)
        url = compile(r'    (.*)\', +([\.\_A-Za-z]+)').sub(r'    \1, \2', url)
        url = url.replace('.as_view()', '')
        return url

    print 'Find all the URLs for the app'
    for s in app_source():
        m = text_match('^ *url\(.*', s)
        if m:
            m = [simplify(url) for url in m]
            print '\n' + s + '\n'
            print '\n'.join(m)


def run_server():
    system('''
            cd $p;
            rbg python manage.py runserver %s;
            sleep 2
            # echo x web http://127.0.0.1:%s/;
           ''' % (APP_PORT, APP_PORT))

