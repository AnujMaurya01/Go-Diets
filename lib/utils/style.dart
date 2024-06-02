import 'package:dietitian/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

const poppinsSemiBold = TextStyle(
  fontFamily: "Poppins",
  fontWeight: FontWeight.w600,
);

const poppinstMedium = TextStyle(
  fontFamily: 'Poppins',
  fontWeight: FontWeight.w500,
);

final poppinsRegular = TextStyle(
  fontFamily: 'Poppins',
  fontWeight: FontWeight.w300,
//  color: Colors.grey.shade400
);

class CustomLoadingIndicator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color:
          Colors.transparent, // Change the color according to your preference
      child: Center(
        child: SpinKitWave(
          color: ColorResources
              .buttonYellow, // Change the color of the loading indicator
          size: 50.0, // Adjust the size of the loading indicator
        ),
      ),
    );
  }
}

class CustomLoadingIndicator1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color:
          Colors.transparent, // Change the color according to your preference
      child: Center(
        child: SpinKitWave(
          color: ColorResources
              .buttonYellow, // Change the color of the loading indicator
          size: 30.0, // Adjust the size of the loading indicator
        ),
      ),
    );
  }
}
