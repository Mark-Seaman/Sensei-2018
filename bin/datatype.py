from os import environ, system
from os.path import join

from shell import  write_file, read_file


def name_replacement(text, directory, datatype):
    return text.replace('xxx', datatype).replace('Xxx', datatype.capitalize()).replace('yyy', directory)


def source_code(prototype):
    return read_file(prototype)


def convert_code(prototype, code, directory, datatype):
    text = source_code(prototype)
    text = name_replacement(text, directory, datatype)
    path = datatype_path(directory, code)
    print('Create ' + path)
    write_file(path, text)


def datatype_add(args):
    if args[1:]:
        directory = args[0]
        datatype = args[1]
        print('Create datatype '+datatype)

        convert_code('tool/xxx.py', datatype + '.py', directory, datatype)
        convert_code('tool/xxx_views.py', datatype + '_views.py', directory, datatype)

        convert_code('tool/templates/xxx_list.html',   'templates/' + datatype + '_list.html',   directory, datatype)
        convert_code('tool/templates/xxx_add.html',    'templates/' + datatype + '_add.html',    directory, datatype)
        convert_code('tool/templates/xxx_detail.html', 'templates/' + datatype + '_detail.html', directory, datatype)
        convert_code('tool/templates/xxx_edit.html',   'templates/' + datatype + '_edit.html',   directory, datatype)
        convert_code('tool/templates/xxx_delete.html', 'templates/' + datatype + '_delete.html', directory, datatype)

    else:
        print('usage: datatype add DIRECTORY DATATYPE')


def datatype_command(options):
    print('datatype command %s' % options)
    if options:
        cmd = options[0]
        args = options[1:]
        if cmd=='add':
            datatype_add(args)
        elif cmd=='edit':
            datatype_edit(args[0])
        else:
            datatype_help(args)
    else:
        datatype_help()


def datatype_path(directory, doc=None):
    if doc:
        return join(environ['p'], directory, doc)
    else:
        return join(environ['p'], directory)


def datatype_edit(doc):
    system('e '+datatype_path(doc))


def datatype_help(args=None):
    print('''
        datatype Command

        usage: x datatype COMMAND

        COMMAND:

            add - add a new data type
            edit - edit the data type
        ''')


