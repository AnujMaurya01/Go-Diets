import 'dart:developer';
import 'package:dietitian/chatApp/peer_chat_page.dart';
import 'package:dietitian/controller/auth_controller.dart';
import 'package:dietitian/widget/AppLifecycleObserver.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:intl/intl.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:zego_uikit_prebuilt_call/zego_uikit_prebuilt_call.dart';
import 'package:zego_uikit_signaling_plugin/zego_uikit_signaling_plugin.dart';
import '../audioandvideocalls/login_service.dart';
import '../view_model/user_model.dart';
import 'dia_log_items/error_dia_log.dart';

final AuthController _authController = Get.find<AuthController>();

class MessageChat {
  ZIMUserInfo userInfo = ZIMUserInfo();
  logins(BuildContext context, String token, String id, String Username,
      String joinId) async {
    try {
      ZIMLoginConfig config = ZIMLoginConfig();
      config.token = token;
      config.userName = userInfo.userName ?? '';
      userInfo.userID = id;
      await ZIM.getInstance()!.login(userInfo.userID, config);
      log('success');
      UserModel.shared().userInfo = userInfo;
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('userID', userInfo.userID);
      await prefs.setString('userName', Username);
      _authController.getFirebaseToken(joinId);
      saveToken(id);

      Navigator.push(context, MaterialPageRoute(builder: ((context) {
        return PeerChatPage(
            conversationID: joinId, Id: id, conversationName: Username);
      })));
    } on PlatformException catch (onError) {
      Navigator.of(context).pop();
      bool? delete = await ErrorDiaLog.showFailedDialog(
          context, onError.code, onError.message!);
    }
  }

  saveToken(userId) async {
    FirebaseMessaging messaging = FirebaseMessaging.instance;
    String? token = await messaging.getToken();
    print("FCM Token: $token");
    Map<String, dynamic> userData = {
      'token': '$token',
      'id': '$userId',
      'lastseen': 'Online'
    };
    await FBCollections.chat.doc(userId).set(userData);
  }

  loginCall(String? callUserId, String? string) async {
    login(
      userID: callUserId!,
      userName: '${string}',
    ).then((value) {
      onUserLogin();
      print("sjdsndndsnndns"
          "dns");
      _requestNotificationPermission();

      // Timer(Duration(seconds: 2), () {
      //   Navigator.push(
      //     context,
      //     MaterialPageRoute(
      //       builder: (context) => HomePage(), // Pass your number here
      //     ),
      //   );
      // });
      print("dnfkcdc");
      // Get.to(HomeP age());
    });
  }

  Future<void> _requestNotificationPermission() async {
    // Request permission
    var status = await Permission.notification.request();
    if (status.isGranted) {
      print('Notification permission granted');
    } else {
      print('Notification permission not granted');
    }
  }

  List<ZegoUIKitUser> getInvitesFromTextCtrl(String textCtrlText, String name) {
    List<ZegoUIKitUser> invitees = [];

    var inviteeIDs = textCtrlText.trim().replaceAll('，', '');
    inviteeIDs.split(",").forEach((inviteeUserID) {
      if (inviteeUserID.isEmpty) {
        return;
      }

      invitees.add(ZegoUIKitUser(
        id: inviteeUserID,
        name: '$name',
      ));
    });

    return invitees;
  }
}
