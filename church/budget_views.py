from django.contrib.auth.mixins import LoginRequiredMixin
from django.core.urlresolvers import reverse_lazy
from django.forms import Form
from django.views.generic import DeleteView, FormView, ListView, RedirectView, TemplateView
from django.views.generic.base import ContextMixin

from budget import budget_add, budget_dates, budget_categories, budget_months, budget_table, current_month, monthly_budget, render_budget_table
from models import Church, Budget
from tool.log import log_page
from mybook.mybook_views import main_menu


class ChurchContext(ContextMixin, LoginRequiredMixin):

    def get_context_data(self, **kwargs):
        title = kwargs.get('title', '')
        log_page(self.request, 'ChurchView:' + title)
        data = {
            'site': ('Church Dashboard', 'Leadership Matters'),
            'menu': main_menu('church', 'church/1'),
            'title': 'CHURCH CONTEXT',
        }
        return data


class BudgetDetail(ChurchContext, TemplateView):
    template_name = 'budget_summary.html'

    def get_context_data(self, **kwargs):
        month = self.kwargs.get('date', current_month())
        context = super(BudgetDetail, self).get_context_data(**kwargs)
        month_data = dict(title=month, months=1, amounts=budget_table(month))
        table = render_budget_table(month_data)
        context.update(title='Income Statement for %s' % month, budget_table=table)
        return context


class BudgetReport(ChurchContext, TemplateView):
    template_name = 'budget_report.html'

    def get_context_data(self, **kwargs):
        date = self.kwargs.get('date', current_month())
        context = super(BudgetReport, self).get_context_data(**kwargs)
        num_months = len(budget_dates())

        year_data = dict(title='Previous Year', amounts=budget_table(), multiple_months=True)
        table_year = render_budget_table(year_data)

        month_data = dict(title=date, amounts=budget_table(date))
        table_month = render_budget_table(month_data)

        all_data = dict(title='Income Statement: %s' % date, month=table_month, year=table_year, num_months=num_months)
        context.update(all_data)
        return context


class ChurchView(RedirectView):
    url = '/church/money'


# List view
class ChurchBudgetList(ChurchContext, ListView):
    model = Budget
    template_name = 'church_budget_list.html'

    def get_context_data(self, **kwargs):
        context = super(ChurchBudgetList, self).get_context_data(**kwargs)
        context['title'] = 'Monthly Budgets'
        context['months'] = self.object_list
        return context

    def get_queryset(self):
        return budget_months()


# Add view
class ChurchBudgetAdd(ChurchContext, FormView):

    class BudgetAddForm(Form):
        pass

    form_class = BudgetAddForm
    template_name = 'church_budget_add.html'
    success_url = '/church/church_budget_list'

    def get_context_data(self, **kwargs):
        context = super(ChurchBudgetAdd, self).get_context_data(**kwargs)
        context.update(dict(title='Add Monthly Record'))
        return context

    def form_valid(self, form):
        church = Church.objects.get(name='Greeley Vineyard')
        date = form.data.get('year','2017') + '-' + form.data.get('month') + '-01'
        for category in budget_categories:
            budget_add(church, category, date, 0)
        return super(ChurchBudgetAdd, self).form_valid(form)


# Edit view
class ChurchBudgetEdit(ChurchContext, FormView):

    class BudgetEditForm(Form):
        pass

    form_class = BudgetEditForm
    template_name = 'church_budget_edit.html'
    success_url = '/church/church_budget_list'

    def get_context_data(self, **kwargs):
        context = super(ChurchBudgetEdit, self).get_context_data(**kwargs)
        form_fields = monthly_budget(self.kwargs.get('date'))
        data = dict(title='Record Giving & Spending', date=self.kwargs.get('date'), form_fields=form_fields)
        context.update(data)
        return context

    def form_valid(self, form):
        church = Church.objects.get(pk=1)
        date = self.kwargs.get('date')+'-01'
        for category in budget_categories:
            amount = form.data.get(category, 0)
            budget_add(church, category, date, amount)
        return super(ChurchBudgetEdit, self).form_valid(form)


# Delete view
class ChurchBudgetDelete(ChurchContext, DeleteView):
    model = Budget
    success_url = reverse_lazy('church_budget_list')
    template_name = 'church_budget_delete.html'

    def get_context_data(self, **kwargs):
        context = super(ChurchBudgetDelete, self).get_context_data(**kwargs)
        return context



def weekly_money(money):
   pass


def yearly_money(money):
    pass

