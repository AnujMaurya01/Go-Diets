import 'dart:async';

import 'package:dietitian/controller/auth_controller.dart';
import 'package:dietitian/messaging_service/messaging_service.dart';
import 'package:dietitian/views/screen/ChatHistoryForUser/ChatHistoryDietitian.dart';
import 'package:dietitian/views/screen/DashBoard/UserDashBoard.dart';
import 'package:dietitian/views/screen/HistoryTraction/TractionHistory.dart';
import 'package:dietitian/views/screen/ProfileDetailsView/ClientProfileView.dart';
import 'package:dietitian/widget/bottombar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  int _selectedIndex = 0;
  String? Dietitian;
  static List<Widget> _widgetOptions = <Widget>[
    UserDashBord(),
    HistoryTransaction(),
    ChatUser(),
    ProfileViewDetails(),
  ];
  final _messagingService = MessagingService();

  @override
  void initState() {
    super.initState();
    _messagingService.init(context);
    Timer(Duration(seconds: 2), () {
      mainLoadingFunction();
    });
  }

  mainLoadingFunction() {
    var token = Get.find<AuthController>().getAuthToken();
    print("token::::::::::::::::::::::::::$token");
    // var dititianID = Get.find<AuthController>().getDietitianID();
    Get.find<AuthController>().adminBankDetails();
    Get.find<AuthController>().dietitian_details();
    Get.find<AuthController>().chatAudioHistoryDetails(page: 1);
    Get.find<AuthController>().myDietDetails(context, isupdate: false);
    Get.find<AuthController>().usermyDietDetails(context, isupdate: false);

    //
    Get.find<AuthController>().transactionFunt(page: 1);
    Get.find<AuthController>().listWeeklyMeasurements(page: 1);
    //   Get.find<AuthController>().listRemark(page: 1, dititianID: dititianID);
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
