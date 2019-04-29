import 'package:flutter/material.dart';
import 'package:text_flutter_player/WordEditPage.dart';

void main() => runApp(new InitScreen());

class InitScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new Scaffold(body: new WordEdit()),
    );
  }
}
