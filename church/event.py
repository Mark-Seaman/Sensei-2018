from csv import reader
from datetime import datetime, timedelta

from models import ChurchEvent


def church_event_import(path):
    is_leadership = path.endswith('lead.csv')
    with open(path) as f:
        weeks = [row for row in reader(f)]
    for w in weeks:
        if len(w) == 4:
            date = '2016-'+w[0]
            e = ChurchEvent.objects.get_or_create(date=date, name=w[1], leadership=is_leadership)[0]
            e.participants = w[2]
            e.duration = w[3]
            e.save()
            print(e)


def church_event_print():
    for e in ChurchEvent.objects.all():
        print(e.date, e.name)


def church_connect(path):
    with open(path) as f:
        weeks = [row for row in reader(f)]
        totals = {}
        for w in weeks:
            if len(w)==4:
                total = int(w[2]) * int(w[3])
                print("%-8s %-20s %8s %8s %8d" % (w[0],w[1],w[2],w[3],total))
                x = totals.setdefault(w[0],0)
                totals[w[0]] = x + total
        print
        for x in sorted(totals):
            print('%s    %s hours' % (x,totals[x]))


def monthly_hours(date, leadership):
    end = datetime.strptime(date, "%Y-%m-%d")
    start = end - timedelta(days=30)
    return ChurchEvent.objects.filter(date__gt=start, date__lte=end, leadership=leadership)


def query_hours(date, leadership):
    return ChurchEvent.objects.filter(date=date, leadership=leadership)


def event_hours(date, leadership):
    total = 0
    #hours = query_hours(date, leadership)
    hours = monthly_hours(date, leadership)
    for e in hours:
        total += e.duration * e.participants
    return total / 4


def connect_hours(date):
    return event_hours(date, False)


def lead_hours(date):
    return event_hours(date, True)


def total_hours(table):
    return sum([e[6] for e in table])


def hours_table(date, leadership):
    return [e.as_row()+[e.duration*e.participants] for e in query_hours(date, leadership)]


def connect_score(hours):
    if hours < 200:
        return 1
    elif hours < 250:
        return 2
    elif hours < 300:
        return 3
    elif hours < 350:
        return 4
    else:
        return 5


def lead_score(hours):
    if hours < 20:
        return 1
    elif hours < 25:
        return 2
    elif hours < 30:
        return 3
    elif hours < 35:
        return 4
    else:
        return 5


def event_dates():
    events = ChurchEvent.objects.order_by('-date').values('date').distinct()
    return [str(d['date']) for d in events]