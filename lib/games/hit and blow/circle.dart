import 'package:flutter/material.dart';

class Circle extends StatefulWidget {
  const Circle({super.key, required this.color});

  final Color color;

  @override
  CircleState createState() => CircleState();
}

class CircleState extends State<Circle> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 60,
      height: 60,
      decoration: BoxDecoration(
        color: widget.color,
        shape: BoxShape.circle,
      ),
    );
  }
}