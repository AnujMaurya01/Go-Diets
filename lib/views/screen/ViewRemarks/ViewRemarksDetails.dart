import 'dart:async';

import 'package:dietitian/controller/auth_controller.dart';
import 'package:dietitian/utils/all_images.dart';
import 'package:dietitian/utils/colors.dart';
import 'package:dietitian/utils/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:intl/intl.dart';

final AuthController _authController = Get.find<AuthController>();

class ViewRemarksDetails extends StatefulWidget {
  ViewRemarksDetails({super.key});

  @override
  State<ViewRemarksDetails> createState() => _ViewRemarksDetailsState();
}

class _ViewRemarksDetailsState extends State<ViewRemarksDetails> {
  var UserAppID;
  bool showLoader = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(Duration(seconds: 1), () {
      setState(() {
        showLoader = false;
      });
    });
    // _authController.listRemark();

    /*// UserAppID = Get.find<AuthController>().getDietitian();
    main();*/
  }

  final _scrollController = ScrollController();
  int page = 1;

  @override
  Widget build(BuildContext context) {
    var dititianID = Get.find<AuthController>().getDietitianID();
    final Size screenSize = MediaQuery.of(context).size;
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: ColorResources.buttonYellow,
      statusBarIconBrightness: Brightness.dark, // For Android (dark icons)
      statusBarBrightness: Brightness
          .light, // Yahaan aap apne pasandeeda rang ka istemal kar sakte hain
    ));
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        _authController.listRemark(page: page++, dititianID: dititianID);
      }
    });
    return Scaffold(
        //  backgroundColor: ColorResources.loginappColor,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(45),
          child: AppBar(
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
            title: Container(
              child: Text(
                "Remark and Special",
                textAlign: TextAlign.center,
                style: poppinsSemiBold.copyWith(
                    fontSize: 18, height: 0, color: Colors.black),
              ),
            ),
          ),
        ),
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
                    color: ColorResources.buttonYellow,
                    height: 130,
                    child: Column(
                      children: [
                        Container(
                          child: Text(
                            "Instruction List",
                            textAlign: TextAlign.center,
                            style: poppinsSemiBold.copyWith(
                                fontSize: 18, height: 1, color: Colors.black),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Positioned(
                  top: 40,
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
                          Expanded(
                            child: showLoader
                                ? Center(child: CustomLoadingIndicator())
                                : Obx(() {
                                    if (_authController.isLoading.value &&
                                        _authController.remarksData.isEmpty) {
                                      return Center(
                                          child: Text('No Instruction List!!'));
                                    } else if (_authController
                                        .remarksData.isEmpty) {
                                      return const Center(
                                          child: Text('No Instruction List!!'));
                                    } else {
                                      return Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: SingleChildScrollView(
                                          controller: _scrollController,
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.stretch,
                                            children: [
                                              ..._authController.remarksData
                                                  .asMap()
                                                  .entries
                                                  .map((e) {
                                                String originalDateString =
                                                    e.value.createdAt!;
                                                DateTime originalDate =
                                                    DateTime.parse(
                                                        originalDateString);
                                                int index = e.key;
                                                int lenght = _authController
                                                        .remarksData.length -
                                                    1;
                                                String formattedDate =
                                                    DateFormat('dd-MMMM-yyyy')
                                                        .format(originalDate);

                                                return Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  children: [
                                                    Theme(
                                                      data: ThemeData().copyWith(
                                                          dividerColor: Colors
                                                              .transparent),
                                                      child: ExpansionTile(
                                                        iconColor: ColorResources
                                                            .verifyScreenButton,
                                                        title: Row(
                                                          children: [
                                                            Image.asset(
                                                              Images.Vector3,
                                                              height: 25,
                                                            ),
                                                            SizedBox(
                                                              width: 20,
                                                            ),
                                                            Container(
                                                              padding: EdgeInsets
                                                                  .only(top: 0),
                                                              child: Text(
                                                                  "$formattedDate",
                                                                  style: poppinsSemiBold.copyWith(
                                                                      color: ColorResources
                                                                          .verifyScreenButton,
                                                                      height: 1,
                                                                      fontSize:
                                                                          15)),
                                                            )
                                                          ],
                                                        ),
                                                        children: <Widget>[
                                                          Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                        .symmetric(
                                                                    horizontal:
                                                                        16.0,
                                                                    vertical:
                                                                        8.0),
                                                            child: Column(
                                                              children: [
                                                                Container(
                                                                  alignment:
                                                                      Alignment
                                                                          .centerLeft,
                                                                  child: Text(
                                                                    "Remarks:",
                                                                    style: poppinsSemiBold
                                                                        .copyWith(
                                                                      fontSize:
                                                                          14.0,
                                                                    ),
                                                                  ),
                                                                ),
                                                                Container(
                                                                  alignment:
                                                                      Alignment
                                                                          .centerLeft,
                                                                  child: Text(
                                                                    e.value
                                                                        .remarks!,
                                                                    textAlign:
                                                                        TextAlign
                                                                            .justify,
                                                                    style: poppinstMedium
                                                                        .copyWith(
                                                                      fontSize:
                                                                          12.0,
                                                                    ),
                                                                  ),
                                                                ),
                                                                Container(
                                                                  alignment:
                                                                      Alignment
                                                                          .centerLeft,
                                                                  child: Text(
                                                                    "Special Instruction:",
                                                                    style: poppinsSemiBold
                                                                        .copyWith(
                                                                      fontSize:
                                                                          14.0,
                                                                    ),
                                                                  ),
                                                                ),
                                                                Container(
                                                                  alignment:
                                                                      Alignment
                                                                          .centerLeft,
                                                                  child: Text(
                                                                    e.value
                                                                        .specialInstruction!,
                                                                    textAlign:
                                                                        TextAlign
                                                                            .justify,
                                                                    style: poppinstMedium
                                                                        .copyWith(
                                                                      fontSize:
                                                                          12.0,
                                                                    ),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    if (index !=
                                                        lenght) // Excluding the last index
                                                      Container(
                                                        height: 1.5,
                                                        decoration:
                                                            BoxDecoration(
                                                                color: Colors
                                                                    .grey
                                                                    .withOpacity(
                                                                        0.4)),
                                                      )
                                                  ],
                                                );
                                              }).toList(),
                                            ],
                                          ),
                                        ),
                                      );
                                    }
                                  }),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ]),
            ],
          ),
        ));
  }

  Widget steponecontainer2() {
    return Padding(
      padding: const EdgeInsets.only(left: 10.0, right: 10, top: 0),
      child: GetBuilder<AuthController>(builder: (logic) {
        return Column(
          children: logic.remarksData.asMap().entries.map((e) {
            String originalDateString = e.value.createdAt!;
            DateTime originalDate = DateTime.parse(originalDateString);
            int index = e.key;
            int lenght = logic.remarksData.length - 1;
            String formattedDate =
                DateFormat('dd-MMMM-yyyy').format(originalDate);

            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Theme(
                  data: ThemeData().copyWith(dividerColor: Colors.transparent),
                  child: ExpansionTile(
                    iconColor: ColorResources.verifyScreenButton,
                    title: Row(
                      children: [
                        Image.asset(
                          Images.Vector3,
                          height: 40,
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Container(
                          padding: EdgeInsets.only(top: 0),
                          child: Text("$formattedDate",
                              style: poppinsSemiBold.copyWith(
                                  color: ColorResources.verifyScreenButton,
                                  height: 1,
                                  fontSize: 15)),
                        )
                      ],
                    ),
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16.0, vertical: 8.0),
                        child: Column(
                          children: [
                            Container(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                "Remarks:",
                                style: poppinsSemiBold.copyWith(
                                  fontSize: 15.0,
                                ),
                              ),
                            ),
                            Container(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                e.value.remarks!,
                                textAlign: TextAlign.justify,
                                style: poppinstMedium.copyWith(
                                  fontSize: 12.0,
                                ),
                              ),
                            ),
                            Container(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                "Special Instruction:",
                                style: poppinsSemiBold.copyWith(
                                  fontSize: 15.0,
                                ),
                              ),
                            ),
                            Container(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                e.value.specialInstruction!,
                                textAlign: TextAlign.justify,
                                style: poppinstMedium.copyWith(
                                  fontSize: 12.0,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                if (index != lenght) // Excluding the last index
                  Container(
                    height: 1.5,
                    decoration:
                        BoxDecoration(color: Colors.grey.withOpacity(0.4)),
                  )
              ],
            );
          }).toList(),
        );
      }),
    );
  }
}
