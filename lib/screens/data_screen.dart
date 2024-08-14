import 'package:flutter/material.dart';

class DataScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(65),
        child: AppBar(
          automaticallyImplyLeading: false,
          title: Column(
            children: [
              Padding(padding: EdgeInsets.only(top: 25)),
              Text(
                'BROWSER',
                style: TextStyle(fontSize:27 ,color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          backgroundColor: Color.fromARGB(255, 203, 71, 71),
          elevation: 10.0, //왜 안돼
        ),
      ),

      body: Column(
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
                height: 400,
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 247, 201, 201), // Container의배경색
                  borderRadius: BorderRadius.circular(15)
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(padding: EdgeInsets.fromLTRB(30, 5, 0, 5)),
                    Text('   기본 정보', style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold))

                    
                  ],
                )
            )
        ],
      )
    );
  }
}