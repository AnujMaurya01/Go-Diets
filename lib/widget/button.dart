/*
import 'package:flutter/material.dart';
import 'package:dietitian/utils/colors.dart';
import 'package:dietitian/utils/dimensions.dart';
import 'package:dietitian/utils/style.dart';


class CustomButton extends StatelessWidget {
  final VoidCallback onPressed;
  final Color buttonColor;
  final Color lenearbuttonColor;
  final Color textColor;
  final String buttonText;
  final String image;

  CustomButton({
    required this.onPressed,
    required this.buttonColor,
    required this.textColor,
    required this.buttonText,
    required this.lenearbuttonColor,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        height: Dimensions.hight57,
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.symmetric(
            horizontal: Dimensions.PADDING_SIZE,
            vertical: Dimensions.PADDING_SIZE),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [buttonColor, lenearbuttonColor],
          ),
          borderRadius: BorderRadius.circular(5),
        ),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                image.toString(),
                height: Dimensions.hight17,
                width: Dimensions.hight19,
              ),
              SizedBox(
                width: Dimensions.SMALLSPACE_HIGHT_SIZE,
              ),
              Text(buttonText,
                  style: montserratMedium.copyWith(
                    color: textColor,
                    fontSize: Dimensions.mediumFont,
                  )),
            ],
          ),
        ),
      ),
    );
  }
}

class CustomLoButton extends StatelessWidget {
  final VoidCallback onPressed;
  final Color buttonColor;
  final Color lenearbuttonColor;
  final Color textColor;
  final String buttonText;

  const CustomLoButton({
    required this.onPressed,
    required this.buttonColor,
    required this.textColor,
    required this.buttonText,
    required this.lenearbuttonColor,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        height: Dimensions.hight57,
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.symmetric(
            horizontal: Dimensions.PADDING_SIZE,
            vertical: Dimensions.PADDING_SIZE),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [buttonColor, lenearbuttonColor],
          ),
          borderRadius: BorderRadius.circular(5),
        ),
        child: Center(
          child: Text(buttonText,
              style: montserratMedium.copyWith(
                color: textColor,
                fontSize: Dimensions.mediumFont,
              )),
        ),
      ),
    );
  }
}












class CustomWhiteButton extends StatelessWidget {
  final VoidCallback onPressed;
  final Color buttonColor;
  final Color borderColor;
  final Color textColor;
  final String buttonText;

  const CustomWhiteButton({
    required this.onPressed,
    required this.buttonColor,
    required this.textColor,
    required this.buttonText,
    required this.borderColor,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        height: Dimensions.hight57,
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.symmetric(
            horizontal: Dimensions.PADDING_SIZE,
            vertical: Dimensions.PADDING_SIZE),
        decoration: BoxDecoration(
          color: ColorResources.whiteColor,
          // gradient: LinearGradient(
          //   begin: Alignment.topCenter,
          //   end: Alignment.bottomCenter,
          //   colors: [buttonColor, lenearbuttonColor],
          // ),
          borderRadius: BorderRadius.circular(5),
          border: Border.all(
              color: borderColor, // Border color
              width: 2.0, // Border width
            ),

        ),
        child: Center(
          child: Text(buttonText,
              style: montserratMedium.copyWith(
                color: textColor,
                fontSize: Dimensions.mediumFont,
              )),
        ),
      ),
    );
  }
}

class CustomButtonLenear extends StatelessWidget {
  final VoidCallback onPressed;
  final Color buttonColor;
  final Color lenearbuttonColor;
  final Color textColor;
  final String buttonText;
  final String image;

  CustomButtonLenear({
    required this.onPressed,
    required this.buttonColor,
    required this.textColor,
    required this.buttonText,
    required this.lenearbuttonColor,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        height: Dimensions.hight57,
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.symmetric(
            horizontal: Dimensions.PADDING_SIZE,
            vertical: Dimensions.PADDING_SIZE),
        decoration: BoxDecoration(
          color: buttonColor,
          // gradient: LinearGradient(
          //   begin: Alignment.topCenter,
          //   end: Alignment.bottomCenter,
          //  // colors: [buttonColor, buttonColor],
          // ),
          borderRadius: BorderRadius.circular(5),
        ),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                image.toString(),
                height: Dimensions.SMALL_LOGO,
              ),
              SizedBox(
                width: Dimensions.SMALLSPACE_HIGHT_SIZE,
              ),
              Text(buttonText,
                  style: rubikLight.copyWith(
                    color: textColor,
                    fontSize: Dimensions.FONT_SIZE_EXTRA,
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
*/
