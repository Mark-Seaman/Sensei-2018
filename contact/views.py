# views.py

from django.views.generic import ListView, DetailView
from django.views.generic.edit import CreateView, UpdateView, DeleteView
from django.core.urlresolvers import reverse_lazy

from contact.models import Contact


# Basic list view with using a template
class ContactList(ListView):
    model = Contact
    template_name = 'contact_list.html'


# Filter the rows with a query
class MyContactList(ListView):

    template_name = 'contact_list.html'
    queryset = Contact.objects.filter(name__startswith='L')


# Basic detail view
class ContactDetail(DetailView):

    model = Contact
    template_name = 'contact_detail.html'


# Create view
class ContactCreate(CreateView):
    model = Contact
    fields = ['name','address', 'phone']
    template_name = 'contact_edit.html'


# Update view
class ContactUpdate(UpdateView):
    model = Contact
    fields = ['name','address','phone']
    template_name = 'contact_edit.html'


# Delete view
class ContactDelete(DeleteView):
    model = Contact
    success_url = reverse_lazy('contact_list')
    template_name = 'contact_confirm_delete.html'
