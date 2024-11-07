import 'package:flutter/material.dart';
import 'package:flutter_browser/screens/result_screen.dart';
import 'package:flutter_browser/widgets/custom_appbar.dart';

import 'package:flutter_browser/screens/loding_screen.dart';
import 'package:http/http.dart' as http; //http 요청을 위한 패키지
import 'dart:convert'; //JSON 변환을 위한 패키지


class DataScreen extends StatefulWidget{
  @override
  _DataScreen createState() => _DataScreen();
}

class _DataScreen extends State<DataScreen> {
  final _valueList1 = [ '남', '여', '기타' ];
  String? _selectedValue1;
  final _valueList2 = ['0~6세', '7~18세', '19~29세', '30~49세', '50~64세', '65세 이상'];
  String? _selectedValue2;
  final _valueList3 = ['KRAS 1', 'KRAS 2', 'KRAS 3', 'KRAS 4', 'KRAS 5'];
  String? _selectedValue3;
  final _valueList4 = ['일반(판단 어려움)', '흉부외과', '내과', '외과', '신경외과','심장내과'];
  String? _selectedValue4;

  bool isChecked_CT = false;
  bool isChecked_MRI = false;
  bool isChecked_Vessel = false;
  bool isChecked_Respirator = false;

  // 텍스트 필드 컨트롤러 (텍스트 필드에 입력한 값 가져와서 사용하기 위함)
  TextEditingController patientStateController = TextEditingController();

  // 서버로 데이터를 전송하는 함수
  Future<void> sendDataToServer() async {
    final url = Uri.parse('서버에서 데이터를 받을 API 엔드포인트 URL'); //여기에요 여기!

  //보내려는 데이터를 JSON형식으로 변환
  final response = await http.post(
    url,
    headers:  {
      'Content-Type' : 'application/json',
    },
    body: jsonEncode({
      'gender': _selectedValue1,
      'age': _selectedValue2,
      'KRAS': _selectedValue3,
      'hospital_department' : _selectedValue4,
      'CT' : isChecked_CT,
      'MRI' : isChecked_MRI,
      'vessel_scan' : isChecked_Vessel,
      'respirator' : isChecked_Respirator,
      'patient_state' : patientStateController.text,
    }),
  );

  if (response.statusCode == 200){ 
    print('Data sent successfully');
    Navigator.of(context).push( //데이터 전송 성공하면 로딩 화면으로 넘어감
      MaterialPageRoute(
        builder: (BuildContext context) => LodingScreen(),
      ),
  );
  } else {
    print('Fail to send data');
  }
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),

      body: Column( //전체
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container( //환자 정보 입력 텍스트
                margin: EdgeInsets.only(top: 70, left: 35),
                padding: EdgeInsets.only(bottom: 18),
                child: Text('환자 정보 입력',
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
              ),
              Container( //정보 입력 네모 박스
                margin: EdgeInsets.only(left: 27),
                width: 450,
                height: 460,
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 247, 201, 201), // Container의 배경색
                  borderRadius: BorderRadius.circular(15)
                ),

                child: Column(//네모박스 안에서 전체
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(padding: EdgeInsets.fromLTRB(30, 10, 0, 5)),
                    Text('     기본 정보', style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold)),
                    
                    Row( //성별, 연령 
                      children: [
                        Padding(padding: EdgeInsets.fromLTRB(25, 40, 0, 10)),
                        Text('성별', style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
                          Container(
                          padding: EdgeInsets.only(left: 5),
                          margin: EdgeInsets.only(left: 10, right: 50),
                          color: Colors.white,
                          height: 25,
                          width: 70,
                          child: DropdownButton(
                            underline: SizedBox.shrink(),
                            isExpanded: true,
                            style: TextStyle(fontWeight: FontWeight.bold),
                            hint: Text('선택'),
                            value: _selectedValue1,
                            items: _valueList1.map(
                              (value) {
                                return DropdownMenuItem(
                                  value: value,
                                  child: Text(value),
                                );
                              },
                            ).toList(),
                            onChanged: (String? value) {
                              setState(() {
                                _selectedValue1 = value;
                                
                              });
                            },
                          ),
                        ),
     
                        Text('연령', style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
                          Container(
                          padding: EdgeInsets.only(left: 5),
                          margin: EdgeInsets.only(left: 10),
                          color: Colors.white,
                          height: 25,
                          width: 100,
                          child: DropdownButton(
                            underline: SizedBox.shrink(),
                            isExpanded: true,
                            style: TextStyle(fontWeight: FontWeight.bold),
                            hint: Text('선택'),
                            value: _selectedValue2,
                            items: _valueList2.map(
                              (value) {
                                return DropdownMenuItem(
                                  value: value,
                                  child: Text(value),
                                );
                              },
                            ).toList(),
                            onChanged: (String? value) {
                              setState(() {
                                _selectedValue2 = value;
                                
                              });
                            },
                          ),
                        )
                      ],
                    ),
                    
                    Row( //중증도
                      children: [
                        Padding(padding: EdgeInsets.fromLTRB(25, 40, 0, 10)),
                        Text('중증도', style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
                          Container(
                          padding: EdgeInsets.only(left: 5),
                          margin: EdgeInsets.only(left: 10, right: 50),
                          color: Colors.white,
                          height: 25,
                          width: 150,
                          child: DropdownButton(
                            underline: SizedBox.shrink(),
                            isExpanded: true,
                            style: TextStyle(fontWeight: FontWeight.bold),
                            hint: Text('선택'),
                            value: _selectedValue3,
                            items: _valueList3.map(
                              (value) {
                                return DropdownMenuItem(
                                  value: value,
                                  child: Text(value),
                                );
                              },
                            ).toList(),
                            onChanged: (String? value) {
                              setState(() {
                                _selectedValue3 = value;
                                
                              });
                            },
                          ),
                        ),
                      ],
                    ),

                    Row( //예상 진료 과
                      children: [
                        Padding(padding: EdgeInsets.fromLTRB(25, 40, 0, 10)),
                        Text('예상 진료 과', style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
                          Container(
                          padding: EdgeInsets.only(left: 5),
                          margin: EdgeInsets.only(left: 10, right: 50),
                          color: Colors.white,
                          height: 25,
                          width: 180,
                          child: DropdownButton(
                            underline: SizedBox.shrink(),
                            isExpanded: true,
                            style: TextStyle(fontWeight: FontWeight.bold),
                            hint: Text('선택'),
                            value: _selectedValue4,
                            items: _valueList4.map(
                              (value) {
                                return DropdownMenuItem(
                                  value: value,
                                  child: Text(value),
                                );
                              },
                            ).toList(),
                            onChanged: (String? value) {
                              setState(() {
                                _selectedValue4 = value;
                                
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                    //dropdown 버튼 끝

                    //checkbox 시작
                    Container(//필수 의료 장비
                      margin: EdgeInsets.only(left: 25, top: 10),
                      child: Text('필수 의료 장비', style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
                    ),
                    Row(
                      children: [
                        Padding(padding: EdgeInsets.only(left: 25, top: 10)),                 
                        Checkbox(//CT
                          value: isChecked_CT,
                          onChanged: (bool? newValue) {
                            setState(() {
                              isChecked_CT = newValue!;
                            });
                          },
                          fillColor: MaterialStateProperty.resolveWith<Color>((Set<MaterialState> states) {
                            if (states.contains(MaterialState.selected)) {
                              return Color.fromARGB(255, 212, 96, 107); // 체크박스가 선택되었을 때의 색상
                            }
                              return Colors.white; // 체크박스가 선택되지 않았을 때의 색상
                          }),
                          side: BorderSide(
                            color: Colors.white,
                          ),
                          checkColor: Colors.white,
                        ),
                        Text(
                        'CT', style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                        ),

                        Padding(padding: EdgeInsets.only(left: 110)),                 
                        Checkbox( //MRI
                          value: isChecked_MRI,
                          onChanged: (bool? newValue) {
                            setState(() {
                              isChecked_MRI = newValue!;
                            });
                          },
                          fillColor: MaterialStateProperty.resolveWith<Color>((Set<MaterialState> states) {
                            if (states.contains(MaterialState.selected)) {
                              return Color.fromARGB(255, 212, 96, 107); // 체크박스가 선택되었을 때의 색상
                            }
                              return Colors.white; // 체크박스가 선택되지 않았을 때의 색상
                          }),
                          side: BorderSide(
                            color: Colors.white,
                          ),
                          checkColor: Colors.white,
                        ),
                        Text(
                        'MRI', style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    //체크박스 한줄 끝, 둘째 줄 시작
                    Row(
                      children: [
                        Padding(padding: EdgeInsets.only(left: 25, top: 10)),                 
                        Checkbox(//혈관촬영기
                          value: isChecked_Vessel,
                          onChanged: (bool? newValue) {
                            setState(() {
                              isChecked_Vessel = newValue!;
                            });
                          },
                          fillColor: MaterialStateProperty.resolveWith<Color>((Set<MaterialState> states) {
                            if (states.contains(MaterialState.selected)) {
                              return Color.fromARGB(255, 212, 96, 107); // 체크박스가 선택되었을 때의 색상
                            }
                              return Colors.white; // 체크박스가 선택되지 않았을 때의 색상
                          }),
                          side: BorderSide(
                            color: Colors.white,
                          ),
                          checkColor: Colors.white,
                        ),
                        Text(
                        '혈관촬영기', style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                        ),

                        Padding(padding: EdgeInsets.only(left: 60)),                 
                        Checkbox( //인공호흡기
                          value: isChecked_Respirator,
                          onChanged: (bool? newValue) {
                            setState(() {
                              isChecked_Respirator = newValue!;
                            });
                          },
                          fillColor: MaterialStateProperty.resolveWith<Color>((Set<MaterialState> states) {
                            if (states.contains(MaterialState.selected)) {
                              return Color.fromARGB(255, 212, 96, 107); // 체크박스가 선택되었을 때의 색상
                            }
                              return Colors.white; // 체크박스가 선택되지 않았을 때의 색상
                          }),
                          side: BorderSide(
                            color: Colors.white,
                          ),
                          checkColor: Colors.white,
                        ),
                        Text(
                        '인공호흡기', style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    //체크박스 끝

                    //환자 상태 작성 칸
                    Container(//필수 의료 장비
                      margin: EdgeInsets.only(left: 25, top: 10),
                      child: Text('환자 상태', style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 25, top: 5),
                      width: 400,
                      height: 115,
                      color: Colors.white,
                      padding: EdgeInsets.only(left: 7, right: 7),
                      child: TextField(
                        decoration: InputDecoration(
                        hintText: '환자 상태를 입력하세요.',
                        ),
                        maxLines: null
                      )
                    ),
                  ],
                )
            ),
            Container( //매칭 버튼
              padding: EdgeInsets.only(top: 15),
              child: Center(
                child: SizedBox(
                  width: 125,
                  height: 37,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(backgroundColor: Color.fromARGB(255, 247, 201, 201),),
                    onPressed: () {
                      sendDataToServer(); //데이터 전송
                    
                    }, 
                    child: Text('매칭 신청', style: TextStyle(fontSize: 15 ,color: Colors.black, fontWeight: FontWeight.bold))
                  ),
                )
              ),
            ),
        ],
        
      )
    );
  }
}