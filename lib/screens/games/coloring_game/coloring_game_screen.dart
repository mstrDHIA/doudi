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
  Color selectedColor = Colors.blue;
  double strokeWidth = 5.0;
  bool isEraser = false;
  @override
  void initState() {
    menuController=Provider.of(context,listen: false);
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   actions: [
          
      //   ],
      // ),
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
              painter: ColoringPainter(points, selectedColor, strokeWidth, isEraser),
              child: Container(
                width: MediaQuery.sizeOf(context).width,
                height: MediaQuery.sizeOf(context).height,
                child: Center(
                  child: Image.asset(
                    "assets/images/number/color${menuController.selectedNumber}.png",
                    width: 1000,
                    ),
                ),
              ),
            ),
          ),
          Positioned(
            right: 10,
            child: PopupMenuButton<String>(
              child: Image.asset("assets/icons/palette.png",scale: 1.5,),
              onSelected: (value) {
                switch (value) {
                  // case 'Color':
                  //   _selectColor();
                    // break;
                  case 'Stroke Width':
                    _selectStrokeWidth();
                    break;
                  case 'Eraser':
                    setState(() {
                      isEraser = !isEraser;
                    });
                    break;
                }
              },
              itemBuilder: (BuildContext context) {
                return {'Color', 'Stroke Width', 'Eraser'}.map((String choice) {
                  return PopupMenuItem<String>(
                    value: choice,
                    child: Text(choice),
                  );
                }).toList();
              },
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

  // void _selectColor() async {
  //   Color? color = await showDialog(
  //     context: context,
  //     builder: (context) => AlertDialog(
  //       title: Text('Select Color'),
  //       content: SingleChildScrollView(
  //         child: BlockPicker(
  //           pickerColor: selectedColor,
  //           onColorChanged: (color) {
  //             setState(() {
  //               selectedColor = color;
  //               isEraser = false;
  //             });
  //           },
  //         ),
  //       ),
  //       actions: [
  //         TextButton(
  //           child: Text('Done'),
  //           onPressed: () {
  //             Navigator.of(context).pop(selectedColor);
  //           },
  //         ),
  //       ],
  //     ),
  //   );

  //   if (color != null) {
  //     setState(() {
  //       selectedColor = color;
  //     });
  //   }
  // }

  void _selectStrokeWidth() async {
    double? width = await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Select Stroke Width'),
        content: Slider(
          value: strokeWidth,
          min: 1.0,
          max: 10.0,
          divisions: 9,
          label: strokeWidth.round().toString(),
          onChanged: (value) {
            setState(() {
              strokeWidth = value;
            });
          },
        ),
        actions: [
          TextButton(
            child: Text('Done'),
            onPressed: () {
              Navigator.of(context).pop(strokeWidth);
            },
          ),
        ],
      ),
    );

    if (width != null) {
      setState(() {
        strokeWidth = width;
      });
    }
  }
}

class ColoringPainter extends CustomPainter {
  final List<Offset?> points;
  final Color color;
  final double strokeWidth;
  final bool isEraser;

  ColoringPainter(this.points, this.color, this.strokeWidth, this.isEraser);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = isEraser ? Colors.white : color
      ..strokeWidth = strokeWidth
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