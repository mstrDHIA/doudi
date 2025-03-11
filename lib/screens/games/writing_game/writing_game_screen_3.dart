import 'dart:io';
import 'dart:typed_data';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:match/controllers/menu_controller.dart';
import 'package:provider/provider.dart';
import 'package:saver_gallery/saver_gallery.dart';
import 'package:screenshot/screenshot.dart';

class WritingGameScreen3 extends StatefulWidget {
  const WritingGameScreen3({super.key});

  @override
  _WritingGameScreen3State createState() => _WritingGameScreen3State();
}

class _WritingGameScreen3State extends State<WritingGameScreen3> {
  List<int> size=[1,2,4,8,12,20,24,30,];
  ScreenshotController screenshotController = ScreenshotController(); 

  List<Offset?> points = [];
  late MyMenuController menuController ;
  int count=1;
  late double screenWidth ;
    late double screenHeight;
    late int crossAxisCount ; 
    late double itemHeight ; 
    late double fontSize ; 
  var scr = GlobalKey();

  @override
  void initState() {
    menuController=Provider.of<MyMenuController>(context, listen: false);
    super.initState();
  }
  @override
  void didChangeDependencies() {
  
    super.didChangeDependencies();
  }

  takescrshot() async {
  RenderRepaintBoundary boundary = scr.currentContext!.findRenderObject() as RenderRepaintBoundary; // the key provided
  var image = await boundary.toImage();
  var byteData = await image.toByteData(format: ImageByteFormat.png);
  var pngBytes = byteData!.buffer.asUint8List();
  final result = await SaverGallery.saveImage(
    Uint8List.fromList(pngBytes),
    quality: 60,
    fileName: menuController.selectedNumber.toString(),
    androidRelativePath: "Pictures/doudi/writing/${menuController.selectedNumber}",
    skipIfExists: false,
  );
  }

  @override
  Widget build(BuildContext context) {
     screenWidth = MediaQuery.of(context).size.width;
     screenHeight = MediaQuery.of(context).size.height;
     crossAxisCount = (screenWidth / 200).floor(); // Number of columns
     itemHeight = screenHeight / (count / crossAxisCount).ceil(); // Height of each item
     fontSize = itemHeight / 2; // Adjust font size based on item height
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
        label: Text((count<16)?"التالي":"النهاية"),
        onPressed: () async {
          if(count<16){
                 setState(() {
                  
                      points.clear();
                      count*=2;
                    });}
                    else{
                      Navigator.pop(context);
                    }
          takescrshot();
   
}),
      body: RepaintBoundary(
        key: scr,
        child: Stack(
          children: [
        
            Positioned(
              child: Container(
              color: Colors.white,
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
                    color: Colors.grey[800],
                    fontWeight: FontWeight.w100,
                  ),
                ),
                         );
                      },
                    ),
             ),
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
            Positioned(   
              top: 20,
              right: 20,
              child: GestureDetector(
                onTap: () {
                  
                  setState(() {
                    points.clear();
                  });
                },
                child: Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: Colors.green,
        
                  ),
                  child: const Icon(Icons.restart_alt,color: Colors.white,),
                ),
              ),
            ),
        //     Positioned(bottom: 20,right: 20,child: ElevatedButton(onPressed: () async {
        // //       final directory = (await getApplicationDocumentsDirectory ()).path; //from path_provide package
        // //       String fileName = 'example.png';
        // //       String path = '$directory';
        // //       screenshotController.captureAndSave(
        // //     path, //set path where screenshot will be saved
        // //     fileName:fileName 
        // // );
        //       // screenshotController.capture().then((Uint8List? image) {
        //       //   setState(() {
        //       //     _imageFile = image;
        //       //   });
        //       // });
        //       if(count<16){
        //        setState(() {
                
        //             points.clear();
        //             count*=2;
        //           });}
        //           else{
        //             Navigator.pop(context);
        //           }
        //     }, child: Text((count<16)?"التالي":"النهاية")),),
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