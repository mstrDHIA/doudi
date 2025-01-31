import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:match/controllers/menu_controller.dart';
import 'package:provider/provider.dart';

class ColoringGameScreen extends StatefulWidget {
  @override
  _ColoringGameScreenState createState() => _ColoringGameScreenState();
}

class _ColoringGameScreenState extends State<ColoringGameScreen> {
  late MyMenuController menuController;
  List<Offset?> points = [];
  @override
  void initState() {
    menuController=Provider.of<MyMenuController>(context,listen: false);
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          GestureDetector(
            onPanUpdate: (details) {
              setState(() {
                RenderBox renderBox = context.findRenderObject() as RenderBox;
                points.add(renderBox.globalToLocal(details.localPosition));
              });
            },
            onPanEnd: (details) {
              points.add(null);
            },
            child: CustomPaint(
              size: Size.infinite,
              painter: ColoringPainter(points),
              child: Center(child: Image.asset("assets/images/number/color${menuController.selectedNumber}.png"),),
            ),
          ),
        ],
      ),
    );
  }
}

class ColoringPainter extends CustomPainter {
  final List<Offset?> points;

  ColoringPainter(this.points);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.blue
      ..strokeWidth = 10.0
      ..strokeCap = StrokeCap.round;

    for (int i = 0; i < points.length - 1; i++) {
      if (points[i] != null && points[i + 1] != null) {
        canvas.drawLine(points[i]!, points[i + 1]!, paint);
      } else if (points[i] != null && points[i + 1] == null) {
        canvas.drawPoints(PointMode.points, [points[i]!], paint);
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}