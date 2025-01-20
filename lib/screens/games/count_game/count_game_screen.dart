import 'package:flutter/material.dart';
import 'package:stroke_text/stroke_text.dart';

class CountGameScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
   
      body: Stack(
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
                          Positioned(child:   Text("كم من تفاحة في الصورة",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),top: 30,right: 30,),
                          Center(child: Image.asset("assets/images/apple.png"),),
                          Positioned(
                            left: MediaQuery.of(context).size.width/2-(4*(MediaQuery.of(context).size.width/12)+30)/2,
                            bottom: 20,
                            child: Row(mainAxisAlignment: MainAxisAlignment.center,
                            // crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                                Container(
                                  width: MediaQuery.of(context).size.width/12,
                                  height: MediaQuery.of(context).size.width/12,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(10)
                                  ),
                                  child: Center(child: StrokeText(text:"1",strokeColor: Colors.black,textColor: Colors.red,textStyle: TextStyle(fontSize: 50),strokeWidth: 2,))),
                                  SizedBox(width: 10,),
                                  Container(
                                  width: MediaQuery.of(context).size.width/12,
                                  height: MediaQuery.of(context).size.width/12,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(10)
                                  ),
                                  child: Center(child: StrokeText(text:"2",strokeColor: Colors.black,textColor: Colors.red,textStyle: TextStyle(fontSize: 50),strokeWidth: 2,))),
                                  SizedBox(width: 10,),
                                  Container(
                                  width: MediaQuery.of(context).size.width/12,
                                  height: MediaQuery.of(context).size.width/12,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(10)
                                  ),
                                  child: Center(child: StrokeText(text:"3",strokeColor: Colors.black,textColor: Colors.red,textStyle: TextStyle(fontSize: 50),strokeWidth: 2,))),
                                  SizedBox(width: 10,),
                                  Container(
                                  width: MediaQuery.of(context).size.width/12,
                                  height: MediaQuery.of(context).size.width/12,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(10)
                                  ),
                                  child: Center(child: StrokeText(text:"4",strokeColor: Colors.black,textColor: Colors.red,textStyle: TextStyle(fontSize: 50),strokeWidth: 2,))),
                                // StrokeText(text:"2",strokeColor: Colors.black,textColor: Colors.red,textStyle: TextStyle(fontSize: 80),strokeWidth: 2,),
                                // StrokeText(text:"3",strokeColor: Colors.black,textColor: Colors.red,textStyle: TextStyle(fontSize: 80),strokeWidth: 2,),
                                // StrokeText(text:"4",strokeColor: Colors.black,textColor: Colors.red,textStyle: TextStyle(fontSize: 80),strokeWidth: 2,), 

                            ],
                          ),)
        ],
      ),
                    

    );
  }
}