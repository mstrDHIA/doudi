import 'package:flutter/material.dart';

class FormChip extends StatelessWidget {
  final String txt;
  final TextEditingController textController;
  final TextInputType inputType;
  const FormChip({
    super.key, required this.txt, required this.textController, required this.inputType,
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
          keyboardType: inputType,
          controller: textController,
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


class InfoChip extends StatelessWidget {
  final String txt;
  final String info;
  const InfoChip({
    super.key, required this.txt, required this.info,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.45,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [ 
          Text('$txt: '),
          // SizedBox(width: 10,),
          Container(
            
            height: MediaQuery.of(context).size.height * 0.15,
            width: MediaQuery.of(context).size.width * 0.3,
          
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
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: Text(info,
                  style: TextStyle(color: Colors.white),
                  
                 
                 
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class SelectChip extends StatefulWidget {
  final String txt;
  final TextEditingController textController;
  // final TextInputType inputType;
  final List<String> options;

  const SelectChip({
    super.key, required this.txt, required this.textController, 
    // required this.inputType,
     required this.options,
  });

  @override
  _SelectChipState createState() => _SelectChipState();
}

class _SelectChipState extends State<SelectChip> {
  String? selectedValue;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Show dropdown when tapped
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.green.withOpacity(0.8),
          borderRadius: BorderRadius.circular(50),
          boxShadow: [
            BoxShadow(
              color: Colors.white.withOpacity(0.5),
              blurRadius: 1,
            ),
            BoxShadow(
              color: Colors.white,
              spreadRadius: -4.0,
              offset: Offset(0, 2),
              blurRadius: 2.0,
            ),
          ],
        ),
        width: MediaQuery.of(context).size.width * 0.4,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: DropdownButtonFormField<String>(
            value: selectedValue,
            items: widget.options.map((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
            onChanged: (newValue) {
              setState(() {
                selectedValue = newValue;
                widget.textController.text = newValue!;
              });
            },
            decoration: InputDecoration(
              labelText: widget.txt,
              border: InputBorder.none,
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'الرجاء إدخال ${widget.txt}';
              }
              return null;
            },
          ),
        ),
      ),
    );
  }
}