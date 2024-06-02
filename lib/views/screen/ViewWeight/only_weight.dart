import 'dart:async';

import 'package:dietitian/controller/auth_controller.dart';
import 'package:dietitian/utils/colors.dart';
import 'package:dietitian/utils/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:intl/intl.dart';

final AuthController _authController = Get.find<AuthController>();

// ignore: must_be_immutable
class OnlyWeightScreen extends StatefulWidget {
  String? nameId;
  OnlyWeightScreen({super.key, this.nameId});

  @override
  State<OnlyWeightScreen> createState() => _OnlyWeightScreenState();
}

class _OnlyWeightScreenState extends State<OnlyWeightScreen> {
  final _scrollController = ScrollController();
  int page = 1;
  bool showLoader = true;

  var argument = Get.arguments;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    var receivedData = Get.arguments;
    print("SMDLKMLMDSLM${widget.nameId}");
    Timer(Duration(seconds: 1), () {
      setState(() {
        showLoader = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: ColorResources.buttonYellow,
      statusBarIconBrightness: Brightness.dark,
      statusBarBrightness: Brightness.light,
    ));

    //   print("sdjnnds${argument['data']}");
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        _authController.dietitianWeeklys(
            page: page++, dititianID: widget.nameId);
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
                    color: ColorResources.buttonYellow,
                    height: 190,
                    child: Column(
                      children: [
                        SizedBox(
                          height: 40,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 20.0, right: 15, top: 20, bottom: 10),
                          child: GestureDetector(
                            onTap: () {
                              Get.back();
                            },
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(top: 5.0),
                                  child: Container(
                                    width: 20,
                                    child: Icon(
                                      Icons.arrow_back_ios,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 50,
                                ),
                                Container(
                                  child: Text(
                                    "Weight List",
                                    textAlign: TextAlign.center,
                                    style: poppinsSemiBold.copyWith(
                                      fontSize: 18,
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
                      height: screenSize.height * 0.84,
                      child: Column(
                        children: [
                          SizedBox(
                            height: 10,
                          ),
                          Expanded(child: Obx(() {
                            if (_authController.isLoading.value &&
                                _authController.dietitianWeekly.isEmpty) {
                              return Center(child: CustomLoadingIndicator());
                            } else if (_authController
                                .dietitianWeekly.isEmpty) {
                              return const Center(child: Text('No Data found'));
                            } else {
                              return showLoader
                                  ? Center(child: CustomLoadingIndicator())
                                  : Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: SingleChildScrollView(
                                        controller: _scrollController,
                                        child: Column(
                                          children: [
                                            ..._authController.dietitianWeekly
                                                .asMap()
                                                .entries
                                                .map((e) {
                                              var consoleDate =
                                                  e.value.createdAt;
                                              DateTime originalDate =
                                                  DateTime.parse(consoleDate!);
                                              String formattedDate =
                                                  DateFormat('dd MMMM yyyy')
                                                      .format(originalDate);
                                              var value = e.value;
                                              return Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: Column(
                                                  children: [
                                                    Row(
                                                      children: [
                                                        Icon(
                                                          Icons
                                                              .calendar_today_rounded,
                                                          size: 20,
                                                        ),
                                                        SizedBox(
                                                          width: 15,
                                                        ),
                                                        Text(
                                                          formattedDate,
                                                          style: poppinsSemiBold
                                                              .copyWith(
                                                            fontSize: 15,
                                                          ),
                                                        )
                                                      ],
                                                    ),
                                                    SizedBox(
                                                      height: 8,
                                                    ),
                                                    Image.asset(
                                                        "assets/Line 43.png"),
                                                    SizedBox(
                                                      height: 8,
                                                    ),
                                                    Row(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .center,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        Expanded(
                                                          child: Column(
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .center,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .center,
                                                            children: [
                                                              Row(
                                                                children: [
                                                                  Container(
                                                                      width: 80,
                                                                      child:
                                                                          Text(
                                                                        'Weight :',
                                                                        style: poppinsSemiBold.copyWith(
                                                                            height:
                                                                                1.2,
                                                                            fontSize:
                                                                                12),
                                                                      )),
                                                                  Expanded(
                                                                    child:
                                                                        Container(
                                                                      child: e.value.weight ==
                                                                              null
                                                                          ? SizedBox()
                                                                          : Text(
                                                                              "${e.value.weight} kg",
                                                                              style: poppinsRegular.copyWith(height: 1.2, fontSize: 12),
                                                                            ),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ],
                                                          ),
                                                        )
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              );
                                            }).toList(),
                                          ],
                                        ),
                                      ));
                            }
                          })),
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
}
