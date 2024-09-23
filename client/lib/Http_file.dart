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
  final String apiUrl = "https://4cf6-118-47-136-130.ngrok-free.app/emergencyroom/api/er-info/";
  Future<List<Hospital>> fetchHospitalData() async {
    print('I am in fetchHospitalData function.');
    final response = await http.get(Uri.parse(apiUrl));

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