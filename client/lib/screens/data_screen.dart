import 'package:flutter/material.dart';
import 'package:flutter_browser/widgets/custom_appbar.dart';
import 'package:flutter_browser/widgets/custom_checkbox.dart';

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
                  color: Color.fromARGB(255, 247, 201, 201), // Container의배경색
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
                      height: 50,
                      color: Colors.white,
                      child: TextField(
                        decoration: InputDecoration(
                        labelText: '입력',
                        ),
                      )
                    )
                  ],
                )
            )
        ],
      )
    );
  }
}