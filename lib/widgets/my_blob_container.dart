import 'package:flutter/material.dart';

class MyBlobContainer extends StatelessWidget {
  final Widget child;
  MyBlobContainer({this.child});
  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: BlobPainter(),
      child: child,
    );
  }
}

class BlobPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final height = size.height;
    final width = size.width;
    Paint paint = Paint();

    Path ovalPath = Path();

    ovalPath.moveTo(width * 0.05, height * 0.16); // starting point
    //A

    ovalPath.quadraticBezierTo(0, height * 0.27, width * 0.007, height * 0.5);
    //B

    ovalPath.quadraticBezierTo(0, height * 0.88, width * 0.4, height * 0.92);
    //C

    ovalPath.lineTo(width * 0.8, height * 0.9);
    //D

    ovalPath.quadraticBezierTo(
        width * 0.94, height * 0.9, width * 0.96, height * 0.6);
    //E

    ovalPath.quadraticBezierTo(width, height * 0.1, width * 0.8, height * 0.06);
    //F

    ovalPath.quadraticBezierTo(
        width * 0.55, height * 0.03, width * 0.4, height * 0.03);
    //H

    ovalPath.quadraticBezierTo(
        width * 0.29, height * 0.03, width * 0.18, height * 0.06);
    //I
    ovalPath.quadraticBezierTo(
        width * 0.1, height * 0.08, width * 0.05, height * 0.16);
    //J

    ovalPath.close();

    paint.color = Colors.blue.shade700;
    canvas.drawPath(ovalPath, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return oldDelegate != this;
  }
}
