import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:match/controllers/menu_controller.dart';
import 'package:match/screens/games/writing_game/painters/number_three_painter.dart';
import 'package:provider/provider.dart';
// import 'number_three_painter.dart'; // Import the NumberThreePainter

class WritingGameScreen3 extends StatefulWidget {
  @override
  _WritingGameScreen3State createState() => _WritingGameScreen3State();
}

class _WritingGameScreen3State extends State<WritingGameScreen3> {
  List<int> size=[1,2,4,8,12,20,24,30,];
    // List<int> numbers = [1,]; // Example list of numbers

  List<Offset?> points = [];
  late MyMenuController menuController ;
  int count=1;
  late double screenWidth ;
    late double screenHeight;
    late int crossAxisCount ; // Number of columns
    late double itemHeight ; // Height of each item
    late double fontSize ; // Adjust font size based on item height
  // int myCount=1;
  @override
  void initState() {
    menuController=Provider.of<MyMenuController>(context, listen: false);
    // TODO: implement initState
    super.initState();
  }
  @override
  void didChangeDependencies() {
    //      screenWidth = MediaQuery.of(context).size.width;
    //  screenHeight = MediaQuery.of(context).size.height;
    //  crossAxisCount = (screenWidth / 200).floor(); // Number of columns
    //  itemHeight = screenHeight / (numbers.length / crossAxisCount).ceil(); // Height of each item
    //  fontSize = itemHeight / 2; // Adjust font size based on item height
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
  }
  @override
  Widget build(BuildContext context) {
     screenWidth = MediaQuery.of(context).size.width;
     screenHeight = MediaQuery.of(context).size.height;
     crossAxisCount = (screenWidth / 200).floor(); // Number of columns
     itemHeight = screenHeight / (count / crossAxisCount).ceil(); // Height of each item
     fontSize = itemHeight / 2; // Adjust font size based on item height
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            // top: 0,
            // left: 0,
            // right: 20,
           child: GridView.builder(
                  padding: const EdgeInsets.all(20.0),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: crossAxisCount, // Number of columns
          mainAxisSpacing: 10.0,
          crossAxisSpacing: 10.0,
          childAspectRatio: (screenWidth / crossAxisCount) / itemHeight, // Aspect ratio of each item
                  ),
                  itemCount: count,
                  itemBuilder: (context, index) {
          return Center(
            child: Text(
              menuController.selectedNumber.toString(),
              style: TextStyle(
                fontFamily: 'Trace',
                fontSize: fontSize,
                color: Colors.grey[300],
                fontWeight: FontWeight.w100,
              ),
            ),
          );
                  },
                ),
          ),
          // Blueprint of the number 3

          // if(count<=4)
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.center,
          //   children: [
          //     for(int i=0;i<count;i++)
          //     Center(child: Text(menuController.selectedNumber.toString(),style: TextStyle(fontSize: (count<=4)?300:200,color: Colors.grey[300],fontWeight: FontWeight.w100),)),],
          // ),
          // if(count>4)
          // Column(
          //   mainAxisSize: MainAxisSize.min,
          //   mainAxisAlignment: MainAxisAlignment.start,
          //   children: [
              
          //     for(int i=0;i<count~/4;i++)
          //     Row(
          //       mainAxisAlignment: MainAxisAlignment.center,
          //       children: [
          //         for(int i=0;i<4;i++)
          //         Center(child: Text(menuController.selectedNumber.toString(),style: TextStyle(fontSize: (count<=4)?300:100,color: Colors.grey[300],fontWeight: FontWeight.w100),)),],
          //     ),
          //   ]
          //     // Center(child: Text(menuController.selectedNumber.toString(),style: TextStyle(fontSize: (count<=4)?300:200,color: Colors.grey[300],fontWeight: FontWeight.w100),)),],
          // ),

          // Center(
          //   child: CustomPaint(
          //     size: const Size(200, 400),
          //     painter: NumberThreePainter(),
          //   ),
          // ),
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
              onTap: () {
                setState(() {
                  points.clear();
                });
              },
              child: Container(
                padding: const EdgeInsets.all(10),
                color: Colors.blue,
                child: const Text(
                  'Clear',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ),
          Positioned(child: ElevatedButton(onPressed: (){
            if(count<16){
             setState(() {
              
                  points.clear();
                  count*=2;
                });}
                else{
                  Navigator.pop(context);
                }
          }, child: Text((count<16)?"Next":"Done")),bottom: 20,right: 20,)
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
      ..color = Colors.black
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