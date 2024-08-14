import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_browser/screens/data_screen.dart';

class FirstScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(65),
        child: AppBar(
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
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: 
            Container(
              margin: EdgeInsets.only(bottom: 50),
              child: Image.network(
                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT1gqFCaZABPjxTIstvlrEefojoion6d7igGw&s',
              ),
            ),
          ),//구급차 이미지
          Container(
            child:ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Color.fromARGB(255, 247, 201, 201)),
              onPressed: () {
                Navigator.of(context).push( 
                MaterialPageRoute(  
                  builder: (BuildContext context) => DataScreen()
                ));
              }, 
              child: Text('병원 매칭 신청', style: TextStyle(fontSize: 14 ,color: Colors.black, fontWeight: FontWeight.bold))
            ),
            width: 220,
            height: 40,
          )
        ] 
      )
    );
  }
}
