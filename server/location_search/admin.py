# location_search/admin.py

from django.contrib import admin
from .models import Stage  # 변경된 모델 이름으로 import

admin.site.register(Stage)
