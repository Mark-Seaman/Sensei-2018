from os import environ
from os.path import join

from bin.web import web
from mybook.mybook import main_menu
from budget import budget_list, church_budget_import, church_budget_export
from leader import leader_command
# from money import money_import


def church_command(options):
    if options:
        cmd = options[0]
        args = options[1:]
        if cmd=='budget':
            church_budget_import(church_doc_path('budget'))
        elif cmd=='export':
            church_budget_export(args[0])
        # elif cmd == 'import':
        #     money_import(args[0])
        elif cmd=='leader':
            leader_command(args)
        elif cmd=='list':
            budget_list()
        elif cmd=='web':
            church_web()
        else:
            church_help(args)
    else:
        church_help()


def church_help(args=None):
    print('''
        Church Leadership Tool

        usage: x church COMMAND

        COMMAND:

            budget  - show the church budget
            export  - export the money data
            import  - bring in data from old format
            leader  - list the church leaders
            web     - present the remote web page
        ''')


# -------------------
# Functions

def church_context(context, data, page, title):
    context['settings'] = church_settings(page)
    context['title'] = title
    context['menu'] = main_menu('church', 'church/'+page)
    context.update(data)
    return context


def church_doc_path(doc=None):
    path = join(environ['p'], 'Documents', 'church')
    if doc:
        path = join(path, '%s.csv' % doc)
    return path


def church_web():
    web('shrinking-world.com/church')
    aspire_web('staging', 'Church')


def church_settings(page):
    return {
        'title': 'Church Leadership Dashboard',
        'subtitle': "Building God's Kingdom",
        'label': '',
        'color': 'blue',
        'menu': main_menu('church', 'church/'+page),
        'footer': True,
    }