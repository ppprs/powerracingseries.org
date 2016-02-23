# This is an auto-generated Django model module.
# You'll have to do the following manually to clean this up:
#   * Rearrange models' order
#   * Make sure each model has one field with primary_key=True
#   * Make sure each ForeignKey has `on_delete` set to the desired behavior.
#   * Remove `managed = False` lines if you wish to allow Django to create, modify, and delete the table
# Feel free to rename the models, but don't rename db_table values or field names.
from __future__ import unicode_literals

from django.db import models


"""
There are many leagues(ppprs, high school ppprs, autonomous cars)
Leagues have many seasons (2013, 2014, 2015, summer/winter?)
Leagues have many Races (SF 2014, Detroit 2014, Detroit 2015)
Leagues have many Teams
Teams have many Cars (or is each car it's own team?)
Cars sign up for Races (or teams? or do they sign up for seasons?)
Races have many Events (drag race, endurance race)
Cars have one result for each Event.
Each League-Season has a Rules document

League
Season
Team
Car
Race
Event
Result
Rules
"""


class Car(models.Model):
    name = models.CharField(max_length=255)
    description = models.TextField(blank=True, null=True)
    photo_url = models.CharField(max_length=255, blank=True)
    team_id = models.IntegerField(blank=True, null=True)
    created_at = models.DateTimeField()
    updated_at = models.DateTimeField()
    number = models.IntegerField(blank=True, null=True)
    image = models.CharField(max_length=255, blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'cars'


class Person(models.Model):
    first_name = models.CharField(max_length=255, blank=True, null=True)
    last_name = models.CharField(max_length=255, blank=True, null=True)
    phone = models.CharField(max_length=255, blank=True, null=True)
    twitter = models.CharField(max_length=255, blank=True, null=True)
    email = models.CharField(unique=True, max_length=255, blank=True, null=True)
    address = models.CharField(max_length=255, blank=True, null=True)
    birthday = models.DateField(blank=True, null=True)
    bio = models.TextField(blank=True, null=True)
    photo_url = models.CharField(max_length=255, blank=True, null=True)
    personal_url = models.CharField(max_length=255, blank=True, null=True)
    location = models.CharField(max_length=255, blank=True, null=True)
    team_id = models.IntegerField(blank=True, null=True)
    is_admin = models.NullBooleanField()
    created_at = models.DateTimeField()
    updated_at = models.DateTimeField()
    encrypted_password = models.CharField(max_length=255)
    reset_password_token = models.CharField(unique=True, max_length=255, blank=True, null=True)
    reset_password_sent_at = models.DateTimeField(blank=True, null=True)
    remember_created_at = models.DateTimeField(blank=True, null=True)
    sign_in_count = models.IntegerField(blank=True, null=True)
    current_sign_in_at = models.DateTimeField(blank=True, null=True)
    last_sign_in_at = models.DateTimeField(blank=True, null=True)
    current_sign_in_ip = models.CharField(max_length=255, blank=True, null=True)
    last_sign_in_ip = models.CharField(max_length=255, blank=True, null=True)
    image = models.CharField(max_length=255, blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'people'


class Team(models.Model):
    name = models.CharField(max_length=255, blank=True, null=True)
    url = models.CharField(max_length=255, blank=True, null=True)
    photo_url = models.CharField(max_length=255, blank=True, null=True)
    video_url = models.CharField(max_length=255, blank=True, null=True)
    location = models.CharField(max_length=255, blank=True, null=True)
    organization_name = models.CharField(max_length=255, blank=True, null=True)
    created_at = models.DateTimeField()
    updated_at = models.DateTimeField()
    bio = models.TextField(blank=True, null=True)
    slug = models.CharField(max_length=255, blank=True, null=True)
    is_visible = models.NullBooleanField()
    image = models.CharField(max_length=255, blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'teams'
