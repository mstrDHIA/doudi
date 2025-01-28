import 'package:flutter/material.dart';
import 'package:match/controllers/press_controller.dart';
import 'package:provider/provider.dart';
import 'package:stroke_text/stroke_text.dart';

class PressGameScreen extends StatefulWidget {
  const PressGameScreen({super.key});

  @override
  State<PressGameScreen> createState() => _PressGameScreenState();
}

class _PressGameScreenState extends State<PressGameScreen> {
  late PressController pressController;
  @override
  void initState() {
    pressController=Provider.of<PressController>(context, listen: false);
    super.initState();
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
              pressController.incrementNumber();
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
                    Center(child:StrokeText(
                      text: pressController.number.toString(),
                      textStyle: const TextStyle(
                        fontSize: 250,
                        color: Colors.white
                      ),
                      strokeWidth: 3,
                      strokeColor: Colors.black,
                    )),
                    const Positioned(top: 20,right: 20,child:  Text("اضغط على الشاشة مرة واحدة",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),),
              ],
            ),
          );
        }
      )
    );
  }
}