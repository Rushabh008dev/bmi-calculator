import 'package:flutter/material.dart';

class icon extends StatelessWidget {
  final IconData req_icon;
  final String req_data;

  icon({required this.req_icon, required this.req_data});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          req_icon,
          size: 80.0,
        ),
        SizedBox(
          height: 15.0,
        ),
        Text(
          req_data,
          style: TextStyle(
            fontSize: 18.0,
            color: Color(0XFF8D8E98),
          ),
        ),
      ],
    );
  }
}
