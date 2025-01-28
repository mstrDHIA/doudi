import 'package:flutter/material.dart';

class GamesList extends StatelessWidget{
  const GamesList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Games List'),
      ),
      body: const Center(child: Text("Games List")),);

  }
}