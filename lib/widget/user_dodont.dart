import 'package:dietitian/controller/auth_controller.dart';
import 'package:dietitian/utils/colors.dart';
import 'package:dietitian/utils/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class DondontScreen extends StatefulWidget {
  const DondontScreen({super.key});

  @override
  State<DondontScreen> createState() => _DondontScreenState();
}

class _DondontScreenState extends State<DondontScreen> {
  final TextEditingController templateenameController = TextEditingController();
  final TextEditingController contennttController = TextEditingController();
  bool emailerrer = false;
  bool isLoading = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  String formatDateTime(DateTime dateTime) {
    final DateFormat formatter = DateFormat("yyyy-MM-ddTHH:mm:ss.SSSSSS'Z'");
    return formatter.format(dateTime.toUtc());
  }

  bool passwordError = false;
  bool passwordError1 = false;

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;

    return DefaultTabController(
      length: 3,
      child: Scaffold(
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
                    height: 250,
                    child: Column(
                      children: [
                        SizedBox(
                          height: 40,
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
                                    "Do n Don\'t",
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
                  top: 90,
                  left: 0,
                  right: 0,
                  child: Padding(
                    padding: EdgeInsets.only(left: 20, right: 20),
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          color: Colors.white),
                      height: screenSize.height * 0.85,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            TabBar(
                              tabs: [
                                Tab(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(
                                        Icons.thumb_up,
                                        size: 20,
                                        color:
                                            ColorResources.verifyScreenButton,
                                      ),
                                      SizedBox(width: 8),
                                      Text('Do'),
                                    ],
                                  ),
                                ),
                                Tab(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(
                                        Icons.thumb_down,
                                        size: 20,
                                        color:
                                            ColorResources.verifyScreenButton,
                                      ),
                                      SizedBox(width: 8),
                                      Text('Don\'t'),
                                    ],
                                  ),
                                ),
                              ],
                              labelStyle: poppinsSemiBold.copyWith(
                                fontSize: 17,
                                height: 1.2,
                                color: ColorResources.verifyScreenButton,
                              ),
                            ),
                            Expanded(
                              child: TabBarView(
                                physics: NeverScrollableScrollPhysics(),
                                children: [douserddd(), dontttdouserddd()],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ]),
            ],
          ),
        ),
      ),
    );
  }

  Widget douserddd() {
    return GetBuilder<AuthController>(builder: (profileeeee) {
      return Column(
        children: [
          SizedBox(
            height: 10,
          ),
          Stack(children: [
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20, bottom: 5, top: 10),
                  child: Row(
                    children: [
                      // Text(
                      //   "Question",
                      //   textAlign: TextAlign.center,
                      //   style: poppinsSemiBold.copyWith(
                      //     fontSize: 15,
                      //     height: 1.2,
                      //     color: Colors.black,
                      //   ),
                      // ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20, top: 0),
                  child: Container(
                    height: 100,
                    child: TextFormField(
                      controller: templateenameController,
                      maxLines: 10,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.grey.shade200,
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(
                            color: passwordError
                                ? Colors.red
                                : Colors.grey.shade400,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(
                            color: passwordError
                                ? Colors.red
                                : Colors.grey.shade400,
                          ),
                        ),
                        contentPadding: EdgeInsets.only(top: 5, left: 10),
                        // hintText: AppConstants.password,
                        hintStyle: poppinstMedium.copyWith(color: Colors.grey),
                      ),
                      onChanged: (value) {
                        setState(() {
                          passwordError = false;
                        });
                      },
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () async {
                    detoxxdiett(
                        context, profileeeee.profileDetails!.dieticianId);
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        margin: EdgeInsets.only(left: 0, right: 30, top: 20),
                        height: 35,
                        width: 100,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            color: Colors.green,
                            borderRadius: BorderRadius.circular(5)),
                        child: Text(
                          "Submit",
                          style: poppinsRegular.copyWith(
                            color: Colors.white,
                            fontSize: 15,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            if (isLoading)
              Positioned.fill(
                child: Center(
                  child:
                      CustomLoadingIndicator(), // Or your custom loader widget
                ),
              ),
          ]),
          Padding(
            padding: const EdgeInsets.only(left: 20, bottom: 5, top: 20),
            child: Container(
              alignment: Alignment.centerLeft,
              child: Text(
                "Do",
                textAlign: TextAlign.center,
                style: poppinsSemiBold.copyWith(
                  fontSize: 18,
                  height: 1.2,
                  color: Colors.black,
                ),
              ),
            ),
          ),
          Expanded(child: SingleChildScrollView(
            child: GetBuilder<AuthController>(builder: (dontodnttlists) {
              if (dontodnttlists.isLoading.value &&
                  dontodnttlists.dopntlistdataa.isEmpty) {
                return Center(child: CustomLoadingIndicator());
              } else if (dontodnttlists.dopntlistdataa.isEmpty) {
                return const Center(
                    child: Padding(
                  padding: EdgeInsets.only(top: 200),
                  child: Text('No Data found!'),
                ));
              } else {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      ...dontodnttlists.dopntlistdataa.asMap().entries.map((e) {
                        String getCurrentDateTime() {
                          final now = DateTime.now().toUtc();
                          final formatter = DateFormat("${e.value.createdAt}");
                          return formatter.format(now);
                        }

                        String dateString = "${e.value.createdAt}";

                        DateTime dateTime = DateTime.parse(dateString);

                        String formattedDate =
                            DateFormat('dd-MM-yyyy').format(dateTime);
                        return Column(
                          children: [
                            e.value.question == ""
                                ? SizedBox()
                                : Padding(
                                    padding: EdgeInsets.only(
                                        left: 10.0,
                                        right: 10,
                                        top: 5,
                                        bottom: 5),
                                    child: Container(
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                              color: Colors.grey.shade500),
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    e.value.dUserId == null
                                                        ? Row(
                                                            children: [
                                                              Text(
                                                                '${profileeeee.profileDetails!.name}',
                                                                textAlign:
                                                                    TextAlign
                                                                        .start,
                                                                style:
                                                                    poppinstMedium
                                                                        .copyWith(
                                                                  fontSize: 15,
                                                                  height: 1,
                                                                  color: Colors
                                                                      .black,
                                                                ),
                                                              ),
                                                              // Text(
                                                              //   '(you)  ',
                                                              //   textAlign:
                                                              //       TextAlign
                                                              //           .start,
                                                              //   style:
                                                              //       poppinstMedium
                                                              //           .copyWith(
                                                              //     fontSize: 15,
                                                              //     height: 0,
                                                              //     color: Colors
                                                              //         .black87,
                                                              //   ),
                                                              // )
                                                            ],
                                                          )
                                                        : Text(
                                                            '${e.value.dietitian!.name}',
                                                            textAlign:
                                                                TextAlign.start,
                                                            style:
                                                                poppinstMedium
                                                                    .copyWith(
                                                              fontSize: 15,
                                                              height: 0,
                                                              color:
                                                                  Colors.black,
                                                            ),
                                                          ),
                                                    Row(
                                                      children: [
                                                        Icon(
                                                          Icons.date_range,
                                                          size: 15,
                                                        ),
                                                        SizedBox(
                                                          width: 2,
                                                        ),
                                                        Text(
                                                          '${formattedDate}',
                                                          textAlign:
                                                              TextAlign.start,
                                                          style: poppinstMedium
                                                              .copyWith(
                                                            fontSize: 15,
                                                            height: 0,
                                                            color:
                                                                Colors.black87,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                                SizedBox(
                                                  height: 2,
                                                ),
                                                SizedBox(
                                                  height: 2,
                                                ),
                                                Text(
                                                  '${e.value.question}',
                                                  textAlign: TextAlign.start,
                                                  style:
                                                      poppinstMedium.copyWith(
                                                    fontSize: 14,
                                                    height: 1,
                                                    color: Colors.grey.shade600,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    )),
                            // e.value.answer == ""
                            //     ? SizedBox()
                            //     : Padding(
                            //         padding: EdgeInsets.only(
                            //             left: 10.0,
                            //             right: 10,
                            //             top: 5,
                            //             bottom: 5),
                            //         child: Container(
                            //           decoration: BoxDecoration(
                            //               border: Border.all(
                            //                   color: Colors.grey.shade500),
                            //               borderRadius:
                            //                   BorderRadius.circular(10)),
                            //           child: Padding(
                            //             padding: const EdgeInsets.all(8.0),
                            //             child: Column(
                            //               mainAxisAlignment:
                            //                   MainAxisAlignment.start,
                            //               crossAxisAlignment:
                            //                   CrossAxisAlignment.start,
                            //               children: [
                            //                 Column(
                            //                   crossAxisAlignment:
                            //                       CrossAxisAlignment.start,
                            //                   children: [
                            //                     Row(
                            //                       children: [
                            //                         // Text(
                            //                         //   '${e.value.dietitian!.name}',
                            //                         //   textAlign:
                            //                         //       TextAlign.start,
                            //                         //   style: poppinstMedium
                            //                         //       .copyWith(
                            //                         //     fontSize: 15,
                            //                         //     height: 1,
                            //                         //     color: Colors.black,
                            //                         //   ),
                            //                         // ),
                            //                       ],
                            //                     ),
                            //                     SizedBox(
                            //                       height: 2,
                            //                     ),
                            //                     Text(
                            //                       '${formattedDate}',
                            //                       textAlign: TextAlign.start,
                            //                       style:
                            //                           poppinstMedium.copyWith(
                            //                         fontSize: 14,
                            //                         height: 1,
                            //                         color: Colors.black87,
                            //                       ),
                            //                     ),
                            //                     SizedBox(
                            //                       height: 2,
                            //                     ),
                            //                     Text(
                            //                       '${e.value.answer}',
                            //                       textAlign: TextAlign.start,
                            //                       style:
                            //                           poppinstMedium.copyWith(
                            //                         fontSize: 14,
                            //                         height: 1,
                            //                         color: Colors.grey.shade600,
                            //                       ),
                            //                     ),
                            //                   ],
                            //                 ),

                            //                 // Row(
                            //               ],
                            //             ),
                            //           ),
                            //         )),
                          ],
                        );
                      }).toList(),
                    ],
                  ),
                );
              }
            }),
          )),
          SizedBox(
            height: 10,
          ),
        ],
      );
    });
  }

  Widget dontttdouserddd() {
    return GetBuilder<AuthController>(builder: (profileeeee) {
      return Column(
        children: [
          SizedBox(
            height: 10,
          ),
          Stack(children: [
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20, bottom: 5, top: 10),
                  child: Row(
                    children: [
                      // Text(
                      //   "Question",
                      //   textAlign: TextAlign.center,
                      //   style: poppinsSemiBold.copyWith(
                      //     fontSize: 15,
                      //     height: 1.2,
                      //     color: Colors.black,
                      //   ),
                      // ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20, top: 0),
                  child: Container(
                    height: 100,
                    child: TextFormField(
                      controller: contennttController,
                      maxLines: 10,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.grey.shade200,
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(
                            color: passwordError1
                                ? Colors.red
                                : Colors.grey.shade400,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(
                            color: passwordError1
                                ? Colors.red
                                : Colors.grey.shade400,
                          ),
                        ),
                        contentPadding: EdgeInsets.only(top: 5, left: 10),
                        // hintText: AppConstants.password,
                        hintStyle: poppinstMedium.copyWith(color: Colors.grey),
                      ),
                      onChanged: (value) {
                        setState(() {
                          passwordError1 = false;
                        });
                      },
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () async {
                    donttdetoxxdiett(
                        context, profileeeee.profileDetails!.dieticianId);
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        margin: EdgeInsets.only(left: 0, right: 30, top: 20),
                        height: 35,
                        width: 100,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            color: Colors.green,
                            borderRadius: BorderRadius.circular(5)),
                        child: Text(
                          "Submit",
                          style: poppinsRegular.copyWith(
                            color: Colors.white,
                            fontSize: 15,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            if (isLoading)
              Positioned.fill(
                child: Center(
                  child:
                      CustomLoadingIndicator(), // Or your custom loader widget
                ),
              ),
          ]),
          Padding(
            padding: const EdgeInsets.only(left: 20, bottom: 5, top: 20),
            child: Container(
              alignment: Alignment.centerLeft,
              child: Text(
                "Don\'t",
                textAlign: TextAlign.center,
                style: poppinsSemiBold.copyWith(
                  fontSize: 18,
                  height: 1.2,
                  color: Colors.black,
                ),
              ),
            ),
          ),
          Expanded(child: SingleChildScrollView(
            child: GetBuilder<AuthController>(builder: (dontodnttlists) {
              if (dontodnttlists.isLoading.value &&
                  dontodnttlists.dopntlistdataa.isEmpty) {
                return Center(child: CustomLoadingIndicator());
              } else if (dontodnttlists.dopntlistdataa.isEmpty) {
                return const Center(
                    child: Padding(
                  padding: EdgeInsets.only(top: 200),
                  child: Text('No Data found!'),
                ));
              } else {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      ...dontodnttlists.dopntlistdataa.asMap().entries.map((e) {
                        String getCurrentDateTime() {
                          final now = DateTime.now().toUtc();
                          final formatter = DateFormat("${e.value.createdAt}");
                          return formatter.format(now);
                        }

                        String dateString = "${e.value.createdAt}";

                        DateTime dateTime = DateTime.parse(dateString);

                        String formattedDate =
                            DateFormat('dd-MM-yyyy').format(dateTime);
                        return Column(
                          children: [
                            e.value.answer == ""
                                ? SizedBox()
                                : Padding(
                                    padding: EdgeInsets.only(
                                        left: 10.0,
                                        right: 10,
                                        top: 5,
                                        bottom: 5),
                                    child: Container(
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                              color: Colors.grey.shade500),
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Row(
                                                  children: [
                                                    e.value.dUserId == null
                                                        ? Row(
                                                            children: [
                                                              Text(
                                                                '${profileeeee.profileDetails!.name}',
                                                                textAlign:
                                                                    TextAlign
                                                                        .start,
                                                                style:
                                                                    poppinstMedium
                                                                        .copyWith(
                                                                  fontSize: 15,
                                                                  height: 1,
                                                                  color: Colors
                                                                      .black,
                                                                ),
                                                              ),
                                                              // Text(
                                                              //   '(you)  ',
                                                              //   textAlign:
                                                              //       TextAlign
                                                              //           .start,
                                                              //   style:
                                                              //       poppinstMedium
                                                              //           .copyWith(
                                                              //     fontSize: 14,
                                                              //     height: 1,
                                                              //     color: Colors
                                                              //         .black87,
                                                              //   ),
                                                              // )
                                                            ],
                                                          )
                                                        : Text(
                                                            '${e.value.dietitian!.name}',
                                                            textAlign:
                                                                TextAlign.start,
                                                            style:
                                                                poppinstMedium
                                                                    .copyWith(
                                                              fontSize: 15,
                                                              height: 1,
                                                              color:
                                                                  Colors.black,
                                                            ),
                                                          ),
                                                  ],
                                                ),
                                                SizedBox(
                                                  height: 2,
                                                ),
                                                Text(
                                                  '${formattedDate}',
                                                  textAlign: TextAlign.start,
                                                  style:
                                                      poppinstMedium.copyWith(
                                                    fontSize: 14,
                                                    height: 1,
                                                    color: Colors.black87,
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: 2,
                                                ),
                                                Text(
                                                  '${e.value.answer}',
                                                  textAlign: TextAlign.start,
                                                  style:
                                                      poppinstMedium.copyWith(
                                                    fontSize: 14,
                                                    height: 1,
                                                    color: Colors.grey.shade600,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    )),
                            // e.value.question == ""
                            //     ? SizedBox()
                            //     : Padding(
                            //         padding: EdgeInsets.only(
                            //             left: 10.0,
                            //             right: 10,
                            //             top: 5,
                            //             bottom: 5),
                            //         child: Container(
                            //           decoration: BoxDecoration(
                            //               border: Border.all(
                            //                   color: Colors.grey.shade500),
                            //               borderRadius:
                            //                   BorderRadius.circular(10)),
                            //           child: Padding(
                            //             padding: const EdgeInsets.all(8.0),
                            //             child: Column(
                            //               mainAxisAlignment:
                            //                   MainAxisAlignment.start,
                            //               crossAxisAlignment:
                            //                   CrossAxisAlignment.start,
                            //               children: [
                            //                 Column(
                            //                   crossAxisAlignment:
                            //                       CrossAxisAlignment.start,
                            //                   children: [
                            //                     Row(
                            //                       children: [
                            //                         Text(
                            //                           '${profileeeee.Listdata!['name']}',
                            //                           textAlign:
                            //                               TextAlign.start,
                            //                           style: poppinstMedium
                            //                               .copyWith(
                            //                             fontSize: 15,
                            //                             height: 1,
                            //                             color: Colors.black,
                            //                           ),
                            //                         ),
                            //                       ],
                            //                     ),
                            //                     SizedBox(
                            //                       height: 2,
                            //                     ),
                            //                     Text(
                            //                       '${formattedDate}',
                            //                       textAlign: TextAlign.start,
                            //                       style:
                            //                           poppinstMedium.copyWith(
                            //                         fontSize: 14,
                            //                         height: 1,
                            //                         color: Colors.black87,
                            //                       ),
                            //                     ),
                            //                     SizedBox(
                            //                       height: 2,
                            //                     ),
                            //                     Text(
                            //                       '${e.value.question}',
                            //                       textAlign: TextAlign.start,
                            //                       style:
                            //                           poppinstMedium.copyWith(
                            //                         fontSize: 14,
                            //                         height: 1,
                            //                         color: Colors.grey.shade600,
                            //                       ),
                            //                     ),
                            //                   ],
                            //                 ),

                            //                 // Row(
                            //               ],
                            //             ),
                            //           ),
                            //         )),
                          ],
                        );
                      }).toList(),
                    ],
                  ),
                );
              }
            }),
          )),
          SizedBox(
            height: 10,
          ),
        ],
      );
    });
  }

  Future<void> detoxxdiett(BuildContext context, idddd) async {
    String temepele = templateenameController.text.trim();
    if (temepele.isEmpty) {
      setState(() {
        passwordError = true;
      });
    } else {
      try {
        setState(() {
          isLoading = true;
        });
        await Future.delayed(Duration(seconds: 3));

        Get.find<AuthController>().donndonttt(
            questionn: temepele.trim(),
            duseridd: idddd,
            answer: '',
            context: context);
        setState(() {
          isLoading = false;
          templateenameController.clear();
          contennttController.clear();
        });
      } catch (e) {}
    }
  }

  Future<void> donttdetoxxdiett(BuildContext context, idddd) async {
    String contenntt = contennttController.text.trim();
    if (contenntt.isEmpty) {
      setState(() {
        passwordError1 = true;
      });
    } else {
      try {
        setState(() {
          isLoading = true;
        });
        await Future.delayed(Duration(seconds: 3));

        Get.find<AuthController>().donndonttt(
            questionn: '',
            answer: contenntt.trim(),
            duseridd: idddd,
            context: context);
        setState(() {
          isLoading = false;
          templateenameController.clear();
          contennttController.clear();
        });
      } catch (e) {}
    }
  }
}
