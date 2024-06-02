import 'dart:async';

import 'package:dietitian/controller/auth_controller.dart';
import 'package:dietitian/utils/colors.dart';
import 'package:dietitian/utils/style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FeedbackScreen extends StatefulWidget {
  const FeedbackScreen({super.key});

  @override
  State<FeedbackScreen> createState() => _FeedbackScreenState();
}

class _FeedbackScreenState extends State<FeedbackScreen> {
  Color borderColor1 = Colors.green;
  Color borderColor2 = Colors.green;
  Color borderColor3 = Colors.green;
  int selectedContainer = 0;
  TextEditingController textUserId = TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // Get.find()<>getfeedbackdataaa()
  }

  String? nametexttt;
  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;

    return Scaffold(body: GetBuilder<AuthController>(builder: (logic) {
      return SingleChildScrollView(
        child: Stack(
          children: [
            Column(
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
                            height: 50,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: GestureDetector(
                              onTap: () {
                                Navigator.pop(context);
                                //Get.back();
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
                                      "Feedback",
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
                    top: 120,
                    left: 0,
                    right: 0,
                    child: Padding(
                      padding: EdgeInsets.only(left: 20, right: 20),
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                            color: Colors.white),
                        height: screenSize.height * 0.88,
                        child: Column(
                          children: [
                            SizedBox(
                              height: 30,
                            ),
                            logic.profileDetails!.planExpiryDate == null
                                ? Padding(
                                    padding: const EdgeInsets.only(top: 300),
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
                                : Expanded(
                                    child: SingleChildScrollView(
                                    child: Column(
                                      children: [
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(left: 15),
                                          child: Row(
                                            children: [
                                              Text(
                                                "Share how is your program going on ?",
                                                overflow: TextOverflow.ellipsis,
                                                maxLines: 2,
                                                textAlign: TextAlign.center,
                                                style: poppinsSemiBold.copyWith(
                                                  fontSize: 15,
                                                  height: 1.2,
                                                  color: Colors.black,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          children: [
                                            buildContainer(
                                                1,
                                                'Excellent',
                                                'For self',
                                                'assets/exc.png',
                                                ColorResources.whiteColor),
                                            buildContainer(
                                                2,
                                                'Very Good',
                                                'For myself & Partner',
                                                'assets/poor.png',
                                                ColorResources.whiteColor),
                                            buildContainer(
                                                3,
                                                'Good',
                                                'For teen age',
                                                'assets/good.png',
                                                ColorResources.whiteColor),
                                            buildContainer(
                                                4,
                                                'Average',
                                                'For self',
                                                'assets/very.png',
                                                ColorResources.whiteColor),
                                            buildContainer(
                                                5,
                                                'Bad',
                                                'For myself & Partner',
                                                'assets/bad.png',
                                                ColorResources.whiteColor),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 30,
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              left: 15, bottom: 5),
                                          child: Row(
                                            children: [
                                              Text(
                                                "Any message want to ekta mam",
                                                textAlign: TextAlign.center,
                                                style: poppinsSemiBold.copyWith(
                                                  fontSize: 15,
                                                  height: 1.2,
                                                  color: Colors.black,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              left: 15, right: 15, top: 10),
                                          child: Container(
                                            height: 100,
                                            child: TextFormField(
                                              controller: textUserId,
                                              maxLines: 10,
                                              decoration: InputDecoration(
                                                filled: true,
                                                fillColor: Colors.grey.shade200,
                                                enabledBorder:
                                                    OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                  borderSide: BorderSide(
                                                    color: Colors.grey.shade400,
                                                  ),
                                                ),
                                                focusedBorder:
                                                    OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                  borderSide: BorderSide(
                                                    color: Colors.grey.shade400,
                                                  ),
                                                ),
                                                contentPadding: EdgeInsets.only(
                                                    top: 5, left: 10),
                                                // hintText: AppConstants.password,
                                                hintStyle:
                                                    poppinstMedium.copyWith(
                                                        color: Colors.grey),
                                              ),
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 50,
                                        ),
                                        GestureDetector(
                                          onTap: () async {
                                            if (selectedContainer == 0) {
                                              var snackBar = SnackBar(
                                                  content:
                                                      Text('Select feedback'));
                                              ScaffoldMessenger.of(context)
                                                  .showSnackBar(snackBar);
                                            } else if (textUserId
                                                .text.isEmpty) {
                                              var snackBar = SnackBar(
                                                  content:
                                                      Text('Enter feedback'));
                                              ScaffoldMessenger.of(context)
                                                  .showSnackBar(snackBar);
                                            } else {
                                              Get.find<AuthController>()
                                                  .feedbackpostapii(
                                                context: context,
                                                shareprogram: nametexttt,
                                                messagee:
                                                    textUserId.text.trim(),
                                              );
                                              Timer(Duration(seconds: 2), () {
                                                textUserId.clear();
                                              });
                                            }
                                          },
                                          child: Container(
                                            margin: EdgeInsets.only(
                                                left: 50, right: 50),
                                            height: 40,
                                            width: MediaQuery.of(context)
                                                .size
                                                .width,
                                            alignment: Alignment.center,
                                            decoration: BoxDecoration(
                                                color: Colors.green,
                                                borderRadius:
                                                    BorderRadius.circular(5)),
                                            child: Text(
                                              "Submit",
                                              style: poppinsRegular.copyWith(
                                                color: Colors.white,
                                                fontSize: 16,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  )),
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
            if (logic.isLoad.value)
              Positioned.fill(
                child: Container(
                  color: Colors.black.withOpacity(0.1),
                  child: Center(
                    child: CustomLoadingIndicator(),
                  ),
                ),
              )
          ],
        ),
      );
    }));
  }

  Widget buildContainer(int containerNumber, String title, String subTitle,
      String imagePath, Color containerColor) {
    bool isSelected = selectedContainer == containerNumber;
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedContainer = containerNumber;
          nametexttt = title;
          print('${title}');
        });
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 10, left: 10),
            child: Image.asset(
              imagePath,
              height: 55,
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title,
                  style: poppinsSemiBold.copyWith(
                      fontSize: 12, color: ColorResources.backColor)),
            ],
          ),
          isSelected
              ? Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: CircleAvatar(
                    radius: 12,
                    backgroundColor: Colors.white,
                    child: Icon(
                      Icons.check,
                      color: Colors.green,
                      size: 20,
                    ),
                  ),
                )
              : Container(),
        ],
      ),
    );
  }
}
