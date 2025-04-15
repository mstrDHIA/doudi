// import 'dart:math';

// import 'package:flutter/material.dart';
// import 'package:match/controllers/colors_controller.dart';
// import 'package:provider/provider.dart';
// import 'package:stroke_text/stroke_text.dart';

// class ColorCircle extends StatefulWidget{
//   final int index;

//   const ColorCircle({super.key, required this.index});
//   @override
//   // ignore: no_logic_in_create_state
//   State<ColorCircle> createState() => _ColorCircleState(index: index);
// }

// class _ColorCircleState extends State<ColorCircle> {
//    int index;
//    late int colorIndex;
//   late ColorsController colorsController;
//   _ColorCircleState({required this.index});

//   @override
//   void initState() {
//     colorsController=Provider.of<ColorsController>(context,listen: false);
//     colorIndex=index;
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return InkWell(
//       onTap: (){
//         // index++;
//         // colorIndex++;
//         // print(colorIndex);
//         if(colorIndex<4){
//       colorIndex++;
//     }
//     else{
//       colorIndex=0;
//     }
//         colorsController.changeColor(colorIndex);
//         colorsController.notify();
//       },
//       child: Consumer<ColorsController>(
//         builder: (context,colorsController,child) {
//           return CircleAvatar(
//             radius: 35,
//             backgroundColor: colorsController.colors[colorIndex],
//             child: Container(
//               decoration: BoxDecoration(border: Border.all(color: Colors.black),borderRadius: BorderRadius.circular(50)), 
//             ),
//           );
//         }
//       ),
//     );

//   }
// }


// // ignore: must_be_immutable
// class ColorUnit extends StatelessWidget {
//   final int number;
//   final int index;
//   List<Color> colors=[Colors.blue,Colors.red,Colors.green,Colors.purple,Colors.yellow];
//    ColorUnit({
//     super.key, required this.index, required this.number,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//       children: [
//         StrokeText(text: number.toString(),strokeColor: Colors.black,textColor: colors[Random().nextInt(4)],textStyle: const TextStyle(fontSize: 80),strokeWidth: 2,),
//         ColorCircle(index: index),
//       ],
//     );
//   }
// }


import 'dart:math';

import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';
import 'package:match/controllers/colors_controller.dart';
import 'package:provider/provider.dart';
import 'package:stroke_text/stroke_text.dart';

class ColorCircle extends StatefulWidget {
  

  final int index;
  final ConfettiController confettiController;

  const ColorCircle({super.key, required this.index, required this.confettiController});
  @override
  // ignore: no_logic_in_create_state
  State<ColorCircle> createState() => _ColorCircleState(index: index);
}

class _ColorCircleState extends State<ColorCircle> {
  bool isTapped=false;
  static List<Color> colors = [
    Colors.blue,
    Colors.red,
    Colors.green,
    Colors.purple,
    Colors.yellow,
    Colors.grey
  ];
  final List<Color> randomColors= [colors[Random().nextInt(colors.length)]];
  int index;
  late int colorIndex;
  late ColorsController colorsController;
  _ColorCircleState({required this.index});

  @override
  void initState() {
    colorsController = Provider.of<ColorsController>(context, listen: false);
    // colorsController.getRandomColors();
    colorIndex = index;
    super.initState();
  }


  
  @override
  void dispose() {
    colorsController.validCount=0;
    colorsController.isValid=[false,false,false,false,false];
    colorsController.circleColors.clear();
    colorsController.randomColors.clear();

    // TODO: implement dispose
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if(colorsController.validCount!=5){
          isTapped=true;
        if (colorIndex < 4) {
          colorIndex++;
        } else {
          colorIndex = 0;
        }
        colorsController.changeColor(colorIndex);
        colorsController.notify();
        colorsController.verify(colorsController.colors[colorIndex],index,widget.confettiController);

        }
       
    
      },
      child: Consumer<ColorsController>(
        builder: (context, colorsController, child) {
          return CircleAvatar(
            radius: 35,
            backgroundColor: isTapped?colorsController.colors[colorIndex]:colorsController.colors[5],
            child: Container(
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.black),
                  borderRadius: BorderRadius.circular(50)),
            ),
          );
        },
      ),
    );
  }
}

// ignore: must_be_immutable
class ColorUnit extends StatefulWidget {
  final int number;
  final int index;
  final ConfettiController confettiController;
  // static List<Color> colors = [
  //   Colors.blue,
  //   Colors.red,
  //   Colors.green,
  //   Colors.purple,
  //   Colors.yellow
  // ];
  static List<Color> currentColors = []; // Track the current colors of numbers

  ColorUnit({
    super.key,
    required this.index,
    required this.number, required this.confettiController,
  });

  @override
  State<ColorUnit> createState() => _ColorUnitState();
}

class _ColorUnitState extends State<ColorUnit> {
  late ColorsController colorsController;

  @override
  void initState() {
    colorsController = Provider.of<ColorsController>(context, listen: false);
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // Randomly assign a color to the number and store it in currentColors
    // Color textColor = colors[Random().nextInt(colors.length)];
    // if (currentColors.length <= index) {
    //   currentColors.add(textColor);
    // } else {
    //   currentColors[index] = textColor;
    // }

    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        StrokeText(
          text: widget.number.toString(),
          strokeColor: Colors.black,
          textColor: colorsController.randomColors[widget.index],
          textStyle: const TextStyle(fontSize: 80),
          strokeWidth: 2,
        ),
        ColorCircle(index: widget.index,confettiController: widget.confettiController,),
      ],
    );
  }
}