/*
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dietitian/utils/app_constants.dart';
import 'package:dietitian/utils/dimensions.dart';
import 'package:dietitian/utils/style.dart';


class CustomTextBold extends StatelessWidget {
  final String text;
  final TextStyle style;
  final TextAlign textAlign;

  CustomTextBold({
    required this.text,
    this.style = const TextStyle(),
    this.textAlign = TextAlign.left,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: montserratSemiBold.copyWith(
          // color: ColorResources.textColor.withOpacity(0.85),
          fontSize: Dimensions.defaultSize),
      textAlign: textAlign,
    );
  }
}

class CustomText extends StatelessWidget {
  final String text;
  final TextStyle style;
  final TextAlign textAlign;

  CustomText({
    required this.text,
    this.style = const TextStyle(),
    this.textAlign = TextAlign.left,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: rubikRegular.copyWith(
        //  color: ColorResources.hintColor,
        fontWeight: FontWeight.w500,
        fontSize: Dimensions.FONT_SIZE_LARGE,
      ),
      textAlign: textAlign,
    );
  }
}

class CustomTextBold1 extends StatelessWidget {
  final String text;
  final TextStyle style;
  final TextAlign textAlign;

  CustomTextBold1({
    required this.text,
    this.style = const TextStyle(),
    this.textAlign = TextAlign.left,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: montserratSemiBold.copyWith(
        // color: ColorResources.textColor.withOpacity(0.85),
        fontSize: Dimensions.defaultSize,
      ),
      textAlign: textAlign,
    );
  }
}

class ExploreText extends StatelessWidget {
  final String text;
  final TextStyle style;
  final TextAlign textAlign;

  ExploreText({
    required this.text,
    this.style = const TextStyle(),
    this.textAlign = TextAlign.left,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: montserratSemiBold.copyWith(
          // color: ColorResources.textColor.withOpacity(0.85),
          fontSize: Dimensions.largeFont),
      textAlign: textAlign,
    );
  }
}

class Regular extends StatelessWidget {
  final String text;
  final TextStyle style;
  final TextAlign textAlign;

  Regular({
    required this.text,
    this.style = const TextStyle(),
    this.textAlign = TextAlign.left,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: rubikRegular.copyWith(
        fontSize: Dimensions.smallFont,
      ),
      textAlign: textAlign,
    );
  }
}

class AllCategory extends StatelessWidget {
  final String text;
  final TextStyle style;
  final TextAlign textAlign;

  AllCategory({
    required this.text,
    this.style = const TextStyle(),
    this.textAlign = TextAlign.left,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: montserratSemiBold.copyWith(fontSize: Dimensions.largeMeFont),
      textAlign: textAlign,
    );
  }
}

Widget podcatesugges() {
  return Text(
    "suggest".tr,
    style: montserratSemiBold.copyWith(fontSize: Dimensions.largeMeFont),
  );
}

Widget newpodcaste() {
  return Text(
    "newpodcast".tr,
    style: montserratSemiBold.copyWith(fontSize: Dimensions.defaultSize),
  );
}

Widget todayCard() {
  return Text(
    'Today',
    style: montserratSemiBold.copyWith(fontSize: Dimensions.defaultSize),
  );
}

Widget lastDay() {
  return Text(
    'Last Day',
    style: montserratSemiBold.copyWith(fontSize: Dimensions.defaultSize),
  );
}

Widget category() {
  return Text(
    "category".tr,
    style: montserratSemiBold.copyWith(fontSize: Dimensions.defaultSize),
  );
}

//
Widget continueListeningContainer() {
  return Text(
    "continue_listen".tr,
    style: montserratSemiBold.copyWith(
        fontSize: Dimensions.defaultSize, letterSpacing: 0.5),
  );
}

Widget libery() {
  return Column(
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
      Text(
        "library".tr,
        style: montserratSemiBold.copyWith(
            //color: ColorResources.textColor.withOpacity(0.85),
            fontSize: Dimensions.largeFont),
      )
      // CustomTextBold(
      //   text: AppConstants.library,
      // ),
    ],
  );
}

Widget explore() {
  return Column(
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
      ExploreText(
        text: "explore".tr,
      ),
    ],
  );
}

Widget search() {
  return Column(
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
      ExploreText(
        text: "Search".tr,
      ),
    ],
  );
}

Widget categoresss() {
  return Column(
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
      AllCategory(
        text: "category".tr,
      ),
    ],
  );
}

Widget suggestionforyou() {
  return Column(
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
      Text(
        "suggestions".tr,
        style: montserratSemiBold.copyWith(fontSize: Dimensions.paddingl22),
      )
    ],
  );
}

Widget allEpisodeyou() {
  return Padding(
    padding: const EdgeInsets.only(
        left: Dimensions.PADDING_SIZE, right: Dimensions.PADDING_SIZE),
    child: Column(
      children: [
        // Text(
        //   AppConstants.allEpisode,
        //   style: montserratSemiBold.copyWith(
        //       //color: ColorResources.textColor.withOpacity(0.85),
        //       fontSize: Dimensions.paddingl22),
        // )
      ],
    ),
  );
}

Widget topcheannelshow() {
  return Column(
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
      Text(
        "top_channnelShow".tr,
        style: montserratSemiBold.copyWith(
            //color: ColorResources.textColor.withOpacity(0.85),
            fontSize: Dimensions.defaultSize),
      )
    ],
  );
}

Widget topList() {
  return Column(
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
      Text(
        "topics_list".tr,
        style: montserratSemiBold.copyWith(fontSize: Dimensions.defaultSize),
      )
    ],
  );
}

Widget topopisode() {
  return Column(
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
      CustomTextBold(
        text: "top_episode".tr,
      ),
    ],
  );
}

Widget seealll() {
  return Column(
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
      InkWell(
        onTap: () {
          //  Get.toNamed(RouteHelper.getTopEpisodeRoute());
        },
        child: Text(
          "see_all".tr,
          style: montserratMedium.copyWith(
            fontSize: Dimensions.smallFont,
            decoration: TextDecoration.underline,
          ),
        ),
      )
    ],
  );
}

Widget whatyouwanttohearcontiner() {
  return Column(
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
      Regular(
        text: "want_today".tr,
      ),
    ],
  );
}
*/
