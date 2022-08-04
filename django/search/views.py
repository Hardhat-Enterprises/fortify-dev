from django.http import Http404
from myapi.models import Organisation, Volunteer
from rest_framework import generics, status
from rest_framework.views import APIView, Response
from .serializers import CompSerializerList, CompSerializerSingle, VolSerializerList, VolSerializerSingle
from django.shortcuts import render
from rest_framework import viewsets

# These views handle the listing and filtering of Companies and Helpers
class CompList(generics.ListCreateAPIView):
    # The default query is get all objects
    queryset = Organisation.objects.all()
    serializer_class = CompSerializerList

    # Using GET method
    def get_queryset(self):
        # Defining queryset again
        queryset = self.queryset
        filter_dict = self.request.GET.dict()
        if filter_dict is not None:
            queryset = queryset.filter(**filter_dict)
        return queryset

class HelpList(generics.ListCreateAPIView):
    queryset = Volunteer.objects.all()
    serializer_class = VolSerializerList

    def get_queryset(self):
        queryset = self.queryset
        filter_dict = self.request.GET.dict()
        if filter_dict is not None:
            queryset = queryset.filter(**filter_dict)
        return queryset

# These detail views are for returning all the attributes of one particular database object
class CompDetail(APIView):
    def get_object(self, pk):
        try:
            return Organisation.objects.get(pk=pk)
        except:
            raise Http404

    def get(self, request, pk, format=None):
        snippet = self.get_object(pk)
        serializer = CompSerializerSingle(snippet)
        return Response(serializer.data)

    def put(self, request, pk, format=None):
        snippet = self.get_object(pk)
        serializer = CompSerializerSingle(snippet, data=request.data)
        if serializer.is_valid():
            serializer.save()
            return Response(serializer.data)
        return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)

    def delete(self, request, pk, format=None):
        snippet = self.get_object(pk)
        snippet.delete()
        return Response(status=status.HTTP_204_NO_CONTENT)

class HelpDetail(APIView):
    def get_object(self, pk):
        try:
            return Volunteer.objects.get(pk=pk)
        except:
            raise Http404

    def get(self, request, pk, format=None):
        snippet = self.get_object(pk)
        serializer = VolSerializerSingle(snippet)
        return Response(serializer.data)

    def put(self, request, pk, format=None):
        snippet = self.get_object(pk)
        serializer = VolSerializerSingle(snippet, data=request.data)
        if serializer.is_valid():
            serializer.save()
            return Response(serializer.data)
        return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)

    def delete(self, request, pk, format=None):
        snippet = self.get_object(pk)
        snippet.delete()
        return Response(status=status.HTTP_204_NO_CONTENT)