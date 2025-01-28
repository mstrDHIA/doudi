import 'package:flutter/material.dart';
import 'package:match/screens/auth/login/login_screen.dart';
// import 'package:match/screens/home/home_screen.dart';
// import 'package:match/screens/numbers/numbers_menu.dart';

// ignore: must_be_immutable
class SelectProfileScreen extends StatelessWidget {
  List<String> profileOption=["parent","child","QRcode"];

  SelectProfileScreen({super.key});
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
            decoration: const BoxDecoration(
              color: Colors.white
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  children: [
                    Center(child: Image.asset("assets/images/worm.png",scale: 3,)),
                    const SizedBox(height: 10,),
                    const Text(

                  'Doudi',
                  style: TextStyle(
                    fontSize: 24,
                    color: Colors.green,
                  ),
                ),
                const SizedBox(height: 5,),
                const Text('Apprendre en s\'amusant',
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
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>const LoginScreen()));
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
                                  child: Center(child: Text(profileOption[i],style: const TextStyle(color: Colors.white),)),
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