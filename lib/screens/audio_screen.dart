import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
class AudioScreen extends StatelessWidget {
  final AudioPlayer _audioPlayer = AudioPlayer();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Audio Screen'),
      ),
      body: Column(
        children: [
          Center(
            child: ElevatedButton(
              onPressed: () async {
                await _audioPlayer.play(AssetSource('audio/intro.ogg'));
              },
              child: Text('Play Sound'),
            ),
          ),
           Center(
            child: ElevatedButton(
              onPressed: () async {
                await _audioPlayer.stop();
              },
              child: Text('Stop Sound'),
            ),
          ),
        ],
      ),
    );
  }
}