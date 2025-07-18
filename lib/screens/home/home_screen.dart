import 'package:flutter/material.dart';
import 'package:doudi/controllers/menu_controller.dart';
import 'package:doudi/controllers/qr_controller.dart';
import 'package:doudi/screens/games/coloring_game/coloring_game_screen.dart';
import 'package:doudi/screens/games/writing_game/writing_game_screen_3.dart';
import 'package:doudi/screens/home/widgets/home_widgets.dart';
import 'package:doudi/screens/main_menu/main_menu_screen.dart';
import 'package:doudi/screens/qr/qr_screen.dart';
import 'package:doudi/screens/youtube_player_screen.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late QrController qrController;
  late MyMenuController menuController;

  @override
  void initState() {
    qrController = Provider.of<QrController>(context, listen: false);
    menuController = Provider.of<MyMenuController>(context, listen: false);

    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // appBar: AppBar(
        //   title: Text('Home Screen'),
        // ),
        body: Consumer<QrController>(builder: (context, qrController, child) {
      return Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                    'assets/backgrounds/trees_bakground.jpeg'), // Path to your background image
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
              top: 20,
              left: 20,
              child: GestureDetector(
                onTap: () => Navigator.pop(context),
                child: CircleAvatar(
                    child: Padding(
                  padding: const EdgeInsets.all(6.0),
                  child: Image.asset(
                    "assets/icons/back.png",
                    width: 50,
                    height: 50,
                  ),
                )),
              )),
          Positioned(
            top: MediaQuery.of(context).size.height / 2 - 10,
            left: MediaQuery.of(context).size.width / 30,
            child: GestureDetector(
              // onTap: () => Navigator.push(
              //     context,
              //     MaterialPageRoute(
              //         builder: (context) =>  YouTubePlayerScreen(videoId: 'iLnmTe5Q2Qw',))),
              child: Image.asset(
                    "assets/images/number${menuController.selectedNumber}.png"),
            ),
          ),
          //  Positioned(
          //                 top: MediaQuery.of(context).size.height/2-100,
          //                 left: MediaQuery.of(context).size.width/50,
          //                 child: Image.asset("assets/images/number${progressController.currentNumber}.png")),
          //                     HomeItem(top: MediaQuery.of(context).size.height/4,
          // left: MediaQuery.of(context).size.width/4,
          // img: "assets/images/numbers.png",
          // Route: NumbersMenuScreen(),
          // txt: "الأرقام",),
          HomeItem(
            top: MediaQuery.of(context).size.height / 4,
            left: MediaQuery.of(context).size.width / 4,
            img: "assets/images/qrbox.png",
            route: const QRScreen(),
            txt: "مسح",
            qrController: qrController,
          ),

          HomeItem(
            top: MediaQuery.of(context).size.height / 3,
            left: MediaQuery.of(context).size.width / 2.3,
            img: "assets/images/olors.png",
            route: const CanvasPainting(),
            txt: "الالوان",
            qrController: qrController,
          ),

          HomeItem(
            top: MediaQuery.of(context).size.height / 5,
            left: MediaQuery.of(context).size.width / 1.65,
            img: "assets/images/writing.png",
            qrController: qrController,
            // route: const WritingGameScreen(),
            route: const WritingGameScreen3(),
            txt: "الكتابة",
          ),
          HomeItem(
            top: MediaQuery.of(context).size.height / 2.5,
            qrController: qrController,
            left: MediaQuery.of(context).size.width / 1.3,
            img: "assets/images/games.png",
            route: MainMenuScreen(),
            // GamesList(),
            txt: "الالعاب",
          ),
          if (qrController.isPlaying)
            Positioned(
              bottom: 20,
              right: 20,
              child: GestureDetector(
                onTap: () {
                  qrController.isPlaying = false;
                  qrController.audioPlayer.stop();
                  qrController.notify();
                  // _controller.removeListener(listener);
                  // Navigator.of(context).pushReplacement(
                  //   MaterialPageRoute(builder: (context) =>  WelcomeScreen()), // Replace with your next screen
                  // );
                },
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.15,
                  height: MediaQuery.of(context).size.height * 0.15,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.black.withOpacity(0.5),
                  ),
                  child: const Center(
                    child: Text(
                      'تخطي',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
              ),
            )
        ],
      );
    }));
  }
}
