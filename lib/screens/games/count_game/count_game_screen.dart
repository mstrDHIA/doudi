import 'package:flutter/material.dart';
import 'package:match/controllers/count_game_controller.dart';
import 'package:match/controllers/menu_controller.dart';
import 'package:match/screens/games/count_game/widgets/count_game_widgets.dart';
import 'package:provider/provider.dart';

class CountGameScreen extends StatefulWidget {
  const CountGameScreen({super.key});

  @override
  State<CountGameScreen> createState() => _CountGameScreenState();
}

class _CountGameScreenState extends State<CountGameScreen> {
  late CountController countController;
  late MyMenuController menuController;

  @override
  void initState() {
    countController=Provider.of<CountController>(context, listen: false);
    menuController=Provider.of<MyMenuController>(context, listen: false);
    countController.generateAndShuffleNumbers(menuController.selectedNumber);
    super.initState();
  }

  @override
  void dispose() {
    countController.numbers.clear();
    countController.isSolved=false;
    countController.colors = [Colors.white, Colors.white, Colors.white, Colors.white];
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
   
      body: Consumer<CountController>(
        builder: (context,countController,child) {
          return Stack(
            children: [
              Container(
                              width: MediaQuery.of(context).size.width,
                              height: MediaQuery.of(context).size.height,
                              decoration: const BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage('assets/backgrounds/background.jpg'),
                                  fit: BoxFit.cover,
                                ),
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
                              top: MediaQuery.of(context).size.height/2-100,
                              child: Image.asset("assets/images/worm.png")),
                              const Positioned(top: 30,right: 30,child:   Text("كم من تفاحة في الصورة",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  for (int i = 0; i < menuController.selectedNumber; i++)
                                  Center(child: Image.asset("assets/images/apple.png"),),
                                ],
                              ),
                              Positioned(
                                left: MediaQuery.of(context).size.width/2-(4*(MediaQuery.of(context).size.width/12)+30)/2,
                                bottom: 20,
                                child: Row(mainAxisAlignment: MainAxisAlignment.center,
                                // crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  for (int i = 0; i < 4; i++)
                                    Row(
                                      children: [
                                        AnswerBox(index: i,number: countController.numbers[i],targetNumber: menuController.selectedNumber,),
                                        const SizedBox(width: 10,),
                                      ],
                                    ),
                                      // const SizedBox(width: 10,),
                                      // Container(
                                      // width: MediaQuery.of(context).size.width/12,
                                      // height: MediaQuery.of(context).size.width/12,
                                      // decoration: BoxDecoration(
                                      //   color: Colors.white,
                                      //   borderRadius: BorderRadius.circular(10)
                                      // ),
                                      // child: const Center(child: StrokeText(text:"2",strokeColor: Colors.black,textColor: Colors.red,textStyle: TextStyle(fontSize: 50),strokeWidth: 2,))),
                                      // const SizedBox(width: 10,),
                                      // Container(
                                      // width: MediaQuery.of(context).size.width/12,
                                      // height: MediaQuery.of(context).size.width/12,
                                      // decoration: BoxDecoration(
                                      //   color: Colors.white,
                                      //   borderRadius: BorderRadius.circular(10)
                                      // ),
                                      // child: const Center(child: StrokeText(text:"3",strokeColor: Colors.black,textColor: Colors.red,textStyle: TextStyle(fontSize: 50),strokeWidth: 2,))),
                                      // const SizedBox(width: 10,),
                                      // Container(
                                      // width: MediaQuery.of(context).size.width/12,
                                      // height: MediaQuery.of(context).size.width/12,
                                      // decoration: BoxDecoration(
                                      //   color: Colors.white,
                                      //   borderRadius: BorderRadius.circular(10)
                                      // ),
                                      // child: const Center(child: StrokeText(text:"4",strokeColor: Colors.black,textColor: Colors.red,textStyle: TextStyle(fontSize: 50),strokeWidth: 2,))),
                                    // StrokeText(text:"2",strokeColor: Colors.black,textColor: Colors.red,textStyle: TextStyle(fontSize: 80),strokeWidth: 2,),
                                    // StrokeText(text:"3",strokeColor: Colors.black,textColor: Colors.red,textStyle: TextStyle(fontSize: 80),strokeWidth: 2,),
                                    // StrokeText(text:"4",strokeColor: Colors.black,textColor: Colors.red,textStyle: TextStyle(fontSize: 80),strokeWidth: 2,), 
          
                                ],
                              ),),
                              if(countController.isSolved)
                              GestureDetector(
                                onTap: () => Navigator.pop(context),
                                child: Container(
                                                  color: Colors.green.withOpacity(0.5),
                                                  child: const Center(
                                                    child: Icon(
                                                      Icons.check_circle,
                                                      color: Colors.white,
                                                      size: 100,
                                                    ),
                                                  ),
                                                ),
                              ),
            ],
          );
        }
      ),
                    

    );
  }
}

