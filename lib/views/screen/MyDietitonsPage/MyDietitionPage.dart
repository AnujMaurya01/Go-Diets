import 'dart:async';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:dietitian/chatApp/chatMessageFuntion.dart';

import 'package:dietitian/controller/auth_controller.dart';
import 'package:dietitian/route/route.dart';
import 'package:dietitian/utils/all_images.dart';
import 'package:dietitian/utils/colors.dart';
import 'package:dietitian/utils/dimensions.dart';
import 'package:dietitian/utils/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:zego_uikit_prebuilt_call/zego_uikit_prebuilt_call.dart';

class MyDietitianPage extends StatefulWidget {
  const MyDietitianPage({super.key});

  @override
  State<MyDietitianPage> createState() => _MyDietitianPageState();
}

class _MyDietitianPageState extends State<MyDietitianPage> {
  final _channelController = TextEditingController();
  MessageChat messageChat = MessageChat();
  @override
  void dispose() {
    // dispose input controller
    _channelController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  // Timer? _timer;
  // int _start = 30;

  // void startTimer() {
  //   _timer = Timer.periodic(Duration(seconds: 10), (timer) {
  //     if (_start == 0) {
  //       setState(() {
  //         timer.cancel();
  //         Get.offAllNamed(RouteHelper.myDietitianPage, arguments: true);
  //       });
  //     } else {
  //       setState(() {
  //         _start--;
  //       });
  //     }
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: ColorResources.buttonYellow,
      statusBarIconBrightness: Brightness.dark,
      statusBarBrightness: Brightness.light,
    ));
    return Scaffold(
      body: SingleChildScrollView(
        //  physics: NeverScrollableScrollPhysics(),
        child: Column(
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
                  height: 250,
                  child: Column(
                    children: [
                      SizedBox(
                        height: 40,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            GestureDetector(
                              onTap: () {
                                Get.back();
                              },
                              child: Icon(
                                Icons.arrow_back_ios,
                                color: Colors.black,
                              ),
                            ),
                            Spacer(),
                            Container(
                              child: Text(
                                "My Dietitian",
                                textAlign: TextAlign.center,
                                style: poppinsSemiBold.copyWith(
                                  fontSize: 20,
                                  height: 1.2,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                            Spacer(),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                top: 110,
                left: 0,
                right: 0,
                child: Padding(
                  padding: EdgeInsets.only(left: 20, right: 20),
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        color: Colors.white),
                    height: screenSize.height * 0.87,
                    child: Column(
                      children: [
                        SizedBox(
                          height: 10,
                        ),
                        Expanded(
                            child: SingleChildScrollView(
                          child: Column(
                            children: [
                              steponecontainer2(),
                            ],
                          ),
                        ))
                      ],
                    ),
                  ),
                ),
              ),
            ]),
          ],
        ),
      ),
    );
  }

  TextEditingController inviteeUsersIDTextCtrl = TextEditingController();
  Widget steponecontainer2() {
    return Padding(
      padding: const EdgeInsets.only(left: 10.0, right: 10, top: 0),
      child: GetBuilder<AuthController>(builder: (logic) {
        return Container(
          child: Padding(
            padding: const EdgeInsets.only(left: 10.0, right: 10, top: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                if (logic.Listdata != null) ...[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Expanded(
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  logic.profileDetails!.planExpiryDate == null
                                      ? GestureDetector(
                                          onTap: () {
                                            AwesomeDialog(
                                              context: context,
                                              dialogType: DialogType.warning,
                                              animType: AnimType.topSlide,
                                              closeIcon: const Icon(Icons
                                                  .close_fullscreen_outlined),
                                              title: 'Plan not activated',
                                              titleTextStyle:
                                                  poppinstMedium.copyWith(
                                                      fontSize: Dimensions
                                                          .PADDING_SIZE_DEFAULT,
                                                      color: Colors.black),
                                              desc:
                                                  'Plan not activated please purchase plan!',
                                              descTextStyle:
                                                  poppinstMedium.copyWith(
                                                      fontSize: 17,
                                                      color: Colors.black),
                                              btnCancelColor: Colors.grey[500],
                                              btnOkColor: ColorResources
                                                  .verifyScreenButton,
                                              btnOkOnPress: () {},
                                            ).show();
                                          },
                                          child: Container(
                                            decoration: BoxDecoration(
                                                color: Colors.green.shade400,
                                                borderRadius:
                                                    BorderRadius.circular(10)),
                                            child: Stack(
                                              children: [
                                                Center(
                                                  child: Padding(
                                                    padding: const EdgeInsets
                                                            .fromLTRB(
                                                        10.0, 5, 10, 5),
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        Icon(
                                                          Icons.call,
                                                          size: 20,
                                                          color: ColorResources
                                                              .whiteColor,
                                                        ),
                                                        SizedBox(
                                                          width: 5,
                                                        ),
                                                        Text(
                                                          'Call Now',
                                                          style: poppinstMedium
                                                              .copyWith(
                                                            fontSize: 15,
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
                                              borderRadius:
                                                  BorderRadius.circular(10)),
                                          child: Stack(
                                            children: [
                                              Center(
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.fromLTRB(
                                                          10.0, 5, 10, 5),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Icon(
                                                        Icons.call,
                                                        size: 20,
                                                        color: ColorResources
                                                            .whiteColor,
                                                      ),
                                                      SizedBox(
                                                        width: 5,
                                                      ),
                                                      Text(
                                                        'Call Now',
                                                        style: poppinstMedium
                                                            .copyWith(
                                                          fontSize: 15,
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
                                                  name: logic.Listdata!['name']
                                                      .toString(),
                                                  inviteeUsersIDTextCtrl:
                                                      TextEditingController(
                                                          text: logic
                                                              .profileDetails!
                                                              .dieticianId
                                                              .toString()),
                                                  onCallFinished: (String code,
                                                      String message,
                                                      List<String>
                                                          errorInvitees) {
                                                    onSendCallInvitationFinished(
                                                        logic.profileDetails!
                                                            .dieticianId
                                                            .toString(),
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
                                    width: 20,
                                  ),
                                  GestureDetector(
                                      onTap: () async {
                                        if (logic.profileDetails!
                                                .planExpiryDate ==
                                            null) {
                                          AwesomeDialog(
                                            context: context,
                                            dialogType: DialogType.warning,
                                            animType: AnimType.topSlide,
                                            closeIcon: const Icon(Icons
                                                .close_fullscreen_outlined),
                                            title: 'Plan not activated',
                                            titleTextStyle:
                                                poppinstMedium.copyWith(
                                                    fontSize: Dimensions
                                                        .PADDING_SIZE_DEFAULT,
                                                    color: Colors.black),
                                            desc:
                                                'Plan not activated please purchase plan!',
                                            descTextStyle:
                                                poppinstMedium.copyWith(
                                                    fontSize: 17,
                                                    color: Colors.black),
                                            btnCancelColor: Colors.grey[500],
                                            btnOkColor: ColorResources
                                                .verifyScreenButton,
                                            btnOkOnPress: () {},
                                          ).show();
                                        } else {
                                          print(
                                              'retyutryutryuiytyu${logic.profileDetails!.mobileNo.toString()}');
                                          DateTime now = DateTime.now();
                                          Get.find<AuthController>()
                                              .saveUserChatHistory(
                                            context: context,
                                            type: "chat",
                                            userID: logic.profileDetails!.id
                                                .toString(),
                                            time: now.toString().trim(),
                                          );
                                          messageChat.logins(
                                              context,
                                              "",
                                              logic.profileDetails!.mobileNo
                                                  .toString(),
                                              logic.Listdata!['name']
                                                  .toString(),
                                              logic.profileDetails!.dieticianId
                                                  .toString());
                                        }
                                      },
                                      child: Container(
                                        decoration: BoxDecoration(
                                            color: ColorResources.buttonYellow,
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                        child: Padding(
                                          padding: const EdgeInsets.fromLTRB(
                                              10.0, 5, 10, 5),
                                          child: Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Image.asset(
                                                Images.messae_doctro,
                                                height: 20,
                                              ),
                                              SizedBox(
                                                width: 5,
                                              ),
                                              Text(
                                                'Chat Now',
                                                style: poppinstMedium.copyWith(
                                                  fontSize: 15,
                                                  // height: 1.2,
                                                  color: Colors.black,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      )),
                                ],
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: 1,
                    decoration: BoxDecoration(
                        color: Colors.white24,
                        border:
                            Border.all(color: Colors.grey.withOpacity(0.5))),
                  ),
                ],
                SizedBox(
                  height: 5,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GestureDetector(
                    onTap: () {
                      Get.toNamed(RouteHelper.chatUserHistoryNav,
                          arguments: true);
                    },
                    child: Row(
                      children: [
                        Container(
                            height: 35,
                            width: 35,
                            decoration: BoxDecoration(
                                color: ColorResources.buttongreem,
                                borderRadius: BorderRadius.circular(90)),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset(
                                  Images.Vector_messahe,
                                  height: 20,
                                ),
                              ],
                            )),
                        SizedBox(
                          width: 10,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text("My Chat",
                                style: poppinstMedium.copyWith(
                                    fontSize: 13,
                                    height: 1,
                                    color: Colors.grey)),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              "View History",
                              style: poppinsSemiBold.copyWith(
                                  fontSize: 16, height: 1),
                            ),
                          ],
                        ),
                        Spacer(),
                        Container(
                          height: 20,
                          width: 20,
                          decoration: BoxDecoration(
                            color: ColorResources.whiteColor,
                            borderRadius: BorderRadius.circular(30),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(
                                    0.5), // specify shadow color and opacity
                                spreadRadius:
                                    2, // extent of spreading of the shadow
                                blurRadius: 2, // blur radius of the shadow
                                offset:
                                    Offset(0, 2), // changes position of shadow
                              ),
                            ],
                          ),
                          child: Container(
                              alignment: Alignment.center,
                              child: Icon(
                                Icons.arrow_forward_ios,
                                size: 12,
                              )),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Container(
                  height: 1,
                  decoration: BoxDecoration(
                      color: Colors.white24,
                      border: Border.all(color: Colors.grey.withOpacity(0.5))),
                ),
                SizedBox(
                  height: 5,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GestureDetector(
                    onTap: () {
                      Get.toNamed(RouteHelper.culture, arguments: true);
                    },
                    child: Row(
                      children: [
                        Container(
                            height: 35,
                            width: 35,
                            decoration: BoxDecoration(
                                color: ColorResources.loginOpenButton,
                                borderRadius: BorderRadius.circular(90)),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset(
                                  Images.dashboard_Vector,
                                  height: 25,
                                ),
                              ],
                            )),
                        SizedBox(
                          width: 10,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text("My Diet",
                                style: poppinstMedium.copyWith(
                                    fontSize: 13,
                                    height: 1,
                                    color: Colors.grey)),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              "View Diet List",
                              style: poppinsSemiBold.copyWith(
                                  fontSize: 16, height: 1),
                            ),
                          ],
                        ),
                        Spacer(),
                        Container(
                          height: 20,
                          width: 20,
                          // padding: EdgeInsets.only(left: 8),
                          decoration: BoxDecoration(
                            color: ColorResources.whiteColor,
                            borderRadius: BorderRadius.circular(30),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(
                                    0.5), // specify shadow color and opacity
                                spreadRadius:
                                    2, // extent of spreading of the shadow
                                blurRadius: 2, // blur radius of the shadow
                                offset:
                                    Offset(0, 2), // changes position of shadow
                              ),
                            ],
                          ),
                          child: Container(
                              alignment: Alignment.center,
                              child: Icon(
                                Icons.arrow_forward_ios,
                                size: 12,
                              )),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Container(
                  height: 1,
                  decoration: BoxDecoration(
                      color: Colors.white24,
                      border: Border.all(color: Colors.grey.withOpacity(0.5))),
                ),
                SizedBox(
                  height: 5,
                ),
                InkWell(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GestureDetector(
                      onTap: () {
                        Get.toNamed(RouteHelper.weeklyPictureViewDetails,
                            arguments: true);
                      },
                      child: Row(
                        children: [
                          Container(
                              height: 35,
                              width: 35,
                              decoration: BoxDecoration(
                                  color: ColorResources.buttongreem,
                                  borderRadius: BorderRadius.circular(90)),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.asset(
                                    Images.dashbord_weeklyworkout,
                                    height: 20,
                                  ),
                                ],
                              )),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            "Weekly Pictures &\nMeasurements",
                            style: poppinsSemiBold.copyWith(
                                fontSize: 16, height: 1),
                          ),
                          Spacer(),
                          Container(
                            height: 20,
                            width: 20,
                            // padding: EdgeInsets.only(left: 8),
                            decoration: BoxDecoration(
                              color: ColorResources.whiteColor,
                              borderRadius: BorderRadius.circular(30),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(
                                      0.5), // specify shadow color and opacity
                                  spreadRadius:
                                      2, // extent of spreading of the shadow
                                  blurRadius: 2, // blur radius of the shadow
                                  offset: Offset(
                                      0, 2), // changes position of shadow
                                ),
                              ],
                            ),
                            child: Container(
                                alignment: Alignment.center,
                                child: Icon(
                                  Icons.arrow_forward_ios,
                                  size: 12,
                                )),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Container(
                  height: 1,
                  decoration: BoxDecoration(
                      color: Colors.white24,
                      border: Border.all(color: Colors.grey.withOpacity(0.5))),
                ),
                SizedBox(
                  height: 5,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GestureDetector(
                    onTap: () {
                      Get.toNamed(RouteHelper.viewRemarksDetails,
                          arguments: true);
                    },
                    child: Row(
                      children: [
                        Container(
                            height: 40,
                            width: 40,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset(
                                  Images.dashboard_review,
                                  height: 38,
                                ),
                              ],
                            )),
                        SizedBox(
                          width: 10,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text("My REMARKS",
                                style: poppinstMedium.copyWith(
                                    fontSize: 13,
                                    height: 1,
                                    color: Colors.grey)),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              "View List",
                              style: poppinsSemiBold.copyWith(
                                  fontSize: 16, height: 1),
                            ),
                          ],
                        ),
                        Spacer(),
                        Container(
                          height: 20,
                          width: 20,
                          // padding: EdgeInsets.only(left: 8),
                          decoration: BoxDecoration(
                            color: ColorResources.whiteColor,
                            borderRadius: BorderRadius.circular(30),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(
                                    0.5), // specify shadow color and opacity
                                spreadRadius:
                                    2, // extent of spreading of the shadow
                                blurRadius: 2, // blur radius of the shadow
                                offset:
                                    Offset(0, 2), // changes position of shadow
                              ),
                            ],
                          ),
                          child: Container(
                              alignment: Alignment.center,
                              child: Icon(
                                Icons.arrow_forward_ios,
                                size: 12,
                              )),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Container(
                  height: 1,
                  decoration: BoxDecoration(
                      color: Colors.white24,
                      border: Border.all(color: Colors.grey.withOpacity(0.5))),
                ),
              ],
            ),
          ),
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
    // startTimer();
    // print('vhbjnkml,');

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

  Future<void> _handleCameraAndMic(Permission permission) async {
    final status = await permission.request();
    print(status);
  }
}
