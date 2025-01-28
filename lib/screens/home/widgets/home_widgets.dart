import 'package:flutter/material.dart';

class HomeItem extends StatelessWidget {
  final String img;
  final String txt;
  final double top;
  final double left;
  final Widget route;
  const HomeItem({
    super.key, required this.img, required this.txt, required this.top, required this.left, required this.route,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: top,
      left: left,
      child: GestureDetector(
        onTap: (){
          Navigator.push(context, MaterialPageRoute(builder: (context)=>route));
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
                child: Text(txt,style: const TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),
              ))
          ],
        ),
      ),);
  }
}