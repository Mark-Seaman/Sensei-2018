from os import environ, system
from os.path import join
from django.contrib.auth.models import User

from bin.web import web
from tasks.task import task_read_health

from .models import HealthScore


def health_command(options):
    # print('health command %s' % options)
    if options:
        cmd = options[0]
        args = options[1:]
        if cmd=='edit':
            health_edit(args)
        elif cmd=='help':
            health_help(args)
        elif cmd=='import':
            health_import(args)
        elif cmd=='list':
            health_list(args)
        elif cmd=='score':
            health_score()
        elif cmd=='web':
            health_web()
        else:
            health_help(args)
    else:
        health_score()


def health_doc_path(doc=None):
    path = join(environ['p'], 'Documents', 'MarkSeaman', 'Health')
    if doc:
        path = join(path, doc)
    return path


def health_edit(args):
    system('e '+health_doc_path())


def health_help(args=None):
    print('''
        health Command

        usage: x health COMMAND

        COMMAND:

            edit    - edit a doc file
            help    - show the commands
            import  - import the list of health records
            list    - list the document files
            score   - calculate the scorecard
        ''')


def health_list(args):
    print('%70s' % 'Sleep   Weight      Eat  Exercise ')
    for h in HealthScore.objects.all().order_by('-date')[:30]:
        print ('%-20s %-18s %-8s %-8s %-8s %-8s' % \
               (str(h.user.username), str(h.date), h.sleep, h.weight, h.eat, h.exercise))


def health_score():

    # def total(row):
    #     amt = 0
    #     for x in row:
    #         amt += int(x.strip())
    #     return amt

    # def print_bar(lag,lead,average):
    #     lead = ">" * lead
    #     lag = "<" * lag
    #     return('  %10s %-10s %s' % (lag, lead, average))

    # def print_score(row, score):
    #     amounts = '  '.join(row[2:])
    #     lag  = total(row[2:4])
    #     lead = total(row[4:])
    #     score = (score + [lead + lag])[-7:]
    #     average = sum(score)/len(score)
    #     print('%s,%s %s  %s' % \
    #         (row[0], row[1], amounts, print_bar(lag, lead, average)))
    #     return score

    # with open(health_doc_path()) as f:
    #     try:
    #         print('            S   W   E   X  Lead/Lag  Score\n')
    #         score = []
    #         amounts = [r for r in reader(f) if len(r)==6]
    #         for row in reversed(amounts):
    #             score = print_score(row, score)
    #     except:
    #         print ('Error: %s' % format_exc())
    user = User.objects.get(username='MarkSeaman')
    scores = HealthScore.objects.filter(user = user).order_by('-date')[:14]
    print ('Date           Sleep       Weight          Eat    Excercise        Score')
    for h in scores:
        row = h.as_row()
        score_labels = ['%-12s'%x for x in row[3:] + [average (row[3:])]]
        print ('%-10s         ' % row[2] + ' '.join (score_labels))


def average (num_list):
    return int(round(sum(num_list) / float(len(num_list))))


def health_import(args):
    for h in task_read_health(args):
        #print(h)
        day, date, sleep, weight, eat, exercise = h.split(', ')
        user = User.objects.get(username='MarkSeaman')
        date = '2017-'+date.strip()
        print(date, date, sleep, weight, eat, exercise)
        HealthScore.objects.get_or_create(user=user, date=date, sleep=sleep, weight=weight, eat=eat, exercise=exercise)
    # with open(health_doc_path()) as f:
    #     try:
    #         print('            S   W   E   X  Lead/Lag  Score\n')
    #         score = []
    #         amounts = [r for r in reader(f) if len(r)==6]
    #         for row in amounts:
    #             user = User.objects.get(username='MarkSeaman')
    #             date = '2016-'+row[1].strip()
    #             print('MarkSeaman',row)
    #             sleep,weight,eat,exercise = row[2:]
    #             HealthScore.objects.get_or_create(user=user, date=date, sleep=sleep, weight=weight, eat=eat, exercise=exercise)
    #     except:
    #         print ('Error: %s' % format_exc())

def health_web():
    web('shrinking-world.com/health')

