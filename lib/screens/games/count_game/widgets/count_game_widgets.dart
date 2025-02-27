import 'package:flutter/material.dart';
import 'package:match/controllers/count_game_controller.dart';
import 'package:provider/provider.dart';
import 'package:stroke_text/stroke_text.dart';

class AnswerBox extends StatefulWidget {
  final int number;
  final int targetNumber;
  final int index;
  const AnswerBox({
    super.key, required this.number, required this.targetNumber, required this.index,
  });

  @override
  State<AnswerBox> createState() => _AnswerBoxState();
}

class _AnswerBoxState extends State<AnswerBox> {
  Color boxColor = Colors.white;
  late CountController countController;
  @override
  void initState() {
    countController=Provider.of<CountController>(context, listen: false);
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    bool clicked=false;
    return Consumer<CountController>(
      builder: (context,countController,child){ 
        return GestureDetector(
          onTap: () {
            if(!clicked){
              print('object');
            countController.validateResult(number: widget.number, targetNumber: widget.targetNumber,index: widget.index);
            clicked=true;
            }
          },
          child: Container(
            width: MediaQuery.of(context).size.width/12,
            height: MediaQuery.of(context).size.width/12,
            decoration: BoxDecoration(
              color: countController.colors[widget.index],
              // color: (clicked)?(countController.isSolved)?Colors.green:Colors.red:Colors.white,
             
              borderRadius: BorderRadius.circular(10)
            ),
            child:  Center(child: StrokeText(text:widget.number.toString(),strokeColor: Colors.black,textColor: Colors.red,textStyle: const TextStyle(fontSize: 50),strokeWidth: 2,))),
        );
      }
    );
  }
}