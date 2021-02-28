import 'dart:ui';
import 'package:digit_finder/server/DrawingPoints.dart';
import 'package:flutter/material.dart';

class DrawingPainter extends CustomPainter {
  DrawingPainter({this.pointsList});
  List<DrawingPoint> pointsList;
  List<Offset> offsetPoints = [];
  @override
  void paint(Canvas canvas, Size size) {
    for (int i = 0; i < pointsList.length - 1; i++) {
      if (pointsList[i] != null && pointsList[i + 1] != null) {
        canvas.drawLine(pointsList[i].points, pointsList[i + 1].points,
            pointsList[i].paint);
      }
      // } else if (pointsList[i] != null && pointsList[i + 1] == null) {
      //   offsetPoints.clear();
      //   offsetPoints.add(pointsList[i].points);
      //   offsetPoints.add(Offset(
      //       pointsList[i].points.dx + 0.1, pointsList[i].points.dy + 0.1));
      //   canvas.drawPoints(PointMode.points, offsetPoints, pointsList[i].paint);
      // }
    }
  }

  @override
  bool shouldRepaint(DrawingPainter oldDelegate) => true;
}
