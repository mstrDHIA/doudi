import 'package:flutter/material.dart';
import 'package:match/controllers/auth_controller.dart';

class LogoutConfirmationDialog extends StatelessWidget {
  const LogoutConfirmationDialog({
    super.key,
    required this.authController,
  });

  final AuthController authController;

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: AlertDialog(
        title: const Text('تاكيد تسجيل الخروج'),
        content: const Text('هل انت متاكد من تسجيل الخروج؟'),
        actions: <Widget>[
          TextButton(
            child: const Text('الغاء'),
            onPressed: () {
              Navigator.of(context).pop(); // Dismiss the dialog
            },
          ),
          TextButton(
            child: const Text('تسجيل الخروج'),
            onPressed: () {
              Navigator.of(context).pop(); // Dismiss the dialog
              authController.logout(context); // Perform the logout action
            },
          ),
        ],
      ),
    );
  }
}
