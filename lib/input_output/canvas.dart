import 'package:digit_finder/server/DrawingPoints.dart';
import 'package:digit_finder/screen/PainterClass.dart';
import 'package:flutter/material.dart';

List<DrawingPoint> points = [];

class DrawingBoard extends StatefulWidget {
  @override
  _DrawingBoardState createState() => _DrawingBoardState();
}

class _DrawingBoardState extends State<DrawingBoard> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onPanUpdate: (details) {
        setState(() {
          RenderBox renderBox = context.findRenderObject();
          points.add(DrawingPoint(
              points: renderBox.globalToLocal(details.globalPosition),
              paint: Paint()
                ..strokeCap = StrokeCap.round
                ..isAntiAlias = true
                ..color = Colors.black
                ..strokeWidth = 25.0));
        });
      },
      onPanStart: (details) {
        setState(() {
          RenderBox renderBox = context.findRenderObject();
          points.add(DrawingPoint(
              points: renderBox.globalToLocal(details.globalPosition),
              paint: Paint()
                ..strokeCap = StrokeCap.round
                ..isAntiAlias = true
                ..color = Colors.red
                ..strokeWidth = 25.0));
        });
      },
      onPanEnd: (details) {
        setState(() {
          points.add(null);
        });
      },
      child: CustomPaint(
        size: Size.infinite,
        painter: DrawingPainter(pointsList: points),
      ),
    );
  }
}

class Draw1 extends ChangeNotifier {
  Widget cleancanvas() {
    return FloatingActionButton(
      child: Icon(Icons.clear),
      onPressed: () {
        points.clear();
        notifyListeners();
      },
    );
  }

  void clean() {
    points.clear();
    notifyListeners();
  }
}
