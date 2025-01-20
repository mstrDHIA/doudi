import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:match/controllers/click_controller.dart';
import 'package:match/controllers/colors_controller.dart';
import 'package:match/controllers/match_controller.dart';
import 'package:match/controllers/press_controller.dart';
import 'package:match/controllers/puzzle_controller.dart';
import 'package:match/screens/games/click_game/click_screen.dart';
import 'package:match/screens/games/colors_game/colors_screen.dart';
import 'package:match/screens/games/count_game/count_game_screen.dart';
import 'package:match/screens/games/press_game/press_game_screen.dart';
import 'package:match/screens/games/puzzle_game/puzzle_screen.dart';
import 'package:match/screens/main_menu/main_menu_screen.dart';
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
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: appTheme, // Use the theme
        home:   
        MainMenuScreen()
        // CountGameScreen()
        
      ),
    );
  }
}
