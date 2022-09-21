"""fortifydjango URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/3.2/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""
from django.contrib import admin
from django.urls import path, include
from rest_framework import routers
from search import views

router = routers.DefaultRouter()

urlpatterns = [
    path('admin/', admin.site.urls),
    path('', include('myapi.urls')),
    path('search/', include(router.urls)),
    # Access these endpoints from eg: http://localhost:8000/search/companies?comp_email=test&comp_name=test
    path(r'search/companies', views.CompList.as_view()),
    path(r'search/volunteers', views.HelpList.as_view()),
    # Access these endpoints from eg: http://localhost:8000/search/companies/1
    path(r'search/companies/<int:pk>', views.CompDetail.as_view()),
    path(r'search/volunteers/<int:pk>', views.HelpDetail.as_view()),
]