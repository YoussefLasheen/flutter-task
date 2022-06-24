import 'package:flutter/material.dart';

class TitleBar extends StatelessWidget {
  const TitleBar({
    Key? key,
    required this.totalCourses,
    required this.title,
  }) : super(key: key);

  final int totalCourses;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            letterSpacing: 2,
          ),
          textAlign: TextAlign.start,
        ),
        TextButton(
          child: Text(
            'See all ($totalCourses)',
            style: const TextStyle(color: Colors.grey, fontSize: 12),
          ),
          onPressed: () {},
        )
      ],
    );
  }
}
