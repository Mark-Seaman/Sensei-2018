# -*- coding: utf-8 -*-
# Generated by Django 1.9.13 on 2018-10-10 15:34
from __future__ import unicode_literals

import django.core.validators
from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('unc', '0015_auto_20181009_1326'),
    ]

    operations = [
        migrations.AddField(
            model_name='review',
            name='notes',
            field=models.TextField(default='', validators=[django.core.validators.MinLengthValidator(100)]),
        ),
    ]
