from django.db import models

# Create your models here.

class LocationSearchStage(models.Model):
    sido = models.CharField(max_length=100)
    sigungu = models.CharField(max_length=100)

    class Meta:
        db_table = 'location_search_stage'
        managed = False  # Django가 이 테이블을 관리하지 않음
