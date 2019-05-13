from django.contrib.auth.mixins import LoginRequiredMixin
from django.core.urlresolvers import reverse_lazy
from django.views.generic import DetailView, ListView, RedirectView, TemplateView
from django.views.generic.base import ContextMixin
from django.views.generic.edit import CreateView, DeleteView, UpdateView

from tasks.models import Task
from tool.document import doc_html_text
from .summary import time_data, time_summary, bad_days_data, bad_days, activity_summary, task_activity_details, \
    task_list, write_task_files, task_import_files
from .task import save_monthly_reports


# Base
class TaskBase(LoginRequiredMixin, ContextMixin):
    def get_context_data(self, **kwargs):
        kwargs = super(TaskBase, self).get_context_data(**kwargs)
        kwargs.update({
            'site': ('Time Accounting', 'Intentional Living'),
            'aspire_menu': True,
        })
        return kwargs


# --------------------------
# Records


# Delete
class TaskDelete(DeleteView):
    model = Task
    success_url = reverse_lazy('task_list')
    template_name = 'task_delete.html'


# Detail
class TaskDetail(DetailView):
    model = Task
    template_name = 'task_detail.html'


# Create
class TaskCreate(CreateView):
    model = Task
    fields = ['name', 'date', 'notes', 'hours', 'done']
    template_name = 'task_edit.html'
    success_url = reverse_lazy('task_list')


# Update
class TaskUpdate(TaskBase, UpdateView):
    model = Task
    fields = ['name', 'date', 'notes', 'hours', 'done']
    template_name = 'task_edit.html'
    success_url = reverse_lazy('task_list')


# --------------------------
# Summary

# Home
class TaskHome(TaskBase, TemplateView):
    template_name = 'task_theme.html'

    def get_context_data(self, **kwargs):
        context = super(TaskHome, self).get_context_data(**kwargs)
        context.update({
            'title': 'Aspire Task History',
            'text': doc_html_text('info/Accomplished.md'),
        })
        return context


# List
class TaskList(TaskBase, ListView):
    model = Task
    template_name = 'task_list.html'

    def get_context_data(self, **kwargs):
        activity = self.kwargs.get('activity', 'All')
        context = super(TaskList, self).get_context_data(**kwargs)
        context.update({
            'title': 'Tasks Details - %s' % self.kwargs.get('activity', 'All'),
            'labels': Task.labels()[2:],
            'types': activity_summary(activity),
        })
        return context

    def get_queryset(self):
        activity = self.kwargs['activity']
        return task_activity_details(activity)


# Time
class MyTime(TaskBase, TemplateView):
    template_name = 'task_time.html'

    def get_context_data(self, **kwargs):
        kwargs = super(MyTime, self).get_context_data(**kwargs)
        kwargs.update({
            'title': 'Time Invested',
            'time_data': time_data(),
            'data_week': time_summary(8),
            'data_month': time_summary(31),
            'data_year': time_summary(366),
            'bad_days': bad_days(),
        })
        return kwargs


# Summary
class TimeSummary(TaskBase, TemplateView):
    template_name = 'task_summary.html'

    def get_context_data(self, **kwargs):
        kwargs = super(TimeSummary, self).get_context_data(**kwargs)
        kwargs.update({
            'title': 'Time Invested',
            'time_data': time_data(),
        })
        return kwargs


# Missing
class MissingDays(TaskBase, TemplateView):
    template_name = 'task_time.html'

    def get_context_data(self, **kwargs):
        kwargs = super(MissingDays, self).get_context_data(**kwargs)
        kwargs.update({
            'title': 'Incomplete Time Log',
            'data_week': bad_days_data(8),
            'data_month': bad_days_data(31),
            'data_year': bad_days_data(366),
        })
        return kwargs


# --------------------------
# Import/Export

class TaskImport(RedirectView):

    def get_redirect_url(self, *args, **kwargs):
        task_import_files()
        return '/task/time'


class TaskExport(TaskBase, TemplateView):
    template_name = 'task_export.html'

    def get_context_data(self, **kwargs):
        kwargs = super(TaskExport, self).get_context_data(**kwargs)
        tlist = task_list(31)
        days = write_task_files(tlist)
        report = save_monthly_reports('2018')
        kwargs.update(dict(title='Export Tasks', days=days, report=report))
        return kwargs
