from xxx import xxx_print, xxx_query


# Command Interpreter
def xxx_command(args):
    if args:
        cmd = args[0]
        if cmd == 'list':
            xxx_list(args[1:])

        else:
            xxx_help()
    else:
        xxx_list()

# Command Usage
def xxx_help(args=None):
    print('''

        xxx - 

        usage: x xxx COMMAND

        COMMAND:

            list      - list all of the Xxx objects
            help      - show the valid commands

        ''')


# Print List
def xxx_list(args=None):
    xxx_print(xxx_query(args))


