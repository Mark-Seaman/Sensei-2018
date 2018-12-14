# project.py -- created by factory script

from django.shortcuts import redirect
from django.views.generic import CreateView, DeleteView, DetailView, ListView, UpdateView

from aspire import aspire_context
from doc import doc_html, doc_path, doc_project
from project import project_add, project_goals, project_table
from models import Project
from tool.log import log


# List view
class ProjectList(ListView):
    model = Project
    template_name = 'project_list.html'

    def get_context_data(self, **kwargs):
        log('ProjectList page')
        context = super(ProjectList, self).get_context_data(**kwargs)
        data = {
            'title': 'Project List',
        }
        return aspire_context(context, data)

    def get_queryset(self):
        return project_table()


# Add view
class ProjectAdd(CreateView):
    model = Project
    fields = ['name', 'role', 'hours']
    template_name = 'project_add.html'
    success_url = '/aspire/project_list'

    def get_context_data(self, **kwargs):
        log('ProjectAdd page', kwargs)
        context = super(ProjectAdd, self).get_context_data(**kwargs)
        data = {'title':  'Add Project'}
        return aspire_context(context, data)

    def form_valid(self, form):
        name = form.cleaned_data['name']
        role = form.cleaned_data['role']
        hours = form.cleaned_data['hours']
        project_add(name, role, hours)
        path = doc_path(self.request.user, name)
        doc_project(path)
        return redirect('/aspire/%s' % name)


# Detail view
class ProjectDetail(DetailView):
    model = Project
    template_name = 'project_detail.html'

    def get_context_data(self, **kwargs):
        log('ProjectDetail page', kwargs)
        context = super(ProjectDetail, self).get_context_data(**kwargs)
        title = self.object.name + '/Index'
        doc = doc_path(self.request.user, title)
        data = {
            'title':  'Project Details',
            'values': self.object.values(),
            'goals':  project_goals(self.object),
            'url': title,
            'doc': doc,
            'text': doc_html(doc),
        }
        return aspire_context(context, data)


# Edit view
class ProjectEdit(UpdateView):
    model = Project
    fields = ['name', 'role', 'hours']
    template_name = 'project_edit.html'
    success_url = '/aspire/project_list'

    def get_context_data(self, **kwargs):
        log('ProjectEdit page', kwargs)
        context = super(ProjectEdit, self).get_context_data(**kwargs)
        data = {'title': 'Project Edit'}
        return aspire_context(context, data)


# Delete view
class ProjectDelete(DeleteView):
    model = Project
    success_url = '/aspire/project_list'
    template_name = 'project_delete.html'

    def get_context_data(self, **kwargs):
        log('ProjectDelete page', kwargs)
        context = super(ProjectDelete, self).get_context_data(**kwargs)
        data = {'title': 'Project Delete'}
        return aspire_context(context, data)
