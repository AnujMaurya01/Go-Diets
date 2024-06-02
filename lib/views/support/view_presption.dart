import 'dart:async';
import 'dart:io';

import 'package:dietitian/controller/auth_controller.dart';
import 'package:dietitian/utils/colors.dart';
import 'package:dietitian/utils/style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class viewPresptionScreen extends StatefulWidget {
  const viewPresptionScreen({super.key});

  @override
  State<viewPresptionScreen> createState() => _viewPresptionScreenState();
}

class _viewPresptionScreenState extends State<viewPresptionScreen> {
  final AuthController _authController = Get.find<AuthController>();
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
  }

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;

    return Scaffold(
      body: SingleChildScrollView(
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
                                "View Prescription",
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
                    height: screenSize.height * 0.88,
                    child: Column(
                      children: [
                        SizedBox(
                          height: 10,
                        ),
                        showLoader
                            ? Center(child: CustomLoadingIndicator())
                            : Expanded(
                                child: SingleChildScrollView(
                                child: Column(
                                  children: [
                                    Column(children: [
                                      GetBuilder<AuthController>(
                                          builder: (viewmedicalreport) {
                                        return viewmedicalreport.profileDetails!
                                                    .planExpiryDate ==
                                                null
                                            ? Padding(
                                                padding: const EdgeInsets.only(
                                                    top: 300),
                                                child: Text(
                                                  'Plan not activated please purchase or buy plan!',
                                                  textAlign: TextAlign.center,
                                                  style:
                                                      poppinstMedium.copyWith(
                                                    fontSize: 16,
                                                    height: 1.2,
                                                    color: Colors.black,
                                                  ),
                                                ),
                                              )
                                            : viewmedicalreport
                                                    .usermedicalreportlistdata
                                                    .isEmpty
                                                ? Center(
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              top: 200),
                                                      child: Text(
                                                          'No Prescription!'),
                                                    ),
                                                  )
                                                : Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            15.0),
                                                    child: Column(
                                                      children: [
                                                        ...viewmedicalreport
                                                            .usermedicalreportlistdata
                                                            .asMap()
                                                            .entries
                                                            .map((e) {
                                                          String
                                                              originalDateString =
                                                              e.value.createdAt
                                                                  .toString();
                                                          DateTime
                                                              originalDate =
                                                              DateTime.parse(
                                                                  originalDateString);
                                                          String formattedDate =
                                                              DateFormat(
                                                                      'dd-MM-yyyy')
                                                                  .format(
                                                                      originalDate);
                                                          return Padding(
                                                              padding: EdgeInsets
                                                                  .only(
                                                                      left: 0.0,
                                                                      right: 0,
                                                                      top: 0,
                                                                      bottom:
                                                                          5),
                                                              child: Container(
                                                                decoration:
                                                                    BoxDecoration(
                                                                        border: Border.all(
                                                                            color: Colors
                                                                                .grey.shade500),

                                                                        //color: Colors.red,
                                                                        borderRadius:
                                                                            BorderRadius.circular(10)),
                                                                child: Padding(
                                                                  padding:
                                                                      const EdgeInsets
                                                                              .all(
                                                                          8.0),
                                                                  child: Column(
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .start,
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .start,
                                                                    children: [
                                                                      Padding(
                                                                        padding:
                                                                            const EdgeInsets.all(5.0),
                                                                        child:
                                                                            Row(
                                                                          children: [
                                                                            Text("Upload Date : ",
                                                                                style: poppinstMedium.copyWith()),
                                                                            Text(
                                                                              '${formattedDate}',
                                                                              style: poppinsRegular.copyWith(),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ),
                                                                      Container(
                                                                        child: Image.network(
                                                                            'https://godiet.aks.5g.in/${e.value.medicalReport}'),
                                                                      )
                                                                    ],
                                                                  ),
                                                                ),
                                                              ));
                                                        }).toList(),
                                                      ],
                                                    ),
                                                  );
                                        // Padding(
                                        //     padding: const EdgeInsets.all(20.0),
                                        //     child: Container(
                                        //       child: Image.network(
                                        //           'https://godiet.aks.5g.in/${viewmedicalreport.doctorlistdataaa.}'),
                                        //     ),
                                        //   );
                                      })
                                    ]),
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
              if (_authController.isLoad.value)
                Positioned.fill(
                  child: Container(
                    color: Colors.black.withOpacity(0.5),
                    child: Center(
                      child: CustomLoadingIndicator(),
                    ),
                  ),
                )
            ]),
          ],
        ),
      ),
    );
  }
}
