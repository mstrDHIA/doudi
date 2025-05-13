import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';
import 'package:doudi/controllers/colors_controller.dart';
import 'package:doudi/controllers/menu_controller.dart';
import 'package:doudi/screens/games/colors_game/widgets/colors_widgets.dart';
import 'package:provider/provider.dart';

class ColorsGameScreen extends StatefulWidget{
  const ColorsGameScreen({super.key});

  @override
  State<ColorsGameScreen> createState() => _ColorsGameScreenState();
}

class _ColorsGameScreenState extends State<ColorsGameScreen> {
  late MyMenuController menuController;
  late ColorsController colorsController;
  final ConfettiController _confettiController =
      ConfettiController(duration: const Duration(seconds: 2),
      
      );
 
  @override
  void initState() {
    menuController=Provider.of<MyMenuController>(context, listen: false);
    colorsController=Provider.of<ColorsController>(context, listen: false);
        colorsController.getRandomColors();

    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(

        children: [
          
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Color(0xFF52C91B),
                  Color(0xFF29630D),
                  
                  // Colors.purple,
                ],
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ColorUnit(index: 0,number:menuController.selectedNumber,confettiController: _confettiController,),
                    ColorUnit(index: 1,number:menuController.selectedNumber,confettiController: _confettiController),
                    ColorUnit(index: 2,number:menuController.selectedNumber,confettiController: _confettiController),
                    ColorUnit(index: 3,number:menuController.selectedNumber,confettiController: _confettiController),
                    ColorUnit(index: 4,number:menuController.selectedNumber,confettiController: _confettiController),
                    // StrokeText(text: '1',strokeColor: Colors.black,textColor: Colors.red,textStyle: TextStyle(fontSize: 80),strokeWidth: 2,),
                    // StrokeText(text: '1',strokeColor: Colors.black,textColor: Colors.green,textStyle: TextStyle(fontSize: 80),strokeWidth: 2,),
                    // StrokeText(text: '1',strokeColor: Colors.black,textColor: Colors.purple,textStyle: TextStyle(fontSize: 80),strokeWidth: 2,),
                    // StrokeText(text: '1',strokeColor: Colors.black,textColor: Colors.yellow,textStyle: TextStyle(fontSize: 80),strokeWidth: 2,),
          
                  ],
                ),
              ],
            )
          ),
          const Positioned(top: 30,right: 30,child:   Text("اربط الوان الدوائر بالوان الارقام",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),),
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
                //       Container(
                //   color: Colors.green.withOpacity(0.5),
                //   child: const Center(
                //     child: Icon(
                //       Icons.check_circle,
                //       color: Colors.white,
                //       size: 100,
                //     ),
                //   ),
                // ),
                Positioned(
                  left: MediaQuery.of(context).size.width*0.5,
                  top: 0,
                  child: ConfettiWidget(
                            confettiController: _confettiController,
                            blastDirectionality: BlastDirectionality.explosive,
                            
                            shouldLoop: false,
                            colors: const [Colors.blue, Colors.red, Colors.green, Colors.yellow],
                          ),
                ),
        ],
      ),
    );

  }
}

