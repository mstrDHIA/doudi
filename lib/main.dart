import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:match/controllers/auth_controller.dart';
import 'package:match/controllers/click_controller.dart';
import 'package:match/controllers/colors_controller.dart';
import 'package:match/controllers/count_game_controller.dart';
import 'package:match/controllers/match_controller.dart';
import 'package:match/controllers/menu_controller.dart';
import 'package:match/controllers/press_controller.dart';
import 'package:match/controllers/puzzle_controller.dart';
import 'package:match/screens/numbers/numbers_menu.dart';
import 'package:match/screens/splash_sreen.dart';
import 'package:provider/provider.dart';
import 'package:match/utils/theme.dart'; // Import the theme

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.landscapeRight,
    DeviceOrientation.landscapeLeft,
  ]).then((_) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
    runApp(const MainApp());
  });
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MultiProvider(
      providers: [
        ChangeNotifierProvider<MatchController>(
            create: (_) => MatchController(),
        ),
        ChangeNotifierProvider<PuzzleController>(
            create: (_) => PuzzleController(),
        ),
        ChangeNotifierProvider<ColorsController>(
            create: (_) => ColorsController(),
        ),
        ChangeNotifierProvider<ClickController>(
            create: (_) => ClickController(),
        ),
        ChangeNotifierProvider<PressController>(
            create: (_) => PressController(),
        ),
        ChangeNotifierProvider<AuthController>(
            create: (_) => AuthController(),
        ),
        ChangeNotifierProvider<MyMenuController>(
            create: (_) => MyMenuController(),
        ),
        ChangeNotifierProvider<CountController>(
            create: (_) => CountController(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: appTheme, // Use the theme
        home: 
        // const 
        // SplashScreen()
        NumbersMenuScreen()
        //  MainMenuScreen()
        //  WelcomeScreen()
        // WritingGameScreen(),
        // HomeScreen()
        // NumbersMenuScreen()
        // ClickGameScreen()
        
      ),
    );
  }
}
