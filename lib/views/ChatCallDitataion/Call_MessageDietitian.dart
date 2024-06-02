import 'dart:async';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:dietitian/chatApp/chatMessageFuntion.dart';
import 'package:dietitian/controller/auth_controller.dart';
import 'package:dietitian/utils/all_images.dart';
import 'package:dietitian/utils/colors.dart';
import 'package:dietitian/utils/dimensions.dart';
import 'package:dietitian/utils/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:zego_uikit_prebuilt_call/zego_uikit_prebuilt_call.dart';

final AuthController _authController = Get.find<AuthController>();

class MyDietitianChatMessage extends StatefulWidget {
  const MyDietitianChatMessage({super.key});

  @override
  State<MyDietitianChatMessage> createState() => _MyDietitianChatMessageState();
}

class _MyDietitianChatMessageState extends State<MyDietitianChatMessage> {
  String? User_id;
  bool isValid = false;
  Timer? _timer;
  MessageChat messageChat = MessageChat();
  TextEditingController inviteeUsersIDTextCtrl = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    User_id = Get.find<AuthController>().getID();
    if (_authController.clientData.isNotEmpty) {
      _timer = Timer.periodic(Duration(seconds: 8), (Timer timer) {
        _authController.clientData.forEach((element) {
          _authController.getFirebaseDoctorAccess(element.mobile_no.toString());
        });
      });
    }
    Timer(Duration(seconds: 3), () {
      setState(() {
        isValid = true;
      });
    });
    //  main();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _timer?.cancel();
  }

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: ColorResources.buttonYellow,

      // Status bar brightness (optional)
      statusBarIconBrightness: Brightness.dark, // For Android (dark icons)
      statusBarBrightness: Brightness
          .light, // Yahaan aap apne pasandeeda rang ka istemal kar sakte hain
    ));
    return Scaffold(
      //  backgroundColor: ColorResources.loginappColor,
      appBar: AppBar(
        backgroundColor: ColorResources.buttonYellow,
        elevation: 0,
        centerTitle: true,
        leading: GestureDetector(
          child: Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
          onTap: () {
            Get.back();
          },
        ),
        title: Text(
          "Chat & Call",
          style: poppinsSemiBold.copyWith(fontSize: 20, color: Colors.black),
        ),
      ),
      body: SingleChildScrollView(
        physics: NeverScrollableScrollPhysics(),
        child: GetBuilder<AuthController>(builder: (logic) {
          return Column(
            children: [
              Stack(children: [
                Container(
                  height: MediaQuery.of(context).size.height,
                  color: ColorResources.loginappColor,
                ),
                Positioned(
                  top: 0,
                  left: 0,
                  right: 0,
                  child: Container(
                    color: ColorResources.buttonYellow,
                    height: 150,
                    child: Column(
                      children: [],
                    ),
                  ),
                ),
                Positioned(
                  top: 10,
                  left: 0,
                  right: 0,
                  child: Padding(
                    padding: EdgeInsets.only(left: 20, right: 20),
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          color: Colors.white),
                      //  color: ColorResources.whiteColor,
                      height: screenSize.height * 0.86,
                      child: Column(
                        children: [
                          SizedBox(
                            height: 10,
                          ),
                          if (isValid) ...[
                            Expanded(
                                child: logic.clientData.isEmpty
                                    ? CustomLoadingIndicator()
                                    : SingleChildScrollView(
                                        child: Column(
                                          children: [
                                            steponecontainer2(),
                                          ],
                                        ),
                                      ))
                          ] else ...[
                            Expanded(child: CustomLoadingIndicator())
                          ]
                        ],
                      ),
                    ),
                  ),
                ),
              ]),
            ],
          );
        }),
      ),
    );
  }

  Widget steponecontainer2() {
    return Padding(
      padding: const EdgeInsets.only(left: 10.0, right: 10, top: 10),
      child: GetBuilder<AuthController>(builder: (logic) {
        return Container(
          child: Column(
              children: logic.clientData.asMap().entries.map((e) {
            // String name = e.value.name!;
            // _authController
            //     .getFirebaseDoctorAccess(e.value.mobile_no.toString());
            // String firstCharacter = name.isNotEmpty
            //     ? name.split(' ').map((e) => e.isNotEmpty ? e[0] : '').join(' ')
            //     : '';
            return Padding(
              padding: EdgeInsets.only(left: 5.0, right: 5, top: 0, bottom: 5),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      e.value.name == null
                          ? SizedBox()
                          : Text(e.value.name!,
                              maxLines: 2,
                              overflow: TextOverflow.clip,
                              style: poppinsSemiBold.copyWith(
                                  color: ColorResources.verifyScreenButton,
                                  fontSize: 16)),
                      Spacer(),
                      e.value.planExpiryDate == null
                          ? GestureDetector(
                              onTap: () {
                                AwesomeDialog(
                                  context: context,
                                  dialogType: DialogType.warning,
                                  animType: AnimType.topSlide,
                                  closeIcon: const Icon(
                                      Icons.close_fullscreen_outlined),
                                  title: 'User Plan not activated',
                                  titleTextStyle: poppinstMedium.copyWith(
                                      fontSize: Dimensions.PADDING_SIZE_DEFAULT,
                                      color: Colors.black),
                                  descTextStyle: poppinstMedium.copyWith(
                                      fontSize: 17, color: Colors.black),
                                  btnCancelColor: Colors.grey[500],
                                  btnOkColor: ColorResources.verifyScreenButton,
                                  btnOkOnPress: () {},
                                ).show();
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                    color: Colors.green.shade400,
                                    borderRadius: BorderRadius.circular(10)),
                                child: Stack(
                                  children: [
                                    Center(
                                      child: Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            7.0, 5, 7, 5),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Icon(
                                              Icons.call,
                                              size: 16,
                                              color: ColorResources.whiteColor,
                                            ),
                                            SizedBox(
                                              width: 5,
                                            ),
                                            Text(
                                              'Call',
                                              style: poppinstMedium.copyWith(
                                                fontSize: 13,
                                                // height: 1.2,
                                                color: Colors.white,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            )
                          : Container(
                              decoration: BoxDecoration(
                                  color: Colors.green.shade400,
                                  borderRadius: BorderRadius.circular(10)),
                              child: Stack(
                                children: [
                                  Center(
                                    child: Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          7.0, 5, 7, 5),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Icon(
                                            Icons.call,
                                            size: 16,
                                            color: ColorResources.whiteColor,
                                          ),
                                          SizedBox(
                                            width: 5,
                                          ),
                                          Text(
                                            'Call',
                                            style: poppinstMedium.copyWith(
                                              fontSize: 13,
                                              // height: 1.2,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Positioned.fill(
                                    child: sendCallButton(
                                      isVideoCall: false,
                                      name: "",
                                      inviteeUsersIDTextCtrl:
                                          TextEditingController(
                                              text:
                                                  e.value.mobile_no.toString()),
                                      onCallFinished: (String code,
                                          String message,
                                          List<String> errorInvitees) {
                                        onSendCallInvitationFinished(
                                            e.value.mobile_no.toString(),
                                            'audio',
                                            code,
                                            message,
                                            errorInvitees);
                                      },
                                    ),
                                  )
                                ],
                              ),
                            ),
                      SizedBox(
                        width: 10,
                      ),
                      GestureDetector(
                        onTap: () async {
                          if (e.value.planExpiryDate == null) {
                            AwesomeDialog(
                              context: context,
                              dialogType: DialogType.warning,
                              animType: AnimType.topSlide,
                              closeIcon:
                                  const Icon(Icons.close_fullscreen_outlined),
                              title: 'User Plan not activated',
                              titleTextStyle: poppinstMedium.copyWith(
                                  fontSize: Dimensions.PADDING_SIZE_DEFAULT,
                                  color: Colors.black),
                              // desc: 'Plan not activated please purchase plan!',
                              descTextStyle: poppinstMedium.copyWith(
                                  fontSize: 17, color: Colors.black),
                              btnCancelColor: Colors.grey[500],
                              btnOkColor: ColorResources.verifyScreenButton,
                              btnOkOnPress: () {},
                            ).show();
                          } else {
                            messageChat.logins(context, "", User_id!,
                                e.value.name!, e.value.mobile_no.toString());
                          }
                        },
                        child: Container(
                          //width: 100,
                          decoration: BoxDecoration(
                              color: ColorResources.buttonYellow,
                              borderRadius: BorderRadius.circular(10)),
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(7.0, 5, 7, 5),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset(
                                  Images.messae_doctro,
                                  height: 16,
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  'Chat',
                                  style: poppinstMedium.copyWith(
                                    fontSize: 13,
                                    // height: 1.2,
                                    color: Colors.black87,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: 1.5,
                    decoration:
                        BoxDecoration(color: Colors.grey.withOpacity(0.4)),
                  )
                ],
              ),
            );
          }).toList()),
        );
      }),
    );
  }

  Widget sendCallButton({
    required bool isVideoCall,
    required TextEditingController inviteeUsersIDTextCtrl,
    void Function(String code, String message, List<String>)? onCallFinished,
    required String name,
  }) {
    return ValueListenableBuilder<TextEditingValue>(
      valueListenable: inviteeUsersIDTextCtrl,
      builder: (context, inviteeUserID, _) {
        var invitees = messageChat.getInvitesFromTextCtrl(
            inviteeUsersIDTextCtrl.text.trim(), name);

        return ZegoSendCallInvitationButton(
          isVideoCall: isVideoCall,
          invitees: invitees,
          resourceID: "zego_data",
          iconVisible: false,
          iconSize: const Size(10, 10),
          buttonSize: const Size(10, 10),
          onPressed: onCallFinished,
        );
      },
    );
  }

  void onSendCallInvitationFinished(
    String id,
    String convertiontype,
    String code,
    String message,
    List<String> errorInvitees,
  ) {
    print("AKSOOAJSOMMWLNENJKNKWENKDNKWN");
    DateTime now = DateTime.now();
    Get.find<AuthController>().saveUserChatHistory(
      context: context,
      type: "audio",
      userID: id.toString(),
      time: now.toString().trim(),
    );

    if (errorInvitees.isNotEmpty) {
      String userIDs = "";
      for (int index = 0; index < errorInvitees.length; index++) {
        if (index >= 5) {
          userIDs += '... ';
          break;
        }
        var userID = errorInvitees.elementAt(index);

        userIDs += userID + ' ';
        print("sjndnjnsdnsjdnsnjn $userID");
      }
      if (userIDs.isNotEmpty) {
        userIDs = userIDs.substring(0, userIDs.length - 1);
        print("MAYANJAKAK $userIDs");
      }

      var message = 'User doesn\'t exist or is offline: $userIDs';
      if (code.isNotEmpty) {
        message += ', code: $code, message:$message';
      }
      print("MAYANJAKAK");
      showToast(
        message,
        position: StyledToastPosition.top,
        context: context,
      );
    } else if (code.isNotEmpty) {
      print("MAYANJAKAK");
      showToast(
        'code: $code, message:$message',
        position: StyledToastPosition.top,
        context: context,
      );
    }
  }
}
