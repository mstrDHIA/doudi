import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:match/controllers/colors_controller.dart';
import 'package:match/controllers/match_controller.dart';
import 'package:match/controllers/puzzle_controller.dart';
import 'package:match/screens/colors_game/colors_screen.dart';
import 'package:match/screens/puzzle_game/puzzle_screen.dart';
import 'package:provider/provider.dart';
import 'package:match/utils/theme.dart'; // Import the theme

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.landscapeRight,
    DeviceOrientation.landscapeLeft,
  ]).then((_) {
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
      ],
      child: MaterialApp(
        theme: appTheme, // Use the theme
        home:   ColorsGameScreen()
        
      ),
    );
  }
}
