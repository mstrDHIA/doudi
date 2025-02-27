// import 'package:barcode_scan2/barcode_scan2.dart';
import 'package:flutter/material.dart';
import 'package:match/controllers/qr_controller.dart';
// import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:match/screens/auth/login/login_screen.dart';
import 'package:provider/provider.dart';
import 'package:simple_barcode_scanner/simple_barcode_scanner.dart';
// import 'package:match/screens/home/home_screen.dart';
// import 'package:match/screens/numbers/numbers_menu.dart';

// ignore: must_be_immutable
class SelectProfileScreen extends StatefulWidget {

  const SelectProfileScreen({super.key});

  @override
  State<SelectProfileScreen> createState() => _SelectProfileScreenState();
}

class _SelectProfileScreenState extends State<SelectProfileScreen> {
  late QrController qrController;
  List<String> profileOption=["parent","child","QRcode"];

  @override
  void initState() {
    qrController=Provider.of<QrController>(context, listen: false);
    // TODO: implement initState
    super.initState();
  }

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
                        onTap:() async {
                          if(profileOption[i]=="child"){
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>const LoginScreen()));
                          }
                          else if(profileOption[i]=="parent"){
                            // Navigator.push(context, MaterialPageRoute(builder: (context)=>const LoginScreen()));
                          }
                          else if(profileOption[i]=="QRcode"){
                            
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
                // setState(() {
                 String result = res as String;
                  qrController.qrCodeHandler(qrData: result, context: context, barcode: res);
                 print(result);
                // });
                            // Navigator.push(context, MaterialPageRoute(builder: (context)=> QRScreen()));
  //                            var result = await BarcodeScanner.scan(options: ScanOptions(
  //                             restrictFormat: [BarcodeFormat.qr],
                              
  //                            ));
  //                            print('aaaa');
  //          print(result.type); // The result type (barcode, cancelled, failed)
  // print(result.rawContent); // The barcode content
  // print(result.format); // The barcode format (as enum)
  // print(result.formatNote); // If a unknown format was scanned this field contains a note

  // String barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
  //                                                  "#ff6666", "Cancel", false, ScanMode.QR);
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