import 'package:flutter/material.dart';
import 'package:flutter_task/models/tutor_model.dart';

class TutorAvatar extends StatelessWidget {
  final TutorModel tutor;
  const TutorAvatar({Key? key, required this.tutor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 10,
      backgroundImage: NetworkImage(
        tutor.image,
      ),
    );
  }
}
