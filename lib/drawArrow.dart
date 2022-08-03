
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Arrowpaint extends CustomPainter{
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint();
    var path = Path();
    paint.color = Colors.grey;
    paint.style = PaintingStyle.stroke;
    paint.strokeWidth = 1;
    path.moveTo(0, size.height*0.8);
    path.lineTo(size.width*0.8, size.height*0.8);
    path.lineTo(size.width*0.8, size.height*0.2);
    path.moveTo(size.width*0.75, size.height*0.25);
    path.lineTo(size.width*0.8, size.height*0.15);
    path.lineTo(size.width*0.85, size.height*0.25);
    canvas.drawPath(path, paint);
    // TODO: implement paint
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    // throw UnimplementedError();
    return false;
  }

}
class Arrowpaint2 extends CustomPainter{
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint();
    var path = Path();
    paint.color = Colors.grey;
    paint.style = PaintingStyle.stroke;
    paint.strokeWidth = 1;
    path.moveTo(size.width, size.height*0.8);
    path.lineTo(size.width*0.2, size.height*0.8);
    path.lineTo(size.width*0.2, size.height*0.2);
    path.moveTo(size.width*0.15, size.height*0.25);
    path.lineTo(size.width*0.2, size.height*0.15);
    path.lineTo(size.width*0.25, size.height*0.25);
    canvas.drawPath(path, paint);
    // TODO: implement paint
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    // throw UnimplementedError();
    return false;
  }

}

class simplearrow extends CustomPainter{
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint();
    var path = Path();
    paint.color = Colors.grey;
    paint.strokeWidth = 1;
    paint.style = PaintingStyle.stroke;
    path.moveTo(0, size.height*0.5);
    path.lineTo(size.width*0.8, size.height*0.5);
    path.moveTo(size.width*0.75, size.height*0.40);
    path.lineTo(size.width*0.85, size.height*0.5);
    path.lineTo(size.width*0.75, size.height*0.60);
    canvas.drawPath(path, paint);
    // TODO: implement paint
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return false;
  }

}