import 'dart:typed_data';
import 'dart:ui' as ui;
import 'dart:ui';

// import 'package:animated_floatactionbuttons/animated_floatactionbuttons.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:match/controllers/menu_controller.dart';
import 'package:provider/provider.dart';
import 'package:saver_gallery/saver_gallery.dart';
// import 'package:image_gallery_saver/image_gallery_saver.dart';
// import 'package:permission_handler/permission_handler.dart';

//void main() => runApp(CanvasPainting());

class CanvasPainting extends StatefulWidget {
  const CanvasPainting({super.key});

  @override
  _CanvasPaintingState createState() => _CanvasPaintingState();
}

class _CanvasPaintingState extends State<CanvasPainting> {
  GlobalKey globalKey = GlobalKey();
  late MyMenuController menuController;
  List<TouchPoints?> points = [];
  double opacity = 1.0;
  StrokeCap strokeType = StrokeCap.round;
  double strokeWidth = 3.0;
  Color selectedColor = Colors.black;

  Future<void> _pickStroke() async {
    //Shows AlertDialog
    return showDialog<void>(
      context: context,

      //Dismiss alert dialog when set true
      barrierDismissible: true, // user must tap button!
      builder: (BuildContext context) {
        //Clips its child in a oval shape
        return ClipOval(
          child: AlertDialog(
            //Creates three buttons to pick stroke value.
            actions: <Widget>[
              //Resetting to default stroke value
              ElevatedButton(
                child: const Icon(
                  Icons.clear,
                ),
                onPressed: () {
                  strokeWidth = 3.0;
                  Navigator.of(context).pop();
                },
              ),
              ElevatedButton(
                child: const Icon(
                  Icons.brush,
                  size: 24,
                ),
                onPressed: () {
                  strokeWidth = 10.0;
                  Navigator.of(context).pop();
                },
              ),
              ElevatedButton(
                child: const Icon(
                  Icons.brush,
                  size: 40,
                ),
                onPressed: () {
                  strokeWidth = 30.0;
                  Navigator.of(context).pop();
                },
              ),
              ElevatedButton(
                child: const Icon(
                  Icons.brush,
                  size: 60,
                ),
                onPressed: () {
                  strokeWidth = 50.0;
                  Navigator.of(context).pop();
                },
              ),
            ],
          ),
        );
      },
    );
  }
// void 
_selectColor() async {
  print('selecting color');
    Color? color = await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        // title: Text('Select Color'),
        content: SingleChildScrollView(
          child: BlockPicker(
            pickerColor: selectedColor,
            onColorChanged: (color) {
              setState(() {
                selectedColor = color;
              });
            },
          ),
        ),
        actions: [
          TextButton(
            child: const Text('Done'),
            onPressed: () {
              Navigator.of(context).pop(selectedColor);
            },
          ),
        ],
      ),
    );

    if (color != null) {
      setState(() {
        selectedColor = color;
      });
    }
  }
  Future<void> _opacity() async {
    //Shows AlertDialog
    return showDialog<void>(
      context: context,

      //Dismiss alert dialog when set true
      barrierDismissible: true,

      builder: (BuildContext context) {
        //Clips its child in a oval shape
        return ClipOval(
          child: AlertDialog(
            //Creates three buttons to pick opacity value.
            actions: <Widget>[
              ElevatedButton(
                child: const Icon(
                  Icons.opacity,
                  size: 24,
                ),
                onPressed: () {
                  //most transparent
                  opacity = 0.1;
                  Navigator.of(context).pop();
                },
              ),
              ElevatedButton(
                child: const Icon(
                  Icons.opacity,
                  size: 40,
                ),
                onPressed: () {
                  opacity = 0.5;
                  Navigator.of(context).pop();
                },
              ),
              ElevatedButton(
                child: const Icon(
                  Icons.opacity,
                  size: 60,
                ),
                onPressed: () {
                  //not transparent at all.
                  opacity = 1.0;
                  Navigator.of(context).pop();
                },
              ),
            ],
          ),
        );
      },
    );
  }

  // Future<void> _save() async {
  //   RenderRepaintBoundary boundary =
  //       globalKey.currentContext.findRenderObject();
  //   ui.Image image = await boundary.toImage();
  //   ByteData byteData = await image.toByteData(format: ui.ImageByteFormat.png);
  //   Uint8List pngBytes = byteData.buffer.asUint8List();

  //   //Request permissions if not already granted
  //   if (!(await Permission.storage.status.isGranted))
  //     await Permission.storage.request();

  //   final result = await ImageGallerySaver.saveImage(
  //       Uint8List.fromList(pngBytes),
  //       quality: 60,
  //       name: "canvas_image");
  //   print(result);
  // }

  List<Widget> fabOption() {
    return <Widget>[
      FloatingActionButton(
        heroTag: "paint_save",
        tooltip: 'Save',
        onPressed: () {
          //min: 0, max: 50
          setState(() {
            // _save();
          });
        },
        child: const Icon(Icons.save),
      ),
      FloatingActionButton(
        heroTag: "paint_stroke",
        tooltip: 'Stroke',
        onPressed: () {
          //min: 0, max: 50
          setState(() {
            _pickStroke();
          });
        },
        child: const Icon(Icons.brush),
      ),
      // FloatingActionButton(
      //   heroTag: "paint_opacity",
      //   child: Icon(Icons.opacity),
      //   tooltip: 'Opacity',
      //   onPressed: () {
      //     //min:0, max:1
      //     setState(() {
      //       _opacity();
      //     });
      //   },
      // ),
      FloatingActionButton(
          heroTag: "erase",
          tooltip: "Erase",
          onPressed: () {
            setState(() {
              points.clear();
            });
          },
          child: const Icon(Icons.clear)),
      FloatingActionButton(
        backgroundColor: Colors.white,
        heroTag: "color",
        tooltip: 'Color',
        onPressed: ()  {
            _selectColor();
          // setState(() {
           
          //   // selectedColor = Colors.red;
          // });
        },
        child: colorMenuItem(selectedColor),
      ),
      // FloatingActionButton(
      //   backgroundColor: Colors.white,
      //   heroTag: "color_green",
      //   child: colorMenuItem(Colors.green),
      //   tooltip: 'Color',
      //   onPressed: () {
      //     setState(() {
      //       selectedColor = Colors.green;
      //     });
      //   },
      // ),
      // FloatingActionButton(
      //   backgroundColor: Colors.white,
      //   heroTag: "color_pink",
      //   child: colorMenuItem(Colors.pink),
      //   tooltip: 'Color',
      //   onPressed: () {
      //     setState(() {
      //       selectedColor = Colors.pink;
      //     });
      //   },
      // ),
      // FloatingActionButton(
      //   backgroundColor: Colors.white,
      //   heroTag: "color_blue",
      //   child: colorMenuItem(Colors.blue),
      //   tooltip: 'Color',
      //   onPressed: () {
      //     setState(() {
      //       selectedColor = Colors.blue;
      //     });
      //   },
      // ),
    ];
  }
  var scr = GlobalKey();

  @override
  void initState() {
    menuController=Provider.of<MyMenuController>(context, listen: false);
    // TODO: implement initState
    super.initState();
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
    androidRelativePath: "Pictures/doudi/coloring/${menuController.selectedNumber}",
    skipIfExists: false,
  );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: RepaintBoundary(
          key: scr,
          child: Container(
            color: Colors.white,
            child: GestureDetector(
              onPanUpdate: (details) {
                setState(() {
                  RenderBox renderBox = context.findRenderObject() as RenderBox;
                  points.add(TouchPoints(
                      points: renderBox.globalToLocal(details.globalPosition),
                      paint: Paint()
                        ..strokeCap = strokeType
                        ..isAntiAlias = true
                        ..color = selectedColor.withOpacity(opacity)
                        ..strokeWidth = strokeWidth));
                });
              },
              onPanStart: (details) {
                setState(() {
                  RenderBox renderBox = context.findRenderObject() as RenderBox;
                  points.add(TouchPoints(
                      points: renderBox.globalToLocal(details.globalPosition),
                      paint: Paint()
                        ..strokeCap = strokeType
                        ..isAntiAlias = true
                        ..color = selectedColor.withOpacity(opacity)
                        ..strokeWidth = strokeWidth));
                });
              },
              onPanEnd: (details) {
                setState(() {
                  points.add(null);
                });
              },
              child: RepaintBoundary(
                key: globalKey,
                child: Stack(
                  children: <Widget>[
                    Center(
                      child: Image.asset("assets/images/number/color${menuController.selectedNumber}.png"),
                      // child: Image.asset("assets/images/number/color${menuController.selectedNumber}.png"),
                    ),
                    CustomPaint(
                      size: Size.infinite,
                      painter: MyPainter(
                        pointsList: points,
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
                    Positioned(
                      right: 10,
                      child: SizedBox(
                        height: MediaQuery.of(context).size.height,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          FloatingActionButton(
                                heroTag: "paint_save",
                                tooltip: 'Save',
                                onPressed: () {
                                  takescrshot();
                                  //min: 0, max: 50
                                  // setState(() {
                                  //   // _save();
                                  // });
                                },
                                child: const Icon(Icons.save),
                              ),
                              FloatingActionButton(
                                heroTag: "paint_stroke",
                                tooltip: 'Stroke',
                                onPressed: () {
                                  //min: 0, max: 50
                                  setState(() {
                                    _pickStroke();
                                  });
                                },
                                child: const Icon(Icons.brush),
                              ),
                              // FloatingActionButton(
                              //   heroTag: "paint_opacity",
                              //   child: Icon(Icons.opacity),
                              //   tooltip: 'Opacity',
                              //   onPressed: () {
                              //     //min:0, max:1
                              //     setState(() {
                              //       _opacity();
                              //     });
                              //   },
                              // ),
                              FloatingActionButton(
                                  heroTag: "erase",
                                  tooltip: "Erase",
                                  onPressed: () {
                                    setState(() {
                                      points.clear();
                                    });
                                  },
                                  child: const Icon(Icons.restart_alt)),
                              FloatingActionButton(
                                // backgroundColor: Colors.white,
                                heroTag: "color",
                                tooltip: 'Color',
                                onPressed: ()  {
                                    _selectColor();
                                  // setState(() {
                                   
                                  //   // selectedColor = Colors.red;
                                  // });
                                },
                                child: colorMenuItem(selectedColor),
                              ),
                        ],
                                        ),
                      ),)
                  ],
                ),
              ),
            ),
          ),
        ),
        // floatingActionButton: 
        // AnimatedFloatingActionButton(
        //   fabButtons: fabOption(),
        //   colorStartAnimation: Colors.blue,
        //   colorEndAnimation: Colors.cyan,
        //   animatedIconData: AnimatedIcons.menu_close,
        // ),
      ),
    );
  }

  Widget colorMenuItem(Color color) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedColor = color;
        });
      },
      child: GestureDetector(
        onTap: (){
          _selectColor();
        },
        child: Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: color,
          ),
          padding: const EdgeInsets.only(bottom: 8.0),
          height: 36,
          width: 36,
          
        ),
      ),
    );
  }
}

class MyPainter extends CustomPainter {
  MyPainter({required this.pointsList});

  //Keep track of the points tapped on the screen
  final List<TouchPoints?> pointsList;
  List<Offset> offsetPoints = [];

  //This is where we can draw on canvas.
  @override
  void paint(Canvas canvas, Size size) {
    for (int i = 0; i < pointsList.length - 1; i++) {
      if (pointsList[i] != null && pointsList[i + 1] != null) {
        //Drawing line when two consecutive points are available
        canvas.drawLine(pointsList[i]!.points!, pointsList[i + 1]!.points!,
            pointsList[i]!.paint!);
      } else if (pointsList[i] != null && pointsList[i + 1] == null) {
        offsetPoints.clear();
        offsetPoints.add(pointsList[i]!.points!);
        offsetPoints.add(Offset(
            pointsList[i]!.points!.dx + 0.1, pointsList[i]!.points!.dy + 0.1));

        //Draw points when two points are not next to each other
        canvas.drawPoints(
            ui.PointMode.points, offsetPoints, pointsList[i]!.paint!);
      }
    }
  }

  //Called when CustomPainter is rebuilt.
  //Returning true because we want canvas to be rebuilt to reflect new changes.
  @override
  bool shouldRepaint(MyPainter oldDelegate) => true;
}

//Class to define a point touched at canvas
class TouchPoints {
  Paint? paint;
  Offset? points;
  TouchPoints({this.points, this.paint});
}