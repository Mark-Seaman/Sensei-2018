from days import days_ago
from datetime import datetime
from os.path import exists
from os import environ, system, chdir


def todo_command(options):
    chdir(environ['p'])
    path = recent_dates(1)

    if options:    
        cmd = options[0]

        if cmd=='show':
            print(open(path).read())
        
        else:
            item = ' '.join(options)
            open(path, 'a').write('* '+item+'\n')
    else:
        for d in recent_dates():
            edit_task_file(d)


def recent_dates(days=3):
    start = datetime.today()
    return [ days_ago(start, days-d-1) for d in range(days) ]


task_default = '''%s

Grow 0
    3, 3, 1, 1
    weight: 20

UNC 0
    
    
People 0
    

Fun 0
    

'''


def edit_task_file(date):
    # print(date)
    f = 'Documents/info/days/%s' % date
    if not exists(f):
        open(f, 'w').write(task_default % datetime.now().strftime("%A"))
    system('e %s' % f)

