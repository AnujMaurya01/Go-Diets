import 'dart:convert';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:dietitian/controller/auth_controller.dart';
import 'package:dietitian/utils/app_constants.dart';
import 'package:dietitian/utils/colors.dart';
import 'package:dietitian/utils/constants.dart';
import 'package:dietitian/utils/dimensions.dart';
import 'package:dietitian/utils/style.dart';
import 'package:dietitian/widget/doctor_view_diets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;

// ignore: must_be_immutable
class AssignDietTemplete extends StatefulWidget {
  String? puserid;
  AssignDietTemplete({super.key, this.puserid});

  @override
  State<AssignDietTemplete> createState() => _AssignDietTempleteState();
}

class _AssignDietTempleteState extends State<AssignDietTemplete> {
  DateTime now = DateTime.now();
  String? weekNumber;
  String? weekNumber1;
  bool isLoading = false;
  bool isLoading1 = false;
  final TextEditingController sunday1Controller = TextEditingController();
  final TextEditingController sunday2Controller = TextEditingController();
  final TextEditingController sunday3Controller = TextEditingController();
  final TextEditingController sunday4Controller = TextEditingController();
  final TextEditingController sunday5Controller = TextEditingController();
  final TextEditingController sunday6Controller = TextEditingController();
  //
  final TextEditingController monday1Controller = TextEditingController();
  final TextEditingController monday2Controller = TextEditingController();
  final TextEditingController monday3Controller = TextEditingController();
  final TextEditingController monday4Controller = TextEditingController();
  final TextEditingController monday5Controller = TextEditingController();
  final TextEditingController monday6Controller = TextEditingController();
  //
  final TextEditingController tuesday1Controller = TextEditingController();
  final TextEditingController tuesday2Controller = TextEditingController();
  final TextEditingController tuesday3Controller = TextEditingController();
  final TextEditingController tuesday4Controller = TextEditingController();
  final TextEditingController tuesday5Controller = TextEditingController();
  final TextEditingController tuesday6Controller = TextEditingController();
  //
  final TextEditingController wenesday1Controller = TextEditingController();
  final TextEditingController wensday2Controller = TextEditingController();
  final TextEditingController wensday3Controller = TextEditingController();
  final TextEditingController wensday4Controller = TextEditingController();
  final TextEditingController wensday5Controller = TextEditingController();
  final TextEditingController wensday6Controller = TextEditingController();
  //
  final TextEditingController thuesday1Controller = TextEditingController();
  final TextEditingController thuesday2Controller = TextEditingController();
  final TextEditingController thuesday3Controller = TextEditingController();
  final TextEditingController thueday4Controller = TextEditingController();
  final TextEditingController thuesday5Controller = TextEditingController();
  final TextEditingController thuesday6Controller = TextEditingController();
  //
  final TextEditingController friday1Controller = TextEditingController();
  final TextEditingController friday2Controller = TextEditingController();
  final TextEditingController friday3Controller = TextEditingController();
  final TextEditingController friday4Controller = TextEditingController();
  final TextEditingController friday5Controller = TextEditingController();
  final TextEditingController friday6Controller = TextEditingController();
  //
  final TextEditingController saturday1Controller = TextEditingController();
  final TextEditingController saturday2Controller = TextEditingController();
  final TextEditingController saturday3Controller = TextEditingController();
  final TextEditingController saturday4Controller = TextEditingController();
  final TextEditingController saturday5Controller = TextEditingController();
  final TextEditingController saturday6Controller = TextEditingController();
//specialllll==-=-=-=-=-=-=-=-=
  final TextEditingController sepsunday1Controller = TextEditingController();
  final TextEditingController sepsunday2Controller = TextEditingController();
  final TextEditingController sepsunday3Controller = TextEditingController();
  final TextEditingController sepsunday4Controller = TextEditingController();
  final TextEditingController sepsunday5Controller = TextEditingController();
  final TextEditingController sepsunday6Controller = TextEditingController();
  //
  final TextEditingController sepmonday1Controller = TextEditingController();
  final TextEditingController sepmonday2Controller = TextEditingController();
  final TextEditingController sepmonday3Controller = TextEditingController();
  final TextEditingController sepmonday4Controller = TextEditingController();
  final TextEditingController sepmonday5Controller = TextEditingController();
  final TextEditingController sepmonday6Controller = TextEditingController();
  //
  final TextEditingController septuesday1Controller = TextEditingController();
  final TextEditingController septuesday2Controller = TextEditingController();
  final TextEditingController septuesday3Controller = TextEditingController();
  final TextEditingController septuesday4Controller = TextEditingController();
  final TextEditingController septuesday5Controller = TextEditingController();
  final TextEditingController septuesday6Controller = TextEditingController();
  //
  final TextEditingController sepwenesday1Controller = TextEditingController();
  final TextEditingController sepwensday2Controller = TextEditingController();
  final TextEditingController sepwensday3Controller = TextEditingController();
  final TextEditingController sepwensday4Controller = TextEditingController();
  final TextEditingController sepwensday5Controller = TextEditingController();
  final TextEditingController sepwensday6Controller = TextEditingController();
  //
  final TextEditingController septhuesday1Controller = TextEditingController();
  final TextEditingController septhuesday2Controller = TextEditingController();
  final TextEditingController septhuesday3Controller = TextEditingController();
  final TextEditingController septhueday4Controller = TextEditingController();
  final TextEditingController septhuesday5Controller = TextEditingController();
  final TextEditingController septhuesday6Controller = TextEditingController();
  //
  final TextEditingController sepfriday1Controller = TextEditingController();
  final TextEditingController sepfriday2Controller = TextEditingController();
  final TextEditingController sepfriday3Controller = TextEditingController();
  final TextEditingController sepfriday4Controller = TextEditingController();
  final TextEditingController sepfriday5Controller = TextEditingController();
  final TextEditingController sepfriday6Controller = TextEditingController();
  //
  final TextEditingController sepsaturday1Controller = TextEditingController();
  final TextEditingController sepsaturday2Controller = TextEditingController();
  final TextEditingController sepsaturday3Controller = TextEditingController();
  final TextEditingController sepsaturday4Controller = TextEditingController();
  final TextEditingController sepsaturday5Controller = TextEditingController();
  final TextEditingController sepsaturday6Controller = TextEditingController();
  final List<String> tasks = [
    "Monday",
    "Tuesday",
    "Wednesday",
    "Thursday",
    "Friday",
    "Saturday",
    "Sunday",
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    weekNumber = getWeekNumber(now);
    weekendDay(weekNumber);
    weekNumber1 = getWeekNumber1(now);
    weekendDay1(weekNumber1);
  }

  bool isEditing = false;
  bool isEditing22 = false;

  String? daysss;
  String? _selectedOption;
  String? _selectedOption1;

  String getWeekNumber(DateTime date) {
    String formattedDate = DateFormat('EEEE').format(date);
    return formattedDate;
  }

  weekendDay(String? weekNumber) {
    if (weekNumber == AppConstants.tuesday) {
      setState(() {
        selectedIndex = 2;
      });
    }
    if (weekNumber == AppConstants.monday) {
      selectedIndex = 1;
    }
    if (weekNumber == AppConstants.wednesday) {
      selectedIndex = 3;
    }
    if (weekNumber == AppConstants.thursday) {
      selectedIndex = 4;
    }
    if (weekNumber == AppConstants.friday) {
      selectedIndex = 5;
      daysss = AppConstants.friday;
    }
    if (weekNumber == AppConstants.saturday) {
      selectedIndex = 6;
    }
    if (weekNumber == AppConstants.sunday) {
      selectedIndex = 0;
    }
  }

  String getWeekNumber1(DateTime date) {
    String formattedDate = DateFormat('EEEE').format(date);
    return formattedDate;
  }

  weekendDay1(String? weekNumber) {
    if (weekNumber == AppConstants.tuesday) {
      setState(() {
        selectedIndex1 = 2;
      });
    }
    if (weekNumber == AppConstants.monday) {
      selectedIndex1 = 1;
    }
    if (weekNumber == AppConstants.wednesday) {
      selectedIndex1 = 3;
    }
    if (weekNumber == AppConstants.thursday) {
      selectedIndex1 = 4;
    }
    if (weekNumber == AppConstants.friday) {
      selectedIndex1 = 5;
    }
    if (weekNumber == AppConstants.saturday) {
      selectedIndex1 = 6;
    }
    if (weekNumber == AppConstants.sunday) {
      selectedIndex1 = 0;
    }
  }

  List<Map<String, dynamic>>? filteredRoutine;
  int selectedIndex = 0;
  int selectedIndex1 = 0;

  static const List<String> allDays = [
    AppConstants.sun,
    AppConstants.mon,
    AppConstants.tue,
    AppConstants.wed,
    AppConstants.thu,
    AppConstants.fri,
    AppConstants.sat,
  ];
  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;

    return DefaultTabController(
      length: 2,
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
                                    "Assign Diet Template",
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
                  top: 110,
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
                                  text: 'Weekly Diet',
                                ),
                                Tab(text: 'Detox Diet'),
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
                                children: [
                                  ///tab11111111
                                  SingleChildScrollView(
                                    child: Container(
                                      child: Column(
                                        children: [
                                          GetBuilder<AuthController>(
                                              builder: (logic) {
                                            return logic.weeekeleyyyd.isEmpty
                                                ? Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            top: 300),
                                                    child: Text(
                                                      'No Detox Diet!',
                                                      style: poppinstMedium
                                                          .copyWith(
                                                        color: Colors.black,
                                                        fontSize: 15,
                                                      ),
                                                    ),
                                                  )
                                                : Column(
                                                    children: [
                                                      ...logic.weeekeleyyyd
                                                          .asMap()
                                                          .entries
                                                          .map((e) {
                                                        return Column(
                                                          children: [
                                                            Theme(
                                                              data: ThemeData()
                                                                  .copyWith(
                                                                      dividerColor:
                                                                          Colors
                                                                              .transparent),
                                                              child:
                                                                  ExpansionTile(
                                                                iconColor:
                                                                    ColorResources
                                                                        .verifyScreenButton,
                                                                title: Row(
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .start,
                                                                  children: [
                                                                    SizedBox(
                                                                      width: 0,
                                                                    ),
                                                                    Container(
                                                                      padding: EdgeInsets
                                                                          .only(
                                                                              top: 0),
                                                                      child:
                                                                          Row(
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.spaceBetween,
                                                                        children: [
                                                                          Radio<
                                                                              String>(
                                                                            value:
                                                                                e.value['id'].toString(),
                                                                            groupValue:
                                                                                _selectedOption,
                                                                            activeColor:
                                                                                ColorResources.buttonYellow,
                                                                            onChanged:
                                                                                (String? value) {
                                                                              setState(() {
                                                                                _selectedOption = value!;
                                                                                print('hgghghghhggh${_selectedOption}');
                                                                              });
                                                                            },
                                                                          ),
                                                                          Text(
                                                                              "${e.value['template_name']}",
                                                                              style: poppinsSemiBold.copyWith(color: ColorResources.verifyScreenButton, height: 1, fontSize: 15)),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                                children: <Widget>[
                                                                  Padding(
                                                                    padding: const EdgeInsets
                                                                            .symmetric(
                                                                        horizontal:
                                                                            1.0,
                                                                        vertical:
                                                                            8.0),
                                                                    child:
                                                                        Column(
                                                                      children: [
                                                                        Row(
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.end,
                                                                          children: [
                                                                            GestureDetector(
                                                                              onTap: () {
                                                                                setState(() {
                                                                                  if (isEditing) {
                                                                                    print('ghjhgfhj');
                                                                                    weeklyyyyydiett();
                                                                                    //
                                                                                  }
                                                                                  sunday1Controller.text = e.value['sunday_e_m'];
                                                                                  sunday2Controller.text = e.value['sunday_b_f'];
                                                                                  sunday3Controller.text = e.value['sunday_m_m'];
                                                                                  sunday4Controller.text = e.value['sunday_l'];
                                                                                  sunday5Controller.text = e.value['sunday_e'];
                                                                                  sunday6Controller.text = e.value['sunday_d'];
                                                                                  //
                                                                                  monday1Controller.text = e.value['monday_e_m'];
                                                                                  monday2Controller.text = e.value['monday_b_f'];
                                                                                  monday3Controller.text = e.value['monday_m_m'];
                                                                                  monday4Controller.text = e.value['monday_l'];
                                                                                  monday5Controller.text = e.value['monday_e'];
                                                                                  monday6Controller.text = e.value['monday_d'];

                                                                                  tuesday1Controller.text = e.value['tuesday_e_m'];
                                                                                  tuesday2Controller.text = e.value['tuesday_b_f'];
                                                                                  tuesday3Controller.text = e.value['tuesday_m_m'];
                                                                                  tuesday4Controller.text = e.value['tuesday_l'];
                                                                                  tuesday5Controller.text = e.value['tuesday_e'];
                                                                                  tuesday6Controller.text = e.value['tuesday_d'];
                                                                                  //
                                                                                  wenesday1Controller.text = e.value['wednesday_e_m'];
                                                                                  wensday2Controller.text = e.value['wednesday_b_f'];
                                                                                  wensday3Controller.text = e.value['wednesday_m_m'];
                                                                                  wensday4Controller.text = e.value['wednesday_l'];
                                                                                  wensday5Controller.text = e.value['wednesday_e'];
                                                                                  wensday6Controller.text = e.value['wednesday_d'];

                                                                                  thuesday1Controller.text = e.value['thursday_e_m'];
                                                                                  thuesday2Controller.text = e.value['thursday_b_f'];
                                                                                  thuesday3Controller.text = e.value['thursday_m_m'];
                                                                                  thueday4Controller.text = e.value['thursday_l'];
                                                                                  thuesday5Controller.text = e.value['thursday_e'];
                                                                                  thuesday6Controller.text = e.value['thursday_d'];

                                                                                  friday1Controller.text = e.value['friday_e_m'];
                                                                                  friday2Controller.text = e.value['friday_b_f'];
                                                                                  friday3Controller.text = e.value['friday_m_m'];
                                                                                  friday4Controller.text = e.value['friday_l'];
                                                                                  friday5Controller.text = e.value['friday_e'];
                                                                                  friday6Controller.text = e.value['friday_d'];

                                                                                  saturday1Controller.text = e.value['saturday_e_m'];
                                                                                  saturday2Controller.text = e.value['saturday_b_f'];
                                                                                  saturday3Controller.text = e.value['saturday_m_m'];
                                                                                  saturday4Controller.text = e.value['saturday_l'];
                                                                                  saturday5Controller.text = e.value['saturday_e'];
                                                                                  saturday6Controller.text = e.value['saturday_d'];
                                                                                  isEditing = !isEditing;
                                                                                });
                                                                              },
                                                                              child: Container(
                                                                                margin: EdgeInsets.only(left: 3, right: 3, top: 0),
                                                                                height: 25,
                                                                                width: isEditing ? 170 : 60,
                                                                                alignment: Alignment.center,
                                                                                decoration: BoxDecoration(color: isEditing ? Colors.green : ColorResources.buttonYellow, borderRadius: BorderRadius.circular(5)),
                                                                                child: Padding(
                                                                                  padding: const EdgeInsets.all(3.0),
                                                                                  child: Row(
                                                                                    mainAxisAlignment: isEditing ? MainAxisAlignment.center : MainAxisAlignment.spaceAround,
                                                                                    children: [
                                                                                      isEditing
                                                                                          ? SizedBox()
                                                                                          : Icon(
                                                                                              Icons.edit,
                                                                                              size: 15,
                                                                                            ),
                                                                                      Text(
                                                                                        isEditing ? "Update & Assign" : "Edit",
                                                                                        style: poppinstMedium.copyWith(
                                                                                          color: isEditing ? Colors.white : Colors.black,
                                                                                          fontSize: 13,
                                                                                        ),
                                                                                      ),
                                                                                    ],
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                        Container(
                                                                            child:
                                                                                Column(
                                                                          children: [
                                                                            Container(
                                                                              padding: const EdgeInsets.only(left: 0, right: 0),
                                                                              alignment: Alignment.topCenter,
                                                                              child: Wrap(
                                                                                children: List.generate(
                                                                                  7,
                                                                                  (index) {
                                                                                    return GestureDetector(
                                                                                      onTap: () {
                                                                                        setState(() {
                                                                                          selectedIndex = index;
                                                                                        });
                                                                                      },
                                                                                      child: SizedBox(
                                                                                        width: (MediaQuery.of(context).size.width - 60) / 7,
                                                                                        child: Column(
                                                                                          children: [
                                                                                            const SizedBox(
                                                                                              height: 10,
                                                                                            ),
                                                                                            Column(
                                                                                              children: [
                                                                                                Container(
                                                                                                  padding: const EdgeInsets.only(left: 0, right: 0),
                                                                                                  alignment: Alignment.center,
                                                                                                  child: Text(allDays[index], style: poppinsSemiBold.copyWith(color: selectedIndex != index ? Colors.black : Colors.green, fontSize: 13)),
                                                                                                ),
                                                                                                if (selectedIndex == index)
                                                                                                  Icon(
                                                                                                    Icons.check,
                                                                                                    size: 15,
                                                                                                    color: Colors.green,
                                                                                                  ),
                                                                                              ],
                                                                                            )
                                                                                          ],
                                                                                        ),
                                                                                      ),
                                                                                    );
                                                                                  },
                                                                                ),
                                                                              ),
                                                                            ),
                                                                            if (selectedIndex ==
                                                                                0) ...[
                                                                              _buildDayCard(
                                                                                'Sunday',
                                                                                e.value['sunday_e_m'],
                                                                                e.value['sunday_b_f'],
                                                                                e.value['sunday_m_m'],
                                                                                e.value['sunday_l'],
                                                                                e.value['sunday_e'],
                                                                                e.value['sunday_d'],
                                                                              ),
                                                                            ],
                                                                            if (selectedIndex ==
                                                                                1) ...[
                                                                              _mondayyyy('Monday', e.value['monday_e_m'], e.value['monday_b_f'], e.value['monday_m_m'], e.value['monday_l'], e.value['monday_e'], e.value['monday_d']),
                                                                            ],
                                                                            if (selectedIndex ==
                                                                                2) ...[
                                                                              _tuesdayss('Tuesday', e.value['tuesday_e_m'], e.value['tuesday_b_f'], e.value['tuesday_m_m'], e.value['tuesday_l'], e.value['tuesday_e'], e.value['tuesday_d']),
                                                                            ],
                                                                            if (selectedIndex ==
                                                                                3) ...[
                                                                              _wednesdayaa('Wednesday', e.value['wednesday_e_m'], e.value['wednesday_b_f'], e.value['wednesday_m_m'], e.value['wednesday_l'], e.value['wednesday_e'], e.value['wednesday_d']),
                                                                            ],
                                                                            if (selectedIndex ==
                                                                                4) ...[
                                                                              _thuredaaaaa('Thursday', e.value['thursday_e_m'], e.value['thursday_b_f'], e.value['thursday_m_m'], e.value['thursday_l'], e.value['thursday_e'], e.value['thursday_d']),
                                                                            ],
                                                                            if (selectedIndex ==
                                                                                5) ...[
                                                                              _fridayssss('Friday', e.value['friday_e_m'], e.value['friday_b_f'], e.value['friday_m_m'], e.value['friday_l'], e.value['friday_e'], e.value['friday_d']),
                                                                            ],
                                                                            if (selectedIndex ==
                                                                                6) ...[
                                                                              _saturdaysss('Saturday', e.value['saturday_e_m'], e.value['saturday_b_f'], e.value['saturday_m_m'], e.value['saturday_l'], e.value['saturday_e'], e.value['saturday_d']),
                                                                            ],
                                                                          ],
                                                                        ))
                                                                      ],
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            )
                                                          ],
                                                        );
                                                      }).toList(),
                                                    ],
                                                  );
                                          }),
                                          if (isLoading)
                                            Center(
                                              child: CustomLoadingIndicator(),
                                            ),
                                          // _authController.weeekeleyyyd.isEmpty
                                          //     ? SizedBox()
                                          //     : isEditing
                                          //         ? SizedBox()
                                          //         : GestureDetector(
                                          //             onTap: () async {
                                          //               if (_selectedOption ==
                                          //                   null) {
                                          //                 var snackBar = SnackBar(
                                          //                     content: Text(
                                          //                         'Select Diet Template'));
                                          //                 ScaffoldMessenger.of(
                                          //                         context)
                                          //                     .showSnackBar(
                                          //                         snackBar);
                                          //               } else {
                                          //                 try {
                                          //                   setState(() {
                                          //                     isLoading = true;
                                          //                   });
                                          //                   await Future
                                          //                       .delayed(
                                          //                           Duration(
                                          //                               seconds:
                                          //                                   4));

                                          //                   Get.find<
                                          //                           AuthController>()
                                          //                       .weeklyypostdataaa(
                                          //                           weeklttempleteidd:
                                          //                               _selectedOption,
                                          //                           pueriss: widget
                                          //                               .puserid,
                                          //                           context:
                                          //                               context);
                                          //                   setState(() {
                                          //                     isLoading = false;
                                          //                     _selectedOption ==
                                          //                         null;
                                          //                   });
                                          //                 } catch (e) {}
                                          //               }
                                          //             },
                                          //             child: Row(
                                          //               mainAxisAlignment:
                                          //                   MainAxisAlignment
                                          //                       .center,
                                          //               children: [
                                          //                 Container(
                                          //                   margin:
                                          //                       EdgeInsets.only(
                                          //                           left: 0,
                                          //                           right: 30,
                                          //                           top: 20),
                                          //                   height: 35,
                                          //                   width: 100,
                                          //                   alignment: Alignment
                                          //                       .center,
                                          //                   decoration: BoxDecoration(
                                          //                       color: ColorResources
                                          //                           .buttonYellow,
                                          //                       borderRadius:
                                          //                           BorderRadius
                                          //                               .circular(
                                          //                                   5)),
                                          //                   child: Text(
                                          //                     "Assign",
                                          //                     style:
                                          //                         poppinstMedium
                                          //                             .copyWith(
                                          //                       color: Colors
                                          //                           .black,
                                          //                       fontSize: 15,
                                          //                     ),
                                          //                   ),
                                          //                 ),
                                          //               ],
                                          //             ),
                                          //           ),
                                          // Spacer(),
                                        ],
                                      ),
                                    ),
                                  ),
                                  //tab22222222
                                  SingleChildScrollView(
                                    child: Container(
                                      child: Column(
                                        children: [
                                          GetBuilder<AuthController>(
                                              builder: (logic) {
                                            return logic.specialdietsss.isEmpty
                                                ? Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            top: 300),
                                                    child: Text(
                                                      'No Detox Diet!',
                                                      style: poppinstMedium
                                                          .copyWith(
                                                        color: Colors.black,
                                                        fontSize: 15,
                                                      ),
                                                    ),
                                                  )
                                                : Column(
                                                    children: [
                                                      ...logic.specialdietsss
                                                          .asMap()
                                                          .entries
                                                          .map((e) {
                                                        return Column(
                                                          children: [
                                                            Theme(
                                                              data: ThemeData()
                                                                  .copyWith(
                                                                      dividerColor:
                                                                          Colors
                                                                              .transparent),
                                                              child:
                                                                  ExpansionTile(
                                                                iconColor:
                                                                    ColorResources
                                                                        .verifyScreenButton,
                                                                title: Row(
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .start,
                                                                  children: [
                                                                    SizedBox(
                                                                      width: 0,
                                                                    ),
                                                                    Container(
                                                                      padding: EdgeInsets
                                                                          .only(
                                                                              top: 0),
                                                                      child:
                                                                          Row(
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.spaceBetween,
                                                                        children: [
                                                                          Radio<
                                                                              String>(
                                                                            value:
                                                                                e.value['id'].toString(),
                                                                            groupValue:
                                                                                _selectedOption1,
                                                                            activeColor:
                                                                                ColorResources.buttonYellow,
                                                                            onChanged:
                                                                                (String? value) {
                                                                              setState(() {
                                                                                _selectedOption1 = value!;
                                                                                print('hgghghghhggh${_selectedOption1}');
                                                                              });
                                                                            },
                                                                          ),
                                                                          Text(
                                                                              "${e.value['template_name']}",
                                                                              style: poppinsSemiBold.copyWith(color: ColorResources.verifyScreenButton, height: 1, fontSize: 15)),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                                children: <Widget>[
                                                                  Padding(
                                                                    padding: const EdgeInsets
                                                                            .symmetric(
                                                                        horizontal:
                                                                            1.0,
                                                                        vertical:
                                                                            8.0),
                                                                    child:
                                                                        Column(
                                                                      children: [
                                                                        Row(
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.end,
                                                                          children: [
                                                                            GestureDetector(
                                                                              onTap: () {
                                                                                setState(() {
                                                                                  if (isEditing22) {
                                                                                    print('ghjhgfhj');
                                                                                    speciallllydiett();
                                                                                  }
                                                                                  sepsunday1Controller.text = e.value['sunday_e_m'];
                                                                                  sepsunday2Controller.text = e.value['sunday_b_f'];
                                                                                  sepsunday3Controller.text = e.value['sunday_m_m'];
                                                                                  sepsunday4Controller.text = e.value['sunday_l'];
                                                                                  sepsunday5Controller.text = e.value['sunday_e'];
                                                                                  sepsunday6Controller.text = e.value['sunday_d'];
                                                                                  //
                                                                                  sepmonday1Controller.text = e.value['monday_e_m'];
                                                                                  sepmonday2Controller.text = e.value['monday_b_f'];
                                                                                  sepmonday3Controller.text = e.value['monday_m_m'];
                                                                                  sepmonday4Controller.text = e.value['monday_l'];
                                                                                  sepmonday5Controller.text = e.value['monday_e'];
                                                                                  sepmonday6Controller.text = e.value['monday_d'];

                                                                                  septuesday1Controller.text = e.value['tuesday_e_m'];
                                                                                  septuesday2Controller.text = e.value['tuesday_b_f'];
                                                                                  septuesday3Controller.text = e.value['tuesday_m_m'];
                                                                                  septuesday4Controller.text = e.value['tuesday_l'];
                                                                                  septuesday5Controller.text = e.value['tuesday_e'];
                                                                                  septuesday6Controller.text = e.value['tuesday_d'];
                                                                                  //
                                                                                  sepwenesday1Controller.text = e.value['wednesday_e_m'];
                                                                                  sepwensday2Controller.text = e.value['wednesday_b_f'];
                                                                                  sepwensday3Controller.text = e.value['wednesday_m_m'];
                                                                                  sepwensday4Controller.text = e.value['wednesday_l'];
                                                                                  sepwensday5Controller.text = e.value['wednesday_e'];
                                                                                  sepwensday6Controller.text = e.value['wednesday_d'];

                                                                                  septhuesday1Controller.text = e.value['thursday_e_m'];
                                                                                  septhuesday2Controller.text = e.value['thursday_b_f'];
                                                                                  septhuesday3Controller.text = e.value['thursday_m_m'];
                                                                                  septhueday4Controller.text = e.value['thursday_l'];
                                                                                  septhuesday5Controller.text = e.value['thursday_e'];
                                                                                  septhuesday6Controller.text = e.value['thursday_d'];

                                                                                  sepfriday1Controller.text = e.value['friday_e_m'];
                                                                                  sepfriday2Controller.text = e.value['friday_b_f'];
                                                                                  sepfriday3Controller.text = e.value['friday_m_m'];
                                                                                  sepfriday4Controller.text = e.value['friday_l'];
                                                                                  sepfriday5Controller.text = e.value['friday_e'];
                                                                                  sepfriday6Controller.text = e.value['friday_d'];

                                                                                  sepsaturday1Controller.text = e.value['saturday_e_m'];
                                                                                  sepsaturday2Controller.text = e.value['saturday_b_f'];
                                                                                  sepsaturday3Controller.text = e.value['saturday_m_m'];
                                                                                  sepsaturday4Controller.text = e.value['saturday_l'];
                                                                                  sepsaturday5Controller.text = e.value['saturday_e'];
                                                                                  sepsaturday6Controller.text = e.value['saturday_d'];
                                                                                  isEditing22 = !isEditing22;
                                                                                });
                                                                              },
                                                                              child: Container(
                                                                                margin: EdgeInsets.only(left: 3, right: 3, top: 0),
                                                                                height: 25,
                                                                                width: isEditing22 ? 170 : 60,
                                                                                alignment: Alignment.center,
                                                                                decoration: BoxDecoration(color: isEditing22 ? Colors.green : ColorResources.buttonYellow, borderRadius: BorderRadius.circular(5)),
                                                                                child: Padding(
                                                                                  padding: const EdgeInsets.all(3.0),
                                                                                  child: Row(
                                                                                    mainAxisAlignment: isEditing22 ? MainAxisAlignment.center : MainAxisAlignment.spaceAround,
                                                                                    children: [
                                                                                      isEditing22
                                                                                          ? SizedBox()
                                                                                          : Icon(
                                                                                              Icons.edit,
                                                                                              size: 15,
                                                                                            ),
                                                                                      Text(
                                                                                        isEditing22 ? "Update & Assign" : "Edit",
                                                                                        style: poppinstMedium.copyWith(
                                                                                          color: isEditing22 ? Colors.white : Colors.black,
                                                                                          fontSize: 13,
                                                                                        ),
                                                                                      ),
                                                                                    ],
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                        Container(
                                                                            child:
                                                                                Column(
                                                                          children: [
                                                                            Container(
                                                                              padding: const EdgeInsets.only(left: 0, right: 0),
                                                                              alignment: Alignment.topCenter,
                                                                              child: Wrap(
                                                                                children: List.generate(
                                                                                  7,
                                                                                  (index) {
                                                                                    return GestureDetector(
                                                                                      onTap: () {
                                                                                        setState(() {
                                                                                          selectedIndex1 = index;
                                                                                        });
                                                                                      },
                                                                                      child: SizedBox(
                                                                                        width: (MediaQuery.of(context).size.width - 60) / 7,
                                                                                        child: Column(
                                                                                          children: [
                                                                                            const SizedBox(
                                                                                              height: 10,
                                                                                            ),
                                                                                            Column(
                                                                                              children: [
                                                                                                Container(
                                                                                                  padding: const EdgeInsets.only(left: 3, right: 3),
                                                                                                  alignment: Alignment.center,
                                                                                                  child: Text(allDays[index], style: poppinsSemiBold.copyWith(color: selectedIndex != index ? Colors.black : Colors.green, fontSize: 13)),
                                                                                                ),
                                                                                                if (selectedIndex1 == index)
                                                                                                  Icon(
                                                                                                    Icons.check,
                                                                                                    size: 15,
                                                                                                    color: Colors.green,
                                                                                                  )
                                                                                              ],
                                                                                            )
                                                                                          ],
                                                                                        ),
                                                                                      ),
                                                                                    );
                                                                                  },
                                                                                ),
                                                                              ),
                                                                            ),
                                                                            if (selectedIndex1 ==
                                                                                0) ...[
                                                                              _speciallbuildDayCard(
                                                                                'Sunday',
                                                                                e.value['sunday_e_m'],
                                                                                e.value['sunday_b_f'],
                                                                                e.value['sunday_m_m'],
                                                                                e.value['sunday_l'],
                                                                                e.value['sunday_e'],
                                                                                e.value['sunday_d'],
                                                                              ),
                                                                            ],
                                                                            if (selectedIndex1 ==
                                                                                1) ...[
                                                                              _mondayyyyspecial('Monday', e.value['monday_e_m'], e.value['monday_b_f'], e.value['monday_m_m'], e.value['monday_l'], e.value['monday_e'], e.value['monday_d']),
                                                                            ],
                                                                            if (selectedIndex1 ==
                                                                                2) ...[
                                                                              _tuesdayssspecial('Tuesday', e.value['tuesday_e_m'], e.value['tuesday_b_f'], e.value['tuesday_m_m'], e.value['tuesday_l'], e.value['tuesday_e'], e.value['tuesday_d']),
                                                                            ],
                                                                            if (selectedIndex1 ==
                                                                                3) ...[
                                                                              _wednesdayaasepecial('Wednesday', e.value['wednesday_e_m'], e.value['wednesday_b_f'], e.value['wednesday_m_m'], e.value['wednesday_l'], e.value['wednesday_e'], e.value['wednesday_d']),
                                                                            ],
                                                                            if (selectedIndex1 ==
                                                                                4) ...[
                                                                              _thuredaaaaaspecail('Thursday', e.value['thursday_e_m'], e.value['thursday_b_f'], e.value['thursday_m_m'], e.value['thursday_l'], e.value['thursday_e'], e.value['thursday_d']),
                                                                            ],
                                                                            if (selectedIndex1 ==
                                                                                5) ...[
                                                                              _fridayssssspecail('Friday', e.value['friday_e_m'], e.value['friday_b_f'], e.value['friday_m_m'], e.value['friday_l'], e.value['friday_e'], e.value['friday_d']),
                                                                            ],
                                                                            if (selectedIndex1 ==
                                                                                6) ...[
                                                                              _saturdayssssep('Saturday', e.value['saturday_e_m'], e.value['saturday_b_f'], e.value['saturday_m_m'], e.value['saturday_l'], e.value['saturday_e'], e.value['saturday_d']),
                                                                            ],
                                                                          ],
                                                                        ))
                                                                      ],
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            )
                                                          ],
                                                        );
                                                      }).toList(),
                                                    ],
                                                  );
                                          }),
                                          if (isLoading)
                                            Center(
                                              child: CustomLoadingIndicator(),
                                            ),
                                          // _authController.specialdietsss.isEmpty
                                          //     ? SizedBox()
                                          //     : isEditing
                                          //         ? SizedBox()
                                          //         : GestureDetector(
                                          //             onTap: () async {
                                          //               if (_selectedOption1 ==
                                          //                   null) {
                                          //                 var snackBar = SnackBar(
                                          //                     content: Text(
                                          //                         'Select Special Diet Template'));
                                          //                 ScaffoldMessenger.of(
                                          //                         context)
                                          //                     .showSnackBar(
                                          //                         snackBar);
                                          //               } else {
                                          //                 try {
                                          //                   setState(() {
                                          //                     isLoading = true;
                                          //                   });
                                          //                   await Future
                                          //                       .delayed(
                                          //                           Duration(
                                          //                               seconds:
                                          //                                   3));

                                          //                   Get.find<
                                          //                           AuthController>()
                                          //                       .specialdietsspostapii(
                                          //                           weeklttempleteidd:
                                          //                               _selectedOption1,
                                          //                           pueriss: widget
                                          //                               .puserid,
                                          //                           context:
                                          //                               context);
                                          //                   setState(() {
                                          //                     isLoading = false;
                                          //                     _selectedOption1 ==
                                          //                         '';
                                          //                   });
                                          //                 } catch (e) {}
                                          //               }
                                          //             },
                                          //             child: Row(
                                          //               mainAxisAlignment:
                                          //                   MainAxisAlignment
                                          //                       .center,
                                          //               children: [
                                          //                 Container(
                                          //                   margin:
                                          //                       EdgeInsets.only(
                                          //                           left: 0,
                                          //                           right: 30,
                                          //                           top: 20),
                                          //                   height: 35,
                                          //                   width: 100,
                                          //                   alignment: Alignment
                                          //                       .center,
                                          //                   decoration: BoxDecoration(
                                          //                       color: ColorResources
                                          //                           .buttonYellow,
                                          //                       borderRadius:
                                          //                           BorderRadius
                                          //                               .circular(
                                          //                                   5)),
                                          //                   child: Text(
                                          //                     "Assign",
                                          //                     style:
                                          //                         poppinstMedium
                                          //                             .copyWith(
                                          //                       color: Colors
                                          //                           .black,
                                          //                       fontSize: 15,
                                          //                     ),
                                          //                   ),
                                          //                 ),
                                          //               ],
                                          //             ),
                                          //           ),
                                          // // Spacer(),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
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

  void weeklyyyyydiett() async {
    String url = "${ApiConstants.baseUrl}${ApiConstants.editweeklyydietss}";

    String? token = Get.find<AuthController>().getAuthToken();
    final Map<String, dynamic> body = {
      'p_user_id': widget.puserid,
      'sunday_e_m': sunday1Controller.text,
      'sunday_b_f': sunday2Controller.text,
      'sunday_m_m': sunday3Controller.text,
      'sunday_l': sunday4Controller.text,
      'sunday_e': sunday5Controller.text,
      'sunday_d': sunday6Controller.text,
      'monday_e_m': monday1Controller.text,
      'monday_b_f': monday2Controller.text,
      'monday_m_m': monday3Controller.text,
      'monday_l': monday4Controller.text,
      'monday_e': monday5Controller.text,
      'monday_d': monday6Controller.text,
      'tuesday_e_m': tuesday1Controller.text,
      'tuesday_b_f': tuesday2Controller.text,
      'tuesday_m_m': tuesday3Controller.text,
      'tuesday_l': tuesday4Controller.text,
      'tuesday_e': tuesday5Controller.text,
      'tuesday_d': tuesday6Controller.text,
      'wednesday_e_m': wenesday1Controller.text,
      'wednesday_b_f': wensday2Controller.text,
      'wednesday_m_m': wensday3Controller.text,
      'wednesday_l': wensday4Controller.text,
      'wednesday_e': wensday5Controller.text,
      'wednesday_d': wensday6Controller.text,
      'thursday_e_m': thuesday1Controller.text,
      'thursday_b_f': thuesday2Controller.text,
      'thursday_m_m': thuesday3Controller.text,
      'thursday_l': thueday4Controller.text,
      'thursday_e': thuesday5Controller.text,
      'thursday_d': thuesday6Controller.text,
      'friday_e_m': friday1Controller.text,
      'friday_b_f': friday2Controller.text,
      'friday_m_m': friday3Controller.text,
      'friday_l': friday4Controller.text,
      'friday_e': friday5Controller.text,
      'friday_d': friday6Controller.text,
      'saturday_e_m': saturday1Controller.text,
      'saturday_b_f': saturday2Controller.text,
      'saturday_m_m': saturday3Controller.text,
      'saturday_l': saturday4Controller.text,
      'saturday_e': saturday5Controller.text,
      'saturday_d': saturday6Controller.text,
    };

    final response = await http.post(
      Uri.parse(url),
      headers: {
        "Authorization": "Bearer $token",
        "Content-Type": "application/json",
      },
      body: jsonEncode(body),
    );

    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);

      // ignore: use_build_context_synchronously
      AwesomeDialog(
        context: context,
        dialogType: DialogType.success,
        animType: AnimType.topSlide,
        closeIcon: Icon(Icons.close_fullscreen_outlined),
        title: 'Successfully',
        titleTextStyle: poppinstMedium.copyWith(
            fontSize: Dimensions.PADDING_SIZE_DEFAULT, color: Colors.black),
        desc: 'Weekly Diet Update & Assign Successfully',
        descTextStyle:
            poppinstMedium.copyWith(fontSize: 17, color: Colors.black),
        btnCancelColor: Colors.grey[500],
        btnOkColor: ColorResources.verifyScreenButton,
        btnOkOnPress: () {
          Get.find<AuthController>().doctorweeklyyviewsietss(context,
              templeteidd: '${jsonData['data']['id']}',
              puseridd: widget.puserid);
          Get.off(DoctorviewDietsScreen(),
              duration: const Duration(
                  milliseconds: ApiConstants.screenTransitionTime),
              transition: Transition.rightToLeft);
        },
        onDismissCallback: (type) {
          Get.find<AuthController>().doctorweeklyyviewsietss(context,
              templeteidd: '${jsonData['data']['id']}',
              puseridd: widget.puserid);
          Get.off(DoctorviewDietsScreen(),
              duration:
                  Duration(milliseconds: ApiConstants.screenTransitionTime),
              transition: Transition.rightToLeft);
        },
      ).show();
      Get.find<AuthController>().dietitianDetails(page: 1);
    } else {
      throw Exception('Failed to load user transactions');
    }
  }

  //
  void speciallllydiett() async {
    String url = "${ApiConstants.baseUrl}${ApiConstants.editseciallyydietss}";

    String? token = Get.find<AuthController>().getAuthToken();
    final Map<String, dynamic> body = {
      'p_user_id': widget.puserid,
      'sunday_e_m': sepsunday1Controller.text,
      'sunday_b_f': sepsunday2Controller.text,
      'sunday_m_m': sepsunday3Controller.text,
      'sunday_l': sepsunday4Controller.text,
      'sunday_e': sepsunday5Controller.text,
      'sunday_d': sepsunday6Controller.text,
      'monday_e_m': sepmonday1Controller.text,
      'monday_b_f': sepmonday2Controller.text,
      'monday_m_m': sepmonday3Controller.text,
      'monday_l': sepmonday4Controller.text,
      'monday_e': sepmonday5Controller.text,
      'monday_d': sepmonday6Controller.text,
      'tuesday_e_m': septuesday1Controller.text,
      'tuesday_b_f': septuesday2Controller.text,
      'tuesday_m_m': septuesday3Controller.text,
      'tuesday_l': septuesday4Controller.text,
      'tuesday_e': septuesday5Controller.text,
      'tuesday_d': septuesday6Controller.text,
      'wednesday_e_m': sepwenesday1Controller.text,
      'wednesday_b_f': sepwensday2Controller.text,
      'wednesday_m_m': sepwensday3Controller.text,
      'wednesday_l': sepwensday4Controller.text,
      'wednesday_e': sepwensday5Controller.text,
      'wednesday_d': sepwensday6Controller.text,
      'thursday_e_m': septhuesday1Controller.text,
      'thursday_b_f': septhuesday2Controller.text,
      'thursday_m_m': septhuesday3Controller.text,
      'thursday_l': septhueday4Controller.text,
      'thursday_e': septhuesday5Controller.text,
      'thursday_d': septhuesday6Controller.text,
      'friday_e_m': sepfriday1Controller.text,
      'friday_b_f': sepfriday2Controller.text,
      'friday_m_m': sepfriday3Controller.text,
      'friday_l': sepfriday4Controller.text,
      'friday_e': sepfriday5Controller.text,
      'friday_d': sepfriday6Controller.text,
      'saturday_e_m': sepsaturday1Controller.text,
      'saturday_b_f': sepsaturday2Controller.text,
      'saturday_m_m': sepsaturday3Controller.text,
      'saturday_l': sepsaturday4Controller.text,
      'saturday_e': sepsaturday5Controller.text,
      'saturday_d': sepsaturday6Controller.text,
    };

    final response = await http.post(
      Uri.parse(url),
      headers: {
        "Authorization": "Bearer $token",
        "Content-Type": "application/json",
      },
      body: jsonEncode(body),
    );

    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);

      // ignore: use_build_context_synchronously
      AwesomeDialog(
        context: context,
        dialogType: DialogType.success,
        animType: AnimType.topSlide,
        closeIcon: const Icon(Icons.close_fullscreen_outlined),
        title: 'Successfully',
        titleTextStyle: poppinstMedium.copyWith(
            fontSize: Dimensions.PADDING_SIZE_DEFAULT, color: Colors.black),
        desc: 'Detox Diet Update & Assign Successfully',
        descTextStyle:
            poppinstMedium.copyWith(fontSize: 17, color: Colors.black),
        btnCancelColor: Colors.grey[500],
        btnOkColor: ColorResources.verifyScreenButton,
        btnOkOnPress: () {
          Get.find<AuthController>().doctorspecialliewsietss(context,
              templeteidd: '${jsonData['data']['id']}',
              puseridd: widget.puserid);
          Get.off(DoctorviewDietsScreen(),
              duration: const Duration(
                  milliseconds: ApiConstants.screenTransitionTime),
              transition: Transition.rightToLeft);
        },
        onDismissCallback: (type) {
          Get.find<AuthController>().doctorspecialliewsietss(context,
              templeteidd: '${jsonData['data']['id']}',
              puseridd: widget.puserid);
          Get.off(DoctorviewDietsScreen(),
              duration:
                  Duration(milliseconds: ApiConstants.screenTransitionTime),
              transition: Transition.rightToLeft);
        },
      ).show();
      Get.find<AuthController>().dietitianDetails(page: 1);
    } else {
      throw Exception('Failed to load user transactions');
    }
  }

  Widget _buildDayCard(String day, String em, String breakfast,
      String midMorning, String lunch, String eveningTea, String dinner) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                border: Border.all(width: 1, color: ColorResources.ditedText)),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Container(
                    height: 40,
                    width: 40,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: ColorResources.ditedText,
                    ),
                    child: Text(
                      "E/m",
                      style: poppinstMedium.copyWith(
                          fontSize: 16, color: Colors.white),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: isEditing
                        ? TextField(
                            controller: sunday1Controller,
                            style: poppinstMedium.copyWith(fontSize: 13),
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              // hintText: '$breakfast',
                              hintStyle: TextStyle(fontSize: 13),
                            ),
                          )
                        : Text(
                            "$em",
                            style: poppinstMedium.copyWith(fontSize: 13),
                          ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                border: Border.all(width: 1, color: ColorResources.ditedText1)),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Container(
                    height: 40,
                    width: 40,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: ColorResources.ditedText1,
                    ),
                    child: Text(
                      "B/f",
                      style: poppinstMedium.copyWith(
                          fontSize: 16, color: Colors.white),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: isEditing
                        ? TextField(
                            controller: sunday2Controller,
                            style: poppinstMedium.copyWith(fontSize: 13),
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              // hintText: '$em',
                              hintStyle: TextStyle(fontSize: 13),
                            ),
                          )
                        : Text(
                            "$breakfast",
                            style: poppinstMedium.copyWith(fontSize: 13),
                          ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                border: Border.all(width: 1, color: ColorResources.ditedText2)),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Container(
                    height: 40,
                    width: 40,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: ColorResources.ditedText2,
                    ),
                    child: Text(
                      "M/m",
                      style: poppinstMedium.copyWith(
                          fontSize: 14, color: Colors.white),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: isEditing
                        ? TextField(
                            controller: sunday3Controller,
                            style: poppinstMedium.copyWith(fontSize: 13),
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              //  hintText: '$midMorning',
                              hintStyle: TextStyle(fontSize: 13),
                            ),
                          )
                        : Text(
                            "$midMorning",
                            style: poppinstMedium.copyWith(fontSize: 13),
                          ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                border: Border.all(width: 1, color: ColorResources.ditedText3)),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Container(
                    height: 40,
                    width: 40,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: ColorResources.ditedText3,
                    ),
                    child: Text(
                      "L ",
                      style: poppinstMedium.copyWith(
                          fontSize: 16, color: Colors.white),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: isEditing
                        ? TextField(
                            controller: sunday4Controller,
                            style: poppinstMedium.copyWith(fontSize: 13),
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              // hintText: '$lunch',
                              hintStyle: TextStyle(fontSize: 13),
                            ),
                          )
                        : Text(
                            "$lunch",
                            style: poppinstMedium.copyWith(fontSize: 13),
                          ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                border: Border.all(width: 1, color: ColorResources.ditedTex4)),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Container(
                    height: 40,
                    width: 40,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: ColorResources.ditedTex4,
                    ),
                    child: Text(
                      "E",
                      style: poppinstMedium.copyWith(
                          fontSize: 16, color: Colors.white),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: isEditing
                        ? TextField(
                            controller: sunday5Controller,
                            style: poppinstMedium.copyWith(fontSize: 13),
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              //  hintText: '$eveningTea',
                              hintStyle: TextStyle(fontSize: 13),
                            ),
                          )
                        : Text(
                            "$eveningTea",
                            style: poppinstMedium.copyWith(fontSize: 13),
                          ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                border: Border.all(width: 1, color: ColorResources.ditedTex5)),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Container(
                    height: 40,
                    width: 40,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: ColorResources.ditedTex5,
                    ),
                    child: Text(
                      "D ",
                      style: poppinstMedium.copyWith(
                          fontSize: 16, color: Colors.white),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: isEditing
                        ? TextField(
                            controller: sunday6Controller,
                            style: poppinstMedium.copyWith(fontSize: 13),
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              // hintText: '$dinner',
                              hintStyle: TextStyle(fontSize: 13),
                            ),
                          )
                        : Text(
                            "$dinner",
                            style: poppinstMedium.copyWith(fontSize: 13),
                          ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 15,
          ),
        ],
      ),
    );
  }

  Widget _mondayyyy(String day, String em, String breakfast, String midMorning,
      String lunch, String eveningTea, String dinner) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                border: Border.all(width: 1, color: ColorResources.ditedText)),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Container(
                    height: 40,
                    width: 40,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: ColorResources.ditedText,
                    ),
                    child: Text(
                      "E/m",
                      style: poppinstMedium.copyWith(
                          fontSize: 16, color: Colors.white),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: isEditing
                        ? TextField(
                            controller: monday1Controller,
                            style: poppinstMedium.copyWith(fontSize: 13),
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: '$breakfast',
                              hintStyle: TextStyle(fontSize: 13),
                            ),
                          )
                        : Text(
                            "$em",
                            style: poppinstMedium.copyWith(fontSize: 13),
                          ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                border: Border.all(width: 1, color: ColorResources.ditedText1)),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Container(
                    height: 40,
                    width: 40,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: ColorResources.ditedText1,
                    ),
                    child: Text(
                      "B/f",
                      style: poppinstMedium.copyWith(
                          fontSize: 16, color: Colors.white),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: isEditing
                        ? TextField(
                            controller: monday2Controller,
                            style: poppinstMedium.copyWith(fontSize: 13),
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: '$em',
                              hintStyle: TextStyle(fontSize: 13),
                            ),
                          )
                        : Text(
                            "$breakfast",
                            style: poppinstMedium.copyWith(fontSize: 13),
                          ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                border: Border.all(width: 1, color: ColorResources.ditedText2)),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Container(
                    height: 40,
                    width: 40,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: ColorResources.ditedText2,
                    ),
                    child: Text(
                      "M/m",
                      style: poppinstMedium.copyWith(
                          fontSize: 14, color: Colors.white),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: isEditing
                        ? TextField(
                            controller: monday3Controller,
                            style: poppinstMedium.copyWith(fontSize: 13),
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintStyle: TextStyle(fontSize: 13),
                            ),
                          )
                        : Text(
                            "$midMorning",
                            style: poppinstMedium.copyWith(fontSize: 13),
                          ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                border: Border.all(width: 1, color: ColorResources.ditedText3)),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Container(
                    height: 40,
                    width: 40,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: ColorResources.ditedText3,
                    ),
                    child: Text(
                      "L ",
                      style: poppinstMedium.copyWith(
                          fontSize: 16, color: Colors.white),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: isEditing
                        ? TextField(
                            controller: monday4Controller,
                            style: poppinstMedium.copyWith(fontSize: 13),
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintStyle: TextStyle(fontSize: 13),
                            ),
                          )
                        : Text(
                            "$lunch",
                            style: poppinstMedium.copyWith(fontSize: 13),
                          ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                border: Border.all(width: 1, color: ColorResources.ditedTex4)),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Container(
                    height: 40,
                    width: 40,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: ColorResources.ditedTex4,
                    ),
                    child: Text(
                      "E",
                      style: poppinstMedium.copyWith(
                          fontSize: 16, color: Colors.white),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: isEditing
                        ? TextField(
                            controller: monday5Controller,
                            style: poppinstMedium.copyWith(fontSize: 13),
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintStyle: TextStyle(fontSize: 13),
                            ),
                          )
                        : Text(
                            "$eveningTea",
                            style: poppinstMedium.copyWith(fontSize: 13),
                          ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                border: Border.all(width: 1, color: ColorResources.ditedTex5)),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Container(
                    height: 40,
                    width: 40,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: ColorResources.ditedTex5,
                    ),
                    child: Text(
                      "D ",
                      style: poppinstMedium.copyWith(
                          fontSize: 16, color: Colors.white),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: isEditing
                        ? TextField(
                            controller: monday6Controller,
                            style: poppinstMedium.copyWith(fontSize: 13),
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintStyle: TextStyle(fontSize: 13),
                            ),
                          )
                        : Text(
                            "$dinner",
                            style: poppinstMedium.copyWith(fontSize: 13),
                          ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 15,
          ),
        ],
      ),
    );
  }

  Widget _tuesdayss(String day, String em, String breakfast, String midMorning,
      String lunch, String eveningTea, String dinner) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                border: Border.all(width: 1, color: ColorResources.ditedText)),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Container(
                    height: 40,
                    width: 40,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: ColorResources.ditedText,
                    ),
                    child: Text(
                      "E/m",
                      style: poppinstMedium.copyWith(
                          fontSize: 16, color: Colors.white),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: isEditing
                        ? TextField(
                            controller: tuesday1Controller,
                            style: poppinstMedium.copyWith(fontSize: 13),
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: '$breakfast',
                              hintStyle: TextStyle(fontSize: 13),
                            ),
                          )
                        : Text(
                            "$em",
                            style: poppinstMedium.copyWith(fontSize: 13),
                          ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                border: Border.all(width: 1, color: ColorResources.ditedText1)),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Container(
                    height: 40,
                    width: 40,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: ColorResources.ditedText1,
                    ),
                    child: Text(
                      "B/f",
                      style: poppinstMedium.copyWith(
                          fontSize: 16, color: Colors.white),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: isEditing
                        ? TextField(
                            controller: tuesday2Controller,
                            style: poppinstMedium.copyWith(fontSize: 13),
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: '$breakfast',
                              hintStyle: TextStyle(fontSize: 13),
                            ),
                          )
                        : Text(
                            "$em",
                            style: poppinstMedium.copyWith(fontSize: 13),
                          ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                border: Border.all(width: 1, color: ColorResources.ditedText2)),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Container(
                    height: 40,
                    width: 40,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: ColorResources.ditedText2,
                    ),
                    child: Text(
                      "M/m",
                      style: poppinstMedium.copyWith(
                          fontSize: 14, color: Colors.white),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: isEditing
                        ? TextField(
                            controller: tuesday3Controller,
                            style: poppinstMedium.copyWith(fontSize: 13),
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintStyle: TextStyle(fontSize: 13),
                            ),
                          )
                        : Text(
                            "$midMorning",
                            style: poppinstMedium.copyWith(fontSize: 13),
                          ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                border: Border.all(width: 1, color: ColorResources.ditedText3)),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Container(
                    height: 40,
                    width: 40,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: ColorResources.ditedText3,
                    ),
                    child: Text(
                      "L ",
                      style: poppinstMedium.copyWith(
                          fontSize: 16, color: Colors.white),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: isEditing
                        ? TextField(
                            controller: tuesday4Controller,
                            style: poppinstMedium.copyWith(fontSize: 13),
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintStyle: TextStyle(fontSize: 13),
                            ),
                          )
                        : Text(
                            "$lunch",
                            style: poppinstMedium.copyWith(fontSize: 13),
                          ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                border: Border.all(width: 1, color: ColorResources.ditedTex4)),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Container(
                    height: 40,
                    width: 40,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: ColorResources.ditedTex4,
                    ),
                    child: Text(
                      "E",
                      style: poppinstMedium.copyWith(
                          fontSize: 16, color: Colors.white),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: isEditing
                        ? TextField(
                            controller: tuesday5Controller,
                            style: poppinstMedium.copyWith(fontSize: 13),
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintStyle: TextStyle(fontSize: 13),
                            ),
                          )
                        : Text(
                            "$eveningTea",
                            style: poppinstMedium.copyWith(fontSize: 13),
                          ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                border: Border.all(width: 1, color: ColorResources.ditedTex5)),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Container(
                    height: 40,
                    width: 40,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: ColorResources.ditedTex5,
                    ),
                    child: Text(
                      "D ",
                      style: poppinstMedium.copyWith(
                          fontSize: 16, color: Colors.white),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: isEditing
                        ? TextField(
                            controller: tuesday6Controller,
                            style: poppinstMedium.copyWith(fontSize: 13),
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintStyle: TextStyle(fontSize: 13),
                            ),
                          )
                        : Text(
                            "$dinner",
                            style: poppinstMedium.copyWith(fontSize: 13),
                          ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 15,
          ),
        ],
      ),
    );
  }

  Widget _wednesdayaa(String day, String em, String breakfast,
      String midMorning, String lunch, String eveningTea, String dinner) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                border: Border.all(width: 1, color: ColorResources.ditedText)),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Container(
                    height: 40,
                    width: 40,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: ColorResources.ditedText,
                    ),
                    child: Text(
                      "E/m",
                      style: poppinstMedium.copyWith(
                          fontSize: 16, color: Colors.white),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: isEditing
                        ? TextField(
                            controller: wenesday1Controller,
                            style: poppinstMedium.copyWith(fontSize: 13),
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: '$breakfast',
                              hintStyle: TextStyle(fontSize: 13),
                            ),
                          )
                        : Text(
                            "$em",
                            style: poppinstMedium.copyWith(fontSize: 13),
                          ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                border: Border.all(width: 1, color: ColorResources.ditedText1)),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Container(
                    height: 40,
                    width: 40,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: ColorResources.ditedText1,
                    ),
                    child: Text(
                      "B/f",
                      style: poppinstMedium.copyWith(
                          fontSize: 16, color: Colors.white),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: isEditing
                        ? TextField(
                            controller: wensday2Controller,
                            style: poppinstMedium.copyWith(fontSize: 13),
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: '$em',
                              hintStyle: TextStyle(fontSize: 13),
                            ),
                          )
                        : Text(
                            "$breakfast",
                            style: poppinstMedium.copyWith(fontSize: 13),
                          ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                border: Border.all(width: 1, color: ColorResources.ditedText2)),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Container(
                    height: 40,
                    width: 40,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: ColorResources.ditedText2,
                    ),
                    child: Text(
                      "M/m",
                      style: poppinstMedium.copyWith(
                          fontSize: 14, color: Colors.white),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: isEditing
                        ? TextField(
                            controller: wensday3Controller,
                            style: poppinstMedium.copyWith(fontSize: 13),
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintStyle: TextStyle(fontSize: 13),
                            ),
                          )
                        : Text(
                            "$midMorning",
                            style: poppinstMedium.copyWith(fontSize: 13),
                          ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                border: Border.all(width: 1, color: ColorResources.ditedText3)),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Container(
                    height: 40,
                    width: 40,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: ColorResources.ditedText3,
                    ),
                    child: Text(
                      "L ",
                      style: poppinstMedium.copyWith(
                          fontSize: 16, color: Colors.white),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: isEditing
                        ? TextField(
                            controller: wensday4Controller,
                            style: poppinstMedium.copyWith(fontSize: 13),
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintStyle: TextStyle(fontSize: 13),
                            ),
                          )
                        : Text(
                            "$lunch",
                            style: poppinstMedium.copyWith(fontSize: 13),
                          ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                border: Border.all(width: 1, color: ColorResources.ditedTex4)),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Container(
                    height: 40,
                    width: 40,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: ColorResources.ditedTex4,
                    ),
                    child: Text(
                      "E",
                      style: poppinstMedium.copyWith(
                          fontSize: 16, color: Colors.white),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: isEditing
                        ? TextField(
                            controller: wensday5Controller,
                            style: poppinstMedium.copyWith(fontSize: 13),
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintStyle: TextStyle(fontSize: 13),
                            ),
                          )
                        : Text(
                            "$eveningTea",
                            style: poppinstMedium.copyWith(fontSize: 13),
                          ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                border: Border.all(width: 1, color: ColorResources.ditedTex5)),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Container(
                    height: 40,
                    width: 40,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: ColorResources.ditedTex5,
                    ),
                    child: Text(
                      "D ",
                      style: poppinstMedium.copyWith(
                          fontSize: 16, color: Colors.white),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: isEditing
                        ? TextField(
                            controller: wensday6Controller,
                            style: poppinstMedium.copyWith(fontSize: 13),
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintStyle: TextStyle(fontSize: 13),
                            ),
                          )
                        : Text(
                            "$dinner",
                            style: poppinstMedium.copyWith(fontSize: 13),
                          ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 15,
          ),
        ],
      ),
    );
  }

  Widget _thuredaaaaa(String day, String em, String breakfast,
      String midMorning, String lunch, String eveningTea, String dinner) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                border: Border.all(width: 1, color: ColorResources.ditedText)),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Container(
                    height: 40,
                    width: 40,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: ColorResources.ditedText,
                    ),
                    child: Text(
                      "E/m",
                      style: poppinstMedium.copyWith(
                          fontSize: 16, color: Colors.white),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: isEditing
                        ? TextField(
                            controller: thuesday1Controller,
                            style: poppinstMedium.copyWith(fontSize: 13),
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintStyle: TextStyle(fontSize: 13),
                            ),
                          )
                        : Text(
                            "$em",
                            style: poppinstMedium.copyWith(fontSize: 13),
                          ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                border: Border.all(width: 1, color: ColorResources.ditedText1)),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Container(
                    height: 40,
                    width: 40,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: ColorResources.ditedText1,
                    ),
                    child: Text(
                      "B/f",
                      style: poppinstMedium.copyWith(
                          fontSize: 16, color: Colors.white),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: isEditing
                        ? TextField(
                            controller: thuesday2Controller,
                            style: poppinstMedium.copyWith(fontSize: 13),
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintStyle: TextStyle(fontSize: 13),
                            ),
                          )
                        : Text(
                            "$breakfast",
                            style: poppinstMedium.copyWith(fontSize: 13),
                          ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                border: Border.all(width: 1, color: ColorResources.ditedText2)),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Container(
                    height: 40,
                    width: 40,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: ColorResources.ditedText2,
                    ),
                    child: Text(
                      "M/m",
                      style: poppinstMedium.copyWith(
                          fontSize: 14, color: Colors.white),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: isEditing
                        ? TextField(
                            controller: thuesday3Controller,
                            style: poppinstMedium.copyWith(fontSize: 13),
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintStyle: TextStyle(fontSize: 13),
                            ),
                          )
                        : Text(
                            "$midMorning",
                            style: poppinstMedium.copyWith(fontSize: 13),
                          ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                border: Border.all(width: 1, color: ColorResources.ditedText3)),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Container(
                    height: 40,
                    width: 40,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: ColorResources.ditedText3,
                    ),
                    child: Text(
                      "L ",
                      style: poppinstMedium.copyWith(
                          fontSize: 16, color: Colors.white),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: isEditing
                        ? TextField(
                            controller: thueday4Controller,
                            style: poppinstMedium.copyWith(fontSize: 13),
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintStyle: TextStyle(fontSize: 13),
                            ),
                          )
                        : Text(
                            "$lunch",
                            style: poppinstMedium.copyWith(fontSize: 13),
                          ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                border: Border.all(width: 1, color: ColorResources.ditedTex4)),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Container(
                    height: 40,
                    width: 40,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: ColorResources.ditedTex4,
                    ),
                    child: Text(
                      "E",
                      style: poppinstMedium.copyWith(
                          fontSize: 16, color: Colors.white),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: isEditing
                        ? TextField(
                            controller: thuesday5Controller,
                            style: poppinstMedium.copyWith(fontSize: 13),
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintStyle: TextStyle(fontSize: 13),
                            ),
                          )
                        : Text(
                            "$eveningTea",
                            style: poppinstMedium.copyWith(fontSize: 13),
                          ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                border: Border.all(width: 1, color: ColorResources.ditedTex5)),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Container(
                    height: 40,
                    width: 40,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: ColorResources.ditedTex5,
                    ),
                    child: Text(
                      "D ",
                      style: poppinstMedium.copyWith(
                          fontSize: 16, color: Colors.white),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: isEditing
                        ? TextField(
                            controller: thuesday6Controller,
                            style: poppinstMedium.copyWith(fontSize: 13),
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintStyle: TextStyle(fontSize: 13),
                            ),
                          )
                        : Text(
                            "$dinner",
                            style: poppinstMedium.copyWith(fontSize: 13),
                          ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 15,
          ),
        ],
      ),
    );
  }

  Widget _fridayssss(String day, String em, String breakfast, String midMorning,
      String lunch, String eveningTea, String dinner) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                border: Border.all(width: 1, color: ColorResources.ditedText)),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Container(
                    height: 40,
                    width: 40,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: ColorResources.ditedText,
                    ),
                    child: Text(
                      "E/m",
                      style: poppinstMedium.copyWith(
                          fontSize: 16, color: Colors.white),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: isEditing
                        ? TextField(
                            controller: friday1Controller,
                            style: poppinstMedium.copyWith(fontSize: 13),
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintStyle: TextStyle(fontSize: 13),
                            ),
                          )
                        : Text(
                            "$em",
                            style: poppinstMedium.copyWith(fontSize: 13),
                          ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                border: Border.all(width: 1, color: ColorResources.ditedText1)),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Container(
                    height: 40,
                    width: 40,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: ColorResources.ditedText1,
                    ),
                    child: Text(
                      "B/f",
                      style: poppinstMedium.copyWith(
                          fontSize: 16, color: Colors.white),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: isEditing
                        ? TextField(
                            controller: friday2Controller,
                            style: poppinstMedium.copyWith(fontSize: 13),
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintStyle: TextStyle(fontSize: 13),
                            ),
                          )
                        : Text(
                            "$breakfast",
                            style: poppinstMedium.copyWith(fontSize: 13),
                          ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                border: Border.all(width: 1, color: ColorResources.ditedText2)),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Container(
                    height: 40,
                    width: 40,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: ColorResources.ditedText2,
                    ),
                    child: Text(
                      "M/m",
                      style: poppinstMedium.copyWith(
                          fontSize: 14, color: Colors.white),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: isEditing
                        ? TextField(
                            controller: friday3Controller,
                            style: poppinstMedium.copyWith(fontSize: 13),
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintStyle: TextStyle(fontSize: 13),
                            ),
                          )
                        : Text(
                            "$midMorning",
                            style: poppinstMedium.copyWith(fontSize: 13),
                          ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                border: Border.all(width: 1, color: ColorResources.ditedText3)),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Container(
                    height: 40,
                    width: 40,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: ColorResources.ditedText3,
                    ),
                    child: Text(
                      "L ",
                      style: poppinstMedium.copyWith(
                          fontSize: 16, color: Colors.white),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: isEditing
                        ? TextField(
                            controller: friday4Controller,
                            style: poppinstMedium.copyWith(fontSize: 13),
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintStyle: TextStyle(fontSize: 13),
                            ),
                          )
                        : Text(
                            "$lunch",
                            style: poppinstMedium.copyWith(fontSize: 13),
                          ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                border: Border.all(width: 1, color: ColorResources.ditedTex4)),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Container(
                    height: 40,
                    width: 40,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: ColorResources.ditedTex4,
                    ),
                    child: Text(
                      "E",
                      style: poppinstMedium.copyWith(
                          fontSize: 16, color: Colors.white),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: isEditing
                        ? TextField(
                            controller: friday5Controller,
                            style: poppinstMedium.copyWith(fontSize: 13),
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintStyle: TextStyle(fontSize: 13),
                            ),
                          )
                        : Text(
                            "$eveningTea",
                            style: poppinstMedium.copyWith(fontSize: 13),
                          ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                border: Border.all(width: 1, color: ColorResources.ditedTex5)),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Container(
                    height: 40,
                    width: 40,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: ColorResources.ditedTex5,
                    ),
                    child: Text(
                      "D ",
                      style: poppinstMedium.copyWith(
                          fontSize: 16, color: Colors.white),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: isEditing
                        ? TextField(
                            controller: friday6Controller,
                            style: poppinstMedium.copyWith(fontSize: 13),
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintStyle: TextStyle(fontSize: 13),
                            ),
                          )
                        : Text(
                            "$dinner",
                            style: poppinstMedium.copyWith(fontSize: 13),
                          ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 15,
          ),
        ],
      ),
    );
  }

  Widget _saturdaysss(String day, String em, String breakfast,
      String midMorning, String lunch, String eveningTea, String dinner) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                border: Border.all(width: 1, color: ColorResources.ditedText)),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Container(
                    height: 40,
                    width: 40,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: ColorResources.ditedText,
                    ),
                    child: Text(
                      "E/m",
                      style: poppinstMedium.copyWith(
                          fontSize: 16, color: Colors.white),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: isEditing
                        ? TextField(
                            controller: saturday1Controller,
                            style: poppinstMedium.copyWith(fontSize: 13),
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: '$breakfast',
                              hintStyle: TextStyle(fontSize: 13),
                            ),
                          )
                        : Text(
                            "$em",
                            style: poppinstMedium.copyWith(fontSize: 13),
                          ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                border: Border.all(width: 1, color: ColorResources.ditedText1)),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Container(
                    height: 40,
                    width: 40,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: ColorResources.ditedText1,
                    ),
                    child: Text(
                      "B/f",
                      style: poppinstMedium.copyWith(
                          fontSize: 16, color: Colors.white),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: isEditing
                        ? TextField(
                            controller: saturday2Controller,
                            style: poppinstMedium.copyWith(fontSize: 13),
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: '$breakfast',
                              hintStyle: TextStyle(fontSize: 13),
                            ),
                          )
                        : Text(
                            "$breakfast",
                            style: poppinstMedium.copyWith(fontSize: 13),
                          ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                border: Border.all(width: 1, color: ColorResources.ditedText2)),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Container(
                    height: 40,
                    width: 40,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: ColorResources.ditedText2,
                    ),
                    child: Text(
                      "M/m",
                      style: poppinstMedium.copyWith(
                          fontSize: 14, color: Colors.white),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: isEditing
                        ? TextField(
                            controller: saturday3Controller,
                            style: poppinstMedium.copyWith(fontSize: 13),
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintStyle: TextStyle(fontSize: 13),
                            ),
                          )
                        : Text(
                            "$midMorning",
                            style: poppinstMedium.copyWith(fontSize: 13),
                          ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                border: Border.all(width: 1, color: ColorResources.ditedText3)),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Container(
                    height: 40,
                    width: 40,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: ColorResources.ditedText3,
                    ),
                    child: Text(
                      "L ",
                      style: poppinstMedium.copyWith(
                          fontSize: 16, color: Colors.white),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: isEditing
                        ? TextField(
                            controller: saturday4Controller,
                            style: poppinstMedium.copyWith(fontSize: 13),
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintStyle: TextStyle(fontSize: 13),
                            ),
                          )
                        : Text(
                            "$lunch",
                            style: poppinstMedium.copyWith(fontSize: 13),
                          ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                border: Border.all(width: 1, color: ColorResources.ditedTex4)),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Container(
                    height: 40,
                    width: 40,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: ColorResources.ditedTex4,
                    ),
                    child: Text(
                      "E",
                      style: poppinstMedium.copyWith(
                          fontSize: 16, color: Colors.white),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: isEditing
                        ? TextField(
                            controller: saturday5Controller,
                            style: poppinstMedium.copyWith(fontSize: 13),
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintStyle: TextStyle(fontSize: 13),
                            ),
                          )
                        : Text(
                            "$eveningTea",
                            style: poppinstMedium.copyWith(fontSize: 13),
                          ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                border: Border.all(width: 1, color: ColorResources.ditedTex5)),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Container(
                    height: 40,
                    width: 40,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: ColorResources.ditedTex5,
                    ),
                    child: Text(
                      "D ",
                      style: poppinstMedium.copyWith(
                          fontSize: 16, color: Colors.white),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: isEditing
                        ? TextField(
                            controller: saturday6Controller,
                            style: poppinstMedium.copyWith(fontSize: 13),
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintStyle: TextStyle(fontSize: 13),
                            ),
                          )
                        : Text(
                            "$dinner",
                            style: poppinstMedium.copyWith(fontSize: 13),
                          ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 15,
          ),
        ],
      ),
    );
  }

//////=-=--=-==-=-==-=-=-=-=-=-==-=-=-=-=--=-=--=-=-=-
  Widget _speciallbuildDayCard(String day, String em, String breakfast,
      String midMorning, String lunch, String eveningTea, String dinner) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                border: Border.all(width: 1, color: ColorResources.ditedText)),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Container(
                    height: 40,
                    width: 40,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: ColorResources.ditedText,
                    ),
                    child: Text(
                      "E/m",
                      style: poppinstMedium.copyWith(
                          fontSize: 16, color: Colors.white),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: isEditing22
                        ? TextField(
                            controller: sepsunday1Controller,
                            style: poppinstMedium.copyWith(fontSize: 13),
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintStyle: TextStyle(fontSize: 13),
                            ),
                          )
                        : Text(
                            "$em",
                            style: poppinstMedium.copyWith(fontSize: 13),
                          ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                border: Border.all(width: 1, color: ColorResources.ditedText1)),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Container(
                    height: 40,
                    width: 40,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: ColorResources.ditedText1,
                    ),
                    child: Text(
                      "B/f",
                      style: poppinstMedium.copyWith(
                          fontSize: 16, color: Colors.white),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: isEditing22
                        ? TextField(
                            controller: sepsunday2Controller,
                            style: poppinstMedium.copyWith(fontSize: 13),
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintStyle: TextStyle(fontSize: 13),
                            ),
                          )
                        : Text(
                            "$breakfast",
                            style: poppinstMedium.copyWith(fontSize: 13),
                          ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                border: Border.all(width: 1, color: ColorResources.ditedText2)),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Container(
                    height: 40,
                    width: 40,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: ColorResources.ditedText2,
                    ),
                    child: Text(
                      "M/m",
                      style: poppinstMedium.copyWith(
                          fontSize: 14, color: Colors.white),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: isEditing22
                        ? TextField(
                            controller: sepsunday3Controller,
                            style: poppinstMedium.copyWith(fontSize: 13),
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintStyle: TextStyle(fontSize: 13),
                            ),
                          )
                        : Text(
                            "$midMorning",
                            style: poppinstMedium.copyWith(fontSize: 13),
                          ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                border: Border.all(width: 1, color: ColorResources.ditedText3)),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Container(
                    height: 40,
                    width: 40,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: ColorResources.ditedText3,
                    ),
                    child: Text(
                      "L ",
                      style: poppinstMedium.copyWith(
                          fontSize: 16, color: Colors.white),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: isEditing22
                        ? TextField(
                            controller: sepsunday4Controller,
                            style: poppinstMedium.copyWith(fontSize: 13),
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintStyle: TextStyle(fontSize: 13),
                            ),
                          )
                        : Text(
                            "$lunch",
                            style: poppinstMedium.copyWith(fontSize: 13),
                          ),
                  ),
                  // Expanded(
                  //   child: Container(
                  //     child: Text(
                  //       "$lunch",
                  //       style: poppinstMedium.copyWith(height: 1, fontSize: 13),
                  //     ),
                  //   ),
                  // )
                ],
              ),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                border: Border.all(width: 1, color: ColorResources.ditedTex4)),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Container(
                    height: 40,
                    width: 40,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: ColorResources.ditedTex4,
                    ),
                    child: Text(
                      "E",
                      style: poppinstMedium.copyWith(
                          fontSize: 16, color: Colors.white),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: isEditing22
                        ? TextField(
                            controller: sepsunday5Controller,
                            style: poppinstMedium.copyWith(fontSize: 13),
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintStyle: TextStyle(fontSize: 13),
                            ),
                          )
                        : Text(
                            "$eveningTea",
                            style: poppinstMedium.copyWith(fontSize: 13),
                          ),
                  ),
                  // Expanded(
                  //   child: Container(
                  //     child: Text(
                  //       "$eveningTea",
                  //       style: poppinstMedium.copyWith(height: 1, fontSize: 13),
                  //     ),
                  //   ),
                  // )
                ],
              ),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                border: Border.all(width: 1, color: ColorResources.ditedTex5)),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Container(
                    height: 40,
                    width: 40,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: ColorResources.ditedTex5,
                    ),
                    child: Text(
                      "D ",
                      style: poppinstMedium.copyWith(
                          fontSize: 16, color: Colors.white),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: isEditing22
                        ? TextField(
                            controller: sepsunday6Controller,
                            style: poppinstMedium.copyWith(fontSize: 13),
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintStyle: TextStyle(fontSize: 13),
                            ),
                          )
                        : Text(
                            "$dinner",
                            style: poppinstMedium.copyWith(fontSize: 13),
                          ),
                  ),
                  // Expanded(
                  //   child: Container(
                  //     child: Text(
                  //       "$dinner",
                  //       style: poppinstMedium.copyWith(fontSize: 13, height: 1),
                  //     ),
                  //   ),
                  // )
                ],
              ),
            ),
          ),
          SizedBox(
            height: 15,
          ),
        ],
      ),
    );
  }

  Widget _mondayyyyspecial(String day, String em, String breakfast,
      String midMorning, String lunch, String eveningTea, String dinner) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                border: Border.all(width: 1, color: ColorResources.ditedText)),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Container(
                    height: 40,
                    width: 40,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: ColorResources.ditedText,
                    ),
                    child: Text(
                      "E/m",
                      style: poppinstMedium.copyWith(
                          fontSize: 16, color: Colors.white),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: isEditing22
                        ? TextField(
                            controller: sepmonday1Controller,
                            style: poppinstMedium.copyWith(fontSize: 13),
                            decoration: InputDecoration(
                              border: InputBorder.none,
                            ),
                          )
                        : Text(
                            "$em",
                            style: poppinstMedium.copyWith(fontSize: 13),
                          ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                border: Border.all(width: 1, color: ColorResources.ditedText1)),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Container(
                    height: 40,
                    width: 40,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: ColorResources.ditedText1,
                    ),
                    child: Text(
                      "B/f",
                      style: poppinstMedium.copyWith(
                          fontSize: 16, color: Colors.white),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: isEditing22
                        ? TextField(
                            controller: sepmonday2Controller,
                            style: poppinstMedium.copyWith(fontSize: 13),
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintStyle: TextStyle(fontSize: 13),
                            ),
                          )
                        : Text(
                            "$breakfast",
                            style: poppinstMedium.copyWith(fontSize: 13),
                          ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                border: Border.all(width: 1, color: ColorResources.ditedText2)),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Container(
                    height: 40,
                    width: 40,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: ColorResources.ditedText2,
                    ),
                    child: Text(
                      "M/m",
                      style: poppinstMedium.copyWith(
                          fontSize: 14, color: Colors.white),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: isEditing22
                        ? TextField(
                            controller: sepmonday3Controller,
                            style: poppinstMedium.copyWith(fontSize: 13),
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintStyle: TextStyle(fontSize: 13),
                            ),
                          )
                        : Text(
                            "$midMorning",
                            style: poppinstMedium.copyWith(fontSize: 13),
                          ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                border: Border.all(width: 1, color: ColorResources.ditedText3)),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Container(
                    height: 40,
                    width: 40,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: ColorResources.ditedText3,
                    ),
                    child: Text(
                      "L ",
                      style: poppinstMedium.copyWith(
                          fontSize: 16, color: Colors.white),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: isEditing22
                        ? TextField(
                            controller: sepmonday4Controller,
                            style: poppinstMedium.copyWith(fontSize: 13),
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintStyle: TextStyle(fontSize: 13),
                            ),
                          )
                        : Text(
                            "$lunch",
                            style: poppinstMedium.copyWith(fontSize: 13),
                          ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                border: Border.all(width: 1, color: ColorResources.ditedTex4)),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Container(
                    height: 40,
                    width: 40,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: ColorResources.ditedTex4,
                    ),
                    child: Text(
                      "E",
                      style: poppinstMedium.copyWith(
                          fontSize: 16, color: Colors.white),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: isEditing22
                        ? TextField(
                            controller: sepmonday5Controller,
                            style: poppinstMedium.copyWith(fontSize: 13),
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintStyle: TextStyle(fontSize: 13),
                            ),
                          )
                        : Text(
                            "$eveningTea",
                            style: poppinstMedium.copyWith(fontSize: 13),
                          ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                border: Border.all(width: 1, color: ColorResources.ditedTex5)),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Container(
                    height: 40,
                    width: 40,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: ColorResources.ditedTex5,
                    ),
                    child: Text(
                      "D ",
                      style: poppinstMedium.copyWith(
                          fontSize: 16, color: Colors.white),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: isEditing22
                        ? TextField(
                            controller: sepmonday6Controller,
                            style: poppinstMedium.copyWith(fontSize: 13),
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintStyle: TextStyle(fontSize: 13),
                            ),
                          )
                        : Text(
                            "$dinner",
                            style: poppinstMedium.copyWith(fontSize: 13),
                          ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 15,
          ),
        ],
      ),
    );
  }

  Widget _tuesdayssspecial(String day, String em, String breakfast,
      String midMorning, String lunch, String eveningTea, String dinner) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                border: Border.all(width: 1, color: ColorResources.ditedText)),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Container(
                    height: 40,
                    width: 40,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: ColorResources.ditedText,
                    ),
                    child: Text(
                      "E/m",
                      style: poppinstMedium.copyWith(
                          fontSize: 16, color: Colors.white),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: isEditing22
                        ? TextField(
                            controller: septuesday1Controller,
                            style: poppinstMedium.copyWith(fontSize: 13),
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: '$breakfast',
                              hintStyle: TextStyle(fontSize: 13),
                            ),
                          )
                        : Text(
                            "$em",
                            style: poppinstMedium.copyWith(fontSize: 13),
                          ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                border: Border.all(width: 1, color: ColorResources.ditedText1)),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Container(
                    height: 40,
                    width: 40,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: ColorResources.ditedText1,
                    ),
                    child: Text(
                      "B/f",
                      style: poppinstMedium.copyWith(
                          fontSize: 16, color: Colors.white),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: isEditing22
                        ? TextField(
                            controller: septuesday2Controller,
                            style: poppinstMedium.copyWith(fontSize: 13),
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: '$breakfast',
                              hintStyle: TextStyle(fontSize: 13),
                            ),
                          )
                        : Text(
                            "$em",
                            style: poppinstMedium.copyWith(fontSize: 13),
                          ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                border: Border.all(width: 1, color: ColorResources.ditedText2)),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Container(
                    height: 40,
                    width: 40,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: ColorResources.ditedText2,
                    ),
                    child: Text(
                      "M/m",
                      style: poppinstMedium.copyWith(
                          fontSize: 14, color: Colors.white),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: isEditing22
                        ? TextField(
                            controller: septuesday3Controller,
                            style: poppinstMedium.copyWith(fontSize: 13),
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintStyle: TextStyle(fontSize: 13),
                            ),
                          )
                        : Text(
                            "$midMorning",
                            style: poppinstMedium.copyWith(fontSize: 13),
                          ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                border: Border.all(width: 1, color: ColorResources.ditedText3)),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Container(
                    height: 40,
                    width: 40,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: ColorResources.ditedText3,
                    ),
                    child: Text(
                      "L ",
                      style: poppinstMedium.copyWith(
                          fontSize: 16, color: Colors.white),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: isEditing22
                        ? TextField(
                            controller: septuesday4Controller,
                            style: poppinstMedium.copyWith(fontSize: 13),
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintStyle: TextStyle(fontSize: 13),
                            ),
                          )
                        : Text(
                            "$lunch",
                            style: poppinstMedium.copyWith(fontSize: 13),
                          ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                border: Border.all(width: 1, color: ColorResources.ditedTex4)),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Container(
                    height: 40,
                    width: 40,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: ColorResources.ditedTex4,
                    ),
                    child: Text(
                      "E",
                      style: poppinstMedium.copyWith(
                          fontSize: 16, color: Colors.white),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: isEditing22
                        ? TextField(
                            controller: septuesday5Controller,
                            style: poppinstMedium.copyWith(fontSize: 13),
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintStyle: TextStyle(fontSize: 13),
                            ),
                          )
                        : Text(
                            "$eveningTea",
                            style: poppinstMedium.copyWith(fontSize: 13),
                          ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                border: Border.all(width: 1, color: ColorResources.ditedTex5)),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Container(
                    height: 40,
                    width: 40,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: ColorResources.ditedTex5,
                    ),
                    child: Text(
                      "D ",
                      style: poppinstMedium.copyWith(
                          fontSize: 16, color: Colors.white),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: isEditing22
                        ? TextField(
                            controller: septuesday6Controller,
                            style: poppinstMedium.copyWith(fontSize: 13),
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintStyle: TextStyle(fontSize: 13),
                            ),
                          )
                        : Text(
                            "$dinner",
                            style: poppinstMedium.copyWith(fontSize: 13),
                          ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 15,
          ),
        ],
      ),
    );
  }

  Widget _wednesdayaasepecial(String day, String em, String breakfast,
      String midMorning, String lunch, String eveningTea, String dinner) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                border: Border.all(width: 1, color: ColorResources.ditedText)),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Container(
                    height: 40,
                    width: 40,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: ColorResources.ditedText,
                    ),
                    child: Text(
                      "E/m",
                      style: poppinstMedium.copyWith(
                          fontSize: 16, color: Colors.white),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: isEditing22
                        ? TextField(
                            controller: sepwenesday1Controller,
                            style: poppinstMedium.copyWith(fontSize: 13),
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: '$breakfast',
                              hintStyle: TextStyle(fontSize: 13),
                            ),
                          )
                        : Text(
                            "$em",
                            style: poppinstMedium.copyWith(fontSize: 13),
                          ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                border: Border.all(width: 1, color: ColorResources.ditedText1)),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Container(
                    height: 40,
                    width: 40,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: ColorResources.ditedText1,
                    ),
                    child: Text(
                      "B/f",
                      style: poppinstMedium.copyWith(
                          fontSize: 16, color: Colors.white),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: isEditing22
                        ? TextField(
                            controller: sepwensday2Controller,
                            style: poppinstMedium.copyWith(fontSize: 13),
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: '$em',
                              hintStyle: TextStyle(fontSize: 13),
                            ),
                          )
                        : Text(
                            "$breakfast",
                            style: poppinstMedium.copyWith(fontSize: 13),
                          ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                border: Border.all(width: 1, color: ColorResources.ditedText2)),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Container(
                    height: 40,
                    width: 40,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: ColorResources.ditedText2,
                    ),
                    child: Text(
                      "M/m",
                      style: poppinstMedium.copyWith(
                          fontSize: 14, color: Colors.white),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: isEditing22
                        ? TextField(
                            controller: sepwensday3Controller,
                            style: poppinstMedium.copyWith(fontSize: 13),
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintStyle: TextStyle(fontSize: 13),
                            ),
                          )
                        : Text(
                            "$midMorning",
                            style: poppinstMedium.copyWith(fontSize: 13),
                          ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                border: Border.all(width: 1, color: ColorResources.ditedText3)),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Container(
                    height: 40,
                    width: 40,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: ColorResources.ditedText3,
                    ),
                    child: Text(
                      "L ",
                      style: poppinstMedium.copyWith(
                          fontSize: 16, color: Colors.white),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: isEditing22
                        ? TextField(
                            controller: sepwensday4Controller,
                            style: poppinstMedium.copyWith(fontSize: 13),
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintStyle: TextStyle(fontSize: 13),
                            ),
                          )
                        : Text(
                            "$lunch",
                            style: poppinstMedium.copyWith(fontSize: 13),
                          ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                border: Border.all(width: 1, color: ColorResources.ditedTex4)),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Container(
                    height: 40,
                    width: 40,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: ColorResources.ditedTex4,
                    ),
                    child: Text(
                      "E",
                      style: poppinstMedium.copyWith(
                          fontSize: 16, color: Colors.white),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: isEditing22
                        ? TextField(
                            controller: sepwensday5Controller,
                            style: poppinstMedium.copyWith(fontSize: 13),
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintStyle: TextStyle(fontSize: 13),
                            ),
                          )
                        : Text(
                            "$eveningTea",
                            style: poppinstMedium.copyWith(fontSize: 13),
                          ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                border: Border.all(width: 1, color: ColorResources.ditedTex5)),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Container(
                    height: 40,
                    width: 40,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: ColorResources.ditedTex5,
                    ),
                    child: Text(
                      "D ",
                      style: poppinstMedium.copyWith(
                          fontSize: 16, color: Colors.white),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: isEditing22
                        ? TextField(
                            controller: sepwensday6Controller,
                            style: poppinstMedium.copyWith(fontSize: 13),
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintStyle: TextStyle(fontSize: 13),
                            ),
                          )
                        : Text(
                            "$dinner",
                            style: poppinstMedium.copyWith(fontSize: 13),
                          ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 15,
          ),
        ],
      ),
    );
  }

  Widget _thuredaaaaaspecail(String day, String em, String breakfast,
      String midMorning, String lunch, String eveningTea, String dinner) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                border: Border.all(width: 1, color: ColorResources.ditedText)),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Container(
                    height: 40,
                    width: 40,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: ColorResources.ditedText,
                    ),
                    child: Text(
                      "E/m",
                      style: poppinstMedium.copyWith(
                          fontSize: 16, color: Colors.white),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: isEditing22
                        ? TextField(
                            controller: septhuesday1Controller,
                            style: poppinstMedium.copyWith(fontSize: 13),
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintStyle: TextStyle(fontSize: 13),
                            ),
                          )
                        : Text(
                            "$em",
                            style: poppinstMedium.copyWith(fontSize: 13),
                          ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                border: Border.all(width: 1, color: ColorResources.ditedText1)),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Container(
                    height: 40,
                    width: 40,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: ColorResources.ditedText1,
                    ),
                    child: Text(
                      "B/f",
                      style: poppinstMedium.copyWith(
                          fontSize: 16, color: Colors.white),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: isEditing22
                        ? TextField(
                            controller: septhuesday2Controller,
                            style: poppinstMedium.copyWith(fontSize: 13),
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintStyle: TextStyle(fontSize: 13),
                            ),
                          )
                        : Text(
                            "$breakfast",
                            style: poppinstMedium.copyWith(fontSize: 13),
                          ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                border: Border.all(width: 1, color: ColorResources.ditedText2)),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Container(
                    height: 40,
                    width: 40,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: ColorResources.ditedText2,
                    ),
                    child: Text(
                      "M/m",
                      style: poppinstMedium.copyWith(
                          fontSize: 14, color: Colors.white),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: isEditing22
                        ? TextField(
                            controller: septhuesday3Controller,
                            style: poppinstMedium.copyWith(fontSize: 13),
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintStyle: TextStyle(fontSize: 13),
                            ),
                          )
                        : Text(
                            "$midMorning",
                            style: poppinstMedium.copyWith(fontSize: 13),
                          ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                border: Border.all(width: 1, color: ColorResources.ditedText3)),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Container(
                    height: 40,
                    width: 40,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: ColorResources.ditedText3,
                    ),
                    child: Text(
                      "L ",
                      style: poppinstMedium.copyWith(
                          fontSize: 16, color: Colors.white),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: isEditing22
                        ? TextField(
                            controller: septhueday4Controller,
                            style: poppinstMedium.copyWith(fontSize: 13),
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintStyle: TextStyle(fontSize: 13),
                            ),
                          )
                        : Text(
                            "$lunch",
                            style: poppinstMedium.copyWith(fontSize: 13),
                          ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                border: Border.all(width: 1, color: ColorResources.ditedTex4)),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Container(
                    height: 40,
                    width: 40,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: ColorResources.ditedTex4,
                    ),
                    child: Text(
                      "E",
                      style: poppinstMedium.copyWith(
                          fontSize: 16, color: Colors.white),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: isEditing22
                        ? TextField(
                            controller: septhuesday5Controller,
                            style: poppinstMedium.copyWith(fontSize: 13),
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintStyle: TextStyle(fontSize: 13),
                            ),
                          )
                        : Text(
                            "$eveningTea",
                            style: poppinstMedium.copyWith(fontSize: 13),
                          ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                border: Border.all(width: 1, color: ColorResources.ditedTex5)),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Container(
                    height: 40,
                    width: 40,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: ColorResources.ditedTex5,
                    ),
                    child: Text(
                      "D ",
                      style: poppinstMedium.copyWith(
                          fontSize: 16, color: Colors.white),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: isEditing22
                        ? TextField(
                            controller: septhuesday6Controller,
                            style: poppinstMedium.copyWith(fontSize: 13),
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintStyle: TextStyle(fontSize: 13),
                            ),
                          )
                        : Text(
                            "$dinner",
                            style: poppinstMedium.copyWith(fontSize: 13),
                          ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 15,
          ),
        ],
      ),
    );
  }

  Widget _fridayssssspecail(String day, String em, String breakfast,
      String midMorning, String lunch, String eveningTea, String dinner) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                border: Border.all(width: 1, color: ColorResources.ditedText)),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Container(
                    height: 40,
                    width: 40,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: ColorResources.ditedText,
                    ),
                    child: Text(
                      "E/m",
                      style: poppinstMedium.copyWith(
                          fontSize: 16, color: Colors.white),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: isEditing22
                        ? TextField(
                            controller: sepfriday1Controller,
                            style: poppinstMedium.copyWith(fontSize: 13),
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintStyle: TextStyle(fontSize: 13),
                            ),
                          )
                        : Text(
                            "$em",
                            style: poppinstMedium.copyWith(fontSize: 13),
                          ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                border: Border.all(width: 1, color: ColorResources.ditedText1)),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Container(
                    height: 40,
                    width: 40,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: ColorResources.ditedText1,
                    ),
                    child: Text(
                      "B/f",
                      style: poppinstMedium.copyWith(
                          fontSize: 16, color: Colors.white),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: isEditing22
                        ? TextField(
                            controller: sepfriday2Controller,
                            style: poppinstMedium.copyWith(fontSize: 13),
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintStyle: TextStyle(fontSize: 13),
                            ),
                          )
                        : Text(
                            "$breakfast",
                            style: poppinstMedium.copyWith(fontSize: 13),
                          ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                border: Border.all(width: 1, color: ColorResources.ditedText2)),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Container(
                    height: 40,
                    width: 40,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: ColorResources.ditedText2,
                    ),
                    child: Text(
                      "M/m",
                      style: poppinstMedium.copyWith(
                          fontSize: 14, color: Colors.white),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: isEditing22
                        ? TextField(
                            controller: sepfriday3Controller,
                            style: poppinstMedium.copyWith(fontSize: 13),
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintStyle: TextStyle(fontSize: 13),
                            ),
                          )
                        : Text(
                            "$midMorning",
                            style: poppinstMedium.copyWith(fontSize: 13),
                          ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                border: Border.all(width: 1, color: ColorResources.ditedText3)),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Container(
                    height: 40,
                    width: 40,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: ColorResources.ditedText3,
                    ),
                    child: Text(
                      "L ",
                      style: poppinstMedium.copyWith(
                          fontSize: 16, color: Colors.white),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: isEditing22
                        ? TextField(
                            controller: sepfriday4Controller,
                            style: poppinstMedium.copyWith(fontSize: 13),
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintStyle: TextStyle(fontSize: 13),
                            ),
                          )
                        : Text(
                            "$lunch",
                            style: poppinstMedium.copyWith(fontSize: 13),
                          ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                border: Border.all(width: 1, color: ColorResources.ditedTex4)),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Container(
                    height: 40,
                    width: 40,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: ColorResources.ditedTex4,
                    ),
                    child: Text(
                      "E",
                      style: poppinstMedium.copyWith(
                          fontSize: 16, color: Colors.white),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: isEditing22
                        ? TextField(
                            controller: sepfriday5Controller,
                            style: poppinstMedium.copyWith(fontSize: 13),
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintStyle: TextStyle(fontSize: 13),
                            ),
                          )
                        : Text(
                            "$eveningTea",
                            style: poppinstMedium.copyWith(fontSize: 13),
                          ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                border: Border.all(width: 1, color: ColorResources.ditedTex5)),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Container(
                    height: 40,
                    width: 40,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: ColorResources.ditedTex5,
                    ),
                    child: Text(
                      "D ",
                      style: poppinstMedium.copyWith(
                          fontSize: 16, color: Colors.white),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: isEditing22
                        ? TextField(
                            controller: sepfriday6Controller,
                            style: poppinstMedium.copyWith(fontSize: 13),
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintStyle: TextStyle(fontSize: 13),
                            ),
                          )
                        : Text(
                            "$dinner",
                            style: poppinstMedium.copyWith(fontSize: 13),
                          ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 15,
          ),
        ],
      ),
    );
  }

  Widget _saturdayssssep(String day, String em, String breakfast,
      String midMorning, String lunch, String eveningTea, String dinner) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                border: Border.all(width: 1, color: ColorResources.ditedText)),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Container(
                    height: 40,
                    width: 40,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: ColorResources.ditedText,
                    ),
                    child: Text(
                      "E/m",
                      style: poppinstMedium.copyWith(
                          fontSize: 16, color: Colors.white),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: isEditing22
                        ? TextField(
                            controller: sepsaturday1Controller,
                            style: poppinstMedium.copyWith(fontSize: 13),
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: '$breakfast',
                              hintStyle: TextStyle(fontSize: 13),
                            ),
                          )
                        : Text(
                            "$em",
                            style: poppinstMedium.copyWith(fontSize: 13),
                          ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                border: Border.all(width: 1, color: ColorResources.ditedText1)),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Container(
                    height: 40,
                    width: 40,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: ColorResources.ditedText1,
                    ),
                    child: Text(
                      "B/f",
                      style: poppinstMedium.copyWith(
                          fontSize: 16, color: Colors.white),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: isEditing22
                        ? TextField(
                            controller: sepsaturday2Controller,
                            style: poppinstMedium.copyWith(fontSize: 13),
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: '$breakfast',
                              hintStyle: TextStyle(fontSize: 13),
                            ),
                          )
                        : Text(
                            "$breakfast",
                            style: poppinstMedium.copyWith(fontSize: 13),
                          ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                border: Border.all(width: 1, color: ColorResources.ditedText2)),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Container(
                    height: 40,
                    width: 40,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: ColorResources.ditedText2,
                    ),
                    child: Text(
                      "M/m",
                      style: poppinstMedium.copyWith(
                          fontSize: 14, color: Colors.white),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: isEditing22
                        ? TextField(
                            controller: sepsaturday3Controller,
                            style: poppinstMedium.copyWith(fontSize: 13),
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintStyle: TextStyle(fontSize: 13),
                            ),
                          )
                        : Text(
                            "$midMorning",
                            style: poppinstMedium.copyWith(fontSize: 13),
                          ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                border: Border.all(width: 1, color: ColorResources.ditedText3)),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Container(
                    height: 40,
                    width: 40,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: ColorResources.ditedText3,
                    ),
                    child: Text(
                      "L ",
                      style: poppinstMedium.copyWith(
                          fontSize: 16, color: Colors.white),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: isEditing22
                        ? TextField(
                            controller: sepsaturday4Controller,
                            style: poppinstMedium.copyWith(fontSize: 13),
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintStyle: TextStyle(fontSize: 13),
                            ),
                          )
                        : Text(
                            "$lunch",
                            style: poppinstMedium.copyWith(fontSize: 13),
                          ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                border: Border.all(width: 1, color: ColorResources.ditedTex4)),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Container(
                    height: 40,
                    width: 40,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: ColorResources.ditedTex4,
                    ),
                    child: Text(
                      "E",
                      style: poppinstMedium.copyWith(
                          fontSize: 16, color: Colors.white),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: isEditing22
                        ? TextField(
                            controller: sepsaturday5Controller,
                            style: poppinstMedium.copyWith(fontSize: 13),
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintStyle: TextStyle(fontSize: 13),
                            ),
                          )
                        : Text(
                            "$eveningTea",
                            style: poppinstMedium.copyWith(fontSize: 13),
                          ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                border: Border.all(width: 1, color: ColorResources.ditedTex5)),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Container(
                    height: 40,
                    width: 40,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: ColorResources.ditedTex5,
                    ),
                    child: Text(
                      "D ",
                      style: poppinstMedium.copyWith(
                          fontSize: 16, color: Colors.white),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: isEditing22
                        ? TextField(
                            controller: sepsaturday6Controller,
                            style: poppinstMedium.copyWith(fontSize: 13),
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintStyle: TextStyle(fontSize: 13),
                            ),
                          )
                        : Text(
                            "$dinner",
                            style: poppinstMedium.copyWith(fontSize: 13),
                          ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 15,
          ),
        ],
      ),
    );
  }
}
