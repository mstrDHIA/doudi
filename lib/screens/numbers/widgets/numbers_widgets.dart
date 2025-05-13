import 'package:flutter/material.dart';
import 'package:doudi/controllers/menu_controller.dart';
import 'package:doudi/controllers/progress_controller.dart';
import 'package:doudi/controllers/qr_controller.dart';
import 'package:doudi/screens/home/home_screen.dart';
import 'package:simple_barcode_scanner/simple_barcode_scanner.dart';

class NumberBox extends StatefulWidget {
  const NumberBox({
    super.key,
    required this.progressController,
    required this.menuController,
    required this.numbers, required this.index, required this.qrController,
  });

  final ProgressController progressController;
  final QrController qrController;
  final MyMenuController menuController;
  final List<String> numbers;
  final int index;

  @override
  State<NumberBox> createState() => _NumberBoxState();
}

class _NumberBoxState extends State<NumberBox> {
  int myindex=-1;
  @override
  void initState() {
    if(widget.index+1<=5){
      myindex=widget.index+1;
    }
    else if(widget.index+1==6){
      myindex=-1;
    }
    else if(widget.index+1==12){
      myindex=-2;
    }
    else if(widget.index+1>6&&widget.index+1<11){
        myindex=widget.index;
      }
      else if(widget.index+1==11){
        // print(widget.index+1);
        myindex=0;
      }
      
    
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Center(child: GestureDetector(
      onTap: () async {
 
        if((myindex<=widget.progressController.currentNumber)&&myindex>0){
          widget.menuController.selectedNumber=widget.index+1;
        Navigator.push(context, MaterialPageRoute(builder: (context)=>const HomeScreen()));
        }
        else if(myindex==-1){
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
                 widget.qrController.qrCodeHandler(qrData: result, context: context, barcode: res);
                 print(result);
          
          // Navigator.push(context, MaterialPageRoute(builder: (context)=> QRScreen()));
        }
        else if(myindex==-2){
          // Navigator.push(context, MaterialPageRoute(builder: (context)=>const HomeScreen()));
        
      }
      
      },
      child: Opacity(
        opacity: (((myindex<=widget.progressController.currentNumber)&&myindex!=0)||myindex<0)?1:0.5,
        child: Image.asset(widget.numbers[widget.index]))));
  }
}