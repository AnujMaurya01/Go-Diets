// Package imports:
import 'package:dietitian/route/route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:zego_uikit_prebuilt_call/zego_uikit_prebuilt_call.dart';
import 'package:zego_uikit_signaling_plugin/zego_uikit_signaling_plugin.dart';

// Project imports:
import '../utils/constants.dart';
import 'comman_service_call.dart';

ZegoUIKitPrebuiltCallController? callController;

/// local virtual login
Future<void> login({
  required String userID,
  required String userName,
}) async {
  final prefs = await SharedPreferences.getInstance();
  prefs.setString(cacheUserIDKeyName, userName);
  prefs.setString(cacheUserIDKey, userID);

  currentUser.id = userID;
  currentUser.name = userName;
}

/// local virtual logout
Future<void> logout() async {
  final prefs = await SharedPreferences.getInstance();
  prefs.remove(cacheUserIDKey);
  prefs.remove(cacheUserIDKeyName);
}

/// on user login
void onUserLogin() {
  callController ??= ZegoUIKitPrebuiltCallController();
  ZegoUIKitPrebuiltCallInvitationService().init(
    appID: yourAppID,
//input your AppID

    appSign: yourAppSign,
    userID: currentUser.id,
    events: ZegoUIKitPrebuiltCallInvitationEvents(),

    userName: currentUser.name,
    notifyWhenAppRunningInBackgroundOrQuit: true,
    androidNotificationConfig: ZegoAndroidNotificationConfig(
      channelID: "ZegoUIKit",
      channelName: "Call Notifications",
      sound: "notification",
    ),
    iOSNotificationConfig: ZegoIOSNotificationConfig(
      isSandboxEnvironment: false,
      systemCallingIconName: 'CallKitIcon',
    ),
    plugins: [ZegoUIKitSignalingPlugin()],
    controller: callController,
    requireConfig: (ZegoCallInvitationData data) {
      final config = (data.invitees.length > 1)
          ? ZegoCallType.videoCall == data.type
              ? ZegoUIKitPrebuiltCallConfig.groupVideoCall()
              : ZegoUIKitPrebuiltCallConfig.groupVoiceCall()
          : ZegoCallType.videoCall == data.type
              ? ZegoUIKitPrebuiltCallConfig.oneOnOneVideoCall()
              : ZegoUIKitPrebuiltCallConfig.oneOnOneVoiceCall();
      config.avatarBuilder = customAvatarBuilder;
      config.topMenuBarConfig.isVisible = true;
      config.topMenuBarConfig.buttons
          .insert(0, ZegoMenuBarButtonName.minimizingButton);
      config.onHangUpConfirmation = (context) => _showAlertDialog(context);
      // config.onHangUp = () => calldescountiong();
      return config;
    },
  );
}

_showAlertDialog(BuildContext context) {
  showCupertinoModalPopup<void>(
    context: context,
    builder: (BuildContext context) => CupertinoAlertDialog(
      title: const Text('Leave confirm'),
      content: const Text('Do you want to end?'),
      actions: <CupertinoDialogAction>[
        CupertinoDialogAction(
          isDefaultAction: true,
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text('No'),
        ),
        CupertinoDialogAction(
          isDestructiveAction: true,
          onPressed: () {
            Get.offNamed(RouteHelper.ratingScreen, arguments: true);
          },
          child: const Text('Yes'),
        ),
      ],
    ),
  );
}

/// on user logout
void onUserLogout() {
  callController = null;
  ZegoUIKitPrebuiltCallInvitationService().uninit();
}
