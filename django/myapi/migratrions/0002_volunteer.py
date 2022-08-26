# Generated by Django 3.2.12 on 2022-04-13 01:43

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('myapi', '0001_initial'),
    ]

    operations = [
        migrations.CreateModel(
            name='Volunteer',
            fields=[
                ('user_ptr', models.OneToOneField(auto_created=True, on_delete=django.db.models.deletion.CASCADE, parent_link=True, primary_key=True, serialize=False, to='myapi.user')),
                ('specialisation', models.CharField(max_length=30)),
            ],
            bases=('myapi.user',),
        ),
    ]