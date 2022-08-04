from myapi.models import Organisation, Volunteer
from rest_framework import serializers

# Serializers for the models
class CompSerializerList(serializers.ModelSerializer):
    class Meta:
        model = Organisation
        fields = [
            'Organisation',
            'Contact_Name',
            'Contact_Number',
        ]

class CompSerializerSingle(serializers.ModelSerializer):
    class Meta:
        model = Organisation
        fields = '__all__'

class VolSerializerList(serializers.ModelSerializer):
    class Meta:
        model = Volunteer
        fields = [
            'name',
            'email',
            'number',
        ]

class VolSerializerSingle(serializers.ModelSerializer):
    class Meta:
        model = Volunteer
        fields = '__all__'