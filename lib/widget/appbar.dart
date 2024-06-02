import 'package:dietitian/controller/auth_controller.dart';
import 'package:dietitian/utils/all_images.dart';
import 'package:dietitian/utils/colors.dart';
import 'package:dietitian/utils/constants.dart';
import 'package:dietitian/utils/style.dart';
import 'package:dietitian/view_model/user_model.dart';
import 'package:dietitian/views/screen/ProfileDetailsView/ProfileNavBar.dart';
import 'package:dietitian/views/support/view_presption.dart';
import 'package:dietitian/widget/user_dodont.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:zego_zimkit/zego_zimkit.dart';

import '../route/route.dart';

class AppBarDrawer extends StatefulWidget {
  const AppBarDrawer({super.key});

  @override
  State<AppBarDrawer> createState() => _AppBarDrawerState();
}

class _AppBarDrawerState extends State<AppBarDrawer> {
  String? Name;
  String? number;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Name = Get.find<AuthController>().getName();
    number = Get.find<AuthController>().getNumber();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: Material(
      color: ColorResources.faceSteppern,
      child: ListView(
        children: [
          SizedBox(
            height: 15,
          ),
          Row(
            children: [
              Spacer(),
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Container(
                  alignment: Alignment.center,
                  height: 25,
                  width: 25,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      border: Border.all(width: 2, color: Colors.white)),
                  child: Icon(
                    Icons.close,
                    color: Colors.white,
                    size: 15,
                  ),
                ),
              ),
              SizedBox(
                width: 10,
              )
            ],
          ),
          SizedBox(
            height: 10,
          ),
          GetBuilder<AuthController>(builder: (logic) {
            return Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                children: [
                  Container(
                      height: 60,
                      width: 60,
                      decoration: BoxDecoration(
                          color: ColorResources.faceStepperButton,
                          border: Border.all(width: 1, color: Colors.white),
                          borderRadius: BorderRadius.circular(90)),
                      child: Image.asset(
                        Images.user_icon,
                      )),
                  SizedBox(
                    width: 15,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "Welcome ${logic.profileDetails!.name}",
                        style: poppinstMedium.copyWith(
                          fontSize: 18,
                          color: Colors.white,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Get.to(ProfileNav(),
                              duration: Duration(
                                  milliseconds:
                                      ApiConstants.screenTransitionTime),
                              transition: Transition.rightToLeft);
                        },
                        //
                        child: Text(
                          'My Profile',
                          style: poppinstMedium.copyWith(
                              fontSize: 16,
                              height: 1.2,
                              color: ColorResources.faceStButton),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            );
          }),
          SizedBox(
            height: 10,
          ),
          GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: buildMenuItem(
                  icon: Images.dashboard_svgrepo, text: 'DashBoard')),
          GestureDetector(
              onTap: () {
                Get.toNamed(RouteHelper.myDietitianPage, arguments: true);
              },
              child: buildMenuItem(
                  icon: Images.dashboard_Group, text: 'My Dietitian')),
          GestureDetector(
              onTap: () {
                Get.find<AuthController>()
                    .myDietDetails(context, isupdate: false);
                Get.find<AuthController>()
                    .usermyDietDetails(context, isupdate: false);
                Get.toNamed(RouteHelper.culture, arguments: true);
              },
              child: buildMenuItem(
                  icon: Images.dashboard_Vector, text: 'My Diet Chart')),
          GestureDetector(
            onTap: () {
              Get.find<AuthController>().viewrepoertttt();

              Get.to(viewPresptionScreen(),
                  duration:
                      Duration(milliseconds: ApiConstants.screenTransitionTime),
                  transition: Transition.rightToLeft);
            },
            child: buildMenuItem(
                icon: Images.dashboard_Group9, text: 'View Prescription'),
          ),
          GestureDetector(
              onTap: () {
                Get.toNamed(RouteHelper.historyTransactionNav, arguments: true);
              },
              child: buildMenuItem(
                  icon: Images.dashbord_Payment, text: 'My Payments')),
          GestureDetector(
              onTap: () {
                Get.find<AuthController>().dondontttt();

                Get.to(DondontScreen(),
                    duration: Duration(
                        milliseconds: ApiConstants.screenTransitionTime),
                    transition: Transition.rightToLeft);
                //
                // Get.toNamed(RouteHelper.mySubscribePlan, arguments: true);
              },
              child: buildMenuItem(
                  icon: Images.dashbord_myplan, text: 'Do n don\'t')),
          GestureDetector(
              onTap: () {
                Get.toNamed(RouteHelper.mySubscribePlan, arguments: true);
              },
              child:
                  buildMenuItem(icon: Images.dashbord_myplan, text: 'My Plan')),
          GestureDetector(
            onTap: () {
              Get.toNamed(RouteHelper.channels, arguments: true);
            },
            child: buildMenuItem(
                icon: Images.dashbord_weeklyworkout,
                text: 'Weekly Pictures & Measurements'),
          ),
          GestureDetector(
            onTap: () {
              Get.toNamed(RouteHelper.supportScreen, arguments: true);
            },
            child:
                buildMenuItem(icon: Images.dashboard_Group9, text: 'Support'),
          ),
          // GestureDetector(
          //   onTap: () {
          //     Get.toNamed(RouteHelper.ratingScreen, arguments: true);
          //   },
          //   child: buildMenuItem(icon: Images.dashboard_Group9, text: 'Rating'),
          // ),
          GestureDetector(
            onTap: () {
              Get.toNamed(RouteHelper.feedbackScreen, arguments: true);
            },
            child:
                buildMenuItem(icon: Images.dashboard_Group9, text: 'feedback'),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 40.0, right: 40, top: 30),
            child: GestureDetector(
              onTap: () async {
                Get.find<AuthController>().userLogout(context);
                Get.find<AuthController>().logOut();
                Get.delete<AuthController>();
                await ZIM.getInstance()!.logout();
                UserModel.release();
                final prefs = await SharedPreferences.getInstance();
                await prefs.setString('userID', '');
                await prefs.setString('userName', '');
              },
              child: Container(
                  height: 40,
                  width: 20,
                  decoration: BoxDecoration(
                      color: ColorResources.buttonYellow,
                      borderRadius: BorderRadius.circular(5)),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        Images.logout_svgrepo,
                        height: 30,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        "Logout",
                        style: poppinsSemiBold.copyWith(fontSize: 16),
                      )
                    ],
                  )),
            ),
          )
        ],
      ),
    ));
  }

  Widget buildMenuItem({required String icon, required String text}) {
    final color = Colors.white;
    final hoverColor = Colors.white24;
    return Container(
      height: 50,
      alignment: Alignment.center,
      child: ListTile(
        leading: Image.asset(
          icon,
          height: 30,
          width: 35,
        ),
        title: Text(
          text,
          style: poppinsRegular.copyWith(fontSize: 15, height: 1, color: color),
        ),
        hoverColor: hoverColor,
      ),
    );
  }
}
