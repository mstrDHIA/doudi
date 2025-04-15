import 'package:flutter/material.dart';
import 'package:match/controllers/menu_controller.dart';
import 'package:match/screens/games/colors_game/widgets/colors_widgets.dart';
import 'package:provider/provider.dart';

class ColorsGameScreen extends StatefulWidget{
  const ColorsGameScreen({super.key});

  @override
  State<ColorsGameScreen> createState() => _ColorsGameScreenState();
}

class _ColorsGameScreenState extends State<ColorsGameScreen> {
  late MyMenuController menuController;
  @override
  void initState() {
    menuController=Provider.of<MyMenuController>(context, listen: false);
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
                    ColorUnit(index: 0,number:menuController.selectedNumber),
                    ColorUnit(index: 1,number:menuController.selectedNumber),
                    ColorUnit(index: 2,number:menuController.selectedNumber),
                    ColorUnit(index: 3,number:menuController.selectedNumber),
                    ColorUnit(index: 4,number:menuController.selectedNumber),
                    // StrokeText(text: '1',strokeColor: Colors.black,textColor: Colors.red,textStyle: TextStyle(fontSize: 80),strokeWidth: 2,),
                    // StrokeText(text: '1',strokeColor: Colors.black,textColor: Colors.green,textStyle: TextStyle(fontSize: 80),strokeWidth: 2,),
                    // StrokeText(text: '1',strokeColor: Colors.black,textColor: Colors.purple,textStyle: TextStyle(fontSize: 80),strokeWidth: 2,),
                    // StrokeText(text: '1',strokeColor: Colors.black,textColor: Colors.yellow,textStyle: TextStyle(fontSize: 80),strokeWidth: 2,),
          
                  ],
                ),
              ],
            )
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
        ],
      ),
    );

  }
}

