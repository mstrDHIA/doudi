import 'package:flutter/material.dart';
import 'package:match/screens/games/puzzle_game/widgets/puzzle_widgets.dart';

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
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              
              PuzzlePieces(),
              SizedBox(width: 20),
              PuzzleHolder(),

            ],
          ),
          
        ],
      ),
    );
  }
}




