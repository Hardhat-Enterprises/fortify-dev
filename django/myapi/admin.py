from django.contrib import admin
from .models import User
from .models import Administration
from .models import Organisation
from .models import Volunteer
from .models import Administration
from .models import Organisation


# Register your models here.
admin.site.register(User)
#admin.site.register(Hacker)

admin.site.register(Administration)
admin.site.register(Organisation)
#admin.site.register(OrganisationProfile)
admin.site.register(Volunteer)
