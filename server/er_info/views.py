from django.shortcuts import render
from django.http import HttpResponse
from django.conf import settings

from .models import LocationSearchStage
from .models import ERRealtimeInfo

import requests
import xml.etree.ElementTree as ET


# index 뷰 함수 정의
def index(request):
    return HttpResponse("This is the Emergency Room information page.")

# 가장 최근 저장된 위치정보 데이터 가져오는 함수 정의
def get_latest_location():
    latest_location = LocationSearchStage.objects.order_by('-id').first()

    if latest_location:
        return latest_location.sido, latest_location.sigungu
    return None, None

# 실시간 응급실 정보를 API로부터 가져오는 함수
def request_er_realtime_info():
    sido, sigungu = get_latest_location()
    
    if sido and sigungu:
        api_url = "http://apis.data.go.kr/B552657/ErmctInfoInqireService/getEmrrmRltmUsefulSckbdInfoInqire"
        service_key = settings.ER_API_KEY
        
        params = {
            'serviceKey': service_key,
            'STAGE1': sido,    # 시도
            'STAGE2': sigungu  # 시군구
        }

        response = requests.get(api_url, params=params)

        if response.status_code == 200:
            print(response.text)  # API 응답 XML을 출력해 확인
            return response.text  # 응답 데이터를 반환
        else:
            print(f"API 호출 실패: {response.status_code}")
            return None
    else:
        print("최근 저장된 시도/시군구 데이터가 없습니다.")
        return None

# XML 데이터를 파싱하여 필요한 정보를 추출하는 함수
def parse_hospital_data(xml_data):
    hospital_info = []
    
    root = ET.fromstring(xml_data)
    
    for item in root.findall('.//item'):
        hospital = {
            'dutyName': item.findtext('dutyName'),
            'dutyTel3': item.findtext('dutyTel3'),
            'hpid': item.findtext('hpid'),
            'hvec': item.findtext('hvec', '0'),  # 일반 진료과목
            'hv2': item.findtext('hv2', '0'),    # 내과
            'hv3': item.findtext('hv3', '0'),    # 외과
            'hv6': item.findtext('hv6', '0'),    # 신경외과
            'hv34': item.findtext('hv34', '0'),  # 심장내과
            'hvctayn': item.findtext('hvctayn', 'N'),  # CT 가용 여부
            'hvmriayn': item.findtext('hvmriayn', 'N'),  # MRI 가용 여부
            'hvangioayn': item.findtext('hvangioayn', 'N'),  # 혈관촬영기 가용 여부
            'hvventiayn': item.findtext('hvventiayn', 'N')  # 인공호흡기 가용 여부
        }
        hospital_info.append(hospital)
    
    return hospital_info


# 뷰 함수
def er_realtime_info_view(request):
    # 실시간 응급실 정보를 API에서 가져옴
    api_response = request_er_realtime_info()

    if api_response:
        # XML 데이터 파싱
        hospitals = parse_hospital_data(api_response)
        context = {'hospitals': hospitals}
    else:
        context = {'error': '응급실 정보를 가져올 수 없습니다.'}

    return render(request, 'emergencyroom/er_info.html', context)

def save_hospital_data(hospitals):
    ERRealtimeInfo.objects.all().delete()  # 기존 데이터를 삭제 (선택 사항)

    for hospital in hospitals:
        ERRealtimeInfo.objects.create(
            dutyName=hospital['dutyName'],
            hpid=hospital['hpid'],
            hvec=int(hospital.get('hvec', 0)),  # 일반 진료과목
            hvccc=int(hospital.get('hvccc', 0)),  # 흉부외과
            hv2=int(hospital.get('hv2', 0)),  # 내과
            hv3=int(hospital.get('hv3', 0)),  # 외과
            hv6=int(hospital.get('hv6', 0)),  # 신경외과
            hv34=int(hospital.get('hv34', 0)),  # 심장내과
            hvctayn=hospital.get('hvctayn', 'N'),  # CT 가용 여부
            hvmriayn=hospital.get('hvmriayn', 'N'),  # MRI 가용 여부
            hvangioayn=hospital.get('hvangioayn', 'N'),  # 혈관촬영기 가용 여부
            hvventiayn=hospital.get('hvventiayn', 'N')  # 인공호흡기 가용 여부
        )

# API 데이터 저장 뷰 함수
def er_realtime_info_view(request):
    api_response = request_er_realtime_info()
    
    if api_response:
        hospitals = parse_hospital_data(api_response)
        save_hospital_data(hospitals)  # 병원 데이터를 DB에 저장
        context = {'hospitals': hospitals}
    else:
        context = {'error': '응급실 정보를 가져올 수 없습니다.'}
    
    return render(request, 'emergencyroom/er_info.html', context)