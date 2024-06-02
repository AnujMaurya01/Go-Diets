import 'package:flutter/material.dart';

class RoundIconButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback? onPressed;

  RoundIconButton({required this.icon, required this.onPressed});
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: Icon(
        icon,
        size: 18,
        color: Colors.white,
      ),
      constraints: BoxConstraints.tightFor(
        width: 40.0,
        height: 40.0,
      ),
      elevation: 0.0,
      onPressed: onPressed,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50.0)),
      fillColor: Colors.green,
    );
  }
}
