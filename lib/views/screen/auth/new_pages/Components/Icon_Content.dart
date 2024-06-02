import 'package:dietitian/utils/colors.dart';
import 'package:flutter/material.dart';

const sizedBox = SizedBox(
  height: 20.0,
);

const iconSize = 30.0;

class IconContent extends StatelessWidget {
  final IconData myicon;
  final String text;
  IconContent({required this.myicon, required this.text});
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Icon(
            myicon,
            size: iconSize,
          ),
        ),
        //sizedBox,
        Text(
          text,
          style: klabelTextStyle,
        ),
      ],
    );
  }
}
