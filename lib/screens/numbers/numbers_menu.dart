import 'package:flutter/material.dart';
import 'package:match/controllers/auth_controller.dart';
import 'package:match/controllers/menu_controller.dart';
import 'package:match/controllers/progress_controller.dart';
import 'package:match/controllers/qr_controller.dart';
import 'package:match/screens/numbers/widgets/dialogs/numbers_dialogs.dart';
// import 'package:match/screens/home/home_screen.dart';
import 'package:match/screens/numbers/widgets/numbers_widgets.dart';
import 'package:match/screens/profile/profile_screen.dart';
import 'package:provider/provider.dart';
// import 'package:shared_preferences/shared_preferences.dart';

class NumbersMenuScreen extends StatefulWidget{

   const NumbersMenuScreen({super.key});

  @override
  State<NumbersMenuScreen> createState() => _NumbersMenuScreenState();
}

class _NumbersMenuScreenState extends State<NumbersMenuScreen> {
  final List<String> numbers = ["assets/images/number1.png","assets/images/number2.png","assets/images/number3.png","assets/images/number4.png","assets/images/number5.png","assets/images/qrbox.png","assets/images/number6.png","assets/images/number7.png","assets/images/number8.png","assets/images/number9.png","assets/images/number0.png","assets/images/numbers.png",];
  late MyMenuController menuController;
  late AuthController authController;
  late ProgressController progressController;
  late QrController qrController;
  // late SharedPreferences prefs;
  @override
  void initState() {
    menuController=Provider.of<MyMenuController>(context, listen: false);
    authController=Provider.of<AuthController>(context, listen: false);
    progressController=Provider.of<ProgressController>(context, listen: false);
    qrController=Provider.of<QrController>(context, listen: false);
    // TODO: implement initState
    super.initState();
  }

  @override
  void didChangeDependencies()  {
    progressController.getCurrentNumber();
    // prefs=await SharedPreferences.getInstance();
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
  }
  
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
                      top: 20,
                      right: 120,
                      child: GestureDetector(
                        
                        onTap: () { 
                          Navigator.push(context, MaterialPageRoute(builder:  (context)=>ProfileScreen()));
    //                       showDialog(
    //   context: context,
    //   builder: (BuildContext context) {
    //     return LogoutConfirmationDialog(authController: authController);
    //   },
    // );
                          // authController.logout(context);
                          },
                        child: const CircleAvatar(child: Padding(
                          padding: EdgeInsets.all(6.0),
                          child: Icon(Icons.person,color: Colors.green,),
                          // child: Image.asset("assets/icons/back.png",width: 50,height: 50,),
                        )),
                      )),
          Positioned(
                      top: 20,
                      right: 70,
                      child: GestureDetector(
                        
                        onTap: () { 
                          Provider.of<AuthController>(context, listen: false).login('6D5E8847105E86F7D34C642C647511F9636F48DFB88488112DF01C22853D7DB3','12345',context);
    //                       showDialog(
    //   context: context,
    //   builder: (BuildContext context) {
    //     return LogoutConfirmationDialog(authController: authController);
    //   },
    // );
                          // authController.logout(context);
                          },
                        child: const CircleAvatar(child: Padding(
                          padding: EdgeInsets.all(6.0),
                          child: Icon(Icons.settings,color: Colors.green,),
                          // child: Image.asset("assets/icons/back.png",width: 50,height: 50,),
                        )),
                      )),

                      Positioned(
                      top: 20,
                      right: 20,
                      child: GestureDetector(
                        
                        onTap: () { 
                          showDialog(
      context: context,
      builder: (BuildContext context) {
        return LogoutConfirmationDialog(authController: authController);
      },
    );
                          // authController.logout(context);
                          },
                        child: const CircleAvatar(child: Padding(
                          padding: EdgeInsets.all(6.0),
                          child: Icon(Icons.logout,color: Colors.green,),
                          // child: Image.asset("assets/icons/back.png",width: 50,height: 50,),
                        )),
                      )),
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
                                    child: Consumer<ProgressController>(
                                      builder: (context,progressController,child) {
                                        return GridView.builder(
                                          
                                          shrinkWrap: true,
                                          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 6),
                                        itemCount: 12,
                                         itemBuilder: (BuildContext context, int index) { 
                                            return NumberBox(progressController: progressController, menuController: menuController, numbers: numbers, index: index,qrController: qrController,);
                                          },);
                                      }
                                    ),
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


