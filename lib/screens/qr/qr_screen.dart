import 'dart:convert';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:match/screens/qr/widget.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

class QRScreen extends StatefulWidget {
  @override
  _QRScreenState createState() => _QRScreenState();
}

class _QRScreenState extends State<QRScreen> {
  final AudioPlayer _audioPlayer = AudioPlayer();
  final MobileScannerController controller = MobileScannerController(
    formats: const [BarcodeFormat.qrCode],
  );
  String? barcode;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: Column(
        children: <Widget>[
          Expanded(
            flex: 5,
            child: MobileScanner(
              onDetect: (barcode) async {
              //  print(barcode.raw);
              // Map<String, dynamic> data = barcode.raw as Map<String, dynamic>;
              //  print(barcode.raw.toString());
              String stringData=barcode.raw.toString().split('displayValue: ')[1].split(', driverLicense:')[0];
              Map<String, dynamic> data = jsonDecode(stringData);
              print(data['message']);
               await _audioPlayer.play(AssetSource(data['message']));
               Navigator.pop(context);


              },
              overlayBuilder: (context, constraints) {
                return Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Center(
                      child: Container(
                        width: MediaQuery.sizeOf(context).width/4,
                        height: MediaQuery.sizeOf(context).width/4,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.green,
                          style: BorderStyle.solid
                          )
                          // color: Colors.red
                          
                        ),
                      ),
                    )
                    // ScannedBarcodeLabel(barcodes: controller.barcodes),
                  ),
                );
              },
              
            ),
          ),
          // ValueListenableBuilder(
          //   valueListenable: controller,
          //   builder: (context, value, child) {
          //     return Container(
          //       width: 100,
          //       height: 100,
          //       decoration: BoxDecoration(
          //         color: Colors.red
          //       ),
          //     );
          //     // if (!value.isInitialized ||
          //     //     !value.isRunning ||
          //     //     value.error != null ||
          //     //     scanWindow.isEmpty) {
          //     //   return const SizedBox();
          //     // }

          //     // return ScanWindowOverlay(
          //     //   controller: controller,
          //     //   scanWindow: scanWindow,
          //     // );
          //   },
          // ),
          
        ],
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