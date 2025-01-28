import 'package:flutter/material.dart';

class PuzzleController extends ChangeNotifier{
final List<String> images = [
      // "assets/puzzles/Group_4.png",
      // "assets/puzzles/Group_5.png",
      // "assets/puzzles/Group_6.png",
      // "assets/puzzles/Group_7.png",
    ];
initPuzzlePieces(number){
  // if(number==0){
    images.clear();
    images.addAll([
      "assets/puzzles/$number/Group_4.png",
      "assets/puzzles/$number/Group_5.png",
      "assets/puzzles/$number/Group_6.png",
      "assets/puzzles/$number/Group_7.png",
    ]);
    notifyListeners();
  // }
  // else if(number==1){

  // }
}

dragEndHandler({acceptedImage, data}){
    if (acceptedImage != null) {
            // Swap the images
            // final temp = acceptedImage;
            acceptedImage = data.data;
            // final sourcePuzzleBox = context.findAncestorStateOfType<_PuzzleBoxState>();
            // sourcePuzzleBox!.acceptedImage = temp;
            // DragTargetDetails<String> target=DragTargetDetails(data: temp!, offset: Offset(0, 0));
            // data.data="";
            // data=target;
            // data.data = temp!;

          } else {
            acceptedImage = data.data;
            
          }
  }
  // void updatePuzzlePiece(int index, String? image) {
  //   puzzlePieces[index] = image!;
  //   notifyListeners();
  // }

  // void swapPuzzlePieces(int index1, int index2) {
  //   final temp = puzzlePieces[index1];
  //   puzzlePieces[index1] = puzzlePieces[index2];
  //   puzzlePieces[index2] = temp;
  //   notifyListeners();
  // }
  notify(){
    notifyListeners();
  }
}