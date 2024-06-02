import 'dart:async';
import 'package:dietitian/controller/auth_controller.dart';
import 'package:dietitian/messaging_service/messaging_service.dart';
import 'package:dietitian/utils/colors.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:dietitian/route/route.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  String accessTokenId = '';
  String? mayabk;
  Timer? _countTimer;
  int _countDown = 1;
  bool isResetZIM = false;
  String? fcmToken;
  final FirebaseMessaging _fcm = FirebaseMessaging.instance;
  @override
  void initState() {
    inistateShare();
    super.initState();
    // _startCountDown();
    Get.find<AuthController>().fetchInstagramMedia(pagee: 15);
    Get.find<AuthController>().fetchInstagramName();
    mayabk = Get.find<AuthController>().getDietitian();
    print("SBDJSDBJHSDJDJHJS${mayabk}");
    // Future.delayed(Duration(seconds: 2), () {
    //   Get.offNamed(RouteHelper.getLoginRoute());
    // });
  }

  fibase() async {
    fcmToken = await _fcm.getToken();
    print('MAMAIAMAMIAM${fcmToken}');
  }

  Future<void> inistateShare() async {
    Timer(const Duration(seconds: 1), () async {
      // ZIMAppConfig appConfig = ZIMAppConfig();
      // appConfig.appID = 1827268733;
      // appConfig.appSign =
      //     '3cd86f283bdac7e5938b731a01dd041fcf2ce8e10d6a55f3bc7a781ed4da63c2';
      // ZIM zim = ZIM.create(appConfig)!;

      Get.find<AuthController>().getAuthToken() == null
          ? Get.offAllNamed(RouteHelper.lpginInstramScreen, arguments: true)
          : Get.find<AuthController>().getDietitian() == "Dietitian"
              ? Get.find<AuthController>()
                  .dietitianUserDetails(context: context)
              : Get.find<AuthController>().userDetail(context, isupdate: false);
    });
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: ColorResources.appbarColor,
      statusBarIconBrightness: Brightness.dark,
      statusBarBrightness: Brightness.light,
    ));
    return Scaffold(
      backgroundColor: ColorResources.buttonDesmissColor,
      body: SafeArea(
        child: Container(
            alignment: Alignment.topCenter,
            height: Get.height,
            width: Get.width,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/splash.png'),
                fit: BoxFit.cover,
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                GestureDetector(
                  onTap: () {
                    inistateShare();
                  },
                  child: Container(
                    height: 40,
                    width: 260,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: ColorResources.appleButton,
                        borderRadius: BorderRadius.circular(5)),
                    child: Text(
                      "Get Now Start",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 17,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
                SizedBox(
                  height: 40,
                )
              ],
            )),
      ),
    );
  }
}
