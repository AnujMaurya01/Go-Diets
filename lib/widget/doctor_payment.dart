import 'dart:async';

import 'package:dietitian/controller/auth_controller.dart';
import 'package:dietitian/utils/colors.dart';
import 'package:dietitian/utils/style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class DoctorPaymentHistory extends StatefulWidget {
  const DoctorPaymentHistory({super.key});

  @override
  State<DoctorPaymentHistory> createState() => _DoctorPaymentHistoryState();
}

class _DoctorPaymentHistoryState extends State<DoctorPaymentHistory> {
  final UserTransactionHistoryController controller =
      Get.put(UserTransactionHistoryController());
  final _scrollController = ScrollController();
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

  int page = 1;
  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;

    return Scaffold(
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
          "Transaction History",
          textAlign: TextAlign.center,
          style: poppinsSemiBold.copyWith(
            fontSize: 18,
            height: 1.2,
            color: Colors.black,
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
                              /*  Icon(
                              Icons.arrow_back_ios,
                              color: Colors.black,
                            ),*/
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  top: 0,
                  left: 0,
                  right: 0,
                  child: Padding(
                    padding: EdgeInsets.only(left: 20, right: 20),
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          color: Colors.white),
                      //  color: ColorResources.whiteColor,
                      height: screenSize.height * 0.88,
                      child: Column(
                        children: [
                          Expanded(
                            child: showLoader
                                ? Center(child: CustomLoadingIndicator())
                                : Obx(
                                    () {
                                      if (controller.userTransactions.isEmpty) {
                                        return Center(
                                          child:
                                              Text('No Transaction History !'),
                                        );
                                      } else {
                                        return ListView.builder(
                                          itemCount: controller
                                              .userTransactions.length,
                                          itemBuilder: (context, index) {
                                            var transaction = controller
                                                .userTransactions[index];
                                            String originalDateString =
                                                transaction["plan_start_date"];
                                            DateTime originalDate =
                                                DateTime.parse(
                                                    originalDateString);
                                            String formattedDate =
                                                DateFormat('dd-MM-yyyy')
                                                    .format(originalDate);
                                            DateTime timer =
                                                DateFormat('dd-MM-yyyy')
                                                    .parse(formattedDate);
                                            DateTime currentDate =
                                                DateTime.now();
                                            String formattedDates =
                                                DateFormat('dd-MM-yyyy')
                                                    .format(currentDate);
                                            DateTime timers =
                                                DateFormat('dd-MM-yyyy')
                                                    .parse(formattedDates);
                                            String formattedNumber =
                                                NumberFormat('#,##0').format(
                                                    double.parse(transaction[
                                                        "plan_price"]));
                                            return Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.fromLTRB(
                                                          15.0, 10, 15, 5),
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
                                                          Expanded(
                                                            child: Text(
                                                              "Plan ${transaction['plan_name']}",
                                                              style: poppinsSemiBold
                                                                  .copyWith(
                                                                      fontSize:
                                                                          14),
                                                            ),
                                                          ),
                                                          Expanded(
                                                            child: Container(
                                                              alignment: Alignment
                                                                  .centerRight,
                                                              child: Text(
                                                                "Payment Date",
                                                                style: poppinsSemiBold
                                                                    .copyWith(
                                                                        fontSize:
                                                                            14),
                                                              ),
                                                            ),
                                                          )
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
                                                          Expanded(
                                                            child: Text(
                                                              "₹${formattedNumber}",
                                                              style: poppinstMedium
                                                                  .copyWith(
                                                                      fontSize:
                                                                          13,
                                                                      color: Colors
                                                                          .black),
                                                            ),
                                                          ),
                                                          Expanded(
                                                            child: Container(
                                                              alignment: Alignment
                                                                  .centerRight,
                                                              child: Text(
                                                                formattedDate,
                                                                style: poppinstMedium
                                                                    .copyWith(
                                                                        fontSize:
                                                                            13),
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                      Container(
                                                        height: 1,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: Colors.grey
                                                              .withOpacity(
                                                                  0.45),
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            );
                                          },
                                        );
                                      }
                                    },
                                  ),
                          ),
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
}
