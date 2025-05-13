import 'package:flutter/material.dart';
import 'package:doudi/controllers/auth_controller.dart';
// import 'package:flutter_inner_shadow/flutter_inner_shadow.dart';
// import 'package:doudi/screens/numbers/numbers_menu.dart';
import 'package:doudi/screens/profile/widgets/profile_widgets.dart';
import 'package:provider/provider.dart';

class AddProfileScreen extends StatefulWidget {
  @override
  _AddProfileScreenState createState() => _AddProfileScreenState();
}

class _AddProfileScreenState extends State<AddProfileScreen> {
  late AuthController authController;
  final _formKey = GlobalKey<FormState>();
  TextEditingController firstNameController=TextEditingController();
  TextEditingController lastNameController=TextEditingController();
  TextEditingController emailController=TextEditingController();
  TextEditingController phoneController=TextEditingController();
  TextEditingController sexController=TextEditingController();
  TextEditingController ageController=TextEditingController();
  TextEditingController cityController=TextEditingController();
  TextEditingController addressController=TextEditingController();

  @override
  void initState() {
    authController=Provider.of<AuthController>(context,listen: false);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green[600],
        title: const Align(
          alignment: Alignment.centerRight,
          child: Text('اضف ملفك الشخصي')),
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
              padding: const EdgeInsets.all(16.0),
              child: Form(
                key: _formKey,
                child: ListView(
                  shrinkWrap: true,

                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        FormChip(txt:'الاسم',textController: firstNameController,inputType: TextInputType.name,),
                        FormChip(txt:'اللقب',textController: lastNameController,inputType: TextInputType.name,),
                        // Container(
                        //   width: MediaQuery.of(context).size.width * 0.4,
                        //   child: TextFormField(
                        //     decoration: InputDecoration(labelText: 'اللقب'),
                        //     validator: (value) {
                        //       if (value == null || value.isEmpty) {
                        //         return 'Please enter your email';
                        //       }
                        //       return null;
                        //     },
                        //     onSaved: (value) {
                        //       _email = value!;
                        //     },
                        //   ),
                        // ),
                        // TextFormField(
                        //   decoration: InputDecoration(labelText: 'Phone'),
                        //   validator: (value) {
                        //     if (value == null || value.isEmpty) {
                        //       return 'Please enter your phone number';
                        //     }
                        //     return null;
                        //   },
                        //   onSaved: (value) {
                        //     _phone = value!;
                        //   },
                        // ),
                        // SizedBox(height: 10),
                        // ElevatedButton(
                        //   onPressed: () {
                        //     if (_formKey.currentState!.validate()) {
                        //       _formKey.currentState!.save();
                        //       // Save profile information
                        //       ScaffoldMessenger.of(context).showSnackBar(
                        //         SnackBar(content: Text('Profile Saved')),
                        //       );
                        //     }
                        //   },
                        //   child: Text('Save Profile'),
                        // ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        FormChip(txt:'البريد الالكتروني',textController: emailController,inputType: TextInputType.emailAddress,),
                        FormChip(txt:'رقم الهاتف',textController: phoneController,inputType: TextInputType.phone,),
                      ],
                    ),
                    const SizedBox(height: 10),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        SelectChip(txt:'الجنس',textController: sexController,options: const ['ذكر','انثى'],),
                        // FormChip(txt:'الجنس',textController: sexController,),
                        FormChip(txt:'العمر',textController: ageController,inputType: TextInputType.number,),
                      ],
                    ),
                    const SizedBox(height: 10),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        FormChip(txt:'العنوان',textController: addressController,inputType: TextInputType.streetAddress,),
                        FormChip(txt:'المدينة',textController: cityController,inputType: TextInputType.text,),
                      ],
                    ),
                    // SizedBox(height: 10),

                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.spaceAround,
                    //   children: <Widget>[
                    //     FormChip(txt:'الدولة'),
                    //     FormChip(txt:'الرمز البريدي'),
                    //   ],
                    // ),
                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.spaceAround,
                    //   children: <Widget>[
                    //     FormChip(txt:'ال'),
                    //     FormChip(txt:'المستوى الدراسي'),
                    //   ],
                    // ),
                    const SizedBox(height: 10),
                    GestureDetector(
                      onTap: (){
                        // if (_formKey.currentState!.validate()) {
                        //   _formKey.currentState!.save();
                        //   // Save profile information
                        //   ScaffoldMessenger.of(context).showSnackBar(
                        //     const SnackBar(content: Text('تم حفظ الملف الشخصي')),
                        //   );
                        // }
                        authController.editProfile(context,address: addressController.text,city: cityController.text,age: ageController.text,email: emailController.text,firstName: firstNameController.text,lastName: lastNameController.text,phone: phoneController.text,sex: sexController.text,);
                        // Navigator.push(context, MaterialPageRoute(builder: (context)=>  NumbersMenuScreen()));
                      },
                      child: Container(
                      
                        decoration: BoxDecoration(
                          color: Colors.white,
                          // color: Colors.green.withOpacity(0.8),
                          borderRadius: BorderRadius.circular(50),
                          
                        ),
                              width: 100,
                              height: MediaQuery.of(context).size.height*0.1,
                              child: const Center(
                                child: Text('حفظ الملف الشخصي'),
                              ),
                            ),
                    ),const SizedBox(height: 60),
                    

                  ],
                ),
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

