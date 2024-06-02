/*
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';
import 'package:dietitian/controller/bottom_controller%20.dart';
import 'package:dietitian/utils/colors.dart';
import 'package:dietitian/utils/dimensions.dart';
import 'package:dietitian/utils/style.dart';


class CustomBottomNavigationBar extends StatelessWidget {
  final List<String> icons;

  final List<String> labels;

  CustomBottomNavigationBar({
    required this.icons,
    required this.labels,
  });

  @override
  Widget build(BuildContext context) {
    final BottomNavController bottomNavController = Get.find();

    return Obx(() {
      final currentIndex = bottomNavController.currentIndex.value;

      return BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: bottomNavController.changePage,
        selectedItemColor: ColorResources.loginButtonColor,
        unselectedItemColor: Colors.grey,
        selectedLabelStyle: corbelBold.copyWith(
          fontSize: Dimensions.smallFont,
        ),
        items: List.generate(
          icons.length,
          (index) => BottomNavigationBarItem(
            icon: SvgPicture.asset(icons[index],
                color: currentIndex == index
                    ? ColorResources.loginButtonColor
                    : null),
            label: labels[index],
          ),
        ),
      );
    });
  }
}
*/
