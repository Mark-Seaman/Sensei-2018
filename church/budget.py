from csv import reader, writer
from datetime import datetime
from django.db.models import Sum
from django.template.loader import render_to_string
# from json import dumps

from models import Budget, BudgetCategory, Church


giving_categories = [
    'Giving'
]

expense_categories = [
    'Staff',
    'Operations',
    'Ministry',
    'Debt',
]

revenue_categories = [
    # 'Designated',
    # 'PassThrough',
    'Earned',
]

special_categories = [
    'Capital',
    # 'PassThroughExpense',
    # 'DesignatedGifts',
]

budget_categories = giving_categories + revenue_categories + expense_categories + special_categories


def budget_add(church, name, date, amount):
    category = budget_category(church, name)
    #print('%-10s %-20s %10s' % (date, category.name, amount))
    b = Budget.objects.get_or_create(category=category, date=date)[0]
    b.dollars = amount
    b.save()
    return b


def budget_amounts(month_str):
    num_months = len(budget_dates())
    year_data  = dict(title='Previous Year', months=10, amounts=budget_table(), num_months=num_months)
    month_data = dict(title=month_str, months=1, amounts=budget_table(month_str))
    return dict(title='Income Statement: %s' % month_str, month=month_data, year=year_data)


def budget_category(church, name):
    is_expense = not name in ['Giving', 'Designated', 'PassThrough', 'Earned']
    is_cumulative = False
    return BudgetCategory.objects.get_or_create(church=church, name=name, is_expense=is_expense, is_cumulative=is_cumulative)[0]


def budget_dates(month=None):
    items = month_filter(month)
    return items.order_by('date').values('date').distinct()


def budget_list(church):
    for b in Budget.objects.all():
        print('%-13s %-12s %10s' % (str(b.date)[:-3], b.category.name, b.dollars))


def budget_months(month=None):
    return [datetime.strftime(d['date'], '%Y-%m') for d in budget_dates(month)]


def budget_table(month=None):
    if month:
        totals = calculate_totals(month)
    else:
        totals = calculate_totals()

    total = totals['Giving']
    months = len(budget_dates(month))

    giving = calculate_summary(totals, 'Regular Income',  giving_categories, months)
    expense = calculate_summary(totals, 'Regular Expense', expense_categories, months)
    subtotal = giving[1] - expense[1]
    surplus = ('Cash Flow', subtotal, subtotal/months, percentage(subtotal,total))

    income = calculate_summary(totals, 'Rental Income', revenue_categories, months)[:3]
    special = calculate_summary(totals, 'Building Expense', special_categories, months)[:3]
    subtotal = income[1] - special[1]
    cashflow = ('Cash Flow', subtotal, subtotal/months, percentage(subtotal, total))

    #return (' ', [giving, expense, surplus]), (' ', [income, special, cashflow])
    return (('Spending ', [giving, expense, surplus]), ('Building ', [income, special, cashflow]))


def category_total(amounts, key):
    return amounts.get(key, 0)


def calculate_summary(totals, label, categories, months):
    total = category_total(totals, 'Giving')
    total = total if total else 1
    months = 1
    subtotal = 0
    entries = []
    for c in categories:
        amount = category_total(totals, c)
        amount = amount if amount else 0
        subtotal += amount
        entries.append((c.replace('Debt', 'Mortgage'), amount, amount/months, percentage(amount,total)))
    return ((label, subtotal, amount/months, percentage(subtotal,total), entries))


def calculate_totals(month=None):
    items = month_filter(month)
    totals = {}
    for category in budget_categories:
        totals[category] = items.filter(category__name=category).aggregate(Sum('dollars'))['dollars__sum']
    return totals


def category_list():
    #church = Church.objects.get(pk=1)
    for cat in BudgetCategory.objects.all():
        print(cat.church.name, cat.name, cat.is_cumulative, cat.is_expense)


def budget_list():
    dates = budget_dates()
    amounts = query_money_table(dates)
    header = ['Date'] + [category for category in budget_categories]
    print(header)
    for date in dates:
        date = date['date']
        entry = amounts[date]
        print(date)
        row = [str(date)] + [entry.get(category, '0') for category in budget_categories]
        print(row)


def church_budget_export(path):
    print('Exporting '+path)
    dates = budget_dates()
    amounts = query_money_table(dates)
    with open(path, 'w') as f:
        w = writer(f)
        header = ['Date'] + [category for category in budget_categories]
        w.writerow(header)
        for date in dates:
            date = date['date']
            entry = amounts[date]
            print(date)
            row = [str(date)] + [entry.get(category, '0') for category in budget_categories]
            print(row)
            w.writerow(row)


def church_budget_import(path):
    BudgetCategory.objects.all().delete()
    church = Church.objects.get(pk=1)
    with open(path) as f:
        months = [row for row in reader(f)]
        categories = months[0]
        print(' '.join(['%12s' % x for x in categories]))
        months = [row for row in months[1:]]
        for row in months:
            if len(row) == 8:
            #    print("%s rows" % len(row))
                print(' '.join(['%12s' % x for x in row]))
                for i, x in enumerate(row[1:]):
                    #budget_add(church, budget_categories[i], row[0], x)
                    money_add(row)

from datetime import datetime

def current_month():
    return datetime.strftime(datetime.now(), '%Y-%m')


def month_filter(month=None):
    items = Budget.objects.all()
    if month:
        y, m = month.split('-')
        items = items.filter(date__year=y, date__month=m)
    return items


def monthly_budget(month):
    amounts = Budget.objects.filter(date=month+'-01')
    return [(a.category.name, a.dollars) for a in amounts]


def percentage(value, total):
    if not total:
        total = 1
    return '%d %%' % (100 * value / total)


def query_money_table(dates):
    amounts = {}
    for date in dates:
        date = date['date']
        print(date)
        for budget in Budget.objects.filter(date=date):
            entry = amounts.setdefault(date, {})
            entry[budget.category.name] = budget.dollars
            amounts[date] = entry
    return amounts


def render_budget_table(data):
    template = 'budget_template.html'
    return render_to_string(template, data)


def send_budget_report():
    from tool.email import send_template_message
    me = ['Mark.B.Seaman@gmail.com']

    date = '2017-08'
    num_months = len(budget_dates())

    year_data = dict(title='Previous Year', amounts=budget_table(), multiple_months=True)
    table_year = render_budget_table(year_data)

    month_data = dict(title=date, amounts=budget_table(date))
    table_month = render_budget_table(month_data)

    data = dict(title='Income Statement: %s' % date, month=table_month, year=table_year, num_months=num_months)
    send_template_message(me, 'Church Budget Report', 'email_budget.html', data)
