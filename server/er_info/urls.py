from django.urls import path
from . import views

urlpatterns = [
    path('', views.main, name='emergencyroom_main'),  # 메인 화면에 대한 URL
]
