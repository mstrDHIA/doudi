import 'dart:math';

import 'package:flutter/material.dart';
import 'package:match/controllers/colors_controller.dart';
import 'package:provider/provider.dart';
import 'package:stroke_text/stroke_text.dart';

class ColorCircle extends StatefulWidget{
  final int index;

  const ColorCircle({super.key, required this.index});
  @override
  // ignore: no_logic_in_create_state
  State<ColorCircle> createState() => _ColorCircleState(index: index);
}

class _ColorCircleState extends State<ColorCircle> {
   int index;
   late int colorIndex;
  late ColorsController colorsController;
  _ColorCircleState({required this.index});

  @override
  void initState() {
    colorsController=Provider.of<ColorsController>(context,listen: false);
    colorIndex=index;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        // index++;
        // colorIndex++;
        // print(colorIndex);
        if(colorIndex<4){
      colorIndex++;
    }
    else{
      colorIndex=0;
    }
        colorsController.changeColor(colorIndex);
        colorsController.notify();
      },
      child: Consumer<ColorsController>(
        builder: (context,colorsController,child) {
          return CircleAvatar(
            radius: 35,
            backgroundColor: colorsController.colors[colorIndex],
            child: Container(
              decoration: BoxDecoration(border: Border.all(color: Colors.black),borderRadius: BorderRadius.circular(50)), 
            ),
          );
        }
      ),
    );

  }
}


// ignore: must_be_immutable
class ColorUnit extends StatelessWidget {
  final int index;
  List<Color> colors=[Colors.blue,Colors.red,Colors.green,Colors.purple,Colors.yellow];
   ColorUnit({
    super.key, required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        StrokeText(text: '1',strokeColor: Colors.black,textColor: colors[Random().nextInt(4)],textStyle: const TextStyle(fontSize: 80),strokeWidth: 2,),
        ColorCircle(index: index),
      ],
    );
  }
}