import 'package:dietitian/route/route.dart';
import 'package:dietitian/utils/colors.dart';
import 'package:dietitian/utils/constants.dart';
import 'package:dietitian/widget/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:dietitian/utils/helper/get_di.dart' as di;
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:get/get.dart';
import 'package:zego_uikit_prebuilt_call/zego_uikit_prebuilt_call.dart';
import 'package:zego_uikit_signaling_plugin/zego_uikit_signaling_plugin.dart';
import 'package:zego_zimkit/zego_zimkit.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: ColorResources.buttonYellow,
    statusBarIconBrightness: Brightness.dark,
    statusBarBrightness: Brightness.light,
  ));
  // ZIMKit().init(
  //   appID: 1827268733,
  //   appSign: '3cd86f283bdac7e5938b731a01dd041fcf2ce8e10d6a55f3bc7a781ed4da63c2',
  // );
  await di.init();
  final prefs = await SharedPreferences.getInstance();
  //final cacheUserID = prefs.get(cacheUserIDKey) as String? ?? '';
  // if (cacheUserID.isNotEmpty) {
  //   currentUser.id = cacheUserID;
  //   currentUser.name = 'user_$cacheUserID';
  // }
  await Firebase.initializeApp(
    name: "Godiets",
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
  // ZegoUIKitPrebuiltCallInvitationService().setNavigatorKey(navigatorKey);
  // ZegoUIKit().initLog().then((value) {
  //   ZegoUIKitPrebuiltCallInvitationService().useSystemCallingUI(
  //     [ZegoUIKitSignalingPlugin()],
  //   );

  // });
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
     // navigatorKey: navigatorKey,
      initialRoute: RouteHelper.getSplashRoute(),
      theme: ThemeData(primarySwatch: Colors.yellow),
      getPages: RouteHelper.routes,
      defaultTransition: Transition.topLevel,
      transitionDuration: Duration(milliseconds: 500),
      // builder: (context, child) {
      //   return Stack(
      //     children: [
      //       // child!,
      //       // ZegoUIKitPrebuiltCallMiniOverlayPage(
      //       //   contextQuery: () {
      //       //     return navigatorKey.currentState!.context;
      //       //   },
      //       // ),
      //     ],
      //   );
      // },
    );
  }
}
