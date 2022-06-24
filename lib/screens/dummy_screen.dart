import 'package:flutter/material.dart';

class DummyScreen extends StatelessWidget {
  final String text;
  const DummyScreen({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('This is $text page'),
    );
  }
}