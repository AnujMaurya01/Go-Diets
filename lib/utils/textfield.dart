import 'package:flutter/material.dart';
import 'package:dietitian/utils/colors.dart';
import 'package:dietitian/utils/dimensions.dart';


// ignore: camel_case_types, must_be_immutable
class Text_FormField extends StatelessWidget {
  String hint;
  final TextEditingController Controllervalue;

  Text_FormField(
      {super.key, required this.hint, required this.Controllervalue});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: ColorResources.textFieldBorderColor,
          width: 1.0,
        ),
        borderRadius: BorderRadius.circular(Dimensions.border_Radius),
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: Dimensions.SPACE_HIGHT_SIZE),
        child: TextFormField(
          controller: Controllervalue,
          decoration: InputDecoration(
            hintStyle: TextStyle(color: Colors.grey.shade400),
            hintText: hint,
            border: InputBorder.none,
          ),
          
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class EmailFormField extends StatelessWidget {
  String hint;
  final TextEditingController Controllervalue;

  EmailFormField(
      {super.key, required this.hint, required this.Controllervalue});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: ColorResources.textFieldBorderColor,
          width: 1.0,
        ),
        borderRadius: BorderRadius.circular(4),
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: Dimensions.SPACE_HIGHT_SIZE),
        child: TextFormField(
          controller: Controllervalue,
          decoration: InputDecoration(
            hintStyle: TextStyle(color: Colors.grey.shade400),
            hintText: hint,
            border: InputBorder.none,
          ),
        ),
      ),
    );
  }
}
