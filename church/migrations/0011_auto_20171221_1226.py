# -*- coding: utf-8 -*-
# Generated by Django 1.11 on 2017-12-21 19:26
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('church', '0010_auto_20171221_1224'),
    ]

    operations = [
        migrations.AlterField(
            model_name='money',
            name='date',
            field=models.DateField(null=True),
        ),
    ]
