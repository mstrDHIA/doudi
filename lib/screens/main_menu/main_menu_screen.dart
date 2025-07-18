import 'package:flutter/material.dart';
import 'package:doudi/screens/games/click_game/click_screen.dart';
import 'package:doudi/screens/games/colors_game/colors_screen.dart';
import 'package:doudi/screens/games/count_game/count_game_screen.dart';
import 'package:doudi/screens/games/press_game/press_game_screen.dart';
import 'package:doudi/screens/games/puzzle_game/puzzle_screen.dart';

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
      'title':'اضغط على الشاشة',
      'icon':'assets/icons/click.png',
      'widget':const PressGameScreen(),
      'route':'/press'
    },
    {
      'title':'حل الأحجية',
      'icon':'assets/icons/puzzle.png',
      'widget':const PuzzleScreen(),
      'route':'/puzzle'
    },
    {
      'title':'احسب الاشياء',
      'icon':'assets/icons/countdown.png',
      'widget':const CountGameScreen(),
      'route':'/count'
    },
    {
      'title':'لغبة الالوان',
      'icon':'assets/icons/color-palette.png',
      'widget':const ColorsGameScreen(),
      'route':'/colors'
    },
    {
      'title':'اختر الرقم الصحيح',
      'icon':'assets/icons/check-box.png',
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
              child: Column(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width/10,
                      height: MediaQuery.of(context).size.width/10,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                    ),
                    // width: 100,
                    // height: 100,
                    // width: MediaQuery.of(context).size.width/5,
                    // height: MediaQuery.of(context).size.width/5,
                    
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Center(child: Image.asset(menuItems[index]['icon'],
                      // width: MediaQuery.of(context).size.width/10,
                      // height: MediaQuery.of(context).size.width/10,
                      )),
                    ),
                  ),
                   const SizedBox(height: 10,),
                        Container(
                           decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Colors.white,
                    ),
                          child: Padding(
                            padding: const EdgeInsets.all(2.0),
                            child: Text(menuItems[index]['title'],
                            style: const TextStyle(fontSize: 20,fontWeight: FontWeight.bold),textAlign: TextAlign.center,),
                          ),
                          )
                ],
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