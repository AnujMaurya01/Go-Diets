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

class ChatUser extends StatefulWidget {
  const ChatUser({super.key});

  @override
  State<ChatUser> createState() => _ChatUserState();
}

class _ChatUserState extends State<ChatUser> {
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
        _authController.chatAudioHistoryDetails(page: page++);
      }
    });
    return Scaffold(
      body: SingleChildScrollView(
        physics: NeverScrollableScrollPhysics(),
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
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(20),
                        bottomRight: Radius.circular(20)),
                  ),
                  height: 200,
                  child: Column(
                    children: [
                      SizedBox(
                        height: 40,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            /*Icon(
                                Icons.arrow_back_ios,
                                color: Colors.black,
                              ),*/
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
                    //  color: ColorResources.whiteColor,
                    height: screenSize.height * 0.80,
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
                            return _authController
                                        .profileDetails!.planExpiryDate ==
                                    null
                                ? Center(
                                    child: Text(
                                      'Plan not activated please purchase or buy plan!',
                                      textAlign: TextAlign.center,
                                      style: poppinstMedium.copyWith(
                                        fontSize: 16,
                                        height: 1.2,
                                        color: Colors.black,
                                      ),
                                    ),
                                  )
                                : Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: SingleChildScrollView(
                                      controller: _scrollController,
                                      child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.stretch,
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
                                                padding: EdgeInsets.all(18),
                                                child: Container(
                                                  height: 40,
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5),
                                                    color: ColorResources
                                                        .greyColor,
                                                    boxShadow: [
                                                      BoxShadow(
                                                        color: Colors.grey
                                                            .withOpacity(
                                                                0.5), // shadow color
                                                        spreadRadius:
                                                            1, // extent of the shadow spreading horizontally
                                                        blurRadius:
                                                            1, // blur level
                                                        offset: Offset(0,
                                                            0.5), // changes position of shadow
                                                      ),
                                                    ],
                                                  ),
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            8.0),
                                                    child: Row(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .center,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        Container(
                                                          alignment: Alignment
                                                              .centerRight,
                                                          child: Text(
                                                              formattedDate,
                                                              style: poppinstMedium
                                                                  .copyWith(
                                                                      fontSize:
                                                                          13)),
                                                        ),
                                                        Spacer(),
                                                        Container(
                                                          alignment: Alignment
                                                              .centerRight,
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
                                                            Images
                                                                .messae_doctro,
                                                            height: 30,
                                                          ),
                                                        ],
                                                        if (e.value
                                                                .conversationType ==
                                                            "audio") ...[
                                                          Icon(Icons
                                                              .phone_enabled)
                                                        ],
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              );
                                            }).toList(),
                                          ]),
                                    ),
                                  );
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
      ),
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
                          1, // extent of the shadow spreading horizontally
                      blurRadius: 1, // blur level
                      offset: Offset(0, 0.5), // changes position of shadow
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
                      if (e.value.conversationType == "audio") ...[
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
