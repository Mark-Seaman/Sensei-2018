# -*- coding: utf-8 -*-
# Generated by Django 1.11 on 2017-11-07 17:03
from __future__ import unicode_literals

from django.db import migrations, models
import django.utils.timezone


class Migration(migrations.Migration):

    dependencies = [
        ('unc', '0002_auto_20171107_0957'),
    ]

    operations = [
        migrations.AlterField(
            model_name='reviewscore',
            name='date',
            field=models.DateTimeField(default=django.utils.timezone.now, editable=False),
        ),
    ]
