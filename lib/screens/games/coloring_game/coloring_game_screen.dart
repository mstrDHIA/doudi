import 'dart:ui';

import 'package:flutter/material.dart';

class ColoringGameScreen extends StatefulWidget {
  const ColoringGameScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _ColoringGameScreenState createState() => _ColoringGameScreenState();
}

class _ColoringGameScreenState extends State<ColoringGameScreen> {
  List<Offset?> points = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Coloring Game'),
      ),
      body: Stack(
        children: [
          
          // Blueprint of the number 1
          // Center(
          //   child: CustomPaint(
          //     size: Size(200, 400),
          //     painter: NumberOnePainter(),
          //   ),
          // ),
          // User's coloring
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
              painter: ColoringPainter(points),
              child:Center(child: Image.asset("assets/images/number/color1.png")),
            ),
            
          ),
          
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
    path.moveTo(size.width / 2, size.height * 0.1);
    path.lineTo(size.width / 2, size.height * 0.9);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
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