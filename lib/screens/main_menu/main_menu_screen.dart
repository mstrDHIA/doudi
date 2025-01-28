import 'package:flutter/material.dart';
import 'package:match/screens/games/click_game/click_screen.dart';
import 'package:match/screens/games/colors_game/colors_screen.dart';
import 'package:match/screens/games/count_game/count_game_screen.dart';
import 'package:match/screens/games/press_game/press_game_screen.dart';
import 'package:match/screens/games/puzzle_game/puzzle_screen.dart';

// ignore: must_be_immutable
class MainMenuScreen extends StatelessWidget{
  List<Map<String,dynamic>> menuItems=[
    // {
    //   'title':'Match',
    //   'icon':Icons.play_arrow,
    //   'widget':MatchScreen(),
    //   'route':'/match'
    // },
    {
      'title':'Press',
      'icon':Icons.ads_click,
      'widget':const PressGameScreen(),
      'route':'/press'
    },
    {
      'title':'Puzzle',
      'icon':Icons.question_answer,
      'widget':const PuzzleScreen(),
      'route':'/puzzle'
    },
    {
      'title':'Count',
      'icon':Icons.numbers,
      'widget':const CountGameScreen(),
      'route':'/count'
    },
    {
      'title':'Colors',
      'icon':Icons.color_lens,
      'widget':const ColorsGameScreen(),
      'route':'/colors'
    },
    {
      'title':'Click',
      'icon':Icons.ads_click,
      'widget':const ClickGameScreen(),
      'route':'/click'
    },
  ];

  MainMenuScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background image
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/backgrounds/barn.png'), // Path to your background image
                fit: BoxFit.cover,
              ),
            ),
          ),
          
          // Foreground content
          Padding(
            padding: const EdgeInsets.all(36.0),
            child: GridView.builder(gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4,
            childAspectRatio: 1, crossAxisSpacing: 40, mainAxisSpacing: 10,
                    
            ), itemBuilder: (context,index)=>
            GestureDetector(
              onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context)=>menuItems[index]['widget'])),
              child: Container(
                // width: 100,
                // height: 100,
                // width: MediaQuery.of(context).size.width/5,
                // height: MediaQuery.of(context).size.width/5,
                color: Colors.white,
                child: Center(child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                     Icon(menuItems[index]['icon']),
                     const SizedBox(height: 10,),
                    Text(menuItems[index]['title']),
                  ],
                )),
              ),
            ),
             itemCount: menuItems.length,),
          ),
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
        ])
    );

  }
}