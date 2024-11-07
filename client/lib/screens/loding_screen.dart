import 'package:flutter/material.dart';
import 'package:flutter_browser/widgets/custom_appbar.dart';

class LodingScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
  
      body: Center(
        child: Stack(
          alignment: Alignment.center,
          children: [
            // 원 모양을 그리는 부분
            CustomPaint(
              size: Size(450,300),  // 원의 크기를 지정
              painter: CirclePainter(),  // CirclePainter로 원을 그림
            ),
            // 텍스트 부분
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  '매칭 중',
                  style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
                ),
                Padding(padding: EdgeInsets.all(5)),
                Text(
                  '잠시만 기다려 주세요',
                  style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// 원을 그리기 위한 커스텀 페인터
class CirclePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = Color.fromARGB(255, 176, 113, 113)  // 원의 색상
      ..style = PaintingStyle.stroke  // 내부를 채우지 않고 테두리만 그리기
      ..strokeWidth = 5;  // 테두리 두께

    // 첫 번째 원을 그림
    canvas.drawOval(
      Rect.fromLTWH(0, 10, size.width, size.height),  // 가로와 세로를 동일하게 해서 원 그림
      paint,

    );

    // 두 번째, 살짝 작거나 크게 겹친 원을 그림
    canvas.drawOval(
      Rect.fromLTWH(25, 0, size.width - 15, size.height - 15),  // 살짝 작게 그리기
      paint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;  // 상태 변경이 없으면 다시 그리지 않음
  }
}