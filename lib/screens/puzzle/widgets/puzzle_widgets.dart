import 'package:flutter/material.dart';

class PuzzleBox extends StatefulWidget {
  const PuzzleBox({super.key});

  @override
  _PuzzleBoxState createState() => _PuzzleBoxState();
}

class _PuzzleBoxState extends State<PuzzleBox> {
  String? acceptedImage;

  @override
  Widget build(BuildContext context) {
    return DragTarget<String>(
      onAccept: (data) {
        setState(() {
          if (acceptedImage != null) {
            // Swap images if the box already has an image
            final temp = acceptedImage;
            acceptedImage = data;
            WidgetsBinding.instance.addPostFrameCallback((_) {
              setState(() {
                acceptedImage = temp;
              });
            });
          } else {
            acceptedImage = data;
          }
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
                  childWhenDragging: Container(),
                  child: PuzzlePiece(img: acceptedImage!),
                )
              : const Center(
                  child: Text(
                    "1",
                    style: TextStyle(
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
                  PuzzleBox(),
                  PuzzleBox(),
                ],
              ),
            ),
            Container(
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  PuzzleBox(),
                  PuzzleBox(),
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
  @override
  _PuzzlePiecesState createState() => _PuzzlePiecesState();
}

class _PuzzlePiecesState extends State<PuzzlePieces> {
  final Set<String> acceptedImages = {};

  @override
  Widget build(BuildContext context) {
    final List<String> images = [
      "assets/puzzles/Group_4.png",
      "assets/puzzles/Group_5.png",
      "assets/puzzles/Group_6.png",
      "assets/puzzles/Group_7.png",
    ];

    return Container(
      width: MediaQuery.sizeOf(context).height * 0.6,
      height: MediaQuery.sizeOf(context).height * 0.6,
      child: GridView.count(
        crossAxisCount: 2,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
        padding: const EdgeInsets.all(10),
        children: images  
            .where((img) => !acceptedImages.contains(img))
            .map((img) => DraggablePuzzlePiece(
                  img: img,
                  onDragCompleted: () {
                    setState(() {
                      acceptedImages.add(img);
                    });
                  },
                ))
            .toList(),
      ),
    );
  }
}

class DraggablePuzzlePiece extends StatelessWidget {
  final String img;
  final VoidCallback onDragCompleted;

  const DraggablePuzzlePiece({
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

  const PuzzlePiece({required this.img});

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