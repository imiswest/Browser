from django.db import models

# Create your models here.

class LocationSearchStage(models.Model):
    sido = models.CharField(max_length=100)
    sigungu = models.CharField(max_length=100)

    class Meta:
        db_table = 'location_search_stage'
        managed = False  # Django가 이 테이블을 관리하지 않음

class ERRealtimeInfo(models.Model):
    # 병원 기본 정보
    hpid = models.CharField(max_length=50)  # 병원 ID
    dutyName = models.CharField(max_length=255)  # 병원 이름
    
    # 예상 진료과목(정수형)
    hvec = models.IntegerField(blank=True, null=True)  # 일반
    hvccc = models.IntegerField(blank=True, null=True)  # 흉부외과
    hv2 = models.IntegerField(blank=True, null=True)  # 내과
    hv3 = models.IntegerField(blank=True, null=True)  # 외과
    hv6 = models.IntegerField(blank=True, null=True)  # 신경외과
    hv34 = models.IntegerField(blank=True, null=True)  # 심장내과

    # 필수 의료장비 (문자열 'Y' 또는 'N'로 저장)
    hvctayn = models.CharField(max_length=2, blank=True, null=True)  # CT 가용 여부
    hvmriayn = models.CharField(max_length=2, blank=True, null=True)  # MRI 가용 여부
    hvangioayn = models.CharField(max_length=2, blank=True, null=True)  # 혈관촬영기 가용 여부
    hvventiayn = models.CharField(max_length=2, blank=True, null=True)  # 인공호흡기 가용 여부

    class Meta:
        db_table = 'er_realtime_info'  # 새로운 테이블명 지정