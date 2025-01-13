import 'package:flutter/material.dart';
import 'package:match/controllers/match_controller.dart';
import 'package:match/screens/match_game/widgets/answer_widget.dart';
import 'package:provider/provider.dart';

class MatchScreen extends StatefulWidget{
  const MatchScreen({super.key});

  @override
  State<MatchScreen> createState() => _MatchScreenState();
}

class _MatchScreenState extends State<MatchScreen> {
late MatchController matchController;
@override
  void initState() {
    matchController=Provider.of<MatchController>(context,listen: false);
    matchController.initGame();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView.builder(
        itemCount: matchController.questionNumber*2,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,), 
        itemBuilder: (BuildContext context, int index) { 
          if(index%2!=0){
            return AnswerWidget(matchController: matchController,index:index~/2);
          }
          else {
            return Image.asset(matchController.gameQuestions[index~/2]);
          }
          
         },
         

        
        
      ),
      bottomNavigationBar: BottomAppBar(
        child: Center(child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Consumer<MatchController>(
            builder: (context,matchController,child) {
              return InkWell(
                onTap: (){
                  matchController.toggleValidation();
                },
                child: Text((matchController.isValidating)?"Stop":"Validate"));
            }
          ),
        ),),
      ),
    );

  }
}

