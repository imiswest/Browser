import 'package:flutter/material.dart';

import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  final Size preferredSize; // 앱바의 크기를 정의

  CustomAppBar({Key? key})
      : preferredSize = const Size.fromHeight(65.0),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false, // 뒤로가기 버튼 비활성화
      title: Padding(
        padding: const EdgeInsets.only(top: 25), // 타이틀의 위치 조정
        child: Text(
          'BROWSER',
          style: TextStyle(
            fontSize: 27,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      backgroundColor: Color.fromARGB(255, 203, 71, 71), // 배경색
      elevation: 10.0, // 그림자 높이
    );
  }
}
