import 'package:dietitian/controller/auth_controller.dart';
import 'package:dietitian/route/route.dart';
import 'package:dietitian/utils/all_images.dart';
import 'package:dietitian/utils/colors.dart';
import 'package:dietitian/utils/style.dart';
import 'package:dietitian/widget/appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:webview_flutter/webview_flutter.dart';

final AuthController _authController = Get.find<AuthController>();

class UserDashBord extends StatefulWidget {
  const UserDashBord({super.key});

  @override
  State<UserDashBord> createState() => _UserDashBordState();
}

class _UserDashBordState extends State<UserDashBord> {
  List<String> name = [
    "Kunal Sagar",
    "Mayank Gupta",
    "Akash Gupta",
    "Akash Nagar",
    "Pamme Laal",
    "Sayukt Mukesh"
  ];
  bool isLoading = true;

  WebViewController? _webViewController;
  final String initialUrl = 'https://www.instagram.com/go__diet/';
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: ColorResources.buttonYellow,

      // Status bar brightness (optional)
      statusBarIconBrightness: Brightness.dark, // For Android (dark icons)
      statusBarBrightness: Brightness
          .light, // Yahaan aap apne pasandeeda rang ka istemal kar sakte hain
    ));
    return Scaffold(
      appBar: AppBar(
        backgroundColor:
            ColorResources.buttonYellow, // Make app bar transparent
        elevation: 0,
        leading: Builder(builder: (BuildContext context) {
          return GestureDetector(
            onTap: () {
              Scaffold.of(context).openDrawer();
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset(
                Images.menutoggle,
                width: 24,
                height: 24,
              ),
            ),
          );
        }),
        actions: [
          Icon(Icons.notifications),
          // Image.asset(
          //   Images.notifiLogo,
          //   width: 24,
          //   height: 24,
          // ),
          SizedBox(
            width: 15,
          )
        ],
      ),
      drawer: AppBarDrawer(),
      body: Obx(() {
        if (_authController.isLoad.value &&
            _authController.profileDetails!.planPrice == null) {
          return CustomLoadingIndicator();
        } else {
          String? formattedNumber;
          String? formattedDate;
          if (_authController.profileDetails!.planPrice != null) {
            formattedNumber = NumberFormat('#,##0').format(
                double.parse(_authController.profileDetails!.planPrice!));
          }

          if (_authController.profileDetails!.planExpiryDate != null) {
            String originalDateString =
                _authController.profileDetails!.planExpiryDate!;
            DateTime originalDate = DateTime.parse(originalDateString);
            formattedDate = DateFormat('dd MMMM yyyy').format(originalDate);
          }
          return Stack(
            children: [
              // Background image
              Positioned.fill(
                child: Image.asset(
                  'assets/numberOtplogin.png',
                  fit: BoxFit.cover,
                ),
              ),

              // Content
              Column(
                children: [
                  Container(
                    height: 70,
                    decoration: BoxDecoration(
                      color: ColorResources.buttonYellow,
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(20),
                          bottomRight: Radius.circular(20)),
                    ),
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.fromLTRB(30, 0, 20, 0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                height: 50,
                                width: 70,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  color: ColorResources.manui,
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Image.asset(
                                      Images.Usericon,
                                      height: 25,
                                    )
                                  ],
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                child: Container(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(top: 8.0),
                                        child: Text(
                                            "Welcome ${_authController.profileDetails!.name}",
                                            style: poppinstMedium.copyWith(
                                                fontSize: 15,
                                                height: 1,
                                                color: ColorResources
                                                    .loginOpenButton)),
                                      ),
                                      Text(
                                        "Dashboard",
                                        style: poppinsSemiBold.copyWith(
                                            fontSize: 25, height: 1.2),
                                      )
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Container(
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 15, right: 15, top: 10, bottom: 10),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Expanded(
                                    child: GestureDetector(
                                      onTap: () {
                                        Get.toNamed(RouteHelper.myDietitianPage,
                                            arguments: true);
                                      },
                                      child: Container(
                                        height: 110,
                                        width: 250,
                                        decoration: BoxDecoration(
                                          color: ColorResources.whiteColor,
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          boxShadow: [
                                            BoxShadow(
                                              color:
                                                  Colors.grey.withOpacity(0.3),
                                              spreadRadius: 2,
                                              blurRadius: 3,
                                              offset: Offset(0, 2),
                                            ),
                                          ],
                                        ),
                                        child: Column(
                                          children: [
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Row(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                children: [
                                                  Container(
                                                    height: 35,
                                                    width: 35,
                                                    decoration: BoxDecoration(
                                                        color: ColorResources
                                                            .buttonSColor,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(30)),
                                                    child: Container(
                                                        alignment:
                                                            Alignment.center,
                                                        child: Image.asset(
                                                          Images.accountsetLogo,
                                                          height: 20,
                                                        )),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Spacer(),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Row(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.end,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    children: [
                                                      Text("My DIETITIAN",
                                                          style: poppinstMedium
                                                              .copyWith(
                                                                  fontSize: 12,
                                                                  height: 1)),
                                                      SizedBox(height: 5),
                                                      Text(
                                                        "Details",
                                                        style: poppinsSemiBold
                                                            .copyWith(
                                                                fontSize: 18,
                                                                height: 1),
                                                      ),
                                                    ],
                                                  ),
                                                  Spacer(),
                                                  Container(
                                                    height: 20,
                                                    width: 20,
                                                    // padding: EdgeInsets.only(left: 8),
                                                    decoration: BoxDecoration(
                                                      color: ColorResources
                                                          .whiteColor,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              30),
                                                      boxShadow: [
                                                        BoxShadow(
                                                          color: Colors.grey
                                                              .withOpacity(0.5),
                                                          // specify shadow color and opacity
                                                          spreadRadius: 2,
                                                          // extent of spreading of the shadow
                                                          blurRadius: 2,
                                                          // blur radius of the shadow
                                                          offset: Offset(0,
                                                              2), // changes position of shadow
                                                        ),
                                                      ],
                                                    ),
                                                    child: Container(
                                                        alignment:
                                                            Alignment.center,
                                                        child: Icon(
                                                          Icons
                                                              .arrow_forward_ios,
                                                          size: 15,
                                                        )),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 13,
                                  ),
                                  Expanded(
                                    child: GestureDetector(
                                      onTap: () {
                                        Get.toNamed(
                                            RouteHelper.chatUserHistoryNav,
                                            arguments: true);
                                      },
                                      child: Container(
                                        height: 110,
                                        width: 250,
                                        decoration: BoxDecoration(
                                          color: ColorResources.whiteColor,
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          boxShadow: [
                                            BoxShadow(
                                              color:
                                                  Colors.grey.withOpacity(0.3),
                                              // specify shadow color and opacity
                                              spreadRadius: 2,
                                              // extent of spreading of the shadow
                                              blurRadius: 3,
                                              // blur radius of the shadow
                                              offset: Offset(0,
                                                  2), // changes position of shadow
                                            ),
                                          ],
                                        ),
                                        child: Column(
                                          children: [
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Row(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                children: [
                                                  Container(
                                                    height: 35,
                                                    width: 35,
                                                    decoration: BoxDecoration(
                                                        color: ColorResources
                                                            .buttongreem,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(30)),
                                                    child: Container(
                                                        alignment:
                                                            Alignment.center,
                                                        child: Image.asset(
                                                          Images.Vector_messahe,
                                                          height: 20,
                                                        )),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Spacer(),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Row(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.end,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    children: [
                                                      Text("My Chat",
                                                          style: poppinstMedium
                                                              .copyWith(
                                                                  fontSize: 12,
                                                                  height: 1)),
                                                      SizedBox(
                                                        height: 5,
                                                      ),
                                                      Text(
                                                        "History",
                                                        style: poppinsSemiBold
                                                            .copyWith(
                                                                fontSize: 18,
                                                                height: 1),
                                                      ),
                                                    ],
                                                  ),
                                                  Spacer(),
                                                  Container(
                                                    height: 20,
                                                    width: 20,
                                                    // padding: EdgeInsets.only(left: 8),
                                                    decoration: BoxDecoration(
                                                      color: ColorResources
                                                          .whiteColor,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              30),
                                                      boxShadow: [
                                                        BoxShadow(
                                                          color: Colors.grey
                                                              .withOpacity(0.5),
                                                          // specify shadow color and opacity
                                                          spreadRadius: 2,
                                                          // extent of spreading of the shadow
                                                          blurRadius: 2,
                                                          // blur radius of the shadow
                                                          offset: Offset(0,
                                                              2), // changes position of shadow
                                                        ),
                                                      ],
                                                    ),
                                                    child: Container(
                                                        alignment:
                                                            Alignment.center,
                                                        child: Icon(
                                                          Icons
                                                              .arrow_forward_ios,
                                                          size: 15,
                                                        )),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            if (_authController.profileDetails!.planPrice !=
                                null) ...[
                              Stack(
                                clipBehavior: Clip.none,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 18.0, right: 18),
                                    child: Container(
                                      height: 230,
                                      width: Get.width,
                                      decoration: BoxDecoration(
                                        color: ColorResources.whiteColor,
                                        borderRadius: BorderRadius.circular(10),
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.grey.withOpacity(0.5),
                                            spreadRadius: 2,
                                            blurRadius: 3,
                                            offset: Offset(0,
                                                2), // changes position of shadow
                                          ),
                                        ],
                                      ),
                                      child: Column(
                                        children: [
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Container(
                                                  height: 45,
                                                  width: 45,
                                                  decoration: BoxDecoration(
                                                      color: ColorResources
                                                          .buttonred,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              30)),
                                                  child: Container(
                                                      alignment:
                                                          Alignment.center,
                                                      child: Image.asset(
                                                        Images.accountsetL,
                                                        height: 20,
                                                      )),
                                                ),
                                                SizedBox(
                                                  width: 10,
                                                ),
                                                Text("My Package Plan",
                                                    style: poppinsSemiBold
                                                        .copyWith(
                                                            fontSize: 17,
                                                            height: 1,
                                                            color:
                                                                Colors.black))
                                              ],
                                            ),
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Text(
                                              "${_authController.profileDetails!.planName!} PLAN",
                                              style: poppinsSemiBold.copyWith(
                                                  fontSize: 18,
                                                  height: 1,
                                                  color: Colors.black)),
                                          SizedBox(
                                            height: 15,
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                              left: 8.0,
                                              right: 8.0,
                                            ),
                                            child: Container(
                                              padding:
                                                  const EdgeInsets.only(top: 5),
                                              height: 45,
                                              width: Get.width,
                                              alignment: Alignment.center,
                                              decoration: BoxDecoration(
                                                color: ColorResources.butongrey,
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                              ),
                                              child: Text("₹$formattedNumber",
                                                  style:
                                                      poppinsSemiBold.copyWith(
                                                          fontSize: 23,
                                                          height: 1,
                                                          color: Colors.black)),
                                            ),
                                          ),
                                          Container(
                                            height: 45,
                                            width: Get.width,
                                            child: Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Image.asset(
                                                  Images.accountwathcread,
                                                  height: 18,
                                                ),
                                                SizedBox(
                                                  width: 5,
                                                ),
                                                Text("$formattedDate",
                                                    style: poppinsSemiBold
                                                        .copyWith(
                                                            fontSize: 17,
                                                            color: ColorResources
                                                                .textRedColor)),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),

                                  //Circle Avatar
                                  Positioned(
                                      top: 210,
                                      left: 0,
                                      right: 0,
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            left: 90, right: 90),
                                        child: GestureDetector(
                                          onTap: () {
                                            Get.toNamed(
                                                RouteHelper.mySubscribePlan,
                                                arguments: true);
                                          },
                                          child: Container(
                                            alignment: Alignment.center,
                                            height: 35,
                                            width: Get.width,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(9),
                                                color: ColorResources
                                                    .buttonYellow),
                                            child: Text(
                                              "Renew Plan",
                                              style: poppinstMedium.copyWith(
                                                  fontSize: 15,
                                                  height: 1,
                                                  color: Colors.black),
                                            ),
                                          ),
                                        ),
                                      )),
                                ],
                              ),
                            ],
                            Padding(
                              padding:
                                  EdgeInsets.only(top: 25, left: 15, right: 15),
                              child: Column(
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(10),
                                          topRight: Radius.circular(10)),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.grey.withOpacity(0.3),
                                          spreadRadius: 2,
                                          blurRadius: 3,
                                          // offset: Offset(0, 2),
                                        ),
                                      ],
                                    ),
                                    height: 30,
                                    width: double.infinity,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        GestureDetector(
                                          onTap: () async {
                                            if (await _webViewController!
                                                .canGoBack()) {
                                              _webViewController!.goBack();
                                            } else {
                                              ScaffoldMessenger.of(context)
                                                  .showSnackBar(
                                                SnackBar(
                                                    content: Text(
                                                        "No back history item")),
                                              );
                                            }
                                          },
                                          child: Padding(
                                            padding:
                                                const EdgeInsets.only(left: 20),
                                            child: Icon(
                                              Icons.arrow_back_ios,
                                            ),
                                          ),
                                        ),
                                        GestureDetector(
                                          onTap: () {
                                            _webViewController!.reload();
                                          },
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                                right: 20),
                                            child: Icon(Icons.refresh),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  Container(
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.grey.withOpacity(0.3),

                                          // offset: Offset(0, 2),
                                        ),
                                      ],
                                    ),
                                    height: 1400,
                                    child: WebView(
                                      initialUrl: initialUrl,
                                      onWebViewCreated: (webViewController) {
                                        _webViewController = webViewController;
                                      },
                                      onPageStarted: (String url) {
                                        setState(() {
                                          isLoading = true;
                                        });
                                      },
                                      onPageFinished: (String url) {
                                        setState(() {
                                          isLoading = false;
                                          _webViewController!
                                              .runJavascriptReturningResult(
                                            "document.getElementsByClassName('').style.display='none';",
                                          );
                                        });
                                      },
                                      javascriptMode:
                                          JavascriptMode.unrestricted,
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          );
        }
      }),
    );
  }
}
