import 'package:flutter/material.dart';
import 'package:match/screens/home/home_screen.dart';

class NumbersMenuScreen extends StatelessWidget{
  final List<String> numbers = ["assets/images/number1.png","assets/images/number2.png","assets/images/number3.png","assets/images/number4.png","assets/images/number5.png","assets/images/number6.png","assets/images/number7.png","assets/images/number8.png","assets/images/number9.png","assets/images/number0.png"];

   NumbersMenuScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('Home Screen'),
      // ),
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/backgrounds/trees_bakground.jpeg'), // Path to your background image
                fit: BoxFit.cover,
              ),
            ),
          ),
           Positioned(
                          top: MediaQuery.of(context).size.height/2-100,
                          left: MediaQuery.of(context).size.width/50,
                          child: Image.asset("assets/images/worm.png")),

                      //     Positioned(
                      // top: 20,
                      // left: 20,
                      // child: GestureDetector(
                      //   onTap: () => Navigator.pop(context),
                      //   child: CircleAvatar(child: Padding(
                      //     padding: const EdgeInsets.all(6.0),
                      //     child: Image.asset("assets/icons/back.png",width: 50,height: 50,),
                      //   )),
                      // )),
                          SizedBox(
                            width: MediaQuery.of(context).size.width,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                SizedBox(
                                  
                                  width: MediaQuery.of(context).size.width*0.8,
                                  child: Center(
                                    child: GridView.builder(
                                      
                                      shrinkWrap: true,
                                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 5),
                                    itemCount: 10,
                                     itemBuilder: (BuildContext context, int index) { 
                                        return Center(child: GestureDetector(
                                          onTap: (){
                                            Navigator.push(context, MaterialPageRoute(builder: (context)=>const HomeScreen()));
                                          },
                                          child: Image.asset(numbers[index])));
                                      },),
                                  ),
                                ),
                              ],
                            ),
                          )
      //                     HomeItem(top: MediaQuery.of(context).size.height/4,
      // left: MediaQuery.of(context).size.width/4,
      // img: "assets/images/numbers.png",
      // Route: NumbersScreen(),
      // txt: "الأرقام",),

      
        ],
      )
    );

  }
}