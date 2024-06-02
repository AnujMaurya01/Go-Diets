import 'dart:async';

import 'package:dietitian/controller/auth_controller.dart';
import 'package:dietitian/utils/all_images.dart';
import 'package:dietitian/utils/colors.dart';
import 'package:dietitian/utils/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:intl/intl.dart';

final AuthController _authController = Get.find<AuthController>();

class ChatScreenHistoryNav extends StatefulWidget {
  const ChatScreenHistoryNav({super.key});

  @override
  State<ChatScreenHistoryNav> createState() => _ChatScreenHistoryNavState();
}

class _ChatScreenHistoryNavState extends State<ChatScreenHistoryNav> {
  bool isValid = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(Duration(seconds: 2), () {
      setState(() {
        isValid = true;
      });
    });
  }

  final _scrollController = ScrollController();
  int page = 1;

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: ColorResources.buttonYellow,
      statusBarIconBrightness: Brightness.dark, // For Android (dark icons)
      statusBarBrightness: Brightness.light,
    ));
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        _authController.chatAudioHistoryDietitian(page: page++);
      }
    });
    return Scaffold(
      body: GetBuilder<AuthController>(builder: (logic) {
        return SingleChildScrollView(
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
                    decoration: BoxDecoration(
                      color: ColorResources.buttonYellow,
                    ),
                    height: 200,
                    child: Column(
                      children: [
                        SizedBox(
                          height: 40,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: GestureDetector(
                            onTap: () {
                              Get.back();
                            },
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.arrow_back_ios,
                                  color: Colors.black,
                                ),
                                Spacer(),
                                Container(
                                  child: Text(
                                    "Call/Chat History",
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
                      //  color: ColorResources.whiteColor,
                      height: screenSize.height * 0.85,
                      child: Column(
                        children: [
                          SizedBox(
                            height: 10,
                          ),
                          Expanded(child: Obx(() {
                            if (_authController.isLoading.value &&
                                _authController.chatData.isEmpty) {
                              return Center(child: CustomLoadingIndicator());
                            } else if (_authController.chatData.isEmpty) {
                              return const Center(
                                  child: Text('No Chat History found'));
                            } else {
                              return Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: SingleChildScrollView(
                                    controller: _scrollController,
                                    child: Column(
                                      children: [
                                        ..._authController.chatData
                                            .asMap()
                                            .entries
                                            .map((e) {
                                          String originalDateString =
                                              e.value.startDateTime!;
                                          DateTime originalDate =
                                              DateTime.parse(
                                                  originalDateString);
                                          String formattedDate =
                                              DateFormat('dd-MM-yyyy')
                                                  .format(originalDate);
                                          return Padding(
                                            padding: const EdgeInsets.only(
                                                left: 18, right: 18, top: 18),
                                            child: Container(
                                              height: 40,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(5),
                                                color: ColorResources.greyColor,
                                                boxShadow: [
                                                  BoxShadow(
                                                    color: Colors.grey
                                                        .withOpacity(
                                                            0.5), // shadow color
                                                    spreadRadius:
                                                        2, // extent of the shadow spreading horizontally
                                                    blurRadius: 1, // blur level
                                                    offset: Offset(0,
                                                        1), // changes position of shadow
                                                  ),
                                                ],
                                              ),
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: Row(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Container(
                                                      alignment:
                                                          Alignment.centerRight,
                                                      child: Text(formattedDate,
                                                          style: poppinstMedium
                                                              .copyWith(
                                                                  fontSize:
                                                                      13)),
                                                    ),
                                                    Spacer(),
                                                    Container(
                                                      alignment:
                                                          Alignment.centerRight,
                                                      child: Text(
                                                          e.value
                                                              .conversationType!,
                                                          style: poppinstMedium
                                                              .copyWith(
                                                                  fontSize:
                                                                      13)),
                                                    ),
                                                    SizedBox(
                                                      width: 5,
                                                    ),
                                                    if (e.value
                                                            .conversationType! ==
                                                        "chat") ...[
                                                      Image.asset(
                                                        Images.messae_doctro,
                                                        height: 30,
                                                      ),
                                                    ],
                                                    if (e.value
                                                            .conversationType! ==
                                                        "audio") ...[
                                                      Icon(Icons.phone_enabled)
                                                    ],
                                                  ],
                                                ),
                                              ),
                                            ),
                                          );
                                        }).toList(),
                                        if (_authController.isLoading.value &&
                                            !_authController
                                                .isAllLoaded.value) ...[
                                          Center(
                                              child: CustomLoadingIndicator()),
                                        ],
                                      ],
                                    ),
                                  ));
                            }
                          })),
                          SizedBox(
                            height: 10,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ]),
            ],
          ),
        );
      }),
    );
  }

  Widget steponecontainer2() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GetBuilder<AuthController>(builder: (transactionHistory) {
        return Column(
          children: transactionHistory.chatData.asMap().entries.map((e) {
            String originalDateString = e.value.startDateTime!;
            DateTime originalDate = DateTime.parse(originalDateString);
            String formattedDate =
                DateFormat('dd-MM-yyyy').format(originalDate);
            return Padding(
              padding: const EdgeInsets.only(left: 8.0, right: 8.0, top: 10),
              child: Container(
                height: 40,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: ColorResources.greyColor,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5), // shadow color
                      spreadRadius:
                          2, // extent of the shadow spreading horizontally
                      blurRadius: 1, // blur level
                      offset: Offset(0, 1), // changes position of shadow
                    ),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        alignment: Alignment.centerRight,
                        child: Text(formattedDate,
                            style: poppinstMedium.copyWith(fontSize: 13)),
                      ),
                      Spacer(),
                      Container(
                        alignment: Alignment.centerRight,
                        child: Text(e.value.conversationType!,
                            style: poppinstMedium.copyWith(fontSize: 13)),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      if (e.value.conversationType! == "chat") ...[
                        Image.asset(
                          Images.messae_doctro,
                          height: 30,
                        ),
                      ],
                      if (e.value.conversationType! == "audio") ...[
                        Icon(Icons.phone_enabled)
                      ],
                    ],
                  ),
                ),
              ),
            );
          }).toList(),
        );
      }),
    );
  }
}
