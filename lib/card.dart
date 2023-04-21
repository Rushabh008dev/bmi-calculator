import 'package:flutter/material.dart';

class card extends StatelessWidget {
  final Color colour;
  final Widget cardChild;
  card({required this.colour, required this.cardChild});

  Widget build(BuildContext context) {
    return Container(
      child: cardChild,
      margin: EdgeInsets.all(15.0),
      decoration: BoxDecoration(
        color: colour,
        borderRadius: BorderRadius.circular(10.0),
      ),
    );
  }
}
