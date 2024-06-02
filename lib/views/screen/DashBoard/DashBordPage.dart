import 'package:dietitian/controller/auth_controller.dart';
import 'package:dietitian/route/route.dart';
import 'package:dietitian/utils/all_images.dart';
import 'package:dietitian/utils/colors.dart';
import 'package:dietitian/utils/style.dart';
import 'package:dietitian/widget/appbarDietitian.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class DashBoardPage extends StatefulWidget {
  const DashBoardPage({super.key});

  @override
  State<DashBoardPage> createState() => _DashBoardPageState();
}

class _DashBoardPageState extends State<DashBoardPage> {
  List<String> name = [
    "Kunal Sagar",
    "Mayank Gupta",
    "Akash Gupta",
    "Akash Nagar",
    "Pamme Laal",
    "Sayukt Mukesh"
  ];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //Get.find<AuthController>().detoxlisttdataa();
  }

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
      ),
      drawer: AppBarDietitian(),
      body: Stack(
        children: [
          // Background image
          Positioned.fill(
            child: Image.asset(
              'assets/numberOtplogin.png',
              fit: BoxFit.cover,
            ),
          ),

          // Content
          GetBuilder<AuthController>(builder: (logic) {
            return Column(
              children: [
                Container(
                  height: 90,
                  decoration: BoxDecoration(
                    color: ColorResources.buttonYellow,
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(20),
                        bottomRight: Radius.circular(20)),
                  ),
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.fromLTRB(20, 10, 20, 0),
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
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(top: 8.0),
                                      child: logic.userDetails == null
                                          ? Text("Welcome Dietitian",
                                              style: poppinstMedium.copyWith(
                                                  fontSize: 15,
                                                  height: 1,
                                                  color: ColorResources
                                                      .loginOpenButton))
                                          : Text(
                                              "Welcome ${logic.userDetails!.name!}",
                                              style: poppinstMedium.copyWith(
                                                  fontSize: 15,
                                                  height: 1,
                                                  color: ColorResources
                                                      .loginOpenButton)),
                                    ),
                                    Text(
                                      "DashBoard",
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
                      /*  Container(
                      margin: EdgeInsets.fromLTRB(20, 20, 20, 20),
                      padding: EdgeInsets.fromLTRB(0, 5, 0, 0),
                      height: 35,
                      width: Get.width,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Text("My Profile".toUpperCase(),
                          style: poppinsSemiBold.copyWith(
                              fontSize: 17,
                              height: 1,
                              color: ColorResources.textOpenButton)),
                    )*/
                    ],
                  ),
                ),
                Expanded(
                  child: SingleChildScrollView(
                    child: Container(
                      // Adjust top padding according to your needs
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(18),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Expanded(
                                  child: GestureDetector(
                                    onTap: () {
                                      Get.find<AuthController>()
                                          .dietitianDetails(page: 1);
                                      Get.toNamed(RouteHelper.myClientPage,
                                          arguments: true);
                                    },
                                    child: Container(
                                      height: 120,
                                      width: 250,
                                      decoration: BoxDecoration(
                                        color: ColorResources.whiteColor,
                                        borderRadius: BorderRadius.circular(10),
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.grey.withOpacity(0.5),
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
                                            padding: const EdgeInsets.all(8.0),
                                            child: Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                Container(
                                                  height: 40,
                                                  width: 40,
                                                  decoration: BoxDecoration(
                                                      color: ColorResources
                                                          .buttonSColor,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              30)),
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
                                            padding: const EdgeInsets.all(8.0),
                                            child: Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.end,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  children: [
                                                    Text("My Client",
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
                                                        Icons.arrow_forward_ios,
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
                                      Get.toNamed(RouteHelper.myCallMessage,
                                          arguments: true);
                                    },
                                    child: Container(
                                      height: 120,
                                      width: 250,
                                      decoration: BoxDecoration(
                                        color: ColorResources.whiteColor,
                                        borderRadius: BorderRadius.circular(10),
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.grey.withOpacity(0.5),
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
                                            padding: const EdgeInsets.all(8.0),
                                            child: Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                Container(
                                                  height: 40,
                                                  width: 40,
                                                  decoration: BoxDecoration(
                                                      color: ColorResources
                                                          .buttongreem,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              30)),
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
                                            padding: const EdgeInsets.all(8.0),
                                            child: Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.end,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  children: [
                                                    Text("Chat & Call",
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
                                                        Icons.arrow_forward_ios,
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
                          /*        Stack(
                          clipBehavior: Clip.none,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 18.0,right:18),
                              child: Container(
                                height: 210,
                                width: Get.width,
                                decoration: BoxDecoration(
                                  color: ColorResources.whiteColor,
                                  borderRadius: BorderRadius.circular(10),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(
                                          0.5), // specify shadow color and opacity
                                      spreadRadius:
                                          2, // extent of spreading of the shadow
                                      blurRadius: 3, // blur radius of the shadow
                                      offset: Offset(
                                          0, 2), // changes position of shadow
                                    ),
                                  ],
                                ),
                                child: Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Container(
                                            height: 45,
                                            width: 45,
                                            decoration: BoxDecoration(
                                                color: ColorResources.buttonred,
                                                borderRadius:
                                                    BorderRadius.circular(30)),
                                            child: Container(
                                                alignment: Alignment.center,
                                                child: Image.asset(
                                                  Images.accountsetL,
                                                  height: 20,
                                                )),
                                          ),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Text("My Subscription Plan",
                                              style: poppinsSemiBold.copyWith(
                                                  fontSize: 17,
                                                  height: 1,
                                                  color: Colors.black))
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      height: 15,
                                    ),
                                    Text("DUMMY PLAN NAME",
                                        style: poppinsSemiBold.copyWith(
                                            fontSize: 17,
                                            height: 1,
                                            color: Colors.black)),
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
                                        child: Text("₹3,999",
                                            style: poppinsSemiBold.copyWith(
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
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Image.asset(
                                            Images.accountwathcread,
                                            height: 18,
                                          ),
                                          SizedBox(
                                            width: 5,
                                          ),
                                          Text("14 MARCH 2024",
                                              style: poppinsSemiBold.copyWith(
                                                  fontSize: 15,
                                                  height: 1,
                                                  color:
                                                      ColorResources.textRedColor)),
                                        ],
                                      ),
                                    ),
*/ /*         Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      crossAxisAlignment: CrossAxisAlignment.end,
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Text("My Chat",
                                                style: poppinsRegular.copyWith(
                                                    fontSize: 12, height: 1)),
                                            SizedBox(
                                              height: 3,
                                            ),
                                            Text(
                                              "History",
                                              style: poppinsSemiBold.copyWith(
                                                  fontSize: 18, height: 1),
                                            ),
                                          ],
                                        ),
                                        Spacer(),
                                        Container(
                                          height: 30,
                                          width: 30,
                                          // padding: EdgeInsets.only(left: 8),
                                          decoration: BoxDecoration(
                                            color: ColorResources.whiteColor,
                                            borderRadius: BorderRadius.circular(30),
                                            boxShadow: [
                                              BoxShadow(
                                                color: Colors.grey.withOpacity(
                                                    0.5), // specify shadow color and opacity
                                                spreadRadius:
                                                    2, // extent of spreading of the shadow
                                                blurRadius:
                                                    2, // blur radius of the shadow
                                                offset: Offset(0,
                                                    2), // changes position of shadow
                                              ),
                                            ],
                                          ),
                                          child: Container(
                                              alignment: Alignment.center,
                                              child: Icon(
                                                Icons.arrow_forward_ios,
                                                size: 20,
                                              )),
                                        ),
                                      ],
                                    ),
                                  ),*/ /*
                                  ],
                                ),
                              ),
                            ),

                            //Circle Avatar
                            Positioned(
                              top: 190,
                              left: 0,
                              right: 0,
                              child: Padding(
                                padding:
                                    const EdgeInsets.only(left: 90, right: 90),
                                child: Container(
                                  alignment: Alignment.center,
                                  height: 35,
                                  width: Get.width,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(9),
                                   color: ColorResources.buttonYellow
                                  ),
                                  child: Text("Renew Plan",
                                      style: poppinstMedium.copyWith(
                                          fontSize: 15,
                                          height: 1,
                                          color:
                                          Colors.black),
                                ),
                              ),
                              )),
                          ],
                        ),*/
                          Padding(
                            padding:
                                const EdgeInsets.only(left: 18.0, right: 18),
                            child: Container(
                              width: Get.width,
                              decoration: BoxDecoration(
                                color: ColorResources.whiteColor,
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(
                                    color: ColorResources.manui, width: 1.4),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.5),
                                    // specify shadow color and opacity
                                    spreadRadius: 2,
                                    // extent of spreading of the shadow
                                    blurRadius: 3,
                                    // blur radius of the shadow
                                    offset: Offset(
                                        0, 2), // changes position of shadow
                                  ),
                                ],
                              ),
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 8.0, right: 8.0, top: 25),
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Container(
                                          height: 40,
                                          width: 40,
                                          decoration: BoxDecoration(
                                              color: ColorResources.buttonred,
                                              borderRadius:
                                                  BorderRadius.circular(30)),
                                          child: Container(
                                              alignment: Alignment.center,
                                              child: Image.asset(
                                                Images.userDounle,
                                                height: 20,
                                              )),
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Text("CLINT'S LIST",
                                                style: poppinstMedium.copyWith(
                                                    fontSize: 14,
                                                    height: 1.2,
                                                    color: ColorResources
                                                        .TEXTgREY)),
                                            Text("Recent Client ",
                                                style: poppinsSemiBold.copyWith(
                                                    fontSize: 17,
                                                    height: 1.2,
                                                    color: Colors.black)),
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 15,
                                  ),
                                  GetBuilder<AuthController>(builder: (logic) {
                                    return logic.clientData.isNotEmpty
                                        ? Column(
                                            children: logic.clientData
                                                .asMap()
                                                .entries
                                                .map((e) {
                                                  int index = e.key;
                                                  bool isLastIndex =
                                                      index == name.length - 1;
                                                  return Container(
                                                    child: Column(
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(10.0),
                                                          child: Row(
                                                            children: [
                                                              Container(
                                                                height: 13,
                                                                width: 13,
                                                                decoration: BoxDecoration(
                                                                    color: ColorResources
                                                                        .buttonYellow,
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            50)),
                                                              ),
                                                              SizedBox(
                                                                width: 5,
                                                              ),
                                                              if (e.value
                                                                      .name! !=
                                                                  null)
                                                                Text(
                                                                  e.value.name!,
                                                                  style: poppinsSemiBold
                                                                      .copyWith(
                                                                          fontSize:
                                                                              14,
                                                                          height:
                                                                              1),
                                                                ),
                                                              Spacer(),
                                                              GestureDetector(
                                                                onTap: () {
                                                                  Get.find<
                                                                          AuthController>()
                                                                      .dietitianUser(
                                                                          id: e
                                                                              .value
                                                                              .id!
                                                                              .toString());
                                                                  Get.toNamed(
                                                                      RouteHelper
                                                                          .profileNav,
                                                                      arguments:
                                                                          true);
                                                                },
                                                                child: Text(
                                                                    "View"
                                                                        .toUpperCase(),
                                                                    style: poppinstMedium.copyWith(
                                                                        fontSize:
                                                                            13,
                                                                        height:
                                                                            1,
                                                                        color: ColorResources
                                                                            .buttongreem)),
                                                              )
                                                            ],
                                                          ),
                                                        ),
                                                        if (isLastIndex ==
                                                            false) ...[
                                                          Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                        .only(
                                                                    left: 10.0,
                                                                    right: 10.0,
                                                                    top: 5,
                                                                    bottom: 5),
                                                            child: Container(
                                                              height: 1,
                                                              decoration: BoxDecoration(
                                                                  color: Colors
                                                                      .grey
                                                                      .withOpacity(
                                                                          0.3)),
                                                            ),
                                                          )
                                                        ],
                                                      ],
                                                    ),
                                                  );
                                                })
                                                .take(5)
                                                .toList(),
                                          )
                                        : SizedBox();
                                  }),
                                  SizedBox(
                                    height: 10,
                                  )
                                ],
                              ),
                            ),
                          ),
                          /*   Padding(
                          padding: const EdgeInsets.only(
                            left: 18.0,
                            right: 18,
                          ),
                          child:
                        ),*/
                        ],
                      ), // Your existing content here
                    ),
                  ),
                ),
              ],
            );
          }),
        ],
      ),
    );
  }
}
