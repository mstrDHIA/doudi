import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';
import 'package:doudi/controllers/menu_controller.dart';
import 'package:doudi/controllers/press_controller.dart';
import 'package:provider/provider.dart';
import 'package:stroke_text/stroke_text.dart';

class PressGameScreen extends StatefulWidget {
  final int? number;
  const PressGameScreen({super.key,  this.number});

  @override
  State<PressGameScreen> createState() => _PressGameScreenState(number: number);
}

class _PressGameScreenState extends State<PressGameScreen> {
  final int? number;
  late PressController pressController;
  late MyMenuController menuController;
  final ConfettiController _confettiController =
      ConfettiController(duration: const Duration(seconds: 5));
  String text='';
  _PressGameScreenState({required this.number});
  @override
  void initState() {
    pressController=Provider.of<PressController>(context, listen: false);
    menuController=Provider.of<MyMenuController>(context, listen: false);

    pressController.setTargetNumber(menuController.selectedNumber);
    prepareText();
    super.initState();
  }
  prepareText(){
    if(menuController.selectedNumber==1){
      text= "اضغط على الشاشة مرة واحدة";
  }
  else if(menuController.selectedNumber==2){
    text= "اضغط على الشاشة مرتين";
  }
  else if(menuController.selectedNumber==3){
    text= "اضغط على الشاشة ثلاث مرات";
  }
  else if(menuController.selectedNumber==4){
    text= "اضغط على الشاشة أربع مرات";
  }
  else if(menuController.selectedNumber==5){
    text= "اضغط على الشاشة خمس مرات";
  }
  else if(menuController.selectedNumber==6){
    text= "اضغط على الشاشة ست مرات";
  }
  else if(menuController.selectedNumber==7){
    text= "اضغط على الشاشة سبع مرات";
  }
  else if(menuController.selectedNumber==8){
    text= "اضغط على الشاشة ثمان مرات";
  }
  else if(menuController.selectedNumber==9){
    text= "اضغط على الشاشة تسع مرات";
  }

  }
  @override
  void dispose() {
    pressController.number=0;
    pressController.isSolved=false;
    // pressController.dispose();
    // menuController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('Press Game'),
      // ),
      body: Consumer<PressController>(
        builder: (context,pressController,child) {
          return InkWell(
            onTap: () {
              pressController.incrementNumber(context, _confettiController);
            },
            child: Stack(
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
                    if(pressController.number!=0)
                    Center(child:StrokeText(
                      text: pressController.number.toString(),
                      textStyle: const TextStyle(
                        fontSize: 250,
                        color: Colors.white
                      ),
                      strokeWidth: 3,
                      strokeColor: Colors.black,
                    )),
                     Positioned(top: 20,right: 20,child:  Text(text,style: const TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),),
                    if(pressController.isSolved)
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  ConfettiWidget(
                            confettiController: _confettiController,
                            blastDirectionality: BlastDirectionality.explosive,
                            
                            shouldLoop: false,
                            colors: const [Colors.blue, Colors.red, Colors.green, Colors.yellow],
                          ),
                                  GestureDetector(
                                    onTap: () => Navigator.pop(context),
                                    
                                    child: Container(
                                      height: MediaQuery.of(context).size.height,
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
                              ),
              ],
            ),
          );
        }
      )
    );
  }
  
}