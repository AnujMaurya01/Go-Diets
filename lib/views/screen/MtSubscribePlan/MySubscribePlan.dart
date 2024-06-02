import 'package:dietitian/controller/auth_controller.dart';
import 'package:dietitian/route/route.dart';
import 'package:dietitian/utils/all_images.dart';
import 'package:dietitian/utils/colors.dart';
import 'package:dietitian/utils/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:intl/intl.dart';

class MySubscribePlan extends StatefulWidget {
  const MySubscribePlan({super.key});

  @override
  State<MySubscribePlan> createState() => _MySubscribePlanState();
}

class _MySubscribePlanState extends State<MySubscribePlan> {
  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: ColorResources.buttonYellow,
      statusBarIconBrightness: Brightness.dark,
      statusBarBrightness: Brightness.light,
    ));
    return Scaffold(
      //  backgroundColor: ColorResources.loginappColor,
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
                                "My Package Plan",
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
                    height: screenSize.height * 0.88,
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
      ),
    );
  }

  Widget steponecontainer2() {
    return GetBuilder<AuthController>(builder: (logic) {
      if (logic.profileDetails!.planPrice == null) {
        return Padding(
          padding: EdgeInsets.only(top: 300),
          child: Text('No Subscribe Plan!!'),
        );
      } else {
        String formattedNumber = NumberFormat('#,##0')
            .format(double.parse(logic.profileDetails!.planPrice!));
        String originalDateString = logic.profileDetails!.planExpiryDate!;
        DateTime originalDate = DateTime.parse(originalDateString);
        String formattedDate = DateFormat('dd MMMM yyyy').format(originalDate);
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              // for (int i = 0; i < 20; i++)
              Column(
                children: [
                  SizedBox(
                    height: 15,
                  ),
                  Text("${logic.profileDetails!.planName!} PLAN",
                      style: poppinsSemiBold.copyWith(
                          fontSize: 17, height: 1, color: Colors.black)),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 8.0,
                      right: 8.0,
                    ),
                    child: Container(
                      padding: const EdgeInsets.only(top: 5),
                      height: 45,
                      width: Get.width,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: ColorResources.butongrey,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Text("₹${formattedNumber}",
                          style: poppinsSemiBold.copyWith(
                              fontSize: 23, height: 1, color: Colors.black)),
                    ),
                  ),
                  Container(
                    height: 45,
                    width: Get.width,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          Images.accountwathcread,
                          height: 18,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text("$formattedDate",
                            style: poppinsSemiBold.copyWith(
                                fontSize: 15,
                                height: 1,
                                color: ColorResources.textRedColor)),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text("UPI Code:${logic.bankDetailsInfo!.upiId!}",
                      style: poppinstMedium.copyWith(
                          fontSize: 13,
                          height: 1,
                          color: ColorResources.blueText)),
                  SizedBox(
                    height: 20,
                  ),
                  GestureDetector(
                    onTap: () {
                      showModalBottomSheet(
                          context: context,
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.vertical(
                              top: Radius.circular(25.0),
                            ),
                          ),
                          builder: (context) {
                            return SizedBox(
                              height: 500,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  Padding(
                                    padding: const EdgeInsets.all(20.0),
                                    child: Row(
                                      children: [
                                        Text(
                                          "Pay Now",
                                          style: poppinsSemiBold.copyWith(
                                            fontSize: 18,
                                            color: Colors.black,
                                          ),
                                        ),
                                        Spacer(),
                                        GestureDetector(
                                          onTap: () {
                                            Get.back();
                                          },
                                          child: Container(
                                              height: 25,
                                              width: 25,
                                              decoration: BoxDecoration(
                                                  color: Colors.black,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          45)),
                                              child: Icon(
                                                Icons.close,
                                                size: 18,
                                                color: Colors.white,
                                              )),
                                        )
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Container(
                                      height: 80,
                                      width: Get.width,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(15),
                                        color: ColorResources.greyColor,
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.grey.withOpacity(
                                                0.5), // shadow color
                                            spreadRadius:
                                                2, // extent of the shadow spreading horizontally
                                            blurRadius: 1, // blur level
                                            offset: Offset(0,
                                                1), // changes position of shadow
                                          ),
                                        ],
                                      ),
                                      child: Row(
                                        children: [
                                          Container(
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(18.0),
                                              child: Text(
                                                "Pay With UPI",
                                                style: poppinstMedium.copyWith(
                                                    fontSize: 19),
                                              ),
                                            ),
                                          ),
                                          Spacer(),
                                          Radio(
                                            value: '',
                                            onChanged: (newValue) {},
                                            activeColor: ColorResources
                                                .buttonYellow, // Color when selected
                                            fillColor: MaterialStateProperty
                                                .resolveWith<Color>(
                                              (Set<MaterialState> states) {
                                                if (states.contains(
                                                    MaterialState.selected)) {
                                                  return ColorResources
                                                      .buYellow; // Color when selected
                                                }
                                                return Colors
                                                    .white; // Color when not selected
                                              },
                                            ),
                                            groupValue: '',
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Container(
                                      height: 120,
                                      width: Get.width,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(15),
                                        color: ColorResources.greyColor,
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.grey.withOpacity(
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
                                        padding: const EdgeInsets.all(18.0),
                                        child: Column(
                                          children: [
                                            Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                Container(
                                                  child: Text(
                                                    "Bank Details:",
                                                    style: poppinsSemiBold
                                                        .copyWith(fontSize: 17),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Row(
                                              children: [
                                                Container(
                                                  width: 140,
                                                  child: Text(
                                                    "Bank Name",
                                                    style: poppinsSemiBold
                                                        .copyWith(fontSize: 13),
                                                  ),
                                                ),
                                                Container(
                                                  child: Text(":"),
                                                ),
                                                Expanded(
                                                  child: Container(
                                                    child: Text(
                                                        logic.bankDetailsInfo!
                                                            .bankName!,
                                                        style: poppinstMedium
                                                            .copyWith(
                                                                fontSize: 13)),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Row(
                                              children: [
                                                Container(
                                                  width: 140,
                                                  child: Text(
                                                    "Acc Number",
                                                    style: poppinsSemiBold
                                                        .copyWith(fontSize: 13),
                                                  ),
                                                ),
                                                Container(
                                                  child: Text(":"),
                                                ),
                                                Expanded(
                                                  child: Container(
                                                    child: Text(
                                                      logic.bankDetailsInfo!
                                                          .accountNumber!,
                                                      style: poppinstMedium
                                                          .copyWith(
                                                              fontSize: 13),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Row(
                                              children: [
                                                Container(
                                                  width: 140,
                                                  child: Text(
                                                    "IFSC Code",
                                                    style: poppinsSemiBold
                                                        .copyWith(fontSize: 13),
                                                  ),
                                                ),
                                                Container(
                                                  child: Text(":"),
                                                ),
                                                Expanded(
                                                  child: Container(
                                                    child: Text(
                                                        logic.bankDetailsInfo!
                                                            .ifcCode!,
                                                        style: poppinstMedium
                                                            .copyWith(
                                                                fontSize: 13)),
                                                  ),
                                                ),
                                              ],
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Container(
                                          height: 50,
                                          width: 50,
                                          child: Image.asset(
                                              "assets/ScanRecord.png"),
                                        ),
                                        Container(
                                            child: Text(
                                          "Show QR Code",
                                          style: poppinsSemiBold.copyWith(
                                              fontSize: 19),
                                        ))
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        right: 18.0,
                                        left: 18,
                                        top: 8,
                                        bottom: 8),
                                    child: Container(
                                      alignment: Alignment.center,
                                      width: Get.width,
                                      height: 40,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5),
                                        color: ColorResources.blueText,
                                      ),
                                      child: Text(
                                        "Pay Now",
                                        style: poppinsRegular.copyWith(
                                            fontSize: 18, color: Colors.white),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            );
                          });
                    },
                    child: Container(
                      width: 150,
                      height: 30,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Colors.yellow[600],
                      ),
                      child: Text(
                        "Pay Now",
                        style: poppinstMedium.copyWith(
                            fontSize: 15, color: Colors.black),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 90,
                  ),
                  Container(
                    height: 40,
                    width: 40,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: ColorResources.butongrey,
                        borderRadius: BorderRadius.circular(50)),
                    child: Text(
                      "OR",
                      style: poppinstMedium.copyWith(fontSize: 18),
                    ),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.toNamed(RouteHelper.historyTransactionNav,
                          arguments: true);
                    },
                    child: Container(
                      padding: const EdgeInsets.only(
                          left: 8.0, right: 8, top: 5, bottom: 5),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: ColorResources.buttongreem.withOpacity(0.4)),
                      child: Row(
                        children: [
                          Image.asset(
                            Images.history,
                            height: 50,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 8.0, right: 8, top: 8, bottom: 8),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  "View My",
                                  style: poppinstMedium.copyWith(
                                      fontSize: 17,
                                      color: ColorResources.butgreem),
                                ),
                                Text(
                                  "Transaction History",
                                  style: poppinstMedium.copyWith(
                                      fontSize: 14,
                                      color: ColorResources.butgreem),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
        );
      }
    });
  }
}
