from budget import invest_difference, give_dollars
from models import ChurchEvent, ChurchBudget
from event import event_hours
from models import Church, ChurchScore, Leader


def add_church(name):
    return Church.objects.get_or_create(name=name)[0]


def add_score(date):
    score = ChurchScore.objects.get_or_create(date=date, church_id=1)[0]
    ChurchEvent.objects.get_or_create(date=date, score=score, name='Sunday Service', leadership=False)
    ChurchBudget.objects.get_or_create(date=date, score=score)


def all_scores():
    return ChurchScore.objects.all().order_by('-date')


def fix_church_score():
    for c in ChurchScore.objects.all():
        if not c.church:
            c.church_id = 1
            c.save()


def limit(x):
    return max(min(x, 5), 1)


def my_church(user):
    return Leader.objects.get(user=user).church


def my_scores(user):
    return ChurchScore.objects.filter(church=my_church(user)).order_by('-date')


def print_church_list():
    for c in Church.objects.all():
        print(c.name)


def print_score_list():
    for c in ChurchScore.objects.all():
        print(', '.join([str(x) for x in c.as_row()]))
        # print(c.connect_hours, c.lead_hours, c.give_dollars, c.invest_difference)


def score_clear():
    ChurchScore.objects.all().delete()


def set_score(church, date):
    connect = event_hours(date, False)
    lead = event_hours(date, True)
    set_hours(church, date, connect, lead)
    invest = invest_difference(church, date)
    give = give_dollars(church, date)
    set_budget(church, date, give, invest)


def set_hours(church, date, connect, lead):
    score = ChurchScore.objects.get_or_create(church=church, date=date)[0]
    score.connect_hours = connect
    score.connect_score = score_connect(connect)
    score.lead_hours = lead
    score.lead_score = score_lead(lead)
    score.save()


def set_budget(church, date, give, invest):
    score = ChurchScore.objects.get_or_create(church=church, date=date)[0]
    score.give_dollars = give
    score.give_score = score_give(give)
    score.invest_difference = invest
    score.invest_score = score_invest(invest)
    score.save()


def score_details(score):
    return (
        ('ID', score.pk),
        ('Church', score.church),
        ('Date', score.date),
        ('Connection Score', '', range(score.connect_score)),
        ('Leadership Score', '', range(score.lead_score)),
        ('Giving Score',     '', range(score.give_score)),
        ('Investing Score',  '', range(score.invest_score)),
    )


def scorecard_data(score):
    return (
        ('Connect', '', range(score.connect_score)),
        ('Lead ',   '', range(score.lead_score)),
        ('Give',    '', range(score.give_score)),
        ('Invest',  '', range(score.invest_score)),
    )


def score_history(scores):

    def average(num_list):
        return int(round(sum(num_list) / float(len(num_list))))

    def five_star(rating):
        return '<i class="zmdi zmdi-star"></i>'*rating

    def score_values(row):
        r = row.as_row()
        id = (r[0], r[2])
        values = r[3:7] + [average(r[3:7])]
        stars = [five_star(x) for x in values]
        return id, stars

    return [score_values(o) for o in scores[:7]]


def score_invest(invest):
    return limit(5 - (invest / 1000))


def score_give(give):
    return limit((give - 7000) / 1000)


def score_connect(connect):
    return limit((connect - 100) / 50)


def score_lead(lead):
    return limit((lead - 10) / 5)
