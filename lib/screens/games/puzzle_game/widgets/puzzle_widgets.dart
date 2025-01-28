// ignore_for_file: avoid_unnecessary_containers, library_private_types_in_public_api, no_logic_in_create_state

import 'package:flutter/material.dart';
import 'package:match/controllers/menu_controller.dart';
import 'package:provider/provider.dart';
List<String> acceptedImages = [
  '',
  '',
  '',
  '',
      // "assets/puzzles/Group_4.png",
      // "assets/puzzles/Group_5.png",
      // "assets/puzzles/Group_6.png",
      // "assets/puzzles/Group_7.png",
    ];  
class PuzzleBox extends StatefulWidget {
  final int index;
  const PuzzleBox({super.key, required this.index});

  @override
  _PuzzleBoxState createState() => _PuzzleBoxState(index: index);
}

class _PuzzleBoxState extends State<PuzzleBox> {
  final int index;
  String? acceptedImage;

  _PuzzleBoxState({required this.index});

  @override
  Widget build(BuildContext context) {
    return DragTarget<String>(

      onWillAcceptWithDetails: (data) {
        if(acceptedImage == null) {
          if(acceptedImages.contains(data.data)) {
            return false;
          }
          return true;
        }
        
        else {
          return false;
        }
      },
      onAcceptWithDetails: (data) {
        setState(() {
          
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
          
          // if (acceptedImage != null) {
          //   // acceptedImage = null;  
          //   // Swap images if the box already has an image
          //   // final temp = acceptedImage;
          //   // acceptedImage = data.data;
          //   // images.add(data.data);
          //   // WidgetsBinding.instance.addPostFrameCallback((_) {
          //   //   setState(() {
          //   //     acceptedImage = temp;
          //   //   });
          //   // });
          // } else {
          //   acceptedImage = data.data;
          //   acceptedImages.add(data.data);
          // }
        });
      },
      builder: (context, candidateData, rejectedData) {
        return Container(
          width: MediaQuery.sizeOf(context).height * 0.3,
          height: MediaQuery.sizeOf(context).height * 0.3,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.green),
          ),
          child: acceptedImage != null
              ? Draggable<String>(

                  data: acceptedImage!,
                  feedback: Opacity(
                    opacity: 0.7,
                    child: PuzzlePiece(img: acceptedImage!),
                  ),
                  onDragCompleted: (){
                    setState(() {
                      acceptedImage=null;
                    });
                  },
                  childWhenDragging: Container(),
                  child: PuzzlePiece(img: acceptedImage!),
                )
              :  Center(
                  child: Text(
                    index.toString(),
                    style: const TextStyle(
                      fontSize: 30,
                      color: Colors.black,
                    ),
                  ),
                ),
        );
      },
    );
  }
}

class PuzzleHolder extends StatelessWidget {
  const PuzzleHolder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        const Text(""),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  PuzzleBox(index:1),
                  PuzzleBox(index:2),
                ],
              ),
            ),
            Container(
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  PuzzleBox(index:3),
                  PuzzleBox(index:4),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class PuzzlePieces extends StatefulWidget {
  const PuzzlePieces({super.key});

  @override
  _PuzzlePiecesState createState() => _PuzzlePiecesState();
}
final List<String> images = [
      // "assets/puzzles/Group_4.png",
      // "assets/puzzles/Group_5.png",
      // "assets/puzzles/Group_6.png",
      // "assets/puzzles/Group_7.png",
    ];
class _PuzzlePiecesState extends State<PuzzlePieces> {
  final Set<String> acceptedImages = {};
  late MyMenuController menuController;

  @override
  void initState() {
    menuController=Provider.of<MyMenuController>(context, listen: false);
    images.addAll([
      "assets/puzzles/${menuController.selectedNumber}/Group 4.png",
      "assets/puzzles/${menuController.selectedNumber}/Group 5.png",
      "assets/puzzles/${menuController.selectedNumber}/Group 6.png",
      "assets/puzzles/${menuController.selectedNumber}/Group 7.png",
    ]);
    // TODO: implement initState
    super.initState();
  }
  @override
  void dispose() {
    images.clear();
    // TODO: implement dispose
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    

    return SizedBox(
      width: MediaQuery.sizeOf(context).height * 0.6,
      height: MediaQuery.sizeOf(context).height * 0.6,
      
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
        ),
        padding: const EdgeInsets.all(10),
        itemCount: images.where((img) => !acceptedImages.contains(img)).length,
        itemBuilder: (context, index) {
          final img = images.where((img) => !acceptedImages.contains(img)).toList()[index];
          return DraggablePuzzlePiece(
            img: img,
            onDragCompleted: () {
              setState(() {
                acceptedImages.add(img);
              });
            },
          );
        },
      ),
    );
  }
}

class DraggablePuzzlePiece extends StatelessWidget {
  final String img;
  final VoidCallback onDragCompleted;

  const DraggablePuzzlePiece({super.key, 
    required this.img,
    required this.onDragCompleted,
  });

  @override
  Widget build(BuildContext context) {
    return Draggable<String>(
      data: img,
      feedback: Opacity(
        opacity: 0.7,
        child: PuzzlePiece(img: img),
      ),
      childWhenDragging: Container(),
      onDragCompleted: onDragCompleted,
      child: PuzzlePiece(img: img),
    );
  }
}

class PuzzlePiece extends StatelessWidget {
  final String img;

  const PuzzlePiece({super.key, required this.img});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 100,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(img),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}