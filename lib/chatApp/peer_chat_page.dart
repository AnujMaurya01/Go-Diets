import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'package:dietitian/widget/AppLifecycleObserver.dart';
import 'package:http/http.dart' as http;
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:zego_zim/zego_zim.dart';

import '../controller/auth_controller.dart';
import '../utils/colors.dart';
import '../utils/style.dart';
import '../view_model/user_model.dart';
import 'msg_items/downloading_progress_model.dart';
import 'msg_items/msg_bottom_box/msg_bottom_model.dart';
import 'msg_items/msg_bottom_box/msg_normal_bottom_box.dart';
import 'msg_items/msg_converter.dart';
import 'msg_items/msg_list.dart';
import 'msg_items/receive_items/receive_image_msg_cell.dart';
import 'msg_items/receive_items/receive_text_msg_cell.dart';
import 'msg_items/receive_items/receive_video_msg_cell.dart';
import 'msg_items/send_items/send_text_msg_cell.dart';
import 'msg_items/uploading_progress_model.dart';

final AuthController _authController = Get.find<AuthController>();

class PeerChatPage extends StatefulWidget {
  PeerChatPage(
      {required this.conversationID,
      required this.Id,
      required this.conversationName}) {
    ZIM.getInstance()!.clearConversationUnreadMessageCount(
        conversationID, ZIMConversationType.peer);
    clearUnReadMessage();
  }

  String conversationID;
  String conversationName;
  String Id;
  double sendTextFieldBottomMargin = 40;
  bool emojiShowing = false;
  List<ZIMMessage> _historyZIMMessageList = <ZIMMessage>[];
  List<Widget> _historyMessageWidgetList = <Widget>[];

  double progress = 0.0;

  bool queryHistoryMsgComplete = false;

  clearUnReadMessage() {
    ZIM.getInstance()!.clearConversationUnreadMessageCount(
        conversationID, ZIMConversationType.peer);
  }

  @override
  State<StatefulWidget> createState() => _MyPageState();
}

class _MyPageState extends State<PeerChatPage> {
  Timer? _timer;

  String get appBarTitleValue {
    if (widget.conversationName != '') {
      return widget.conversationName;
    } else {
      return widget.conversationID;
    }
  }

  @override
  void initState() {
    registerZIMEvent();
    _authController.getFirebaseDoctorAccess(widget.conversationID.toString());
    if (widget._historyZIMMessageList.isEmpty) {
      queryMoreHistoryMessageWidgetList();
    }
    _timer = Timer.periodic(Duration(seconds: 5), (Timer timer) {
      _authController.getFirebaseToken(widget.conversationID);
      print(
          "ghhjhgjhkjhkljk${_authController.tokenValue}fghjghjgj${widget.conversationID}");
      _authController.getFirebaseDoctorAccess(widget.conversationID.toString());
      _authController.getFireToken(widget.conversationID);
    });
    super.initState();
  }

  @override
  void dispose() {
    unregisterZIMEvent();
    _timer?.cancel();
    saveToken(widget.Id);

    super.dispose();
  }

  saveToken(userId) async {
    FirebaseMessaging messaging = FirebaseMessaging.instance;
    String? token = await messaging.getToken();
    print("FCM Token: $token");
    Map<String, dynamic> userData = {
      'token': '$token',
      'id': '$userId',
      'lastseen': 'Offline'
    };
    await FBCollections.chat.doc(userId).set(userData);
  }

  saveSendMessageDoctor(userId) async {
    print('fghjkljhg${userId}');
    FirebaseMessaging messaging = FirebaseMessaging.instance;
    String? token = await messaging.getToken();
    print("FCM Token: $token");
    Map<String, dynamic> userData = {
      'token': '$token',
      'id': '$userId',
      'lastseen': 'FirstTime'
    };
    await FBCollections.userTalkAccess.doc(userId).set(userData);
  }

  @override
  Widget build(BuildContext context) {
    String fullName = widget.conversationName;
    List<String> names = fullName.split(" ");
    String firstCharacters = "";
    for (String name in names) {
      firstCharacters += name[0];
    }
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: ColorResources.buttonYellow,
        elevation: 0,
        titleSpacing: 0,
        centerTitle: false,
        title: Row(
          children: [
            SizedBox(
              width: 15,
            ),
            Container(
              child: GestureDetector(
                child: Container(
                  child: Icon(
                    Icons.arrow_back_ios,
                    color: Colors.black,
                  ),
                ),
                onTap: () {
                  Get.back();
                },
              ),
            ),
            SizedBox(
              width: 5,
            ),
            Container(
              height: 30,
              width: 30,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: ColorResources.darkBackgroundColor,
              ),
              child: Text("${firstCharacters}",
                  style: poppinsSemiBold.copyWith(
                      fontSize: 17, height: 1.6, color: Colors.white)),
            ),
            SizedBox(
              width: 10,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text("${widget.conversationName}",
                    style: poppinsRegular.copyWith(
                        fontSize: 15, height: 1.6, color: Colors.black)),
                /*   Obx(() {
                  return Text("${_authController.lastSeen}",
                      style: poppinsRegular.copyWith(
                          fontSize: 12, height: 1, color: Colors.white));
                }),*/
              ],
            ),
          ],
        ),
      ),
      body: Stack(children: [
        //Background image
        Positioned.fill(
          child: Image.asset(
            'assets/numberOtplogin.png',
            fit: BoxFit.cover,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 8.0, right: 8, bottom: 8),
          child: Column(
            children: [
              Expanded(
                child: GestureDetector(
                    onTap: (() {
                      setState(() {
                        MsgBottomModel.nonselfOnTapResponse();
                      });
                    }),
                    child: Container(
                      alignment: Alignment.topCenter,
                      child: MsgList(
                        widget._historyMessageWidgetList,
                        loadMoreHistoryMsg: () {
                          queryMoreHistoryMessageWidgetList();
                        },
                      ),
                    )),
              ),
              MsgNormalBottomBox(
                sendTextFieldonSubmitted: (message) {
                  print('fghjkhgfghjhghj${_authController.InChatSeen}');
                  if (isNumeric(message)) {
                    if (int.parse(message) <= 999) {
                      sendTextMessage(message);
                      if (_authController.InChatSeen == "Offline" ||
                          _authController.InChatSeen == "") {
                        sendNotification(message);
                      } else {
                        saveSendMessageDoctor(widget.Id);
                      }
                    }
                  } else {
                    sendTextMessage(message);
                    if (_authController.InChatSeen == "Offline" ||
                        _authController.InChatSeen == "") {
                      sendNotification(message);
                    } else {
                      saveSendMessageDoctor(widget.Id);
                    }
                  }
                },
                onCameraIconButtonOnPressed: (path) {
                  sendMediaMessage(path, ZIMMessageType.image);
                },
                onImageIconButtonOnPressed: (path) {
                  sendMediaMessage(path, ZIMMessageType.image);
                },
                onVideoIconButtonOnPressed: (path) {
                  sendMediaMessage(path, ZIMMessageType.video);
                },
              ),
            ],
          ),
        ),
      ]),
      resizeToAvoidBottomInset: true,
    );
  }

  bool isNumeric(String str) {
    if (str == null) {
      return false;
    }
    return double.tryParse(str) != null;
  }

  void sendNotification(String message) async {
    print("Mayankkkkkk${_authController.tokenValue}");
    try {
      var data = {
        "registration_ids": [_authController.tokenValue],
        "notification": {
          "body": message,
          "title": "${widget.conversationName}",
          "sound": "jetsons_doorbell.mp3"
        },
        "android": {
          "notification": {"notification_count": 23}
        },
      };

      var response = await http.post(
        Uri.parse('https://fcm.googleapis.com/fcm/send'),
        body: jsonEncode(data),
        headers: {
          'Content-Type': 'application/json',
          'Authorization':
              'key=AAAAE5chEwQ:APA91bHNnbTWtJ2Lg1dXISkWEeFBGA7QRdeqaWcwCjUr3zSsMVtjb6l7k7DXUs51jaWZM4zvXVMNUKgHg0RgrGVZBZSxMbFzWpZt_KrTwpCI9ktuBl6mzfeJI5WQRT4BBdWDkhVwn3DW'
        },
      );

      if (kDebugMode) {
        print("AAJANJKKAJKAJKJA************$data");
        saveSendMessageDoctor(widget.Id);
        print(response.body.toString());
      }
    } catch (error) {
      if (kDebugMode) {
        print(error);
      }
    }
  }

  // saveToken(String senderUserID, String timer, ZIMMessage message) async {
  //   FirebaseMessaging messaging = FirebaseMessaging.instance;
  //   String? token = await messaging.getToken();
  //   print("FCM Token: $token");
  //   Map<String, dynamic> userData = {
  //     'message': '${message.timestamp}',
  //     'id': '$senderUserID',
  //     'lastseen': "$timer",
  //   };
  //   await FBCollections.chat.doc(userId).set(userData);
  // }

  sendTextMessage(String message) async {
    ZIMTextMessage textMessage = ZIMTextMessage(message: message);
    textMessage.senderUserID = UserModel.shared().userInfo!.userID;
    ZIMMessageSendConfig sendConfig = ZIMMessageSendConfig();
    widget._historyZIMMessageList.add(textMessage);
    SendTextMsgCell cell = SendTextMsgCell(message: textMessage);
    setState(() {
      widget._historyMessageWidgetList.add(cell);
    });
    try {
      ZIMMessageSentResult result = await ZIM.getInstance()!.sendMessage(
          textMessage,
          widget.conversationID,
          ZIMConversationType.peer,
          sendConfig,
          ZIMMessageSendNotification(onMessageAttached: ((message) async {})));

      int index = widget._historyZIMMessageList
          .lastIndexWhere((element) => element == textMessage);
      widget._historyZIMMessageList[index] = result.message;
      //saveToken( textMessage.senderUserID,timer, result.message);
      SendTextMsgCell cell =
          SendTextMsgCell(message: (result.message as ZIMTextMessage));

      setState(() {
        widget._historyMessageWidgetList[index] = cell;
      });
    } on PlatformException catch (onError) {
      log('send error,code:' + onError.code + 'message:' + onError.message!);
      setState(() {
        int index = widget._historyZIMMessageList
            .lastIndexWhere((element) => element == textMessage);
        widget._historyZIMMessageList[index].sentStatus =
            ZIMMessageSentStatus.failed;
        SendTextMsgCell cell = SendTextMsgCell(
            message: (widget._historyZIMMessageList[index] as ZIMTextMessage));
        widget._historyMessageWidgetList[index] = cell;
      });
    }
  }

  sendMediaMessage(String? path, ZIMMessageType messageType) async {
    if (path == null) return;
    ZIMMediaMessage mediaMessage =
        MsgConverter.mediaMessageFactory(path, messageType);
    mediaMessage.senderUserID = UserModel.shared().userInfo!.userID;
    UploadingprogressModel uploadingprogressModel = UploadingprogressModel();
    Widget sendMsgCell = MsgConverter.sendMediaMessageCellFactory(
        mediaMessage, uploadingprogressModel);

    setState(() {
      widget._historyZIMMessageList.add(mediaMessage);
      widget._historyMessageWidgetList.add(sendMsgCell);
    });
    try {
      log(mediaMessage.fileLocalPath);
      ZIMMediaMessageSendNotification notification =
          ZIMMediaMessageSendNotification(
        onMediaUploadingProgress: (message, currentFileSize, totalFileSize) {
          uploadingprogressModel.uploadingprogress!(
              message, currentFileSize, totalFileSize);
        },
      );
      ZIMMessageSentResult result = await ZIM.getInstance()!.sendMediaMessage(
          mediaMessage,
          widget.conversationID,
          ZIMConversationType.peer,
          ZIMMessageSendConfig(),
          notification);
      int index = widget._historyZIMMessageList
          .lastIndexWhere((element) => element == mediaMessage);
      Widget resultCell = MsgConverter.sendMediaMessageCellFactory(
          result.message as ZIMMediaMessage, null);
      setState(() {
        widget._historyMessageWidgetList[index] = resultCell;
      });
    } on PlatformException catch (onError) {
      int index = widget._historyZIMMessageList
          .lastIndexWhere((element) => element == mediaMessage);
      widget._historyZIMMessageList[index].sentStatus =
          ZIMMessageSentStatus.failed;
      Widget failedCell = MsgConverter.sendMediaMessageCellFactory(
          widget._historyZIMMessageList[index] as ZIMMediaMessage, null);
      setState(() {
        widget._historyMessageWidgetList[index] = failedCell;
      });
    }
  }

  queryMoreHistoryMessageWidgetList() async {
    if (widget.queryHistoryMsgComplete) {
      return;
    }

    ZIMMessageQueryConfig queryConfig = ZIMMessageQueryConfig();
    queryConfig.count = 20;
    queryConfig.reverse = true;
    try {
      queryConfig.nextMessage = widget._historyZIMMessageList.first;
    } catch (onerror) {
      queryConfig.nextMessage = null;
    }
    try {
      ZIMMessageQueriedResult result = await ZIM
          .getInstance()!
          .queryHistoryMessage(
              widget.conversationID, ZIMConversationType.peer, queryConfig);
      if (result.messageList.length < 20) {
        widget.queryHistoryMsgComplete = true;
      }
      List<Widget> oldMessageWidgetList =
          MsgConverter.cnvMessageToWidget(result.messageList);
      result.messageList.addAll(widget._historyZIMMessageList);
      widget._historyZIMMessageList = result.messageList;

      oldMessageWidgetList.addAll(widget._historyMessageWidgetList);
      widget._historyMessageWidgetList = oldMessageWidgetList;

      setState(() {});
    } on PlatformException catch (onError) {
      //log(onError.code);
    }
  }

  registerZIMEvent() {
    String conversationName = widget.conversationName;
    ZIMEventHandler.onMessageSentStatusChanged =
        (zim, messageSentStatusChangedInfoList) {
      for (var element in messageSentStatusChangedInfoList) {
        print(
            "sentStatus:${element.status},message:${(element.message as ZIMTextMessage).message}");
      }
    };
    ZIMEventHandler.onReceivePeerMessage = (zim, messageList, fromUserID) {
      if (fromUserID != widget.conversationID) {
        return;
      }
      widget.clearUnReadMessage();
      widget._historyZIMMessageList.addAll(messageList);
      for (ZIMMessage message in messageList) {
        switch (message.type) {
          case ZIMMessageType.text:
            ReceiveTextMsgCell cell =
                ReceiveTextMsgCell(message: (message as ZIMTextMessage));
            widget._historyMessageWidgetList.add(cell);
            break;
          case ZIMMessageType.image:
            if ((message as ZIMImageMessage).fileLocalPath == "") {
              DownloadingProgressModel downloadingProgressModel =
                  DownloadingProgressModel();

              ReceiveImageMsgCell resultCell;
              ZIM
                  .getInstance()!
                  .downloadMediaFile(message, ZIMMediaFileType.originalFile,
                      (message, currentFileSize, totalFileSize) {})
                  .then((value) => {
                        resultCell = ReceiveImageMsgCell(
                            message: (value.message as ZIMImageMessage),
                            downloadingProgress: null,
                            downloadingProgressModel: downloadingProgressModel),
                        widget._historyMessageWidgetList.add(resultCell),
                        setState(() {})
                      });
            } else {
              ReceiveImageMsgCell resultCell = ReceiveImageMsgCell(
                  message: message,
                  downloadingProgress: null,
                  downloadingProgressModel: null);
              widget._historyMessageWidgetList.add(resultCell);
            }

            break;
          case ZIMMessageType.video:
            if ((message as ZIMVideoMessage).fileLocalPath == "") {
              ReceiveVideoMsgCell resultCell;
              ZIM
                  .getInstance()!
                  .downloadMediaFile(message, ZIMMediaFileType.originalFile,
                      (message, currentFileSize, totalFileSize) {})
                  .then((value) => {
                        resultCell = ReceiveVideoMsgCell(
                            message: value.message as ZIMVideoMessage,
                            downloadingProgressModel: null),
                        widget._historyMessageWidgetList.add(resultCell),
                        setState(() {})
                      });
            } else {
              ReceiveVideoMsgCell resultCell = ReceiveVideoMsgCell(
                  message: message, downloadingProgressModel: null);
              widget._historyMessageWidgetList.add(resultCell);
              setState(() {});
            }
            break;
          default:
        }
      }
      setState(() {});
    };

    ZIMEventHandler.onMessageSentStatusChanged = (zim, infos) {
      //window.console.warn(infos);
    };

    ZIMEventHandler.onMessageDeleted = (zim, deletedInfo) {};

    ZIMEventHandler.onUserInfoUpdated = (zim, info) {};
  }

  unregisterZIMEvent() {
    ZIMEventHandler.onReceivePeerMessage = null;
    ZIMEventHandler.onMessageSentStatusChanged = null;
  }
}
