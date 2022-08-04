from django.db import models

# Create your models here.

class Volunteer(models.Model):
    name = models.CharField(max_length=60)
    email = models.CharField(max_length=60)
    number = models.CharField(max_length=60) 
    contact = models.CharField(max_length=60)
    specialisation = models.CharField(max_length=30)

    def __str__(self):
        return (self.name + ' ' + self.email + ' ' + self.specialisation)
    
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
    Organisation = models.CharField(max_length=60)
    Contact_Name = models.CharField(max_length=60)
    Contact_Email = models.CharField(max_length=60)
    Contact_Number = models.CharField(max_length=10)
    Phishing = models.BooleanField()
    Vulnerability_Management = models.BooleanField()
    Cyber_Awareness = models.BooleanField()

    def _str_(self):
        return (self.Organisation + ' ' + self.Contact_Name + ' ' + self.Contact_Email + ' ' 
        + self.Contact_Number + ' ' + self.Phishing + ' ' + self.Vulnerability_Management + ' ' + self.Cyber_Awareness)

class Tester(models.Model):
    Country = models.CharField(max_length=60)
    State = models.CharField(max_length=60)
