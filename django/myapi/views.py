from encodings import search_function
from django.http import Http404
from .serializers import OrganisationSerializer, AdminSerializer, TestSerializer, OrganisationProfileSerializer, UserSerializer
from .models import Administration
from rest_framework.views import Response, APIView
from rest_framework import status, generics, viewsets
from django.shortcuts import render
from rest_framework import viewsets
from .serializers import OrganisationSerializer, AdminSerializer, VolunteerSerializer
from .models import Organisation, Tester, User
from .models import Volunteer
from .models import Administration
from rest_framework.exceptions import AuthenticationFailed
import jwt, datetime

class RegisterView(APIView):
    def post(self, request):
        serializer = UserSerializer(data=request.data)
        serializer.is_valid(raise_exception=True)
        serializer.save()
        return Response(serializer.data)
        
class LoginView(APIView):
    def post(self, request):
        email = request.data['email']
        password = request.data['password']

        user = User.objects.filter(email=email).first()

        if user is None:
            raise AuthenticationFailed('User not found!')

        if not user.check_password(password):
            raise AuthenticationFailed('Incorrect Password!')
        
        payload = {
            'id': user.id,
            'exp': datetime.datetime.utcnow() + datetime.timedelta(minutes=60),
            'iat': datetime.datetime.utcnow()
        }

        token = jwt.encode(payload, 'secret', algorithm='HS256')

        response = Response()

        response.set_cookie(key='jwt', value=token, httponly=True)
        response.data = {
            'jwt': token
        }

        return response

class UserView(APIView):

    def get(self, request):
        token = request.COOKIES.get('jwt')

        if not token:
            raise AuthenticationFailed('Unauthenticated!')

        try:
            payload = jwt.decode(token, 'secret', algorithms=['HS256'])
        except jwt.ExpiredSignatureError:
            raise AuthenticationFailed('Unauthenticated!')
        
        user = User.objects.filter(id=payload['id']).first()
        serializer = UserSerializer(user)
        return Response(serializer.data)

class LogoutView(APIView):
    def post(self,request):
        response = Response()
        response.delete_cookie('jwt')
        response.data = {
            'message': 'success'
        }

        return response

class VolunteerViewSet(viewsets.ModelViewSet):
    queryset = Volunteer.objects.all()
    serializer_class = VolunteerSerializer

class AdminViewSet(viewsets.ModelViewSet):
    queryset = Administration.objects.all()
    serializer_class = AdminSerializer

class OrganisationProfileViewSet(viewsets.ModelViewSet):
    queryset = Organisation.objects.all()
    serializer_class = OrganisationProfileSerializer

class OrganisationSignUpViewSet(viewsets.ModelViewSet):
    queryset = Organisation.objects.all()
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
