# -*- coding: utf-8 -*-
# Generated by Django 1.11 on 2017-12-21 20:46
from __future__ import unicode_literals

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('church', '0012_auto_20171221_1323'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='money',
            name='date',
        ),
    ]
