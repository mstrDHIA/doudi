import 'package:flutter/material.dart';

class FormChip extends StatelessWidget {
  final String txt;
  const FormChip({
    super.key, required this.txt,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.green.withOpacity(0.8),
        borderRadius: BorderRadius.circular(50),
        boxShadow: [
           BoxShadow(
                  color: Colors.white.withOpacity(0.5),
                  blurRadius: 1
                ),
                 BoxShadow(
                  color: Colors.white,
                  spreadRadius: -4.0,
                  offset: Offset(0, 2),
                  blurRadius: 2.0,
                ),
        ]
      ),
      width: MediaQuery.of(context).size.width * 0.4,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: TextFormField(
          style: TextStyle(color: Colors.white),
          decoration: InputDecoration(labelText: txt,
          border: InputBorder.none,
          ),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'الرجاء إدخال $txt';
            }
            return null;
          },
          onSaved: (value) {
            // name = value!;
          },
        ),
      ),
    );
  }
}