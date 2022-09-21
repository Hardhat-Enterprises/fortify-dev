from django.urls import include, path
from .views import RegisterView, LoginView, UserView, LogoutView
from . import views
from rest_framework import routers


router = routers.DefaultRouter()
router.register(r'volunteers', views.VolunteerViewSet) # This isn't working, can be fixed in the future
router.register(r'administration', views.AdminViewSet)
router.register(r'organisation', views.OrganisationSignUpViewSet)
router.register(r'organisationprofile', views.OrganisationProfileViewSet)
# Wire up our API using automatic URL routing.
# Additionally, we include login URLs for the browsable API.
urlpatterns = [
    path('register', RegisterView.as_view()),
    path('login', LoginView.as_view()),
    path('user', UserView.as_view()),
    path('logout', LogoutView.as_view()),
    path('', include(router.urls)),
]