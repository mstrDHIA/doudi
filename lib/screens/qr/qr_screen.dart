import 'package:flutter/material.dart';
import 'package:match/screens/qr/widget.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

class QRScreen extends StatefulWidget {
  @override
  _QRScreenState createState() => _QRScreenState();
}

class _QRScreenState extends State<QRScreen> {
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
              onDetect: (barcode) {
               
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