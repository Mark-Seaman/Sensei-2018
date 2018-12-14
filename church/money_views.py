from django.views.generic import CreateView, UpdateView, ListView, TemplateView
from datetime import datetime

from budget_views import ChurchContext
from models import Money
from money import money_query, money_month, money_totals
from mybook.mybook import main_menu


# Add view
class MoneyAdd(CreateView):
    model = Money
    fields = ['month', 'giving', 'designated', 'staff', 'operations', 'ministry', 'rent',  'building', 'other_revenue']
    template_name = 'money_edit.html'
    success_url = '/church/money_list'


# Edit view
class MoneyEdit(UpdateView):
    model = Money
    fields = ['giving', 'designated', 'staff', 'operations', 'ministry', 'rent', 'building', 'other_revenue']
    template_name = 'money_edit.html'
    success_url = '/church/money_list'

    def get_context_data(self, **kwargs):
        kwargs = super(MoneyEdit, self).get_context_data(**kwargs)
        kwargs.update({
            'site': ('Church Dashboard', 'Leadership Matters'),
            'menu': main_menu('church', 'church/1'),
            'title': 'Edit Month',
        })
        return kwargs


# List view
class MoneyList(ChurchContext, ListView):
    model = Money
    template_name = 'money_list.html'

    def get_context_data(self, **kwargs):
        kwargs = super(MoneyList, self).get_context_data(**kwargs)
        kwargs.update({
            'title': 'Church Accounting By Month',
            'object_list': money_query(),
        })
        return kwargs


# View Summary
class MoneyView(ChurchContext, TemplateView):
    template_name = 'money.html'

    def get_context_data(self, **kwargs):
        month = money_month(kwargs.get('date'))
        year = money_totals(money_query(kwargs.get('date', datetime.now().strftime("%Y-%m"))))
        budget = month.giving + month.designated - month.staff - month.operations - month.ministry
        building = month.rent + month.other_revenue  - month.building
        total = budget + building
        ybudget = year.giving + year.designated - year.staff - year.operations - year.ministry
        ybuilding = year.rent + year.other_revenue - year.building
        ytotal = ybudget + ybuilding
        data = dict(title='Income Statement', m=month, y=year,
                    budget=budget, building=building, total=total,
                    ybudget=ybudget, ybuilding=ybuilding, ytotal=ytotal)
        kwargs = super(MoneyView, self).get_context_data(**kwargs)
        kwargs.update(data)
        return kwargs
