from django.db import models

# Create your models here.

class Volunteer(models.Model):
    first_name = models.CharField(max_length=30)
    last_name = models.CharField(max_length=30)
    email = models.CharField 
    contact_number = models.CharField(max_length=30)
    suburb = models.CharField(max_length=30)
    state = models.CharField(max_length=3)
    about_me = models.CharField(max_length=1000)
    skills1 = models.CharField(max_length=30)
    skills2 = models.CharField(max_length=30)
    skills3 = models.CharField(max_length=30)
    skills4 = models.CharField(max_length=30)
    skills5 = models.CharField(max_length=30)
    your_company = models.CharField(max_length=30)
    degree = models.CharField(max_length=100)
    start_date = models.CharField
    end_date = models.CharField
    linkedin = models.CharField(max_length=200)
    facebook = models.CharField(max_length=200)
    instagram = models.CharField(max_length=30)

    def __str__(self):
        return (self.first_name + ' ' + self.last_name + ' ' + self.email + ' ')
    
class User(models.Model):
    name = models.CharField(max_length=60)
    email = models.CharField(max_length=60)

    def __str__(self):
        return (self.name + self.email)

class Administration(User):
    role = models.CharField(max_length=30)

    def _str_(self):
        return (self.name + ' ' + self.email + ' ' + self.role)

class Organisation(models.Model):
    your_company = models.CharField(max_length=50)
    email = models.CharField
    contact_number = models.CharField(max_length=10)
    about_us = models.CharField(max_length=60)
    company_description = models.CharField(max_length=2000)

    def _str_(self):
        return (self.your_company + ' ' + self.email + ' ' + self.contact_number)

class Tester(models.Model):
    Country = models.CharField(max_length=60)
    State = models.CharField(max_length=60)

class Document(models.Model):
    docfile = models.FileField(upload_to='documents/%Y/%m/%d')