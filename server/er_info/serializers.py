from rest_framework import serializers
from .models import ERRealtimeInfo

# Serializer 생성: 모델 데이터를 JSON으로 직렬화하기 위한 serializer를 정의
class ERRealtimeInfoSerializer(serializers.ModelSerializer):
    class Meta:
        model = ERRealtimeInfo
        fields = '__all__'
