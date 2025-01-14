import 'package:flutter/material.dart';
import 'package:match/controllers/puzzle_controller.dart';
import 'package:match/screens/puzzle_game/widgets/puzzle_widgets.dart';

class PuzzleScreen extends StatefulWidget {
  const PuzzleScreen({super.key});
  @override
  State<PuzzleScreen> createState() => _PuzzleScreenState();
}

class _PuzzleScreenState extends State<PuzzleScreen> {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background image
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/backgrounds/puzzle.jpg'), // Path to your background image
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Foreground content
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              
              PuzzlePieces(),
              const SizedBox(width: 20),
              const PuzzleHolder(),

            ],
          ),
          
        ],
      ),
    );
  }
}




