import 'package:flutter/material.dart';
import 'package:match/screens/auth/login/login_screen.dart';
import 'package:match/screens/home/home_screen.dart';
import 'package:match/screens/numbers/numbers_menu.dart';

class SelectProfileScreen extends StatelessWidget {
  List<String> profileOption=["parent","child","QRcode"];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xFF52C91B),
              Color(0xFF29630D),
            ],
          ),
        ),
        child: Center(
          child: Container(
            width: MediaQuery.sizeOf(context).width * 0.6,
            height: MediaQuery.sizeOf(context).height * 0.8,
            decoration: BoxDecoration(
              color: Colors.white
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  children: [
                    Center(child: Image.asset("assets/images/worm.png",scale: 3,)),
                    SizedBox(height: 10,),
                    Text(

                  'Doudi',
                  style: TextStyle(
                    fontSize: 24,
                    color: Colors.green,
                  ),
                ),
                SizedBox(height: 5,),
                Text('Apprendre en s\'amusant',
                  style: TextStyle(
                    fontSize: 24,
                    color: Colors.black,
                  ),
                ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    for (var i = 0; i < profileOption.length; i++)
                      GestureDetector(
                        onTap:(){
                          if(profileOption[i]=="child"){
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginScreen()));
                          }
                        },
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Image.asset("assets/images/${profileOption[i]}.png"),
                            // SizedBox(height: 10,),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                width: MediaQuery.sizeOf(context).width * 0.1,
                          
                                decoration: BoxDecoration(
                                  color: Colors.green,
                                  borderRadius: BorderRadius.circular(50),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Center(child: Text(profileOption[i],style: TextStyle(color: Colors.white),)),
                                )),
                            ),
                          ],
                        ),
                      )
                  ],
                )
                  
              ],
            ),
          ),
        ),
      ),
      // bottomNavigationBar: BottomAppBar(child: Padding(
      //   padding: const EdgeInsets.all(8.0),
      //   child: Center(child: ElevatedButton(onPressed: (){
      //     Navigator.push(context, MaterialPageRoute(builder: (context)=>NumbersMenuScreen()));
      //   }, child: Center(child: Text("Login")))),
      // ),),
    );
  }
}