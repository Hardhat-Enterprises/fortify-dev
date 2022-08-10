from django.forms import ValidationError
from rest_framework import serializers
from .models import Organisation, User, Volunteer
from .models import Administration, Tester
from rest_framework.serializers import ValidationError


class UserSerializer(serializers.HyperlinkedModelSerializer):
    class Meta:
        model = User
        fields = ('name', 'email')

class AdminSerializer(serializers.HyperlinkedModelSerializer):
    class Meta:
        model = Administration
        fields = ('name', 'email', 'role')

""" class VolunteerSerializer(serializers.HyperlinkedModelSerializer):
    class Meta:
        model = Administration
        fields = '__all__' """

class VolunteerSerializer(serializers.HyperlinkedModelSerializer):
    class Meta:
        model = Volunteer
        fields = ('name', 'email', 'number', 'contact', 'specialisation')

class OrganisationProfileSerializer(serializers.ModelSerializer):
    Phishing = serializers.SerializerMethodField()
    Vulnerability_Management = serializers.SerializerMethodField()
    Cyber_Awareness = serializers.SerializerMethodField()

    class Meta:
        model = Organisation
        fields = ('Organisation', 'Contact_Name', 'Contact_Email', 'Contact_Number', 'Phishing', 'Vulnerability_Management', 'Cyber_Awareness')
        extra_kwargs = {
                'Phishing': {'write_only': True},
                'Vulnerability_Management': {'write_only': True},
                'Cyber_Awareness': {'write_only': True},
        }
    def get_Phishing(self,obj):
        if obj.Phishing == True:
            return "True"
        else:
            return "False"
    
    def get_Vulnerability_Management(self, obj):
        if obj.Vulnerability_Management == True:
            return "True"
        else:
            return "False"
    
    def get_Cyber_Awareness(self, obj):
        if obj.Cyber_Awareness == True:
            return "True"
        else:
            return "False"

class OrganisationSerializer(serializers.ModelSerializer):
    class Meta:
        model = Organisation
        fields = ('__all__')
        extra_kwargs = {
                'Organisation': {'write_only': True},
                'Contact_Name': {'write_only': True},
                'Contact_Email': {'write_only': True},
                'Contact_Number': {'write_only': True},
                'Phishing': {'write_only': True},
                'Vulnerability_Management': {'write_only': True},
                'Cyber_Awareness': {'write_only': True},
        }


    def validate(self, data):
        if data["Organisation"] == data["Contact_Name"]:
            raise ValidationError("Organisation & Contact Name must be different")
        return data

class TestSerializer(serializers.HyperlinkedModelSerializer):

    class Meta:
        model = Tester
        fields = ('__all__')