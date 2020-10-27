import 'package:flutter/material.dart';
import 'package:audioplayers/audio_cache.dart';

void main() => runApp(XylophoneApp());

class XylophoneApp extends StatelessWidget {
  final player = AudioCache();

  final colors = {
    0: Colors.red,
    1: Colors.yellow,
    2: Colors.pink,
    3: Colors.blue,
    4: Colors.purple,
    5: Colors.orange,
    6: Colors.green,
  };
  
  void _press (int note) {
    player.play('note${note}.wav');
  }

  Widget _make_button(int num) {
    return Expanded(
      child: TextButton(
        onPressed: () => _press(num+1),
        style: TextButton.styleFrom(
          backgroundColor:  colors[num]
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: List.generate(
              7, _make_button
            ),
          ),
        ),
      ),
    );
  }
}

