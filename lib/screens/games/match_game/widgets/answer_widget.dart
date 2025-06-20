import 'package:flutter/material.dart';
import 'package:doudi/controllers/match_controller.dart';
import 'package:provider/provider.dart';

class AnswerWidget extends StatefulWidget {
  const AnswerWidget({
    super.key,
    required this.matchController, required this.index,
  });

  final MatchController matchController;
  final int index;

  @override
  // ignore: no_logic_in_create_state
  State<AnswerWidget> createState() => _AnswerWidgetState(index: index);
}

class _AnswerWidgetState extends State<AnswerWidget> {
    final int index;

  _AnswerWidgetState({required this.index});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    
        children: [

          InkWell(
            onTap: (){
              widget.matchController.addNum(index:index);
            },
            child: const CircleAvatar(
            
              child: Center(
                child: Icon(Icons.add,
                size: 20,
                )
              ),
            ),
          ),
          
          const SizedBox(height: 10,),
          Consumer<MatchController>(
            builder: (context,matchController,child) {
              return Container(
                height: MediaQuery.of(context).size.width/10,
                width: MediaQuery.of(context).size.width/10,
                decoration: BoxDecoration(
                  color: (widget.matchController.isValidating)?(widget.matchController.answers[index]==widget.matchController.numbers[index])?Colors.green:Colors.red:Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.black)
                ),
                child: Center(
                  child: Text(matchController.numbers[index].toString(),
                    style: const TextStyle(
                      fontSize: 50
                    ),
                  ),
                ),
              );
            }
          ),
          const SizedBox(height: 10,),
          InkWell(
            onTap: (){
             widget.matchController.reduceNum(index:index);
            },
            child: const CircleAvatar(
             
              child: Center(
                child: Icon(Icons.remove,
                size: 20,
                )
              ),
            ),
          ),
        ],
      ),
    );
    
  }
}