from django.forms import ValidationError
from rest_framework import serializers
from .models import Organisation, User
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

class VolunteerSerializer(serializers.HyperlinkedModelSerializer):
    class Meta:
        model = Administration
        fields = '__all__'

    class Meta:
        model = Organisation
        fields = ('Your_Company', 'Email', 'Contact_Number')


class OrganisationSerializer(serializers.ModelSerializer):
    class Meta:
        model = Organisation
        fields = ('__all__')
        extra_kwargs = {
                'Your_Company': {'write_only': True},
                'Email': {'write_only': True},
                'Contact_Number': {'write_only': True},
                }

class TestSerializer(serializers.HyperlinkedModelSerializer):

    class Meta:
        model = Tester
        fields = ('__all__')