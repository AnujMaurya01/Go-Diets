import 'package:dietitian/controller/auth_controller.dart';
import 'package:dietitian/utils/app_constants.dart';
import 'package:dietitian/utils/colors.dart';
import 'package:dietitian/utils/constants.dart';
import 'package:dietitian/utils/style.dart';
import 'package:dietitian/views/support/upload_presciption.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:intl/intl.dart';

class ViewDied extends StatefulWidget {
  const ViewDied({super.key});

  @override
  State<ViewDied> createState() => _ViewDiedState();
}

class _ViewDiedState extends State<ViewDied> {
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
                                    "My Diet",
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
                  top: 100,
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
                              onTap: (value) {
                                Get.find<AuthController>()
                                    .myDietDetails(context, isupdate: false);
                                Get.find<AuthController>().usermyDietDetails(
                                    context,
                                    isupdate: false);
                              },
                            ),
                            Expanded(
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
        return logic.profileDetails!.planExpiryDate == null
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
            : logic.Mydite == null
                ? Padding(
                    padding: const EdgeInsets.only(top: 300),
                    child: Center(
                        child: Text(
                      'No Diet Shedule!!',
                      style: poppinsSemiBold.copyWith(
                        fontSize: 20,
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
                                    width: (MediaQuery.of(context).size.width -
                                            60) /
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
                                                  style: poppinsSemiBold
                                                      .copyWith(
                                                          color:
                                                              selectedIndex !=
                                                                      index
                                                                  ? Colors.black
                                                                  : Colors
                                                                      .green,
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
                            logic.Mydite!['sunday_e_m'],
                            logic.Mydite!['sunday_b_f'],
                            logic.Mydite!['sunday_m_m'],
                            logic.Mydite!['sunday_l'],
                            logic.Mydite!['sunday_e'],
                            logic.Mydite!['sunday_d'],
                          ),
                        ],
                        if (selectedIndex == 1) ...[
                          _buildDayCard(
                              'Monday',
                              logic.Mydite!['monday_e_m'],
                              logic.Mydite!['monday_b_f'],
                              logic.Mydite!['monday_m_m'],
                              logic.Mydite!['monday_l'],
                              logic.Mydite!['monday_e'],
                              logic.Mydite!['monday_d']),
                        ],
                        if (selectedIndex == 2) ...[
                          _buildDayCard(
                              'Tuesday',
                              logic.Mydite!['tuesday_e_m'],
                              logic.Mydite!['tuesday_b_f'],
                              logic.Mydite!['tuesday_m_m'],
                              logic.Mydite!['tuesday_l'],
                              logic.Mydite!['tuesday_e'],
                              logic.Mydite!['tuesday_d']),
                        ],
                        if (selectedIndex == 3) ...[
                          _buildDayCard(
                              'Wednesday',
                              logic.Mydite!['wednesday_e_m'],
                              logic.Mydite!['wednesday_b_f'],
                              logic.Mydite!['wednesday_m_m'],
                              logic.Mydite!['wednesday_l'],
                              logic.Mydite!['wednesday_e'],
                              logic.Mydite!['wednesday_d']),
                        ],
                        if (selectedIndex == 4) ...[
                          _buildDayCard(
                              'Thursday',
                              logic.Mydite!['thursday_e_m'],
                              logic.Mydite!['thursday_b_f'],
                              logic.Mydite!['thursday_m_m'],
                              logic.Mydite!['thursday_l'],
                              logic.Mydite!['thursday_e'],
                              logic.Mydite!['thursday_d']),
                        ],
                        if (selectedIndex == 5) ...[
                          _buildDayCard(
                              'Friday',
                              logic.Mydite!['friday_e_m'],
                              logic.Mydite!['friday_b_f'],
                              logic.Mydite!['friday_m_m'],
                              logic.Mydite!['friday_l'],
                              logic.Mydite!['friday_e'],
                              logic.Mydite!['friday_d']),
                        ],
                        if (selectedIndex == 6) ...[
                          _buildDayCard(
                              'Saturday',
                              logic.Mydite!['saturday_e_m'],
                              logic.Mydite!['saturday_b_f'],
                              logic.Mydite!['saturday_m_m'],
                              logic.Mydite!['saturday_l'],
                              logic.Mydite!['saturday_e'],
                              logic.Mydite!['saturday_d']),
                        ],
                        Container(
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                        height: 50,
                                        child: Image.asset(
                                            "assets/pdf_svgrepo.png")),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      "Download Diet",
                                      style: poppinstMedium.copyWith(
                                          fontSize: 14,
                                          color: ColorResources.ditedTex7),
                                    )
                                  ],
                                ),
                              ),
                              Expanded(
                                child: GestureDetector(
                                  onTap: () {
                                    Get.to(UploadPrestionScreen(),
                                        duration: Duration(
                                            milliseconds: ApiConstants
                                                .screenTransitionTime),
                                        transition: Transition.rightToLeft);
                                  },
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Container(
                                          height: 60,
                                          child: Image.asset(
                                              "assets/upload_svgrepo.png")),
                                      Text(
                                        "Upload Prescription",
                                        style: poppinstMedium.copyWith(
                                            fontSize: 14,
                                            color: ColorResources.ditedText1),
                                      )
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                        )
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
        return logic.profileDetails!.planExpiryDate == null
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
            : logic.userspeciallMydite == null
                ? Padding(
                    padding: const EdgeInsets.only(top: 00),
                    child: Center(
                        child: Text(
                      'No Diet Shedule!!',
                      style: poppinsSemiBold.copyWith(
                        fontSize: 20,
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
                                    width: (MediaQuery.of(context).size.width -
                                            60) /
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
                                                  style: poppinsSemiBold
                                                      .copyWith(
                                                          color:
                                                              selectedIndex !=
                                                                      index
                                                                  ? Colors.black
                                                                  : Colors
                                                                      .green,
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
                            logic.userspeciallMydite!['sunday_e_m'],
                            logic.userspeciallMydite!['sunday_b_f'],
                            logic.userspeciallMydite!['sunday_m_m'],
                            logic.userspeciallMydite!['sunday_l'],
                            logic.userspeciallMydite!['sunday_e'],
                            logic.userspeciallMydite!['sunday_d'],
                          ),
                        ],
                        if (selectedIndex == 1) ...[
                          _buildDayCard(
                              'Monday',
                              logic.userspeciallMydite!['monday_e_m'],
                              logic.userspeciallMydite!['monday_b_f'],
                              logic.userspeciallMydite!['monday_m_m'],
                              logic.userspeciallMydite!['monday_l'],
                              logic.userspeciallMydite!['monday_e'],
                              logic.userspeciallMydite!['monday_d']),
                        ],
                        if (selectedIndex == 2) ...[
                          _buildDayCard(
                              'Tuesday',
                              logic.userspeciallMydite!['tuesday_e_m'],
                              logic.userspeciallMydite!['tuesday_b_f'],
                              logic.userspeciallMydite!['tuesday_m_m'],
                              logic.userspeciallMydite!['tuesday_l'],
                              logic.userspeciallMydite!['tuesday_e'],
                              logic.userspeciallMydite!['tuesday_d']),
                        ],
                        if (selectedIndex == 3) ...[
                          _buildDayCard(
                              'Wednesday',
                              logic.userspeciallMydite!['wednesday_e_m'],
                              logic.userspeciallMydite!['wednesday_b_f'],
                              logic.userspeciallMydite!['wednesday_m_m'],
                              logic.userspeciallMydite!['wednesday_l'],
                              logic.userspeciallMydite!['wednesday_e'],
                              logic.userspeciallMydite!['wednesday_d']),
                        ],
                        if (selectedIndex == 4) ...[
                          _buildDayCard(
                              'Thursday',
                              logic.userspeciallMydite!['thursday_e_m'],
                              logic.userspeciallMydite!['thursday_b_f'],
                              logic.userspeciallMydite!['thursday_m_m'],
                              logic.userspeciallMydite!['thursday_l'],
                              logic.userspeciallMydite!['thursday_e'],
                              logic.userspeciallMydite!['thursday_d']),
                        ],
                        if (selectedIndex == 5) ...[
                          _buildDayCard(
                              'Friday',
                              logic.userspeciallMydite!['friday_e_m'],
                              logic.userspeciallMydite!['friday_b_f'],
                              logic.userspeciallMydite!['friday_m_m'],
                              logic.userspeciallMydite!['friday_l'],
                              logic.userspeciallMydite!['friday_e'],
                              logic.userspeciallMydite!['friday_d']),
                        ],
                        if (selectedIndex == 6) ...[
                          _buildDayCard(
                              'Saturday',
                              logic.userspeciallMydite!['saturday_e_m'],
                              logic.userspeciallMydite!['saturday_b_f'],
                              logic.userspeciallMydite!['saturday_m_m'],
                              logic.userspeciallMydite!['saturday_l'],
                              logic.userspeciallMydite!['saturday_e'],
                              logic.userspeciallMydite!['saturday_d']),
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
