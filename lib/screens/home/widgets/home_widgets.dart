import 'package:flutter/material.dart';

class HomeItem extends StatelessWidget {
  final String img;
  final String txt;
  final double top;
  final double left;
  final Widget Route;
  const HomeItem({
    super.key, required this.img, required this.txt, required this.top, required this.left, required this.Route,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: top,
      left: left,
      child: GestureDetector(
        onTap: (){
          Navigator.push(context, MaterialPageRoute(builder: (context)=>Route));
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
                child: Text(txt,style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),
              ))
          ],
        ),
      ),);
  }
}