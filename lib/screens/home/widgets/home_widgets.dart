// import 'package:barcode_scan2/barcode_scan2.dart';
import 'package:flutter/material.dart';
import 'package:doudi/controllers/qr_controller.dart';
import 'package:simple_barcode_scanner/simple_barcode_scanner.dart';

class HomeItem extends StatelessWidget {
  final String img;
  final String txt;
  final double top;
  final double left;
  final Widget route;
  final QrController qrController;
  const HomeItem({
    super.key, required this.img, required this.txt, required this.top, required this.left, required this.route, required this.qrController,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: top,
      left: left,
      child: GestureDetector(
        onTap: () async {
          if(txt!="مسح"){
            // Navigator.push(context, MaterialPageRoute(builder: (context)=> NumbersMenuScreen()));
          Navigator.push(context, MaterialPageRoute(builder: (context)=>route));
        }
        else{
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
          
  //         var result = await BarcodeScanner.scan();
  //          print(result.type); // The result type (barcode, cancelled, failed)
  // print(result.rawContent); // The barcode content
  // print(result.format); // The barcode format (as enum)
  // print(result.formatNote); // If a unknown format was scanned this field contains a note
        }
        },
        child: Column(
          children: [
            Image.asset(img),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10)
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: Text(txt,style: const TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),
              ))
          ],
        ),
      ),);
  }
}