import 'package:flutter/material.dart';

class MyBlobContainer extends StatelessWidget {
  final Color myBlobColor;
  final int myBlobNumber;
  final Widget child;
  MyBlobContainer({
    this.child,
    this.myBlobColor,
    this.myBlobNumber,
  });
  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: (myBlobNumber == 4)
          ? BlobPainter4(myBlobColor: myBlobColor)
          : (myBlobNumber == 3)
              ? BlobPainter3(myBlobColor: myBlobColor)
              : (myBlobNumber == 2)
                  ? BlobPainter2(myBlobColor: myBlobColor)
                  : BlobPainter1(myBlobColor: myBlobColor),
      child: child,
    );
  }
}

class BlobPainter1 extends CustomPainter {
  final Color myBlobColor;
  BlobPainter1({this.myBlobColor});
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

    paint.color = myBlobColor;
    canvas.drawPath(ovalPath, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return oldDelegate != this;
  }
}

class BlobPainter2 extends CustomPainter {
  final Color myBlobColor;
  BlobPainter2({this.myBlobColor});
  @override
  void paint(Canvas canvas, Size size) {
    final height = size.height;
    final width = size.width;
    Paint paint = Paint();

    Path ovalPath = Path();

    ovalPath.moveTo(width * 0.03, height * 0.13); // starting point
    //A

    ovalPath.quadraticBezierTo(0, height * 0.27, width * 0.007, height * 0.5);
    //B

    ovalPath.quadraticBezierTo(0, height * 0.88, width * 0.4, height * 0.92);
    //C

    ovalPath.lineTo(width * 0.8, height * 0.99);
    //D

    ovalPath.quadraticBezierTo(
        width * 0.99, height * 1, width * 0.94, height * 0.3);
    //E

    // ovalPath.quadraticBezierTo(width, height * 0.1, width * 0.8, height * 0.06);
    //F

    ovalPath.quadraticBezierTo(
        width * 0.90, height * 0.02, width * 0.4, height * 0.03);
    //H

    ovalPath.quadraticBezierTo(
        width * 0.29, height * 0.03, width * 0.18, height * 0.02);
    //I
    ovalPath.quadraticBezierTo(
        width * 0.06, height * 0.03, width * 0.03, height * 0.13);
    //J

    ovalPath.close();

    paint.color = myBlobColor;
    canvas.drawPath(ovalPath, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return oldDelegate != this;
  }
}

class BlobPainter3 extends CustomPainter {
  final Color myBlobColor;
  BlobPainter3({this.myBlobColor});
  @override
  void paint(Canvas canvas, Size size) {
    final height = size.height;
    final width = size.width;
    Paint paint = Paint();

    Path ovalPath = Path();

    ovalPath.moveTo(width * 0.06, height * 0.1); // starting point
    //A

    ovalPath.quadraticBezierTo(0, height * 0.27, width * 0.007, height * 0.5);
    //B

    ovalPath.quadraticBezierTo(0, height * 0.88, width * 0.4, height * 0.92);
    //C

    ovalPath.lineTo(width * 0.8, height * 0.99);
    //D

    ovalPath.quadraticBezierTo(
        width * 0.99, height * 1.0, width * 0.94, height * 0.5);
    //E

    ovalPath.quadraticBezierTo(
        width * 0.89, height * 0.0, width * 0.7, height * 0.04);
    //F

    ovalPath.quadraticBezierTo(
        width * 0.40, height * 0.02, width * 0.4, height * 0.03);
    //H

    ovalPath.quadraticBezierTo(
        width * 0.29, height * 0.03, width * 0.18, height * 0.02);
    //I
    ovalPath.quadraticBezierTo(
        width * 0.1, height * 0.0, width * 0.06, height * 0.1);
    //J

    ovalPath.close();

    paint.color = myBlobColor;
    canvas.drawPath(ovalPath, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return oldDelegate != this;
  }
}

class BlobPainter4 extends CustomPainter {
  final Color myBlobColor;
  BlobPainter4({this.myBlobColor});
  @override
  void paint(Canvas canvas, Size size) {
    final height = size.height;
    final width = size.width;
    Paint paint = Paint();

    Path ovalPath = Path();

    ovalPath.moveTo(width * 0.052, height * 0.07); // starting point
    //A

    ovalPath.quadraticBezierTo(0, height * 0.27, width * 0.007, height * 0.5);
    //B

    ovalPath.quadraticBezierTo(0, height * 0.88, width * 0.4, height * 0.92);
    //C

    ovalPath.lineTo(width * 0.8, height * 0.99);
    //D

    ovalPath.quadraticBezierTo(
        width * 0.99, height * 1.0, width * 0.94, height * 0.5);
    //E

    ovalPath.quadraticBezierTo(
        width * 0.89, height * 0.2, width * 0.7, height * 0.12);
    //F

    ovalPath.quadraticBezierTo(
        width * 0.60, height * 0.05, width * 0.4, height * 0.05);
    //H

    ovalPath.quadraticBezierTo(
        width * 0.29, height * 0.05, width * 0.18, height * 0.03);
    //I
    ovalPath.quadraticBezierTo(
        width * 0.08, height * 0.01, width * 0.052, height * 0.07);
    //J

    ovalPath.close();

    paint.color = myBlobColor;
    canvas.drawPath(ovalPath, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return oldDelegate != this;
  }
}
