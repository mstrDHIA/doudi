
import 'package:flutter/material.dart';
import 'package:match/controllers/qr_controller.dart';
// import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:provider/provider.dart';

class QRScreen extends StatefulWidget {
  const QRScreen({super.key});

  @override
  _QRScreenState createState() => _QRScreenState();
}

class _QRScreenState extends State<QRScreen> {
  late QrController qrController;
  // final AudioPlayer _audioPlayer = AudioPlayer();
  // final MobileScannerController controller = MobileScannerController(
  //   formats: const [BarcodeFormat.qrCode],
  // );
  String? barcode;


  @override
  void initState() {
    qrController=Provider.of<QrController>(context, listen: false);
    qrController.isFirst=true;
    // TODO: implement initState
    super.initState();
  }


  @override
  void dispose() {
    // controller.dispose();
    // TODO: implement dispose
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: RotatedBox(
        quarterTurns: 1,
        child: Expanded(
          flex: 5,
          child: Container(),
          // child: MobileScanner(
            
          //   onDetect: (barcode,a) async {
          //     print('aaa');
          //     // Map<String, dynamic> data = barcode.raw as Map<String, dynamic>;
          //     await qrController.qrCodeHandler(qrData: barcode,context: context,barcode: barcode);
          //   //  print(barcode.raw);
          //   // Map<String, dynamic> data = barcode.raw as Map<String, dynamic>;
          //   //  print(barcode.raw.toString());
            
          //   //  await _audioPlayer.play(AssetSource(data['message']));
          //   //  Navigator.pop(context);
        
        
          //   },
            
          //   // overlayBuilder: (context, constraints) {
          //   //   return Padding(
          //   //     padding: const EdgeInsets.all(16.0),
          //   //     child: Align(
          //   //       alignment: Alignment.bottomCenter,
          //   //       child: Center(
          //   //         child: Container(
          //   //           width: MediaQuery.sizeOf(context).width/4,
          //   //           height: MediaQuery.sizeOf(context).width/4,
          //   //           decoration: BoxDecoration(
          //   //             border: Border.all(color: Colors.green,
          //   //             style: BorderStyle.solid
          //   //             )
          //   //             // color: Colors.red
                        
          //   //           ),
          //   //         ),
          //   //       )
          //   //       // ScannedBarcodeLabel(barcodes: controller.barcodes),
          //   //     ),
          //   //   );
          //   // },
            
          // ),
        ),
      ),
    );
  }
}


// import 'package:flutter/material.dart';
// import 'package:mobile_scanner/mobile_scanner.dart';

// class QRCodeScannerScreen extends StatefulWidget {
//   @override
//   _QRCodeScannerScreenState createState() => _QRCodeScannerScreenState();
// }

// class _QRCodeScannerScreenState extends State<QRCodeScannerScreen> {
//   String? qrCodeData;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('QR Code Scanner'),
//       ),
//       body: Column(
//         children: <Widget>[
//           Expanded(
//             flex: 5,
//             child: MobileScanner(
//               onDetect: (barcode) {
//                 if (barcode != null) {
//                   setState(() {
//                     qrCodeData = barcode.raw.toString();
//                   });
//                   print(qrCodeData);
//                   // Navigator.of(context).pop(barcode.rawValue);
//                 }
//               },
//             ),
//           ),
//           Expanded(
//             flex: 1,
//             child: Center(
//               child: qrCodeData != null
//                   ? Text('Data: $qrCodeData')
//                   : Text('Scan a code'),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }