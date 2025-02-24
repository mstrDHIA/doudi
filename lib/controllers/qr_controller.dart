import 'dart:convert';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:match/controllers/auth_controller.dart';
import 'package:match/controllers/menu_controller.dart';
import 'package:match/screens/games/coloring_game/coloring_game_screen.dart';
import 'package:match/screens/games/games_list.dart';
import 'package:match/screens/games/writing_game/writing_game_screen_3.dart';
import 'package:match/screens/main_menu/main_menu_screen.dart';
import 'package:match/screens/video/video_screen.dart';
import 'package:mobile_device_identifier/mobile_device_identifier.dart';
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
    // print(barcode.raw);
    // String stringData=barcode.raw.toString().split('displayValue: ')[1].split(', driverLicense:')[0];
    print('ccc');
              Map<String, dynamic> data = jsonDecode(qrData);
              print(data);
    if(data['title']=='auth'){
      print('eee');
      authHandler(qrData: data['content'],context: context);
      print('fff');
    }
    else if(data['title']=='activity'){
      activityHandler(qrData: data['content'],context: context);
    }
    else if(data['title']=='story'){
      print('ddd');
      storyHandler(qrData: data['content'],context: context);
    }
    else if(data['title']=='progress'){
      progressHandler(qrData: data);
    }
    print('ggg');
  }

  authHandler({required Map<String,dynamic> qrData,required context}) async {
    if(qrData['title']=="login"){
        Provider.of<AuthController>(context, listen: false).login(qrData['content']['username'], qrData['content']['password'], context);

    }
    else if(qrData['title']=="register"){
       String? mobileDeviceIdentifier = await MobileDeviceIdentifier().getDeviceId();
      mobileDeviceIdentifier=mobileDeviceIdentifier!.replaceAll(":", "");
      Provider.of<AuthController>(context, listen: false).register(mobileDeviceIdentifier!, qrData['content']['password'], context);
    }

  
  }
  activityHandler({required Map<String,dynamic> qrData,required context}){
    // Provider.of<MyMenuController>(context, listen: false).selectedNumber= int.parse(qrData['content']['number']) ;
    if(qrData['title']=="coloring"){
      Navigator.push(context, MaterialPageRoute(builder: (context) => CanvasPainting()));
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
      Navigator.push(context, MaterialPageRoute(builder: (context) => WritingGameScreen3()));
    }
    else{
      Navigator.push(context, MaterialPageRoute(builder: (context) => MainMenuScreen()));
    }
       
  }
  storyHandler({required Map<String,dynamic> qrData,required context}) async {
    print('story');
    if(qrData['title']=="audio"){
      print('audio');
      // if(isFirst){
        print('first');
        isFirst=false;
        
        audioPlayer.onPlayerComplete.listen((event) {
      isPlaying = false;
      notifyListeners();
    });
        await audioPlayer.play(AssetSource(qrData['content']));
        isPlaying=true;
        // audioPlayer.
        
      // Navigator.pop(context);
      notifyListeners();
      // }
      
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