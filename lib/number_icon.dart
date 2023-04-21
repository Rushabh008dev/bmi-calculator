import 'package:flutter/material.dart';

class numberIcon extends StatelessWidget {
  final String req_label;
  final String req_data;
  final Widget req_widget;
  final String req_units;
  numberIcon(
      {required this.req_data,
      required this.req_label,
      required this.req_widget,
      required this.req_units});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          req_label,
          style: TextStyle(
            fontSize: 18.0,
            color: Color(0XFF8D8E98),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.baseline,
          textBaseline: TextBaseline.alphabetic,
          children: [
            Text(
              req_data,
              style: TextStyle(
                fontSize: 50.0,
                fontWeight: FontWeight.w900,
              ),
            ),
            Text(
              req_units,
              style: TextStyle(
                fontSize: 18.0,
                color: Color(0xFF8D8E98),
              ),
            ),
          ],
        ),
        Container(
          child: req_widget,
        )
      ],
    );
  }
}
