import 'package:dietitian/controller/auth_controller.dart';
import 'package:dietitian/utils/all_images.dart';
import 'package:dietitian/utils/colors.dart';
import 'package:dietitian/utils/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:intl/intl.dart';

final AuthController _authController = Get.find<AuthController>();

class WeeklyPictureViewDetails extends StatefulWidget {
  const WeeklyPictureViewDetails({super.key});

  @override
  State<WeeklyPictureViewDetails> createState() =>
      _WeeklyPictureViewDetailsState();
}

class _WeeklyPictureViewDetailsState extends State<WeeklyPictureViewDetails> {
  final _scrollController = ScrollController();
  int page = 1;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //_authController.listWeeklyMeasurements(page: 1);

  }

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: ColorResources.buttonYellow,

      // Status bar brightness (optional)
      statusBarIconBrightness: Brightness.dark,
      statusBarBrightness: Brightness.light,
    ));
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {

        _authController.listWeeklyMeasurements(page: page++);
      }
    });

    return Scaffold(
      //  backgroundColor: ColorResources.loginappColor,
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
                        height: 30,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 15.0, right: 15, top: 10, bottom: 10),
                        child: GestureDetector(
                          onTap: () {
                            //  Get.back();
                            Navigator.pop(context);
                            // Navigator.pop(context);
                          },
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 5.0),
                                child: Container(
                                  width: 20,
                                  child: Icon(
                                    Icons.arrow_back_ios,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                              Spacer(),
                              Container(
                                child: Text(
                                  "Weekly Picture\n& Measurements",
                                  textAlign: TextAlign.center,
                                  style: poppinsSemiBold.copyWith(
                                    fontSize: 20,
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
                        borderRadius: BorderRadius.circular(35),
                        color: Colors.white),
                    //  color: ColorResources.whiteColor,
                    height: screenSize.height * 0.83,
                    child: Column(
                      children: [
                        Container(
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                    right: 15.0, left: 15, top: 18),
                                child: Row(
                                  children: [
                                    Image.asset(
                                      Images.filterData,
                                      height: 16,
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                      "Filter By",
                                      style: poppinsSemiBold.copyWith(
                                          fontSize: 18),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 10.0, right: 10, top: 0),
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: Container(
                                        height: 45,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(
                                              10.0), // Set the border radius
                                          color: Colors.grey[
                                              200], // Set the background color
                                        ),
                                        child: TextFormField(
                                          onTap: _handDatePickerFromDate,
                                          controller: textFromDate,
                                          decoration: InputDecoration(
                                              contentPadding:
                                                  EdgeInsets.symmetric(
                                                      horizontal: 10.0,
                                                      vertical: 10),
                                              // Adjust padding as needed
                                              hintText: "From Date",
                                              hintStyle:
                                                  poppinsRegular.copyWith(
                                                fontSize: 14,
                                                color: Colors.black,
                                              ),
                                              border: InputBorder.none,
                                              suffixIcon: Padding(
                                                padding:
                                                    const EdgeInsets.all(13.0),
                                                child: Image.asset(
                                                  'assets/calender_svgrepo.png',
                                                  height: 15,
                                                ),
                                              )),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Expanded(
                                      child: Container(
                                        height: 45,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(
                                              10.0), // Set the border radius
                                          color: Colors.grey[
                                              200], // Set the background color
                                        ),
                                        child: TextFormField(
                                          controller: textToDate,
                                          onTap: _handDatePickerTODate,
                                          decoration: InputDecoration(
                                              contentPadding:
                                                  EdgeInsets.symmetric(
                                                      horizontal: 10.0,
                                                      vertical: 10),
                                              // Adjust padding as needed
                                              hintText: "To Date",
                                              hintStyle:
                                                  poppinsRegular.copyWith(
                                                fontSize: 14,
                                                color: Colors.black,
                                              ),
                                              border: InputBorder.none,
                                              suffixIcon: Padding(
                                                padding:
                                                    const EdgeInsets.all(13.0),
                                                child: Image.asset(
                                                  'assets/calender_svgrepo.png',
                                                  height: 15,
                                                ),
                                              )),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Expanded(child: Obx(() {
                          if (_authController.isLoading.value &&
                              _authController.dietitianWeekly.isEmpty) {
                            return Center(child: CustomLoadingIndicator());
                          } else if (_authController.dietitianWeekly.isEmpty) {
                            return Center(child: Text('No measurements found'));
                          } else {
                            return Padding(
                                padding: const EdgeInsets.only(
                                    left: 10.0, right: 10, top: 0, bottom: 0),
                                child: SingleChildScrollView(
                                  controller: _scrollController,
                                  child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.stretch,
                                      children: [
                                        ..._authController.dietitianWeekly
                                            .asMap()
                                            .entries
                                            .map((e) {
                                          String originalDateString =
                                              e.value.createdAt!;
                                          DateTime originalDate =
                                              DateTime.parse(
                                                  originalDateString);
                                          int index = e.key;
                                          int lenght = _authController
                                                  .dietitianWeekly.length -
                                              1;

                                          String formattedDate =
                                              DateFormat('dd-MMMM-yyyy')
                                                  .format(originalDate);
                                          return Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            children: [
                                              Container(
                                                  child: Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 15.0,
                                                    right: 15,
                                                    top: 10,
                                                    bottom: 5),
                                                child: Row(
                                                  children: [
                                                    Image.asset(
                                                      Images.Vector3,
                                                      height: 40,
                                                    ),
                                                    SizedBox(
                                                      width: 20,
                                                    ),
                                                    Container(
                                                      padding: EdgeInsets.only(
                                                          top: 4),
                                                      child: Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .start,
                                                        children: [
                                                          Text("$formattedDate",
                                                              style: poppinsSemiBold
                                                                  .copyWith(
                                                                      color: ColorResources
                                                                          .verifyScreenButton,
                                                                      height: 1,
                                                                      fontSize:
                                                                          15)),
                                                          SizedBox(
                                                            height: 7,
                                                          ),
                                                          GestureDetector(
                                                            onTap: () {
                                                              showDialog(
                                                                context:
                                                                    context,
                                                                builder:
                                                                    (BuildContext
                                                                        context) {
                                                                  return MYBSBSD(
                                                                      index:
                                                                          index);
                                                                },
                                                              );
                                                            },
                                                            child: Text(
                                                                "View Details",
                                                                style: poppinstMedium
                                                                    .copyWith(
                                                                        color: Colors
                                                                            .black,
                                                                        height:
                                                                            0.8,
                                                                        decoration:
                                                                            TextDecoration
                                                                                .underline, // op
                                                                        fontSize:
                                                                            15)),
                                                          ),
                                                        ],
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              )),
                                              if (index != lenght)
                                                Container(
                                                  margin: EdgeInsets.fromLTRB(
                                                      8.0, 0, 8.0, 0),
                                                  height: 1.5,
                                                  decoration: BoxDecoration(
                                                      color: Colors.grey
                                                          .withOpacity(0.4)),
                                                ),
                                            ],
                                          );
                                        }).toList(),
                                        if (_authController.isLoading.value &&
                                            !_authController
                                                .isAllLoaded.value) ...[
                                          Center(
                                              child: CustomLoadingIndicator()),
                                        ]
                                      ]),
                                ));
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
        ),
      ),
    );
  }

  var DOB;
  final DateFormat dateFormat = DateFormat("dd/MM/yyyy");
  TextEditingController textToDate = TextEditingController();
  TextEditingController textFromDate = TextEditingController();
  final DateFormat dateFormats = DateFormat("yyyy-MM-dd");
  DateTime dates = DateTime.now();
  DateTime toDate = DateTime.now();
  DateTime AgeRange = DateTime.now();

  _handDatePickerFromDate() async {
    print("sndknsdnnskdn");
    final DateTime? date = await showDatePicker(
        context: context,
        initialDate: AgeRange,
        firstDate: DateTime(1900),
        lastDate: DateTime.now());
    if (date != null && date != dates) {
      setState(() {
        AgeRange = date;
      });
      textFromDate.text = dateFormat.format(date);
      DOB = dateFormat.format(date);
      print("SDSJKDNKSNKDJKSDNKNSKDNKN${AgeRange}");
    }
  }

  _handDatePickerTODate() async {
    final DateTime? date = await showDatePicker(
        context: context,
        initialDate: AgeRange,
        firstDate: DateTime(1900),
        lastDate: DateTime.now());
    if (date != null && date != toDate) {
      setState(() {
        AgeRange = date;
      });
      textToDate.text = dateFormat.format(date);
      DOB = dateFormat.format(date);
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();

    // _authControlle.value = 1;
   // _authController.dietitianWeekly.clear();
    //   Get.find<AuthController>().listWeeklyMeasurements();
  }
}

class MYBSBSD extends StatefulWidget {
  int? index;

  MYBSBSD({super.key, this.index});

  @override
  State<MYBSBSD> createState() => _MYBSBSDState();
}

class _MYBSBSDState extends State<MYBSBSD> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      elevation: 0,
      backgroundColor: Color(0xffffffff),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: WillPopScope(
        onWillPop: () async => false,
        child: GetBuilder<AuthController>(builder: (logic) {
          String originalDateString =
              logic.dietitianWeekly[widget.index!].createdAt!;
          DateTime originalDate = DateTime.parse(originalDateString);
          String formattedDate =
              DateFormat('dd MMMM yyyy').format(originalDate);
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 18.0, right: 10),
                    child: GestureDetector(
                      onTap: () {
                        Get.back();
                      },
                      child: Container(
                          height: 25,
                          width: 25,
                          decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.circular(45)),
                          child: Icon(
                            Icons.close,
                            size: 18,
                            color: Colors.white,
                          )),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Row(
                  /*     crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,*/
                  children: [
                    Image.asset(
                      Images.Vector3,
                      height: 40,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(formattedDate,
                        style: poppinsSemiBold.copyWith(
                            color: ColorResources.verifyScreenButton,
                            height: 1,
                            fontSize: 15)),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 90,
                      width: 90,
                      child: Image.network(
                        "https://godiet.aks.5g.in/${logic.dietitianWeekly[widget.index!].uploadPicture}",
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Container(
                                width: 80,
                                child: Text(
                                  "Chest/bust",
                                  style: poppinsSemiBold.copyWith(fontSize: 13),
                                ),
                              ),
                              Container(
                                child: Text(":"),
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Expanded(
                                child: Container(
                                  child: Text(
                                      "${logic.dietitianWeekly[widget.index!].chestBust} Inch",
                                      style: poppinstMedium.copyWith(
                                          fontSize: 13)),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Container(
                                width: 80,
                                child: Text(
                                  "Waist",
                                  style: poppinsSemiBold.copyWith(fontSize: 13),
                                ),
                              ),
                              Container(
                                child: Text(":"),
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Expanded(
                                child: Container(
                                  child: Text(
                                    "${logic.dietitianWeekly[widget.index!].waist!} Inch",
                                    style:
                                        poppinstMedium.copyWith(fontSize: 13),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Container(
                                width: 80,
                                child: Text(
                                  "Hip",
                                  style: poppinsSemiBold.copyWith(fontSize: 13),
                                ),
                              ),
                              Container(
                                child: Text(":"),
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Expanded(
                                child: Container(
                                  child: Text(
                                      "${logic.dietitianWeekly[widget.index!].hip!} Inch",
                                      style: poppinstMedium.copyWith(
                                          fontSize: 13)),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Container(
                                width: 80,
                                child: Text(
                                  "ARMS",
                                  style: poppinsSemiBold.copyWith(fontSize: 13),
                                ),
                              ),
                              Container(
                                child: Text(":"),
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Expanded(
                                child: Container(
                                  child: Text(
                                      "${logic.dietitianWeekly[widget.index!].arms!} Inch",
                                      style: poppinstMedium.copyWith(
                                          fontSize: 13)),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 15,
              )
              /*  Container(
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(5)),
              width: MediaQuery.of(context).size.width,
              height: 50,
              child: InkWell(
                highlightColor: Colors.grey[200],
                onTap: () {
                  Get.back();
                },
                child: Center(
                  child: Text(
                    "Ok",
                    style: TextStyle(
                      fontSize: 18.0,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),*/
            ],
          );
        }),
      ),
    );
  }
}
