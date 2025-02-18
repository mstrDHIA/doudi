import 'package:flutter/material.dart';
import 'package:match/controllers/menu_controller.dart';
import 'package:match/controllers/puzzle_controller.dart';
import 'package:match/screens/games/puzzle_game/widgets/puzzle_widgets.dart';
import 'package:provider/provider.dart';

class PuzzleScreen extends StatefulWidget {
  const PuzzleScreen({super.key});
  @override
  State<PuzzleScreen> createState() => _PuzzleScreenState();
}

class _PuzzleScreenState extends State<PuzzleScreen> {
  late MyMenuController menuController;
  late PuzzleController puzzleController;
  @override
  void initState() {
    // menuController=Provider.of<MyMenuController>(context, listen: false);
    // puzzleController=Provider.of<PuzzleController>(context, listen: false);
    // puzzleController.initPuzzlePieces(menuController.selectedNumber);
    // TODO: implement initState
    super.initState();
  }
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
           Consumer<PuzzleController>(
             builder: (context,puzzleController,child) {
               return Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  
                  PuzzlePieces(),
                  SizedBox(width: 20),
                  PuzzleHolder(),

                ],
                         );
             }
           ),
           Positioned(
            right: 10,
            
            child: FloatingActionButton(onPressed: (){acceptedImages.clear();
            puzzleController.notify();
            },child: const Icon(Icons.refresh),),),
          
        ],
      ),
    );
  }
}




