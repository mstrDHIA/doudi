import 'package:flutter/material.dart';
import 'package:match/screens/auth/selet_profile.dart';
import 'package:match/screens/home/home_screen.dart';
import 'package:match/screens/numbers/numbers_menu.dart';

class LoginScreen extends StatelessWidget {
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
                Column(
                  children: [
                    Container(
                      width: MediaQuery.sizeOf(context).width * 0.4,
                      height: 40,
                      child: TextFormField(
                        // style: TextStyle(fontSize: 2),
                        decoration: InputDecoration(
                          labelText: "Nom d'utilisateur",
                          labelStyle: TextStyle(color: Colors.green),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(50),
                          ),
                        ),
                      ),
                      ),
                      SizedBox(height: 10,),
                      Container(
                      width: MediaQuery.sizeOf(context).width * 0.4,
                      height: 40,
                      child: TextFormField(
                        // style: TextStyle(fontSize: 2),
                        obscureText: true,
                        decoration: InputDecoration(
                          labelText: "Mot de passe",
                          labelStyle: TextStyle(color: Colors.green),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(50),
                          ),
                        ),
                      ),
                      )
                  ],
                )
                  ],
                ),
                
                Column(
                  children: [
                    GestureDetector(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>NumbersMenuScreen()));
                      },
                      child: Container(
                        width: MediaQuery.sizeOf(context).width * 0.2,
                        decoration: BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Center(child: Text('Login',style: TextStyle(color: Colors.white),)),
                        )),
                    ),
                      Container(
                        width: MediaQuery.sizeOf(context).width * 0.2,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text("Mot de passe oubliee?",style: TextStyle(color: Colors.green,decoration: TextDecoration.underline),
                            
                            ),
                          ],
                        )),
                  ],
                ),
                  
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