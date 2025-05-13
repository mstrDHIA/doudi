import 'package:doudi/controllers/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:doudi/controllers/qr_controller.dart';
import 'package:doudi/screens/auth/select_profile.dart';
import 'package:provider/provider.dart';
import 'package:simple_barcode_scanner/enum.dart';
import 'package:simple_barcode_scanner/simple_barcode_scanner.dart';
// import 'package:doudi/screens/home/home_screen.dart';
// import 'package:doudi/screens/numbers/numbers_menu.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  late AuthController authController;
  late QrController qrController;
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
                
                Consumer<AuthController>(
                  builder: (context,authController,child) {
                    return (!authController.isLoading)?Column(
                      children: [
                        GestureDetector(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>const SelectProfileScreen()));
                          },
                          child: Container(
                            width: MediaQuery.sizeOf(context).width * 0.2,
                            decoration: BoxDecoration(
                              color: Colors.green,
                              borderRadius: BorderRadius.circular(50),
                            ),
                            child: const Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Center(child: Text('commencer',style: TextStyle(color: Colors.white),)),
                            )),
                        ),
                          const SizedBox(height: 10,),
                          GestureDetector(
                            onTap: () async {
                              String? res = await SimpleBarcodeScanner.scanBarcode(
                      context,
                      barcodeAppBar: const BarcodeAppBar(
                        appBarTitle: 'مسح الكود',
                        centerTitle: false,
                        enableBackButton: true,
                        backButtonIcon: Icon(Icons.arrow_back_ios),
                      ),
                      isShowFlashIcon: true,
                      delayMillis: 2000,
                      cameraFace: CameraFace.back,
                    );
                    if(res != null) {
                       String result = res as String;
                      qrController.qrCodeHandler(qrData: result, context: context, barcode: res);
                    }
                    else{
                       Map<String,dynamic>  data= {
                          
                        
                                "title": "register",
                                "content": {
                    "username": "hama",
                    "password": "12345"
                                }
                            };
                        Provider.of<QrController>(context, listen: false).authHandler(qrData: data, context: context);
                      
                    }
                    // setState(() {
                    
                    //           print("login");
                                   // Navigator.push(context, MaterialPageRoute(builder: (context)=>const SelectProfileScreen()));
                            },
                            child: Container(
                                              width: MediaQuery.sizeOf(context).width * 0.2,
                                              decoration: BoxDecoration(
                                                border: Border.all(color: Colors.green),
                                                color: Colors.white,
                                                borderRadius: BorderRadius.circular(50),
                                              ),
                                              child: const Padding(
                                                padding: EdgeInsets.all(8.0),
                                                child: Center(child: Text('Je n\'est pas de compte',style: TextStyle(color: Colors.green),)),
                                              )),
                          )
                      ],
                    ):CircularProgressIndicator();
                  }
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