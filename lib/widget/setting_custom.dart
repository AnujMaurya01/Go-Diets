/*
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:dietitian/controller/theme_controller.dart';
import 'package:dietitian/utils/colors.dart';
import 'package:dietitian/utils/dimensions.dart';
import 'package:dietitian/utils/style.dart';
import 'package:dietitian/widget/custom_text.dart';


class SettingCustom extends StatelessWidget {
  final String title;
  final String iconLogo;
  final VoidCallback pressed;
  SettingCustom(
      {super.key,
      required this.title,
      required this.iconLogo,
      required this.pressed});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: pressed,
      child: Container(
        height: Dimensions.themHight,
        decoration: BoxDecoration(
            color: ColorResources.loginButtonColor.withOpacity(0.14),
            borderRadius: BorderRadius.circular(
                Dimensions.PADDING_SIZE_SUPER_EXTRA_SMALL)),
        alignment: Alignment.center,
        child: Padding(
          padding: EdgeInsets.only(
              left: Dimensions.SEARCH_ICON_WIDTH,
              right: Dimensions.SEARCH_ICON_WIDTH),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Image.asset(
                iconLogo,
                width: Dimensions.iconsHight,
                height: Dimensions.iconsHight,
                fit: BoxFit.fill,
              ),
              Padding(
                  padding: EdgeInsets.only(
                      left: Dimensions.FONT_SIZE_LARGE,
                      right: Dimensions.FONT_SIZE_LARGE),
                  child: Text(
                    title,
                    style: montserratSemiBold.copyWith(
                      fontSize: Dimensions.mediumFont,
                    ),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}

class CustomBox extends StatelessWidget {
  final String title;
  final String iconLogo;
  final String langIcon;
  final VoidCallback pressed;
  CustomBox(
      {super.key,
      required this.title,
      required this.iconLogo,
      required this.langIcon,
      required this.pressed});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: pressed,
      child: Container(
        height: Dimensions.themHight,
        decoration: BoxDecoration(
            color: ColorResources.loginButtonColor.withOpacity(0.14),
            borderRadius: BorderRadius.circular(
                Dimensions.PADDING_SIZE_SUPER_EXTRA_SMALL)),
        alignment: Alignment.center,
        child: Padding(
          padding: const EdgeInsets.only(
              left: Dimensions.SEARCH_ICON_WIDTH,
              right: Dimensions.SEARCH_ICON_WIDTH),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Image.asset(
                iconLogo,
                width: Dimensions.RADIUS_SIZE_LARGE,
                height: Dimensions.RADIUS_SIZE_LARGE,
                fit: BoxFit.cover,
              ),
              Padding(
                  padding: const EdgeInsets.only(
                      left: Dimensions.FONT_SIZE_LARGE,
                      right: Dimensions.FONT_SIZE_LARGE),
                  child: Text(
                    title,
                    style: montserratSemiBold.copyWith(
                      fontSize: Dimensions.mediumFont,
                    ),
                  )),
              Spacer(),
              // SizedBox(
              //   width: MediaQuery.of(context).size.width * 0.45,
              // ),
              Image.asset(
                langIcon,
                width: Dimensions.RADIUS_SIZE_LARGE,
                height: Dimensions.RADIUS_SIZE_LARGE,
                fit: BoxFit.cover,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class DarkModeSwitch extends StatefulWidget {
  final String title;
  final String iconLogo;
  final bool isDarkModeEnabled;
  final VoidCallback onChanged;

  DarkModeSwitch({
    super.key,
    required this.title,
    required this.iconLogo,
    required this.isDarkModeEnabled,
    required this.onChanged,
  });

  @override
  State<DarkModeSwitch> createState() => _DarkModeSwitchState();
}

class _DarkModeSwitchState extends State<DarkModeSwitch> {
  bool isDarkModeEnabled = false;

  @override
  void initState() {
    super.initState();
    isDarkModeEnabled = widget.isDarkModeEnabled;
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        height: Dimensions.themHight,
        decoration: BoxDecoration(
            color: ColorResources.loginButtonColor.withOpacity(0.14),
            borderRadius: BorderRadius.circular(
                Dimensions.PADDING_SIZE_SUPER_EXTRA_SMALL)),
        alignment: Alignment.center,
        child: Padding(
          padding: EdgeInsets.only(left: Dimensions.SEARCH_ICON_WIDTH),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Image.asset(
                widget.iconLogo,
                width: Dimensions.RADIUS_SIZE_LARGE,
                height: Dimensions.RADIUS_SIZE_LARGE,
                fit: BoxFit.cover,
              ),
              Padding(
                  padding: EdgeInsets.only(left: Dimensions.FONT_SIZE_LARGE),
                  child: Text(
                    widget.title,
                    style: montserratSemiBold.copyWith(
                      // color: ColorResources.textColor.withOpacity(0.90),
                      fontSize: Dimensions.mediumFont,
                    ),
                  )),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.39,
              ),
              Transform.scale(
                //  scale: 0.3
                scaleX: 0.60,
                scaleY: 0.55,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(Dimensions.hight20),
                    border: Border.all(width: 0.60, color: Colors.grey),
                    color: isDarkModeEnabled
                        ? Color.fromARGB(255, 249, 250, 250)
                        : Color.fromARGB(255, 248, 250, 248),
                  ),
                  child: CupertinoSwitch(
                    value: isDarkModeEnabled,
                    activeColor: CupertinoColors.white,
                    trackColor: CupertinoColors.white,
                    thumbColor: ColorResources.loginButtonColor,
                    onChanged: (v) => setState(() {
                      isDarkModeEnabled = v;
                    }),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class LibraryBox extends StatelessWidget {
  final String title;
  final String subTitle;
  final String iconLogo;
  final VoidCallback onPressedss;

  LibraryBox(
      {super.key,
      required this.title,
      required this.iconLogo,
      required this.subTitle,
      required this.onPressedss});

  @override
  Widget build(BuildContext context) {
    return 
    
    GetBuilder<ThemeController>(builder: (themeController) {
      
     return 
      
       InkWell(
        onTap: onPressedss,
        child: Container(
          height: Dimensions.themHight,
          decoration: BoxDecoration(
              color: ColorResources.loginButtonColor.withOpacity(0.14),
              borderRadius: BorderRadius.circular(Dimensions.border_Radius)),
          alignment: Alignment.center,
          child: Padding(
            padding: const EdgeInsets.only(left: Dimensions.SEARCH_ICON_WIDTH),
            child: Row(
             mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const SizedBox(
                  width: Dimensions.iconSpacingSize,
                ),
                SvgPicture.asset(
                  
                  iconLogo,
                  color:themeController.darkTheme?Colors.white:ColorResources.loginButtonColor
                 
                ),
                Padding(
                    padding: const EdgeInsets.only(
                       left: Dimensions.FONT_SIZE_LARGE,
                        right: Dimensions.FONT_SIZE_LARGE),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          title,
                          style: montserratSemiBold.copyWith(
                            // color: ColorResources.textColor.withOpacity(0.85),
                            fontSize: Dimensions.mediumFont,
                          ),
                        ),
                        Regular(
                          text: subTitle,
                        ),
                      ],
                    )),
                Spacer(),
                Icon(
                  Icons.arrow_forward_ios,
                ),
                const SizedBox(
                  width: Dimensions.iconSpacingSize,
                ),
              ],
            ),
          ),
        ),
      );}
    );
  }
}

// class CustomSvGBox extends StatelessWidget {
//   final String title;
//   final String iconLogo;

//   final VoidCallback pressed;
//   CustomSvGBox(
//       {super.key,
//       required this.title,
//       required this.iconLogo,
//       required this.pressed});

//       ProfileController? userData;

//   @override
//   Widget build(BuildContext context) {
//     return InkWell(
//       onTap: pressed,
//       child: Container(
//         height: Dimensions.themHight,
//         decoration: BoxDecoration(
//             color: ColorResources.loginButtonColor.withOpacity(0.14),
//             borderRadius: BorderRadius.circular(
//                 Dimensions.PADDING_SIZE_SUPER_EXTRA_SMALL)),
//         alignment: Alignment.center,
//         child: Padding(
//           padding: EdgeInsets.only(left: Dimensions.SEARCH_ICON_WIDTH,right: Dimensions.spaceSize  ),
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.start,
//             children: [
              
//               SvgPicture.asset(
//                 iconLogo,
//                 width: Dimensions.RADIUS_SIZE_LARGE,
//                 height: Dimensions.RADIUS_SIZE_LARGE,
//                 fit: BoxFit.cover,
//               ),
//               Padding(
//                   padding: EdgeInsets.only(left: Dimensions.FONT_SIZE_LARGE, right: Dimensions.FONT_SIZE_LARGE),
//                   child: 
//                 GetBuilder<ProfileController>(
               
//                  builder:(controller) {
//                  return    Column(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Text(
//                           title,
//                           style: montserratSemiBold.copyWith(
//                             //color: ColorResources.textColor.withOpacity(0.90),
//                             fontSize: Dimensions.mediumFont,
//                           ),
//                         ),
//                         Text(
//                           controller.userDetails!.email!??
//                           'mohammadbilal@gmail.com',
//                           style: montserratRegular.copyWith(
//                             fontSize: Dimensions.smallPadding,
//                           ),
//                         ),
//                       ],
//                     );
//   })),
//               SizedBox(
//                 width: MediaQuery.of(context).size.width * 0.24,
//               ),
//               const Icon(
//                 Icons.verified,
//                 color: Colors.green,
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }





class SvgCustom extends StatelessWidget {
  final String title;
  final String iconLogo;
  final VoidCallback pressed;
  SvgCustom(
      {super.key,
      required this.title,
      required this.iconLogo,
      required this.pressed});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: pressed,
      child: Container(
        height: Dimensions.themHight,
        decoration: BoxDecoration(
            color: ColorResources.loginButtonColor.withOpacity(0.14),
            borderRadius: BorderRadius.circular(
                Dimensions.PADDING_SIZE_SUPER_EXTRA_SMALL)),
        alignment: Alignment.center,
        child: Padding(
          padding: EdgeInsets.only(left: Dimensions.SEARCH_ICON_WIDTH, right: Dimensions.SEARCH_ICON_WIDTH),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SvgPicture.asset(
                iconLogo,
                width: Dimensions.iconsHight,
                height: Dimensions.iconsHight,
                fit: BoxFit.fill,
              ),
              
              Padding(
                  padding: EdgeInsets.only(left: Dimensions.FONT_SIZE_LARGE, right: Dimensions.FONT_SIZE_LARGE),
                  child: Text(
                    title,
                    style: montserratSemiBold.copyWith(
                      //color: ColorResources.textColor.withOpacity(0.90),
                      fontSize: Dimensions.mediumFont,
                    ),
                  )
                  //  CustomTextBold1(
                  //   text: title,
                  // )

                  ),
            ],
          ),
        ),
      ),
    );
  }
}
*/
