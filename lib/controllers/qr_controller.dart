import 'dart:convert';

import 'package:audioplayers/audioplayers.dart';
import 'package:doudi/screens/youtube_player_screen.dart';
import 'package:flutter/material.dart';
import 'package:doudi/controllers/auth_controller.dart';
import 'package:doudi/controllers/progress_controller.dart';
import 'package:doudi/screens/games/coloring_game/coloring_game_screen.dart';
import 'package:doudi/screens/games/writing_game/writing_game_screen_3.dart';
import 'package:doudi/screens/main_menu/main_menu_screen.dart';
import 'package:doudi/screens/video/video_screen.dart';
import 'package:mobile_device_identifier/mobile_device_identifier.dart';
import 'package:provider/provider.dart';
// import 'package:video_player/video_player.dart';

class QrController extends ChangeNotifier {
  bool isFirst = true;
  bool isPlaying = false;
  final AudioPlayer audioPlayer = AudioPlayer();
  // late VideoPlayerController videoController;

  // List<Map<String, dynamic>> qrScreens = [
  //   {"title":"activity",
  //     "number":5,
  //     "message":"coloring"
  //   ,"path":CanvasPainting()},

  // ];

  qrCodeHandler({required qrData, required context, required barcode}) {
    Map<String, dynamic> data = jsonDecode(qrData);
    print(Provider.of<ProgressController>(context, listen: false).currentNumber);
    print(data['content']['number']);
    if (Provider.of<AuthController>(context, listen: false).isAuth) {
      if(data['title']=='auth'){
        errorHandling(context);
      }
      else if(data['title'] != 'progress') {
        
      
      if (data['content']['number'] <= Provider.of<ProgressController>(context, listen: false).currentNumber) {
        if (data['title'] == 'activity') {
          activityHandler(qrData: data['content'], context: context);
        } else if (data['title'] == 'story') {
          storyHandler(qrData: data['content'], context: context);
        }
      }} else {
        if (data['title'] == 'progress') {
          progressHandler(qrData: data['content'], context: context);
        }
      }
    } else {
      if (data['title'] == 'auth') {
        authHandler(qrData: data['content'], context: context);
      }
      else{
        SnackBar snackBar =  SnackBar(
          content: Text('الرجاء تسجيل الدخول أولا',
            style: TextStyle(
              fontSize: 16,
              color: Colors.white,
            ),
          ),
          width: MediaQuery.of(context).size.width * 0.6,
      
      elevation: 2,
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      action: SnackBarAction(
        label: 'حسنا',
        onPressed: () {
          // Navigator.pop(context);
          // Some code to undo the change.
        },
      ),
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      }
    }
  }


  errorHandling(context){
   final SnackBar snackBar =  SnackBar(
    content: Text('انت مسجل دخولك',
        style: const TextStyle(
          fontSize: 16,
          color: Colors.white,
        ),
      ),
      backgroundColor: Colors.orange,
      width: MediaQuery.of(context).size.width * 0.6,
      
      elevation: 2,
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      action: SnackBarAction(
        label: 'حسنا',
        onPressed: () {
          // Navigator.pop(context);
          // Some code to undo the change.
        },
      ),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  authHandler({required Map<String, dynamic> qrData, required context}) async {
    String? mobileDeviceIdentifier =
          await MobileDeviceIdentifier().getDeviceId();
      mobileDeviceIdentifier = mobileDeviceIdentifier!.replaceAll(":", "");
    if (qrData['title'] == "login") {
      print('login from auth handler');
      Provider.of<AuthController>(context, listen: false).login(
          // qrData['content']['username'],
          mobileDeviceIdentifier,
          qrData['content']['password'],
          context);
    } else if (qrData['title'] == "register") {
      
      Provider.of<AuthController>(context, listen: false).register(
          mobileDeviceIdentifier, qrData['content']['password'], context);
    }
  }

  activityHandler({required Map<String, dynamic> qrData, required context}) {
    // Provider.of<MyMenuController>(context, listen: false).selectedNumber= int.parse(qrData['content']['number']) ;
    if (qrData['title'] == "coloring") {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => const CanvasPainting()));
      // return ColoringGameScreen();
    } else if (qrData['title'] == "puzzle") {
    } else if (qrData['title'] == "count") {
    } else if (qrData['title'] == "press") {
    } else if (qrData['title'] == "colors") {
    } else if (qrData['title'] == "click") {
    } else if (qrData['title'] == "writing") {
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => const WritingGameScreen3()));
    } else {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => MainMenuScreen()));
    }
  }

  storyHandler({required Map<String, dynamic> qrData, required context}) async {
    if (qrData['title'] == "audio") {
      // if(isFirst){
      isFirst = false;

      audioPlayer.onPlayerComplete.listen((event) {
        isPlaying = false;
        notifyListeners();
      });
      await audioPlayer.play(AssetSource(qrData['content']));
      isPlaying = true;
      // audioPlayer.

      // Navigator.pop(context);
      notifyListeners();
      // }
    } else if (qrData['title'] == "video") {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => YouTubePlayerScreen(
                // videoId: "ylECTOM_Gak",
                    videoId: qrData['content'],
                  )));
      // Navigator.push(
      //     context,
      //     MaterialPageRoute(
      //         builder: (context) => VideoScreen(
      //               videoPath: qrData['content'],
      //             )));
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

  progressHandler({required Map<String, dynamic> qrData, required context}) {
    if (qrData['title'] == "number") {
      Provider.of<ProgressController>(context, listen: false)
          .updateCurrentNumber(qrData['content']);
      // Provider.of<ProgressController>(context, listen: false).updateCurrentNumber();
    }
  }

  notify() {
    notifyListeners();
  }
}
