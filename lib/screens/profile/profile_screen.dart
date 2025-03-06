import 'package:flutter/material.dart';
import 'package:match/controllers/auth_controller.dart';
// import 'package:flutter_inner_shadow/flutter_inner_shadow.dart';
import 'package:match/screens/profile/widgets/profile_widgets.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  late AuthController authController;

  @override
  void initState() {
    authController=Provider.of<AuthController>(context, listen: false);
    // TODO: implement initState
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green[600],
        title: const Align(
          alignment: Alignment.centerRight,
          child: const Text('ملفك الشخصي',style: TextStyle(color: Colors.white),)),
      ),
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: Stack(
          children: [
            Container(
              // decoration: const BoxDecoration(
              //   image: DecorationImage(
              //     image: AssetImage('assets/backgrounds/trees_bakground.jpeg'), // Path to your background image
              //     fit: BoxFit.cover,
              //   ),
              // ),
            
            decoration: const BoxDecoration(
        
            // gradient: LinearGradient(
            //   begin: Alignment.topLeft,
            //   end: Alignment.bottomRight,
              color: Colors.green,
            //     Color(0xFF52C91B),
            //     Color(0xFF29630D),
            //   ],
            // ),
            
          ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal:12.0,
              vertical: 12
              ),
              child: ListView(
                shrinkWrap: true,
              
                children:  [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      InfoChip(txt:'الاسم',info:authController.currentUser.profile!.firstName!),
                      InfoChip(txt:'اللقب',info:authController.currentUser.profile!.lastName!),
                  
                    ],
                  ),
                  SizedBox(height: 5),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      InfoChip(txt:'البريد الالكتروني',info:authController.currentUser.profile!.email!),
                      InfoChip(txt:'رقم الهاتف',info:authController.currentUser.profile!.phone.toString()),
                    ],
                  ),
                  SizedBox(height: 5),
              
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      InfoChip(txt:'الجنس',info:authController.currentUser.profile!.phone.toString()!),
                      InfoChip(txt:'العمر',info:authController.currentUser.profile!.age.toString()),
                    ],
                  ),
                  SizedBox(height: 5),
              
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      InfoChip(txt:'العنوان',info:authController.currentUser.profile!.phone.toString()),
                      InfoChip(txt:'المدينة',info:authController.currentUser.profile!.phone.toString()),
                    ],
                  ),
                  SizedBox(height: 5),
              
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //   children: <Widget>[
                  //     InfoChip(txt:'الدولة'),
                  //     InfoChip(txt:'الرمز البريدي'),
                  //   ],
                  // ),
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //   children: <Widget>[
                  //     InfoChip(txt:'ال'),
                  //     InfoChip(txt:'المستوى الدراسي'),
                  //   ],
                  // ),
                  // SizedBox(height: 5),
                  // GestureDetector(
                  //   onTap: (){
                  //     // if (_formKey.currentState!.validate()) {
                  //     //   _formKey.currentState!.save();
                  //     //   // Save profile information
                  //     //   ScaffoldMessenger.of(context).showSnackBar(
                  //     //     const SnackBar(content: Text('تم حفظ الملف الشخصي')),
                  //     //   );
                  //     // }
                  //     Navigator.push(context, MaterialPageRoute(builder: (context)=>  NumbersMenuScreen()));
                  //   },
                  //   child: Container(
                    
                  //     decoration: BoxDecoration(
                  //       color: Colors.white,
                  //       // color: Colors.green.withOpacity(0.8),
                  //       borderRadius: BorderRadius.circular(50),
                        
                  //     ),
                  //           width: 100,
                  //           height: MediaQuery.of(context).size.height*0.1,
                  //           child: Center(
                  //             child: Text('حفظ الملف الشخصي'),
                  //           ),
                  //         ),
                  // ),
                  // SizedBox(height: 60),
                  
              
                ],
              ),
            ),
          ],
        ),
      ),
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      // floatingActionButton: FloatingActionButton.extended(
        
      //   onPressed: (){
      //   if (_formKey.currentState!.validate()) {
      //     _formKey.currentState!.save();
      //     // Save profile information
      //     ScaffoldMessenger.of(context).showSnackBar(
      //       SnackBar(content: Text('تم حفظ الملف الشخصي')),
      //     );
      //   }
      // }, label: Text("حفظ الملف الشخصي"),
      // elevation: 2,
      
      // ),
      // bottomNavigationBar: Container(
      //   width: MediaQuery.of(context).size.width*0.5,
      //   height: MediaQuery.of(context).size.height*0.1,
      //   child: Center(
      //     child: Padding(
      //       padding: const EdgeInsets.all(8.0),
      //       child: ElevatedButton(
      //                           onPressed: () {
      //                             if (_formKey.currentState!.validate()) {
      //                               _formKey.currentState!.save();
      //                               // Save profile information
      //                               ScaffoldMessenger.of(context).showSnackBar(
      //                                 SnackBar(content: Text('تم حفظ الملف الشخصي')),
      //                               );
      //                             }
      //                           },
      //                           child: Text('حفظ الملف الشخصي'),
      //                         ),
      //     ),
      //   ),
      // ),
    );
  }
}

