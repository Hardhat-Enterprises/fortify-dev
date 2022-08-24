from django.http import Http404, HttpResponse, JsonResponse
from django.shortcuts import render
from .serializers import OrganisationSerializer, UserSerializer, AdminSerializer, OrganisationProfileSerializer
from .models import User
from .models import Administration
from rest_framework.views import Response, APIView
from rest_framework import status, generics, viewsets
from rest_framework import viewsets
from .serializers import OrganisationSerializer, UserSerializer, AdminSerializer, VolunteerSerializer, TestSerializer
from .models import Volunteer
from .models import Organisation, Tester
import json


class VolunteerViewSet(viewsets.ModelViewSet):
    queryset = Volunteer.objects.all().order_by('name')
    serializer_class = VolunteerSerializer

class AdminViewSet(viewsets.ModelViewSet):
    queryset = Administration.objects.all().order_by('name')
    serializer_class = AdminSerializer

class OrganisationProfileViewSet(generics.ListCreateAPIView):
    queryset = Organisation.objects.all().order_by('Organisation')
    serializer_class = OrganisationProfileSerializer

class OrganisationSignUpViewSet(generics.ListCreateAPIView):
    queryset = Organisation.objects.all().order_by('Organisation')
    serializer_class = OrganisationSerializer

class TestList(generics.ListCreateAPIView):
    queryset = Tester
    serializer_class = TestSerializer

    def get_queryset(self):
        queryset = self.queryset
        filter_dict = self.request.GET.dict()
        if filter_dict is not None:
            queryset = queryset.filter(**filter_dict)
        return queryset

class TestDetail(APIView):
    def get_object(self,pk):
        try:
            return Tester.objects.get(pk=pk)
        except:
            raise Http404
    
    def get(self, request, pk, format=None) :
        snippet = self.get_object(pk)
        serializer = TestSerializer
        return Response(serializer.data)
    
    def put(self, request, pk, format=None):
        snippet = self.get.object(pk)
        serializer = TestSerializer(snippet, data=request.data)
        if serializer.is_valid():
            serializer.save()
            return Response(serializer.data)
        return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)

    def delete(self, request, pk, format=None):
        snippet = self.get_object(pk)
        snippet.delete()
        return Response(status=status.HTTP_204_NO_CONTENT)

class OrgViewSet(viewsets.ModelViewSet):
    queryset = Organisation.objects.all().order_by('Organisation')
    serializer_class = OrganisationSerializer

## HTTP Requests ##
class UserList(APIView):
    def get(pk, request):
        user = User.objects.all()
        serializer = UserSerializer(user, many=True)
        return Response(serializer.data)

    def post(pk, request):
        serializer = UserSerializer(data=request.data)

        if serializer.is_valid():
            serializer.save()

        return Response(serializer.data)

class VolunteerList(APIView):
    def get(pk, request):
        volunteer = Volunteer.objects.all()
        serializer = VolunteerSerializer(volunteer, many=True)
        return Response(serializer.data)

    def post(pk, request):
        serializer = VolunteerSerializer(data=request.data)

        if serializer.is_valid():
            serializer.save()

        return Response(serializer.data)

class AdministrationList(APIView):
    def get(pk, request):
        organisation = Administration.objects.all()
        serializer = AdminSerializer(organisation, many=True)
        return Response(serializer.data)

    def post(pk, request):
        serializer = AdminSerializer(data=request.data)
        if serializer.is_valid():
            serializer.save()

        return Response(serializer.data)

## GET request is working org, but POST request still getting errors ##
class OrganisationList(APIView):
    def get(pk, request):
        organisation = Organisation.objects.all()
        serializer = OrganisationSerializer(organisation, many=True)
        return Response(serializer.data)

    def post(pk, request):
        serializer = OrganisationSerializer(data=request.data)
        if serializer.is_valid():
            serializer.save()
        return Response(serializer.data)





