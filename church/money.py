# from csv import reader
from django.db.models import Sum

from models import Money


# def money_add(row):
#     date, giving, rent, staff, ops, ministry, mortgage, building = row
#     print(date, giving, rent, staff, ops, ministry, mortgage, building)
#
#     Money.objects.create(date=date, giving=giving, staff=staff, operations=ops, ministry=ministry,
#                          rent=rent, mortgage=mortgage, building=building)
#
#
# def money_import(path):
#     with open(path) as f:
#         months = [row for row in reader(f)]
#         print(' '.join(['%12s' % x for x in months[0]]))
#         months = [row for row in months[1:]]
#         for row in months:
#             if len(row) == 8:
#                 #    print("%s rows" % len(row))
#                 print(' '.join(['%12s' % x for x in row]))
#                 money_add(row)
#

def money_query(month=None):
    if month:
        year = month.split('-')[0]
        objects = Money.objects.filter(month__contains=year, month__lte=month)
    else:
        objects = Money.objects.all()
    return objects.order_by('-month')


def money_month(month):
    if month:
        return Money.objects.get(month=month)
    else:
        return money_query()[0]


def money_totals(records):
    def total(records, name):
        return records.aggregate(Sum(name))[name + '__sum']

    m = Money()
    m.giving        = total(records, 'giving')
    m.designated    = total(records, 'designated')
    m.staff         = total(records, 'staff')
    m.operations    = total(records, 'operations')
    m.ministry      = total(records, 'ministry')
    m.rent          = total(records, 'rent')
    m.building      = total(records, 'building')
    m.other_revenue = total(records, 'other_revenue')
    return m

#
# # from church.money import money_record_fix
# def money_record_fix():
#     for m in Money.objects.all():
#         m.operations = m.mortgage
#         m.mortgage = 0
#         m.save()
