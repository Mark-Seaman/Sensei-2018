# models.py - Default model code for code generator

from django.core.urlresolvers import reverse
from django.db import models
from django.contrib.auth.models import User


# Author
#    User *
#    Organization

class Author(models.Model):
    user = models.OneToOneField(User, on_delete=models.CASCADE)
    organization = models.CharField(max_length=100)

    def __unicode__(self):
        return self.user.username

    def get_absolute_url(self):
        return reverse('author-detail', kwargs={'pk': self.pk})

    def as_row(self):
        return [self.pk, self.user.username, self.user.email, self.organization]

    @staticmethod
    def labels():
        return ['ID', 'User Name', 'Email', 'Organization']

    def values(self):
        return zip(Author.labels(), self.as_row())

    def name(self):
        return '%s-%s' % (self.user.first_name, self.user.last_name)

    def fields(self):
        return zip(
            ['User', 'Organization'],
            ['user', 'organization'],
            [self.user, self.organization],
        )


# Book
#
#      author *
#      title
#      doc
#      hours

class Book(models.Model):
    author    = models.ForeignKey(Author, on_delete=models.CASCADE, editable=False)
    title     = models.CharField(max_length=100)
    doc       = models.CharField(max_length=300)
    published = models.CharField(max_length=300, null=True, blank=True, default=None)
    hours     = models.IntegerField(default=0)

    def __unicode__(self):
        return self.title + ' by ' + self.author.name()

    def get_absolute_url(self):
        return reverse('book-detail', kwargs={'pk': self.pk})

    def as_row(self):
        return [self.pk, self.title, self.author.name(), self.author.user.email, self.doc, self.hours]

    @staticmethod
    def labels():
        return ['ID', 'Title', 'Author', 'Email', 'Doc', 'Weekly Hours']

    def values(self):
        return zip(Book.labels(), self.as_row())

    def fields(self):
        return zip(
            ['Title', 'Author',  'Doc', 'Weekly Hours'],
            ['title', 'author',  'doc', 'hours'],
            [self.title, self.author, self.doc, self.hours],
        )



