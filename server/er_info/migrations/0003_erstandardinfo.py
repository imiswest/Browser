# Generated by Django 5.1 on 2024-09-20 18:25

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('er_info', '0002_alter_errealtimeinfo_hvangioayn_and_more'),
    ]

    operations = [
        migrations.CreateModel(
            name='ERStandardInfo',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('hpid', models.CharField(max_length=20, unique=True)),
                ('dutyTel3', models.CharField(max_length=20)),
                ('dutyEmclsName', models.CharField(max_length=50)),
                ('dutyAddr', models.CharField(max_length=200)),
                ('latitude', models.FloatField()),
                ('longitude', models.FloatField()),
            ],
            options={
                'db_table': 'er_standard_info',
            },
        ),
    ]