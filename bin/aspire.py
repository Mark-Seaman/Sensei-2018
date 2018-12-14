from datetime import datetime
from glob import glob
from os import environ, listdir, mkdir, system
from os.path import basename, dirname, exists, isdir, join
from shutil import copy

from doc import doc_count, doc_word_count
from log import log
from shell import banner, file_tree_list, line_count, read_file, shell, write_file
from switches import SERVER_TYPE, MYBOOK_PRODUCTION
from text import markdown_list_links, markdown_list_string, text_body, text_title
# from table import sort_table, table_text, text_table
from web import web


# ------------------------------
# Command Interpreter

def aspire_command(options):
    #print('aspire command %s' % options)
    if options:
        cmd = options[0]
        args = options[1:]
        if cmd=='clone':
            aspire_clone(args)
        elif cmd=='edit':
            aspire_edit(args[0])
        # elif cmd=='guide':
        #     aspire_guide()
        # elif cmd=='history':
        #     aspire_history(args)
        elif cmd=='hours':
            print(markdown_list_string(aspire_hours(args)))
        elif cmd=='list':
            print(markdown_list_string(aspire_list(args)))
        elif cmd=='local':
            aspire_local(args)
        elif cmd=='projects':
            print(markdown_list_string(aspire_projects(args)))
        elif cmd=='priority':
            print(aspire_priority())
        elif cmd=='report':
            aspire_report(args)
        elif cmd=='reports':
            print(markdown_list_string(aspire_reports()))
        elif cmd=='score':
            print(markdown_list_string(aspire_score(args)))
        # elif cmd=='send':
        #     aspire_send()
        elif cmd=='todo':
            aspire_todo(args)
        # elif cmd=='week':
        #     aspire_week_print()
        elif cmd=='web':
            aspire_web('staging')
        else:
            aspire_help(args)
    else:
        aspire_help()


def aspire_help(args=None):
    print('''
        aspire Command

        usage: x aspire COMMAND

        COMMAND:

            clone PROJECT PROJECT_TYPE     - clone a new project
            edit  FILE      - edit a doc file
            guide           - provide guidance to all Aspire users
            history PROJECT - update project history files
            hours PROJECT   - count hours invested for an objective
            list  PROJECT   - list the document files
            local           - show website on local host
            priority        -
            projects        - list projects for Mark-Seaman
            report          - create a new report for today
            reports         - show the reports available for this client
            score PROJECT   - calculate the score for an objective
            todo            - update the local task plan
            web             - show the web site
            week            - show the stats for this week

        ''')


# ------------------------------
# Functions

def aspire_clone(args):
    if args[1:]:
        print('aspire clone %s' % args)
        print('project name: '+ args[0])
        print('project type: '+ args[1])
        template_path = aspire_doc_path(args[1]+'/Template')
        project_path = aspire_doc_path(args[0])
        print('project template: %s' % template_path)
        print('project path: %s' % project_path)
        if exists(project_path) and isdir:
            print('Directory OK')
        else:
            mkdir(project_path)
        if exists(template_path) and isdir:
            for f in listdir(template_path):
                print(f)
                copy(join(template_path,f), project_path)
    else:
        print('usage: x aspire clone PROJECT_NAME PROJECT_TYPE')


def aspire_doc_path(doc=None):
    path = join(environ['p'], 'Documents', 'aspire', 'clients', 'Mark-Seaman')
    if doc:
        if type(doc)==type([]):
            path = join(path, doc[0])
        else:
            path = join(path, doc)
    return path


def aspire_docs():

    def count_docs(project):
        return p, doc_count(aspire_doc_path(p))

    return table_text([count_docs(p) for p in aspire_projects()])


def aspire_edit(doc):
    system('e '+aspire_doc_path(doc))


# def aspire_guide():
#
#     # def article_text(path):
#     #     web = 'http://162.243.52.136/aspire/clients/Mark-Seaman/Report-Today'
#     #     link = '\n\n\n\nRead more at [%s](%s)\n\n' % (web, web)
#     #     text = link + read_file(path)
#     #     text = doc_format(text)
#     #     #print(text)
#     #     return text
#
#     path = join(environ['p'], 'Documents', 'aspire', 'guides', 'aspire', '03')
#     log('aspire guide (doc = %s)' % path)
#     text = doc_format(read_file(path))
#     queue_message('aspire', text)
#     send_dispatch()


# TODO: move to text.py
def text_tail(text):
    return '\n'.join(text.split('\n')[-10:])


# def aspire_history(args):
#     if args:
#         if args[0]!='Total':
#             history = shell('x task history '+' '.join(args))
#             path = aspire_doc_path('History/History-' + args[0])
#         else:
#             history = shell('x task history')
#             path = aspire_doc_path('History/Total')
#         write_file(path, history)
#         print('Updating %s (%s lines)\n%s' % (path,line_count(path),text_tail(history)))
#         return history
#     else:
#         print('Activities %s' % activities())
#         for a in activities():
#             aspire_history([a])
#

def aspire_hours(args=None):
    if args:
        path = aspire_doc_path(args[0]+'/History')
        events = list_tasks(read_file(path))
        hours  = [int(e[3]) for e in events if e[3:]]
        return '%-15s %5d hours' % (args[0], sum(hours))
    else:
        return [aspire_hours([a]) for a in aspire_projects()]


def aspire_list(args=None):
    path = aspire_doc_path(args)
    return [f.replace(path+'/', '') for f in file_tree_list(path)]


def aspire_local(args):
    if args:
        web('%s/aspire/%s' % ('localhost:8001', args[0]))
    else:
        web('%s/aspire/' % 'localhost:8001')


def aspire_priority():
    print('Experiment with Task Priorities')

    projects = ['work', 'people', 'fun', 'grow']
    priority = [100/(i+1) for i,p in enumerate(projects)]
    total = sum(priority)
    priority = [100*p/total for p in priority]
    print('\nAll')
    for p in zip(projects, priority):
        print('    %-10s %s%%' % p)

    projects = ['hire', 'aspire', 'write' ]
    priority = [100/(i+1) for i,p in enumerate(projects)]
    total = sum(priority)
    priority = [40*p/total for p in priority]
    print('\nWork')
    for p in zip(projects, priority):
        print('    %-10s %s%%' % p)

    projects = ['people', 'fun', 'grow' ]
    priority = [100/(i+1) for i,p in enumerate(projects)]
    total = sum(priority)
    priority = [60*p/total for p in priority]
    print('\nPlay')
    for p in zip(projects, priority):
        print('    %-10s %s%%' % p)

    projects = ['people', 'fun', 'grow', 'church' ]
    priority = [100/(i+1) for i,p in enumerate(projects)]
    total = sum(priority)
    priority = [60*p/total for p in priority]
    print('\nPlay')
    for p in zip(projects, priority):
        print('    %-10s %s%%' % p)

    return ''


def aspire_progress():
    def text_string(title, body):
        return "\n\n## %s\n\n%s\n" % (title, body)

    hours = aspire_week()
    docs = aspire_docs()
    published = shell('x doc summary').replace('\nDoc ','    ')
    return  text_string('Weekly Hours', hours) + \
            text_string('Planning Docs', docs) + \
            text_string('Published Docs', published)


def aspire_projects(args=None):
    return [d for d in listdir(aspire_doc_path(args)) if isdir(join(aspire_doc_path(args), d))]


def aspire_report(args):

    def report_data(date, path):
        path = 'http://shrinking-world.com/%s' % dirname(path)
        client = 'Mark-Seaman'
        data = {
            'title': '%s  %s' % (client, date),
            'path': path,
            'projects': aspire_projects(),
            'hours': aspire_hours(),
            'score': aspire_score(),
            'reports': aspire_reports(),
            'date': date,
        }
        return data

    def report_text(data):
        text = [
            '\nReturn to [Index](Index)',
            '# %s' % data['title'],
            '\n**Client path**: %s' % data['path'],
            aspire_progress(),
            '\n**History**:   \n\n%s' % markdown_list_links(data['path'], data['reports']),
            '',
        ]
        return '\n\n'.join(text)

    def report_save():
        date = datetime.now().strftime("%Y-%m-%d")
        path = aspire_doc_path('Report/Report-%s' % date)
        print(path)
        doc = path.replace(join(environ['p'],'Documents')+'/', '')
        data = report_data(date, doc)
        text = report_text(data)
        open(path, 'w').write(text)
        path = aspire_doc_path('Report-Today')
        open(path, 'w').write(text)

    report_save()


def aspire_reports():
    return [basename(f) for f in sorted(glob(aspire_doc_path('Report/Report*')), reverse=True)[:7]]


def aspire_score(args=None):
    results = []
    path = aspire_doc_path(args)
    if args:
        results.append("%-4d  %s" % (doc_count(path), args[0]))
    else:
        total_words = 0
        total_docs = 0
        results.append("                  Docs  Words")
        for d in listdir(path):
            dir = join(path, d)
            if isdir(dir):
                docs  = doc_count(dir)
                words = doc_word_count(dir)
                results.append("%-15s %6d %6d" % (d, docs, words))
                total_words += words
                total_docs += docs
        results.append(" %-14s %6d %6d" % (' Total', total_docs, total_words, ))
    return results


# def aspire_send():
#
#     def article_text(path):
#         web = 'http://162.243.52.136/aspire/clients/Mark-Seaman/Report-Today'
#         link = '\n\n\n\nRead more at [%s](%s)\n\n' % (web, web)
#         text = link + read_file(path)
#         text = doc_format(text)
#         #print(text)
#         return text
#
#     if SERVER_TYPE=='staging':
#         aspire_guide()
#         path = aspire_doc_path('Report-Today')
#         log('aspire send (doc = %s)' % path)
#         text = article_text(path)
#         queue_message('aspire', text)
#         send_dispatch()
#     else:
#         print('Must be run on server to send email')


def aspire_show(args):
    print('aspire Show')
    path = aspire_doc_path()
    for f in file_tree_list(path):
        print(banner(f.replace(path+'/', '')))
        print(read_file(f))


def aspire_todo(args):
    if args:
        aspire_edit(join(args[0],'Index'))
        aspire_edit(join(args[0],'ToDo'))
        aspire_edit('History/History-'+args[0])
    else:
        aspire_edit('Aspire/Index')
        aspire_edit('Aspire/ToDo')
        aspire_edit('History/History-Aspire')


def aspire_web(server, page=None):
    if server=='staging':
        if page:
            web('%s/aspire/%s' % (MYBOOK_PRODUCTION, page))
        else:   
            web('%s/aspire/Index' % MYBOOK_PRODUCTION)
    else:
        web('shrinking-world.com/aspire')


# def aspire_week():
#     def project_week_string(project, hours, total):
#         filename = "History-%s" % project if project!='Total' else 'History'
#         link = '[%s](%s)' % (project,filename)
#         percent = '%d%%' % (int(hours)*100/total)
#         hours = '%s hours' % hours
#         return '* %-30s %-10s %-10s' % (link, hours, percent)
#
#     def weekly_summary():
#         hours = shell('x task week')
#         title = text_title(hours)+'\n\n'
#         table = text_table(text_body(hours))
#         table = sort_table(table)
#         total = int(table[0][1])
#         hours = [project_week_string(h[0], h[1], total) for h in table]
#         return title  + '\n'.join(hours)
#
#     def weekly_totals():
#
#         def summarize(label, times, activities, total):
#             entry = [(w, times.get(w)) for w in activities if times.get(w)]
#             amount = sum([e[1] for e in entry])
#             if total!=0:
#                 return '%-10s %d %d%%' % (label, amount, amount*100/total)
#             else:
#                 return '%-10s %d %d%%' % (label, amount, 100)
#
#         def gather_data(shell_cmd):
#             hours = shell('x task week')
#             #print hours
#             title = text_title(hours)+'\n\n'
#             table = text_table(text_body(hours))
#
#             times = {}
#             for row in table:
#                 if row[1:]:
#                     #print row
#                     times[row[0]] = int(row[1])
#
#             total = sum([int(row[1]) for row in table if row[1:]])/2
#             return table,times,total
#
#         table,times,total = gather_data('x task week')
#         summary = [
#             'Activity Summary', '',
#             summarize('* Work', times, activities_work(), total),
#             summarize('* Private', times, activities_private(), total),
#             summarize('* Public', times, activities_public(), total),
#             '', '',
#         ]
#         return '\n'.join(summary)
#
#     return weekly_totals() + weekly_summary()
#
#
# def aspire_week_print():
#     hours = aspire_week()
#     print(hours)
