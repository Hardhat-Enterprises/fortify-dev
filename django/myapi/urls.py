from django.urls import include, path
from rest_framework import routers
from . import views

router = routers.DefaultRouter()
router.register(r'volunteers', views.VolunteerViewSet)
router.register(r'administration', views.AdminViewSet)

# Wire up our API using automatic URL routing.
# Additionally, we include login URLs for the browsable API.
urlpatterns = [
    # path('', include(router.urls)),
    path('api-auth/', include('rest_framework.urls', namespace='rest_framework')),
    path(r'myapi/user/', views.UserList.as_view()),
    path(r'myapi/volunteer/', views.VolunteerList.as_view()),
    path(r'myapi/administration/', views.AdministrationList.as_view()),
    path(r'myapi/organisation/', views.OrganisationList.as_view()),
    path(r'organisation/', views.OrganisationSignUpViewSet.as_view()),
    path(r'organisationprofile/', views.OrganisationProfileViewSet.as_view()),
    path('', include(router.urls)),
    path('api-auth/', include('rest_framework.urls', namespace='rest_framework'))
]
""" path(r'tester/<int:pk>', views.TestDetail.as_view()), """
""" path(r'user/', views.UserList.as_view()), """