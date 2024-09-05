from django.contrib import admin
from django.urls import path, include

urlpatterns = [
    path('admin/', admin.site.urls),
    path('location/', include('location_search.urls')), 
    path('emergencyroom/', include('er_info.urls')), 
]
