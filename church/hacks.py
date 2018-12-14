# Hacks for direct testing of code

from datetime import datetime, timedelta
from church.score import *
from church.models import *
from church.budget import *
from church.event import *


# -------------------
# Church

add_church('Greeley Vineyard')
churches = Church.objects.all()
for c in churches:
    print(c.pk,c.name)


# -------------------
# ChurchLeader

Leader.objects.all()

church = Church.objects.get_or_create(name='Greeley Vineyard')[0]
user = User.objects.get_or_create(first_name='Mark', last_name='Seaman')[0]
leader = Leader.objects.get_or_create(church=church, user=user)[0]



# -------------------
# Score

scores = ChurchScore.objects.all().order_by('date')

# scores = ChurchScore.objects.filter(date='2016-12-03')

for s in scores:
    print([str(v) for v in s.as_row()])

for s in scores:
    if not s.church:
        s.church = Church.objects.get(pk='1')
        s.save()
        print(s.date, s.church)

# -------------------
# Budget

budgets = ChurchBudget.objects.all()
for s in budgets:
    print(s.church.name, s.date, s.pk, s.as_row())

for s in budgets:
    if not s.score:
        print(s.date)
        s.score = ChurchScore.objects.get_or_create(date=s.date)[0]

a = ChurchBudget.objects.all()[0]
a._meta.fields

ChurchBudget._meta.get_fields()
ChurchBudget.objects.values()
a = ChurchBudget.objects.all()[0]
dir(ChurchBudget._meta)

values = ChurchBudget.objects.values()
for o in values:
    print(o['date'])
    for v in o:
        print('    %-20s %s' % (v, o[v]))

value_rows(ChurchBudget.objects.all())
ChurchBudget.labels()


# Convert string to date object


def to_date(s):
    return datetime.strptime(s, "%Y-%m-%d")  # "%Y-%m-%d"


# Convert date object to string
def date_str(t):
    return t.strftime("%Y-%m-%d")  # "%Y-%m-%d"


def days_ago(date,days):
    return  date_str(date-timedelta(days=days))

date_str(to_date('2016-12-25'))
d = to_date('2016-12-25')
days_ago(d, 30)