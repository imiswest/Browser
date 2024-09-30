import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Hospital {
  final String dutyName;

Hospital({required this.dutyName});

factory Hospital.fromJson(Map<String, dynamic> json){
    return Hospital(
      dutyName: json['dutyName'],
    );
  }
}

class FirstApi{
  final String apiUrl = "https://7d9b-14-44-120-104.ngrok-free.app/emergencyroom/api/er-info/?format=json";
  Future<List<Hospital>> fetchHospitalData() async {
    print('I am in fetchHospitalData function.'); 
    final response = await http.get(Uri.parse(apiUrl),headers: {"Accept": "application/json","ngrok-skip-browser-warning": "true"});
    print(response.statusCode);
    print(response.body);

    if (response.statusCode == 200) {
       print('API get success');
      List<dynamic> body = json.decode(response.body); // JSON 데이터를 파싱
      List<Hospital> hospitals = body.map((dynamic item) => Hospital.fromJson(item)).toList();
      
      return hospitals;
      
    } 
    else {
      print('API get failed');
      
      throw Exception('Failed to load hospital data');
    }
  }
}