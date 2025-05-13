// ignore_for_file: avoid_unnecessary_containers, library_private_types_in_public_api, no_logic_in_create_state


import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';
import 'package:doudi/controllers/menu_controller.dart';
import 'package:provider/provider.dart';
List<Map<String, dynamic>> acceptedImages = [
  {},
  {},
  {},
  {},
      // "assets/puzzles/Group_4.png",
      // "assets/puzzles/Group_5.png",
      // "assets/puzzles/Group_6.png",
      // "assets/puzzles/Group_7.png",
    ];  
    List<bool> isCorrect=[false,false,false,false];
class PuzzleBox extends StatefulWidget {

  final int index;
    final int id;

  const PuzzleBox({super.key, required this.index, required this.id});

  @override
  _PuzzleBoxState createState() => _PuzzleBoxState(id,index: index);
}

class _PuzzleBoxState extends State<PuzzleBox> {
  final ConfettiController _controllerCenter=ConfettiController(duration: const Duration(seconds: 1));
  final ConfettiController _controllerBot=ConfettiController(duration: const Duration(seconds: 1));
  final ConfettiController _controllerTop=ConfettiController(duration: const Duration(seconds: 1));
  final ConfettiController _controllerRight=ConfettiController(duration: const Duration(seconds: 1));
  final ConfettiController _controllerLeft=ConfettiController(duration: const Duration(seconds: 1));
  final ConfettiController _controllerTopRight=ConfettiController(duration: const Duration(seconds: 1));
  final ConfettiController _controllerTopLeft=ConfettiController(duration: const Duration(seconds: 1));
  final ConfettiController _controllerBotRight=ConfettiController(duration: const Duration(seconds: 1));
  final ConfettiController _controllerBotLeft=ConfettiController(duration: const Duration(seconds: 1));
    final int id;

  final int index;
   String? acceptedImage;

  _PuzzleBoxState(this.id, {required this.index});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [DragTarget<Map<String, dynamic>>(
      
        onWillAcceptWithDetails: (data) {
          //  _controllerCenter.play();
          //       _controllerBot.play();
          //       _controllerTop.play();
          //       _controllerRight.play();
          //       _controllerLeft.play();
          //       _controllerTopRight.play();
          //       _controllerTopLeft.play();
          //       _controllerBotRight.play();
          //       _controllerBotLeft.play();

          // print(id);
          //   print(data.data['id']);
          if(acceptedImage == null) {
            
            if(acceptedImages.any((element)=>data.data['id']==element['id'])) {
              print('aaaa');
              return false;
            }
            // print(data.data['id']);
            // for (var element in acceptedImages) {
            //   print(element['id']);
            // }
            print('bbbb');
            if(id==data.data['id']){
              isCorrect[index-1]=true;
            }
            if(isCorrect.contains(false)){
            }
            else{
               _controllerCenter.play();
                _controllerBot.play();
                _controllerTop.play();
                _controllerRight.play();
                _controllerLeft.play();
                _controllerTopRight.play();
                _controllerTopLeft.play();
                _controllerBotRight.play();
                _controllerBotLeft.play();

      
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
              acceptedImage = data.data['img']!;
              // final sourcePuzzleBox = context.findAncestorStateOfType<_PuzzleBoxState>();
              // sourcePuzzleBox!.acceptedImage = temp;
              // DragTargetDetails<String> target=DragTargetDetails(data: temp!, offset: Offset(0, 0));
              // data.data="";
              // data=target;
              // data.data = temp!;
      
            } else {
              acceptedImage = data.data['img']!;
              
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
                ? Draggable<Map<String, dynamic>>(
      
                    data: {'img': acceptedImage!, 'id': id},
                    feedback: Opacity(
                      opacity: 0.7,
                      child: PuzzlePiece(img: acceptedImage!, id: id,),
                    ),
                    onDragCompleted: (){
                      setState(() {
                        acceptedImage=null;
                      });
                    },
                    childWhenDragging: Container(),
                    child: PuzzlePiece(img: acceptedImage!, id: id,),
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
      ),

      Align(
        alignment: Alignment.center,
        child: ConfettiWidget(
          confettiController: _controllerCenter,
          blastDirectionality: BlastDirectionality.explosive,
          shouldLoop: false,
          numberOfParticles: 10,
          gravity: 0.1,
          emissionFrequency: 0.5,
          maxBlastForce: 20,
          minBlastForce: 5,
          blastDirection: 0,

        ),
      ),
      Align(
        alignment: Alignment.bottomCenter,
        child: ConfettiWidget(
          confettiController: _controllerBot,
          blastDirectionality: BlastDirectionality.explosive,
          shouldLoop: false,
          numberOfParticles: 5,
          gravity: 0.1,
          emissionFrequency: 0.05,
          maxBlastForce: 5,
          minBlastForce: 2,
          blastDirection: 0,
        ),
      ),
      Align(
        alignment: Alignment.topCenter,
        child: ConfettiWidget(
          confettiController: _controllerTop,
          blastDirectionality: BlastDirectionality.explosive,
          shouldLoop: false,
          numberOfParticles: 5,
          gravity: 0.1,
          emissionFrequency: 0.05,
          maxBlastForce: 5,
          minBlastForce: 2,
          blastDirection: 0,
        ),
      ),
      Align(
        alignment: Alignment.centerRight,
        child: ConfettiWidget(
          confettiController: _controllerRight,
          blastDirectionality: BlastDirectionality.explosive,
          shouldLoop: false,
          numberOfParticles: 5,
          gravity: 0.1,
          emissionFrequency: 0.05,
          maxBlastForce: 5,
          minBlastForce: 2,
          blastDirection: 0,
        ),
      ),
      Align(
        alignment: Alignment.centerLeft,
        child: ConfettiWidget(
          confettiController: _controllerLeft,
          blastDirectionality: BlastDirectionality.explosive,
          shouldLoop: false,
          numberOfParticles: 5,
          gravity: 0.1,
          emissionFrequency: 0.05,
          maxBlastForce: 5,
          minBlastForce: 2,
          blastDirection: 0,
        ),
      ),
      Align(
        alignment: Alignment.topRight,
        child: ConfettiWidget(
          confettiController: _controllerTopRight,
          blastDirectionality: BlastDirectionality.explosive,
          shouldLoop: false,
          numberOfParticles: 5,
          gravity: 0.1,
          emissionFrequency: 0.05,
          maxBlastForce: 5,
          minBlastForce: 2,
          blastDirection: 0,
        ),
      ),
      Align(
        alignment: Alignment.topLeft,
        child: ConfettiWidget(
          confettiController: _controllerTopLeft,
          blastDirectionality: BlastDirectionality.explosive,
          shouldLoop: false,
          numberOfParticles: 5,
          gravity: 0.1,
          emissionFrequency: 0.05,
          maxBlastForce: 5,
          minBlastForce: 2,
          blastDirection: 0,
        ),
      ),
      Align(
        alignment: Alignment.bottomRight,
        child: ConfettiWidget(
          confettiController: _controllerBotRight,
          blastDirectionality: BlastDirectionality.explosive,
          shouldLoop: false,
          numberOfParticles: 5,
          gravity: 0.1,
          emissionFrequency: 0.05,
          maxBlastForce: 5,
          minBlastForce: 2,
          blastDirection: 0,
        ),
      ),
      Align(
        alignment: Alignment.bottomLeft,
        child: ConfettiWidget(
          confettiController: _controllerBotLeft,
          blastDirectionality: BlastDirectionality.explosive,
          shouldLoop: false,
          numberOfParticles: 5,
          gravity: 0.1,
          emissionFrequency: 0.05,
          maxBlastForce: 5,
          minBlastForce: 2,
          blastDirection: 0,
        ),
      ),


      ]
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
                  PuzzleBox(index:1, id: 1),
                  PuzzleBox(index:2, id: 2),
                ],
              ),
            ),
            Container(
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  PuzzleBox(index:3,id: 3,),
                  PuzzleBox(index:4,id: 4,),
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
final List<Map<String, dynamic>> images = [
      // "assets/puzzles/Group_4.png",
      // "assets/puzzles/Group_5.png",
      // "assets/puzzles/Group_6.png",
      // "assets/puzzles/Group_7.png",
    ];
class _PuzzlePiecesState extends State<PuzzlePieces> {
  // final Set<String> acceptedImages = {};
  late MyMenuController menuController;

  @override
  void initState() {
    menuController=Provider.of<MyMenuController>(context, listen: false);
    images.addAll([
       {'img': "assets/puzzles/${menuController.selectedNumber}/Group 4.png", 'id': 4},
      {'img': "assets/puzzles/${menuController.selectedNumber}/Group 5.png", 'id': 3},
      {'img': "assets/puzzles/${menuController.selectedNumber}/Group 6.png", 'id': 1},
      {'img': "assets/puzzles/${menuController.selectedNumber}/Group 7.png", 'id': 2},
      // "assets/puzzles/${menuController.selectedNumber}/Group 4.png",
      // "assets/puzzles/${menuController.selectedNumber}/Group 5.png",
      // "assets/puzzles/${menuController.selectedNumber}/Group 6.png",
      // "assets/puzzles/${menuController.selectedNumber}/Group 7.png",
    ]);
    super.initState();
  }
  @override
  void dispose() {
    acceptedImages.clear();
    isCorrect.clear();
    isCorrect.addAll([false,false,false,false]);
    images.clear();
    
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
            img: img['img'],
            id: img['id'],
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
  final int id;
  final VoidCallback onDragCompleted;

  const DraggablePuzzlePiece({super.key, 
    required this.img,
    required this.onDragCompleted, required this.id,
  });

  @override
  Widget build(BuildContext context) {
    return Draggable<Map<String, dynamic>>(
      data: {'img': img, 'id': id},
      feedback: Opacity(
        opacity: 0.7,
        child: PuzzlePiece(img: img,id:id),
      ),
      childWhenDragging: Container(),
      onDragCompleted: onDragCompleted,
      child: PuzzlePiece(img: img,id:id),
    );
  }
}

class PuzzlePiece extends StatelessWidget {
  final String img;
  final int id;
  const PuzzlePiece({super.key, required this.img, required this.id});

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