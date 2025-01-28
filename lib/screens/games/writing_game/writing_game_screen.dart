import 'dart:ui';

import 'package:flutter/material.dart';

class WritingGameScreen extends StatefulWidget {
  const WritingGameScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _WritingGameScreenState createState() => _WritingGameScreenState();
}

class _WritingGameScreenState extends State<WritingGameScreen> {
  List<Offset?> points = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('Learn to Write Number 1'),
      // ),
      body: Stack(
        children: [
          
          // Blueprint of the number 1
          Center(
            child: CustomPaint(
              size: const Size(200, 400),
              painter: NumberOnePainter(),
            ),
          ),
          // User's drawing
          GestureDetector(
            onPanUpdate: (details) {
              setState(() {
                RenderBox renderBox = context.findRenderObject() as RenderBox;
                points.add(renderBox.globalToLocal(details.globalPosition));
              });
            },
            onPanEnd: (details) {
              points.add(null);
            },
            child: CustomPaint(
              size: Size.infinite,
              painter: DrawingPainter(points),
            ),
          ),
          Positioned(
                      top: 20,
                      left: 20,
                      child: GestureDetector(
                        onTap: () => Navigator.pop(context),
                        child: CircleAvatar(child: Padding(
                          padding: const EdgeInsets.all(6.0),
                          child: Image.asset("assets/icons/back.png",width: 50,height: 50,),
                        )),
                      )),
        ],
      ),
    );
  }
}

class NumberOnePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.grey
      ..strokeWidth = 4.0
      ..style = PaintingStyle.stroke;

    final path = Path();
    path.moveTo(size.width / 3, size.height * 0.3);
    path.lineTo(size.width / 2, size.height * 0.1);
    path.moveTo(size.width / 2, size.height * 0.1);
    path.lineTo(size.width / 2, size.height * 0.9);
    path.moveTo(size.width / 5, size.height * 0.9);
    path.lineTo(size.width / 1.3, size.height * 0.9);
    // path.moveTo(size.width / 2, size.height * 0.1);
    // path.lineTo(size.width / 2, size.height * 0.9);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}

class DrawingPainter extends CustomPainter {
  final List<Offset?> points;

  DrawingPainter(this.points);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.blue
      ..strokeWidth = 4.0
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