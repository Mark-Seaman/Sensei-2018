# -*- coding: utf-8 -*-
# Generated by Django 1.10.6 on 2017-04-10 23:39
from __future__ import unicode_literals

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('aspire', '0001_initial'),
    ]

    operations = [
        migrations.AlterField(
            model_name='project',
            name='role',
            field=models.ForeignKey(null=True, on_delete=django.db.models.deletion.CASCADE, to='aspire.Role'),
        ),
    ]
