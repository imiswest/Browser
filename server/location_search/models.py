# location_search/models.py
from django.db import models

class Stage(models.Model):
    sido = models.CharField(max_length=100)  # 시도
    sigungu = models.CharField(max_length=100)  # 시군구
    latitude = models.FloatField()  # 위도
    longitude = models.FloatField()  # 경도
    created_at = models.DateTimeField(auto_now_add=True)  # 저장 시간

    def __str__(self):
        return f'{self.sido} {self.sigungu}'
