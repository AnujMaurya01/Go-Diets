import 'dart:async';

import 'package:dietitian/controller/auth_controller.dart';
import 'package:dietitian/messaging_service/messaging_service.dart';
import 'package:dietitian/views/screen/ChatHistoryForDititian/chatView.dart';
import 'package:dietitian/views/screen/DashBoard/DashBordPage.dart';
import 'package:dietitian/views/screen/DietitanProfile/DitetitanProfilePgae.dart';
import 'package:dietitian/views/screen/MyClientPage/MyClientNavBar.dart';
import 'package:dietitian/widget/bottombar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WelcomeDietitian extends StatefulWidget {
  const WelcomeDietitian({super.key});

  @override
  State<WelcomeDietitian> createState() => _WelcomeDietitianState();
}

class _WelcomeDietitianState extends State<WelcomeDietitian> {
  int _selectedIndex = 0;
  String? Dietitian;
  static List<Widget> _widgetOptions = <Widget>[
    DashBoardPage(),
    MyClientPageNav(),
    ChatScreenHistory(),
    DietitanProfileDetails(),
  ];
  final _messagingService = MessagingService();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _messagingService.init(context);

    Timer(Duration(seconds: 2), () {
      mainBLoading();
    });
  }

  mainBLoading() {
    var token = Get.find<AuthController>().getAuthToken();
    print("Token::::::::::: $token");
    Get.find<AuthController>().chatAudioHistoryDietitian(page: 1);
    Get.find<AuthController>().dietitianDetails(page: 1);
    Get.find<AuthController>().weeklyydeitsss(context, isupdate: false);
    Get.find<AuthController>().specialdiett(context, isupdate: false);

    //
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: _widgetOptions.elementAt(_selectedIndex),
        bottomNavigationBar: CustomNavigationBar(
          selectedIndex: _selectedIndex,
          onIndexChanged: (index) {
            setState(() {
              _selectedIndex = index;
            });
          },
        ));
  }
}
