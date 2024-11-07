import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Hospital {
  final String dutyName;
  final String hpid;
  final int hvec;
  final int hvccc;
  final int hv2;
  final int hv3;
  final int hv6;
  final int hv34;
  final bool hvctayn;
  final bool hvmriayn;
  final bool hvangioayn;
  final bool hvventiayn;

Hospital({
  required this.dutyName,
  required this.hpid,
  required this.hvec,
  required this.hvccc,
  required this.hv2,
  required this.hv3,
  required this.hv6,
  required this.hv34,
  required this.hvctayn,
  required this.hvmriayn,
  required this.hvangioayn,
  required this.hvventiayn,
  });

// JSON 데이터를 Hospital 객체로 변환하는 factory constructor
factory Hospital.fromJson(Map<String, dynamic> json){
    return Hospital(
      dutyName: json['dutyName'],
      hpid: json['hpid'],
      hvec: json['hvec'] ?? 0,
      hvccc: json['hvccc'] ?? 0,
      hv2: json['hv2'] ?? 0,
      hv3: json['hv3'] ?? 0,
      hv6: json['hv6'] ?? 0,
      hv34: json['hv34'] ?? 0,
      hvctayn: json['hvctayn'] == 'Y',
      hvmriayn: json['hvmriayn'] == 'Y',
      hvangioayn: json['hvangioayn'] == 'Y',
      hvventiayn: json['hvventiayn'] == 'Y',
    );
  }
}

class FirstApi{
  final String apiUrl = "https://7d9b-14-44-120-104.ngrok-free.app/emergencyroom/api/er-info/?format=json";
  Future<List<Hospital>> fetchHospitalData() async {
    print('I am in fetchHospitalData function.'); 
    //API 요청
    final response = await http.get(Uri.parse(apiUrl),
    headers: {
      "Accept": "application/json",
      "ngrok-skip-browser-warning": "true"
      }
    );// ngrok 경고 무시를 위한 헤더
    
    print(response.statusCode);// 응답 상태 코드 출력
    print(response.body);// 응답 본문 출력

    if (response.statusCode == 200) {
      print('API get success');
      // JSON 데이터를 파싱하여 리스트로 변환
      List<dynamic> body = json.decode(response.body);
      // 각 항목을 Hospital 객체로 변환
      List<Hospital> hospitals = body.map((dynamic item) => Hospital.fromJson(item)).toList();
      
      return hospitals;
      
    } 
    else {
      print('API get failed');
      
      throw Exception('Failed to load hospital data');
    }
  }
}