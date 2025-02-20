import 'dart:convert';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:match/controllers/menu_controller.dart';
import 'package:match/screens/games/coloring_game/coloring_game_screen.dart';
import 'package:match/screens/video/video_screen.dart';
import 'package:provider/provider.dart';
import 'package:video_player/video_player.dart';

class QrController extends ChangeNotifier{
  bool isFirst=true;
  bool isPlaying=false;
  final AudioPlayer audioPlayer = AudioPlayer();
  late VideoPlayerController videoController;
  
  // List<Map<String, dynamic>> qrScreens = [
  //   {"title":"activity",
  //     "number":5,
  //     "message":"coloring"
  //   ,"path":CanvasPainting()},
    
  // ];


  qrCodeHandler({required qrData,required context,required barcode}){
    print('bbb');
    print(barcode.raw);
    String stringData=barcode.raw.toString().split('displayValue: ')[1].split(', driverLicense:')[0];
    print('ccc');
              Map<String, dynamic> data = jsonDecode(stringData);
              print(data);
    if(data['title']=='auth'){
      authHandler(qrData: data);
    }
    else if(data['title']=='activity'){
      activityHandler(qrData: data,context: context);
    }
    else if(data['title']=='story'){
      print('ddd');
      storyHandler(qrData: data['content'],context: context);
    }
    else if(data['title']=='progress'){
      progressHandler(qrData: data);
    }
  }

  authHandler({required Map<String,dynamic> qrData}){
    
  }
  activityHandler({required Map<String,dynamic> qrData,required context}){
    Provider.of<MyMenuController>(context, listen: false).selectedNumber=qrData['number'];
    if(qrData['title']=="coloring"){
      // return ColoringGameScreen();
    }
    else if(qrData['title']=="puzzle"){

    }
    else if(qrData['title']=="count"){

    }
    else if(qrData['title']=="press"){

    }
    else if(qrData['title']=="colors"){

    }
    else if(qrData['title']=="click"){

    }
    else if(qrData['title']=="writing"){

    }
       
  }
  storyHandler({required Map<String,dynamic> qrData,required context}) async {
    if(qrData['title']=="audio"){
      if(isFirst){
        isFirst=false;
        
        audioPlayer.onPlayerComplete.listen((event) {
      isPlaying = false;
      notifyListeners();
    });
        await audioPlayer.play(AssetSource(qrData['content']));
        isPlaying=true;
        // audioPlayer.
        
      Navigator.pop(context);
      notifyListeners();
      }
      
    }
    else if(qrData['title']=="video"){
      Navigator.push(context, MaterialPageRoute(builder: (context) => VideoScreen(videoPath: qrData['content'],)));
      // videoController = VideoPlayerController.asset(qrData['content'],)
      // ..initialize().then((_) {

      //   videoController.play(); // Auto play the video
      
      // });
      // videoController.addListener(() {
      // if (videoController.value.position == videoController.value.duration) {
      //   // Navigator.of(context).pushReplacement(
      //   //     MaterialPageRoute(builder: (context) =>  WelcomeScreen()), // Replace with your next screen
      //   //   );
      //   // Navigator.pop(context);
      // }
    // });
    }

  }
  progressHandler({required Map<String,dynamic> qrData}){
    
  }


  notify(){
    notifyListeners();
  }

}