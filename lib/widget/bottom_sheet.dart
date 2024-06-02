/*
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dietitian/utils/colors.dart';
import 'package:dietitian/utils/dimensions.dart';
import 'package:dietitian/utils/style.dart';


class CustomBottom extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return 
    
    Container(
      padding: const EdgeInsets.only(top: Dimensions.smallSize),
      height: MediaQuery.of(context).size.height * 0.47,
      margin: const EdgeInsets.symmetric(horizontal: Dimensions.spacingSize10),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
              color: ColorResources.loginButtonColor.withOpacity(0.5)),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              InkWell(
                  onTap: () {
                    Get.back();
                  },
                  child: const Icon(Icons.close))
            ],
          ),
          const SizedBox(height: Dimensions.mediumFont),
          Padding(
            padding: const EdgeInsets.only(left: Dimensions.allPadding),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Description",
                  style: montserratSemiBold.copyWith(
                      fontSize: Dimensions.SpacingSize18),
                ),
                const SizedBox(height: Dimensions.spacingSize10),
               
                const SizedBox(height: Dimensions.hight20),
                Text(
                  "Timestamps",
                  style: montserratSemiBold.copyWith(
                      fontSize: Dimensions.SpacingSize18),
                ),
                const SizedBox(height: Dimensions.spacingSize10),
                Text(
                  "00:00 - Indoduction",
                  style: montserratRegular.copyWith(
                      fontSize: Dimensions.mediumFont),
                ),
                const SizedBox(height: Dimensions.spacingSize10),
                Text(
                  "01:00 - Lorem Ipsum is simply dummy",
                  style: montserratRegular.copyWith(
                      fontSize: Dimensions.mediumFont),
                ),
                const SizedBox(height: Dimensions.spacingSize10),
                Text(
                  "02:00 - Lorem Ipsum is simply dummy",
                  style: montserratRegular.copyWith(
                      fontSize: Dimensions.mediumFont),
                ),
                const SizedBox(height: Dimensions.hight20),
                Text(
                  "Resources",
                  style: montserratSemiBold.copyWith(
                      fontSize: Dimensions.SpacingSize18),
                ),
                const SizedBox(height: Dimensions.spacingSize10),
                Text(
                  "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
                  style: montserratRegular.copyWith(
                      fontSize: Dimensions.mediumFont),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  
  
  
  
  
  }
}
*/
