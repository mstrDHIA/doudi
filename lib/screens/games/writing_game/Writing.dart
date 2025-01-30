import 'dart:ui';

import 'package:flutter/material.dart';

class WritingGameScreenTest extends StatefulWidget {
  @override
  _WritingGameScreenState createState() => _WritingGameScreenState();
}

class _WritingGameScreenState extends State<WritingGameScreenTest> {
  List<int> numbers = [1,]; // Example list of numbers
  List<Offset?> points = [];

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    int crossAxisCount = (screenWidth / 200).floor(); // Number of columns
    double itemHeight = screenHeight / (numbers.length / crossAxisCount).ceil(); // Height of each item
    double fontSize = screenWidth / (numbers.length * 2); // Adjust font size based on number of items

    return Scaffold(
      body: Stack(
        children: [
          GridView.builder(
            padding: const EdgeInsets.all(20.0),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: crossAxisCount, // Number of columns
              mainAxisSpacing: 10.0,
              crossAxisSpacing: 10.0,
              childAspectRatio: (screenWidth / crossAxisCount) / itemHeight, // Aspect ratio of each item
            ),
            itemCount: numbers.length,
            itemBuilder: (context, index) {
              return Center(
                child: Text(
                  numbers[index].toString(),
                  style: TextStyle(
                    fontSize: fontSize,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              );
            },
          ),
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
        ],
      ),
    );
  }
}

class DrawingPainter extends CustomPainter {
  final List<Offset?> points;

  DrawingPainter(this.points);

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = Colors.red
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 5.0;

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