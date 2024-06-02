import 'dart:async';

import 'package:dietitian/controller/auth_controller.dart';
import 'package:dietitian/utils/colors.dart';
import 'package:dietitian/utils/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

final AuthController _authController = Get.find<AuthController>();

class HistoryTransactionNav extends StatefulWidget {
  const HistoryTransactionNav({super.key});

  @override
  State<HistoryTransactionNav> createState() => _HistoryTransactionNavState();
}

class _HistoryTransactionNavState extends State<HistoryTransactionNav> {
  bool isValid = false;
  final _scrollController = ScrollController();
  int page = 1;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(Duration(seconds: 1), () {
      setState(() {
        isValid = true;
      });
    });
  }

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
        _authController.transactionFunt(page: page++);
      }
    });
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
                              "Transaction",
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
                              child: Text('No Transaction History found'));
                        } else {
                          return _authController
                                      .profileDetails!.planExpiryDate ==
                                  null
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
                              : Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: SingleChildScrollView(
                                    controller: _scrollController,
                                    child: Column(children: [
                                      ..._authController.transactionData
                                          .asMap()
                                          .entries
                                          .map((e) {
                                        String originalDateString =
                                            e.value.planExpiryDate!;
                                        DateTime originalDate =
                                            DateTime.parse(originalDateString);
                                        String formattedDate =
                                            DateFormat('dd-MM-yyyy')
                                                .format(originalDate);
                                        DateTime timer =
                                            DateFormat('dd-MM-yyyy')
                                                .parse(formattedDate);
                                        DateTime currentDate = DateTime.now();
                                        String formattedDates =
                                            DateFormat('dd-MM-yyyy')
                                                .format(currentDate);
                                        DateTime timers =
                                            DateFormat('dd-MM-yyyy')
                                                .parse(formattedDates);
                                        String formattedNumber =
                                            NumberFormat('#,##0').format(
                                                double.parse(
                                                    e.value.planPrice!));
                                        return Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(15.0),
                                              child: Column(
                                                children: [
                                                  Row(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .center,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Text(
                                                        "Plan ${e.value.planName!}",
                                                        style: poppinsSemiBold
                                                            .copyWith(
                                                                fontSize: 14),
                                                      ),
                                                      Spacer(),
                                                      Container(
                                                          width: 80,
                                                          alignment: Alignment
                                                              .centerLeft,
                                                          child: Text(
                                                              'Expire Date',
                                                              style: poppinsSemiBold
                                                                  .copyWith(
                                                                      fontSize:
                                                                          14)))
                                                    ],
                                                  ),
                                                  Row(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .center,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Text(
                                                        "₹${formattedNumber}",
                                                        style: poppinstMedium.copyWith(
                                                            fontSize: 13,
                                                            color: timers
                                                                    .isBefore(
                                                                        timer)
                                                                ? ColorResources
                                                                    .buttongreem
                                                                : Colors.red),
                                                      ),
                                                      Spacer(),
                                                      Container(
                                                        width: 100,
                                                        alignment: Alignment
                                                            .centerRight,
                                                        child: Text(
                                                            formattedDate,
                                                            style: poppinstMedium
                                                                .copyWith(
                                                                    fontSize:
                                                                        13)),
                                                      )
                                                    ],
                                                  ),
                                                  Container(
                                                    height: 1,
                                                    decoration: BoxDecoration(
                                                        color: Colors.grey
                                                            .withOpacity(0.45)),
                                                  )
                                                ],
                                              ),
                                            ),
                                          ],
                                        );
                                      }).toList(),
                                      if (_authController.isLoading.value &&
                                          !_authController
                                              .isAllLoaded.value) ...[
                                        Center(child: CustomLoadingIndicator()),
                                      ]
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
      )),
    );
  }

  Widget steponecontainer2() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GetBuilder<AuthController>(builder: (transactionHistory) {
        return Column(
          children: transactionHistory.transactionData.asMap().entries.map((e) {
            String originalDateString = e.value.planExpiryDate!;
            DateTime originalDate = DateTime.parse(originalDateString);
            String formattedDate =
                DateFormat('dd-MM-yyyy').format(originalDate);
            DateTime timer = DateFormat('dd-MM-yyyy').parse(formattedDate);
            DateTime currentDate = DateTime.now();
            String formattedDates =
                DateFormat('dd-MM-yyyy').format(currentDate);
            DateTime timers = DateFormat('dd-MM-yyyy').parse(formattedDates);
            String formattedNumber =
                NumberFormat('#,##0').format(double.parse(e.value.planPrice!));
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Plan ${e.value.planName!}",
                            style: poppinsSemiBold.copyWith(fontSize: 14),
                          ),
                          Spacer(),
                          Container(
                              width: 80,
                              alignment: Alignment.centerLeft,
                              child: Text('Expire Date',
                                  style:
                                      poppinsSemiBold.copyWith(fontSize: 14)))
                        ],
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "₹${formattedNumber}",
                            style: poppinstMedium.copyWith(
                                fontSize: 13,
                                color: timers.isBefore(timer)
                                    ? ColorResources.buttongreem
                                    : Colors.red),
                          ),
                          Spacer(),
                          Container(
                            width: 100,
                            alignment: Alignment.centerRight,
                            child: Text(formattedDate,
                                style: poppinstMedium.copyWith(fontSize: 13)),
                          )
                        ],
                      ),
                      Container(
                        height: 1,
                        decoration:
                            BoxDecoration(color: Colors.grey.withOpacity(0.45)),
                      )
                    ],
                  ),
                ),
              ],
            );
          }).toList(),
        );
      }),
    );
  }
}
