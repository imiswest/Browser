from django.shortcuts import render
from django.http import HttpResponse
from .models import LocationSearchStage
import requests
import xml.etree.ElementTree as ET
from django.conf import settings

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
    
    # XML 내 item 태그에서 병원 정보 추출
    for item in root.findall('.//item'):
        hospital = {
            'dutyName': item.findtext('dutyName'),
            'dutyTel3': item.findtext('dutyTel3'),
            'hpid': item.findtext('hpid'),
            'hv10': item.findtext('hv10'),
            # 필요한 다른 필드들을 추가로 추출
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
