import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';
import 'package:doudi/controllers/click_controller.dart';
import 'package:doudi/controllers/menu_controller.dart';
import 'package:doudi/screens/games/click_game/widgets/click_game_widgets.dart';
import 'package:provider/provider.dart';

class ClickGameScreen extends StatefulWidget{
  const ClickGameScreen({super.key});

  @override
  State<ClickGameScreen> createState() => _ClickGameScreenState();
}

class _ClickGameScreenState extends State<ClickGameScreen> {
  late ClickController clickController;
    late MyMenuController menuController;
  final ConfettiController _confettiController =
      ConfettiController(duration: const Duration(seconds: 5));
  @override
  void initState() {
    clickController=Provider.of<ClickController>(context, listen: false);
    menuController=Provider.of<MyMenuController>(context, listen: false);
    // clickController.startTimer();
    super.initState();
  }
  
  @override
  void dispose() {
    clickController.isSolved=false;
    clickController.showOverlay=false;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<ClickController>(
        builder: (context,clickController,child) {
          return Stack(
            children: [
              
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/backgrounds/barn.png'),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      // height: MediaQuery.of(context).size.height,
                      // width: MediaQuery.of(context).size.width/2,
                      color: Colors.transparent,
                      child: Image.asset("assets/images/sheep.png"),
                    ),
                    InkWell(
                      onTap: () {
                        clickController.showResultOverlay(menuController.selectedNumber,_confettiController);
                      },
                      child: NumberHolder(clickController: clickController,)),
          
                  ],
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
               Positioned(top: 30,right: 30,child: Text("اضغط على الرقم ${menuController.selectedNumber}",style: const TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),),
             
              if (clickController.showOverlay&&clickController.isSolved)
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
              if (clickController.showOverlay&&!clickController.isSolved)
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
          );
        }
      ),
    );

  }
}

