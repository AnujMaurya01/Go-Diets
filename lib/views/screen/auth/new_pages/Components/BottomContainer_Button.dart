import 'package:dietitian/utils/colors.dart';
import 'package:dietitian/utils/style.dart';
import 'package:flutter/material.dart';

class BottomContainer extends StatelessWidget {
  final String text;
  final VoidCallback? onTap;

  BottomContainer({required this.text, required this.onTap});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.green,
        ),
        alignment: Alignment.center,
        // margin: EdgeInsets.only(top: 10.0),
        width: double.infinity,
        height: kbottomContainerHeight,
        //  padding: EdgeInsets.only(bottom: 15.0),
        child: Center(
          child: Text(
            text,
            style: poppinsSemiBold.copyWith(fontSize: 18, color: Colors.white),
          ),
        ),
      ),
    );
  }
}
