import 'package:flutter/material.dart';
import 'package:match/controllers/click_controller.dart';
import 'package:match/screens/games/click_game/widgets/click_game_widgets.dart';
import 'package:provider/provider.dart';
import 'package:stroke_text/stroke_text.dart';

class ClickGameScreen extends StatefulWidget{
  @override
  State<ClickGameScreen> createState() => _ClickGameScreenState();
}

class _ClickGameScreenState extends State<ClickGameScreen> {
  late ClickController clickController;
  @override
  void initState() {
    clickController=Provider.of<ClickController>(context, listen: false);
    // clickController.startTimer();
    // TODO: implement initState
    super.initState();
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
                        clickController.showCorrectOverlay();
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
              Positioned(child: Text("اضغط على الرقم 1",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),top: 30,right: 30,),
             
              if (clickController.showOverlay&&clickController.randomNumber==1)
                Container(
                  color: Colors.green.withOpacity(0.5),
                  child: Center(
                    child: Icon(
                      Icons.check_circle,
                      color: Colors.white,
                      size: 100,
                    ),
                  ),
                ),
              if (clickController.showOverlay&&clickController.randomNumber!=1)
                Container(
                  color: Colors.red.withOpacity(0.5),
                  child: Center(
                    child: Icon(
                      Icons.cancel,
                      color: Colors.white,
                      size: 100,
                    ),
                  ),
                ),
            ],
          );
        }
      ),
    );
    // TODO: implement build
    throw UnimplementedError();
  }
}

