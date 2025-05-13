import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:doudi/controllers/auth_controller.dart';
import 'package:doudi/controllers/click_controller.dart';
import 'package:doudi/controllers/colors_controller.dart';
import 'package:doudi/controllers/count_game_controller.dart';
import 'package:doudi/controllers/match_controller.dart';
import 'package:doudi/controllers/menu_controller.dart';
import 'package:doudi/controllers/press_controller.dart';
import 'package:doudi/controllers/progress_controller.dart';
import 'package:doudi/controllers/puzzle_controller.dart';
import 'package:doudi/controllers/qr_controller.dart';
// import 'package:doudi/screens/numbers/numbers_menu.dart';
// import 'package:doudi/screens/profile/add_profile.dart';
// import 'package:doudi/screens/profile/profile_screen.dart';
import 'package:doudi/screens/splash_screen.dart';
import 'package:doudi/screens/splash_screen2.dart';
import 'package:provider/provider.dart';
import 'package:doudi/utils/theme.dart'; // Import the theme

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
        ChangeNotifierProvider<QrController>(
            create: (_) => QrController(),
        ),
        ChangeNotifierProvider<ProgressController>(
            create: (_) => ProgressController(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: appTheme, // Use the theme
        home: 
        const SplashScreen2()
        // IntroScreen(),
        // AudioScreen(),
        // const 
        // AddProfileScreen(),
        // const SplashScreen()
        // NumbersMenuScreen()
        // ProfileScreen()
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
