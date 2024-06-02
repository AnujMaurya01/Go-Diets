import 'dart:async';

import 'package:dietitian/controller/auth_controller.dart';
import 'package:dietitian/utils/app_constants.dart';
import 'package:dietitian/utils/colors.dart';
import 'package:dietitian/utils/style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

// ignore: must_be_immutable
class DoctorviewDietsScreen extends StatefulWidget {
  String? puseridd;
  String? templeteid;
  String? specialidd;
  DoctorviewDietsScreen(
      {super.key, this.puseridd, this.templeteid, this.specialidd});

  @override
  State<DoctorviewDietsScreen> createState() => _DoctorviewDietsScreenState();
}

class _DoctorviewDietsScreenState extends State<DoctorviewDietsScreen> {
  DateTime now = DateTime.now();
  String? weekNumber;
  final List<String> tasks = [
    "Monday",
    "Tuesday",
    "Wednesday",
    "Thursday",
    "Friday",
    "Saturday",
    "Sunday",
  ];
  List<Map<String, dynamic>>? filteredRoutine;
  int selectedIndex = 0;
  bool showLoader = true;

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
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(Duration(seconds: 1), () {
      setState(() {
        showLoader = false;
      });
    });
    weekNumber = getWeekNumber(now);
    weekendDay(weekNumber);
  }

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
    }
    if (weekNumber == AppConstants.saturday) {
      selectedIndex = 6;
    }
    if (weekNumber == AppConstants.sunday) {
      selectedIndex = 0;
    }
  }

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
                                    "Diet",
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
                            showLoader
                                ? Padding(
                                    padding: const EdgeInsets.only(top: 300),
                                    child:
                                        Center(child: CustomLoadingIndicator()),
                                  )
                                : Expanded(
                                    child: TabBarView(
                                      physics: NeverScrollableScrollPhysics(),
                                      children: [
                                        steponecontainer2(),
                                        steponecontainer2222()
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

  Widget steponecontainer2() {
    return Padding(
      padding: const EdgeInsets.only(left: 0.0, right: 0, top: 10),
      child: GetBuilder<AuthController>(builder: (logic) {
        return logic.viewweeklyyassing == null
            ? Padding(
                padding: const EdgeInsets.only(top: 00),
                child: Center(
                    child: Text(
                  'No Diet Assign!!',
                  style: poppinsSemiBold.copyWith(
                    fontSize: 15,
                    height: 1.2,
                    color: Colors.black,
                  ),
                )),
              )
            : Container(
                child: Column(
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
                                width:
                                    (MediaQuery.of(context).size.width - 60) /
                                        7,
                                child: Column(
                                  children: [
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Column(
                                      children: [
                                        Container(
                                          padding: const EdgeInsets.only(
                                              left: 3, right: 3),
                                          alignment: Alignment.center,
                                          child: Text(allDays[index],
                                              style: poppinsSemiBold.copyWith(
                                                  color: selectedIndex != index
                                                      ? Colors.black
                                                      : Colors.green,
                                                  fontSize: 13)),
                                        ),
                                        if (selectedIndex == index)
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
                    if (selectedIndex == 0) ...[
                      _buildDayCard(
                        'Sunday',
                        logic.viewweeklyyassing!['sunday_b_f'],
                        logic.viewweeklyyassing!['sunday_e_m'],
                        logic.viewweeklyyassing!['sunday_m_m'],
                        logic.viewweeklyyassing!['sunday_l'],
                        logic.viewweeklyyassing!['sunday_e'],
                        logic.viewweeklyyassing!['sunday_d'],
                      ),
                    ],
                    if (selectedIndex == 1) ...[
                      _buildDayCard(
                          'Monday',
                          logic.viewweeklyyassing!['monday_e_m'],
                          logic.viewweeklyyassing!['monday_b_f'],
                          logic.viewweeklyyassing!['monday_m_m'],
                          logic.viewweeklyyassing!['monday_l'],
                          logic.viewweeklyyassing!['monday_e'],
                          logic.viewweeklyyassing!['monday_d']),
                    ],
                    if (selectedIndex == 2) ...[
                      _buildDayCard(
                          'Tuesday',
                          logic.viewweeklyyassing!['tuesday_e_m'],
                          logic.viewweeklyyassing!['tuesday_b_f'],
                          logic.viewweeklyyassing!['tuesday_m_m'],
                          logic.viewweeklyyassing!['tuesday_l'],
                          logic.viewweeklyyassing!['tuesday_e'],
                          logic.viewweeklyyassing!['tuesday_d']),
                    ],
                    if (selectedIndex == 3) ...[
                      _buildDayCard(
                          'Wednesday',
                          logic.viewweeklyyassing!['wednesday_e_m'],
                          logic.viewweeklyyassing!['wednesday_b_f'],
                          logic.viewweeklyyassing!['wednesday_m_m'],
                          logic.viewweeklyyassing!['wednesday_l'],
                          logic.viewweeklyyassing!['wednesday_e'],
                          logic.viewweeklyyassing!['wednesday_d']),
                    ],
                    if (selectedIndex == 4) ...[
                      _buildDayCard(
                          'Thursday',
                          logic.viewweeklyyassing!['thursday_e_m'],
                          logic.viewweeklyyassing!['thursday_b_f'],
                          logic.viewweeklyyassing!['thursday_m_m'],
                          logic.viewweeklyyassing!['thursday_l'],
                          logic.viewweeklyyassing!['thursday_e'],
                          logic.viewweeklyyassing!['thursday_d']),
                    ],
                    if (selectedIndex == 5) ...[
                      _buildDayCard(
                          'Friday',
                          logic.viewweeklyyassing!['friday_e_m'],
                          logic.viewweeklyyassing!['friday_b_f'],
                          logic.viewweeklyyassing!['friday_m_m'],
                          logic.viewweeklyyassing!['friday_l'],
                          logic.viewweeklyyassing!['friday_e'],
                          logic.viewweeklyyassing!['friday_d']),
                    ],
                    if (selectedIndex == 6) ...[
                      _buildDayCard(
                          'Saturday',
                          logic.viewweeklyyassing!['saturday_e_m'],
                          logic.viewweeklyyassing!['saturday_b_f'],
                          logic.viewweeklyyassing!['saturday_m_m'],
                          logic.viewweeklyyassing!['saturday_l'],
                          logic.viewweeklyyassing!['saturday_e'],
                          logic.viewweeklyyassing!['saturday_d']),
                    ],
                  ],
                ),
              );
      }),
    );
  }

  Widget steponecontainer2222() {
    return Padding(
      padding: const EdgeInsets.only(left: 0.0, right: 0, top: 10),
      child: GetBuilder<AuthController>(builder: (logic) {
        return logic.specailviewdetss == null
            ? Padding(
                padding: const EdgeInsets.only(top: 00),
                child: Center(
                    child: Text(
                  'No Diet Assign!!',
                  style: poppinsSemiBold.copyWith(
                    fontSize: 15,
                    height: 1.2,
                    color: Colors.black,
                  ),
                )),
              )
            : Container(
                child: Column(
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
                                width:
                                    (MediaQuery.of(context).size.width - 60) /
                                        7,
                                child: Column(
                                  children: [
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Column(
                                      children: [
                                        Container(
                                          padding: const EdgeInsets.only(
                                              left: 3, right: 3),
                                          alignment: Alignment.center,
                                          child: Text(allDays[index],
                                              style: poppinsSemiBold.copyWith(
                                                  color: selectedIndex != index
                                                      ? Colors.black
                                                      : Colors.green,
                                                  fontSize: 13)),
                                        ),
                                        if (selectedIndex == index)
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
                    if (selectedIndex == 0) ...[
                      _buildDayCard(
                        'Sunday',
                        logic.specailviewdetss!['sunday_b_f'],
                        logic.specailviewdetss!['sunday_e_m'],
                        logic.specailviewdetss!['sunday_m_m'],
                        logic.specailviewdetss!['sunday_l'],
                        logic.specailviewdetss!['sunday_e'],
                        logic.specailviewdetss!['sunday_d'],
                      ),
                    ],
                    if (selectedIndex == 1) ...[
                      _buildDayCard(
                          'Monday',
                          logic.specailviewdetss!['sunday_b_f'],
                          logic.specailviewdetss!['monday_b_f'],
                          logic.specailviewdetss!['monday_m_m'],
                          logic.specailviewdetss!['monday_l'],
                          logic.specailviewdetss!['monday_e'],
                          logic.specailviewdetss!['monday_d']),
                    ],
                    if (selectedIndex == 2) ...[
                      _buildDayCard(
                          'Tuesday',
                          logic.specailviewdetss!['sunday_b_f'],
                          logic.specailviewdetss!['tuesday_b_f'],
                          logic.specailviewdetss!['tuesday_m_m'],
                          logic.specailviewdetss!['tuesday_l'],
                          logic.specailviewdetss!['tuesday_e'],
                          logic.specailviewdetss!['tuesday_d']),
                    ],
                    if (selectedIndex == 3) ...[
                      _buildDayCard(
                          'Wednesday',
                          logic.specailviewdetss!['sunday_b_f'],
                          logic.specailviewdetss!['wednesday_b_f'],
                          logic.specailviewdetss!['wednesday_m_m'],
                          logic.specailviewdetss!['wednesday_l'],
                          logic.specailviewdetss!['wednesday_e'],
                          logic.specailviewdetss!['wednesday_d']),
                    ],
                    if (selectedIndex == 4) ...[
                      _buildDayCard(
                          'Thursday',
                          logic.specailviewdetss!['sunday_b_f'],
                          logic.specailviewdetss!['thursday_b_f'],
                          logic.specailviewdetss!['thursday_m_m'],
                          logic.specailviewdetss!['thursday_l'],
                          logic.specailviewdetss!['thursday_e'],
                          logic.specailviewdetss!['thursday_d']),
                    ],
                    if (selectedIndex == 5) ...[
                      _buildDayCard(
                          'Friday',
                          logic.specailviewdetss!['sunday_b_f'],
                          logic.specailviewdetss!['friday_b_f'],
                          logic.specailviewdetss!['friday_m_m'],
                          logic.specailviewdetss!['friday_l'],
                          logic.specailviewdetss!['friday_e'],
                          logic.specailviewdetss!['friday_d']),
                    ],
                    if (selectedIndex == 6) ...[
                      _buildDayCard(
                          'Saturday',
                          logic.specailviewdetss!['sunday_b_f'],
                          logic.specailviewdetss!['saturday_b_f'],
                          logic.specailviewdetss!['saturday_m_m'],
                          logic.specailviewdetss!['saturday_l'],
                          logic.specailviewdetss!['saturday_e'],
                          logic.specailviewdetss!['saturday_d']),
                    ],
                  ],
                ),
              );
      }),
    );
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
                  Container(
                    child: Text(
                      "$em",
                      style: poppinstMedium.copyWith(fontSize: 13),
                    ),
                  )
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
                    child: Container(
                      child: Text(
                        "$breakfast",
                        style: poppinstMedium.copyWith(height: 1, fontSize: 13),
                      ),
                    ),
                  )
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
                    child: Container(
                      child: Text(
                        "$midMorning",
                        style: poppinstMedium.copyWith(height: 1, fontSize: 13),
                      ),
                    ),
                  )
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
                    child: Container(
                      child: Text(
                        "$lunch",
                        style: poppinstMedium.copyWith(height: 1, fontSize: 13),
                      ),
                    ),
                  )
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
                    child: Container(
                      child: Text(
                        "$eveningTea",
                        style: poppinstMedium.copyWith(height: 1, fontSize: 13),
                      ),
                    ),
                  )
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
                    child: Container(
                      child: Text(
                        "$dinner",
                        style: poppinstMedium.copyWith(fontSize: 13, height: 1),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          SizedBox(
            height: 15,
          ),

          /*  Theme(
              data: ThemeData().copyWith(dividerColor: Colors.transparent),
              child: ExpansionTile(
                iconColor: ColorResources.verifyScreenButton,
                title: Row(
                  children: [
                    Image.asset(
                      Images.VectorCelender,
                      height: 25,
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Container(
                      padding: EdgeInsets.only(top: 0),
                      child: Text(day,
                          style: poppinsSemiBold.copyWith(
                              color: ColorResources.verifyScreenButton,
                              height: 1,
                              fontSize: 15)),
                    ),
                  ],
                ),
                children: <Widget>[
                  Padding(
                    paddi
                    ng: const EdgeInsets.symmetric(
                        horizontal: 16.0, vertical: 8.0),
                    child: Column(
                      children: [
                        Container(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "E/m:",
                            style: poppinsSemiBold.copyWith(
                              fontSize: 15.0,
                            ),
                          ),
                        ),
                        Container(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            em,
                            textAlign: TextAlign.justify,
                            style: poppinstMedium.copyWith(
                              fontSize: 12.0,
                            ),
                          ),
                        ),
                        Container(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "B/f:",
                            style: poppinsSemiBold.copyWith(
                              fontSize: 15.0,
                            ),
                          ),
                        ),
                        Container(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            breakfast,
                            textAlign: TextAlign.justify,
                            style: poppinstMedium.copyWith(
                              fontSize: 12.0,
                            ),
                          ),
                        ),
                        Container(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "M/m:",
                            style: poppinsSemiBold.copyWith(
                              fontSize: 15.0,
                            ),
                          ),
                        ),
                        Container(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            midMorning,
                            textAlign: TextAlign.justify,
                            style: poppinstMedium.copyWith(
                              fontSize: 12.0,
                            ),
                          ),
                        ),
                        Container(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "L :",
                            style: poppinsSemiBold.copyWith(
                              fontSize: 15.0,
                            ),
                          ),
                        ),
                        Container(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            lunch,
                            textAlign: TextAlign.justify,
                            style: poppinstMedium.copyWith(
                              fontSize: 12.0,
                            ),
                          ),
                        ),
                        Container(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "E :",
                            style: poppinsSemiBold.copyWith(
                              fontSize: 15.0,
                            ),
                          ),
                        ),
                        Container(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            eveningTea,
                            textAlign: TextAlign.justify,
                            style: poppinstMedium.copyWith(
                              fontSize: 12.0,
                            ),
                          ),
                        ),
                        Container(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "D :",
                            style: poppinsSemiBold.copyWith(
                              fontSize: 15.0,
                            ),
                          ),
                        ),
                        Container(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            dinner,
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
            ),*/
        ],
      ),
    );
  }
}
