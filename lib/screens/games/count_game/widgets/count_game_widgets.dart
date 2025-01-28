import 'package:flutter/material.dart';
import 'package:stroke_text/stroke_text.dart';

class AnswerBox extends StatelessWidget {
  final int number;
  const AnswerBox({
    super.key, required this.number,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width/12,
      height: MediaQuery.of(context).size.width/12,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10)
      ),
      child:  Center(child: StrokeText(text:number.toString(),strokeColor: Colors.black,textColor: Colors.red,textStyle: TextStyle(fontSize: 50),strokeWidth: 2,)));
  }
}