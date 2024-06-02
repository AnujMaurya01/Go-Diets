import 'dart:async';

import 'package:dietitian/controller/auth_controller.dart';
import 'package:dietitian/utils/all_images.dart';
import 'package:dietitian/utils/colors.dart';
import 'package:dietitian/utils/style.dart';
import 'package:dietitian/view_model/ProfileDetails.dart';
import 'package:dietitian/views/screen/RemarksandSpecial/RemarkandSpecial.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:intl/intl.dart';

class ProfileNav extends StatefulWidget {
  const ProfileNav({super.key});

  @override
  State<ProfileNav> createState() => _ProfileNavState();
}

class _ProfileNavState extends State<ProfileNav> {
  bool isValid = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    dietitianList = Get.find<AuthController>().getDietitian();
    Timer(Duration(seconds: 2), () {
      setState(() {
        isValid = true;
      });
    });
  }

  var dietitianList;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorResources.whiteColor,
      appBar: AppBar(
          backgroundColor: ColorResources.buttonYellow,
          centerTitle: true,
          automaticallyImplyLeading: false,
          title: Text(
            "My Profile",
            style: poppinsSemiBold.copyWith(
                fontSize: 18, height: 1, color: Colors.black),
          ),
          // Make app bar transparent
          elevation: 0,
          leading: Builder(builder: (BuildContext context) {
            return GestureDetector(
              onTap: () {
                Get.back();
              },
              child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Icon(
                    Icons.arrow_back_ios,
                    color: Colors.black,
                  )),
            );
          })),
      body: GetBuilder<AuthController>(builder: (logic) {
        return Stack(
          children: [
            if (isValid) ...[
              if (logic.profileDetails == null) ...[
                Center(child: CustomLoadingIndicator())
              ] else ...[
                Column(
                  children: [
                    Container(
                      height: 130,
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
                                  width: 50,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    color: ColorResources.manui,
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
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
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(top: 8.0),
                                          child: Text(
                                              logic.profileDetails!.name!,
                                              style: poppinstMedium.copyWith(
                                                  fontSize: 18,
                                                  height: 1,
                                                  color: ColorResources
                                                      .loginOpenButton)),
                                        ),
                                        Text(
                                          "${logic.profileDetails!.gender!} ${logic.profileDetails!.age!} Yrs Old",
                                          style: poppinsSemiBold.copyWith(
                                              fontSize: 16, height: 1.2),
                                        )
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                top: 25, left: 18, right: 18),
                            child: Container(
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    height: 13,
                                    width: 13,
                                    child: Icon(
                                      Icons.location_on_sharp,
                                      size: 20,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    "${logic.profileDetails!.address!}",
                                    style: poppinstMedium.copyWith(
                                        fontSize: 13, height: 1.3),
                                  ),
                                  Spacer(),
                                  if(logic.profileDetails!.planName!=null)...[
                                    GestureDetector(
                                      onTap: () {
                                        showDialog(
                                          context: context,
                                          builder: (context) {
                                            return _buildAlertSlotSuccessDialog(
                                                context, logic.profileDetails);
                                          },
                                        );
                                        // _showPopup(context);
                                      },
                                      child: Container(
                                        padding: const EdgeInsets.only(top: 4),
                                        width: 90,
                                        height: 24,
                                        alignment: Alignment.center,
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                            BorderRadius.circular(15)),
                                        child: Text("View Plan".toUpperCase(),
                                            style: poppinsSemiBold.copyWith(
                                                fontSize: 12,
                                                height: 1,
                                                color:
                                                ColorResources.buttongreem)),
                                      ),
                                    )
                                  ]

                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: SingleChildScrollView(
                          child: Container(
                            // Adjust top padding according to your needs
                            child: Column(
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Expanded(
                                      child: Container(
                                          child: Text("Date of Birth",
                                              style: poppinsSemiBold.copyWith(
                                                  fontSize: 14,
                                                  height: 1,
                                                  color: Colors.black))),
                                    ),
                                    Expanded(
                                      child: Container(
                                          padding: EdgeInsets.only(left: 20),
                                          child: Text("Height & Weight",
                                              style: poppinsSemiBold.copyWith(
                                                  fontSize: 14,
                                                  height: 1,
                                                  color: Colors.black))),
                                    )
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 8.0),
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Expanded(
                                        child: Container(
                                            child: Text(
                                                "${logic.profileDetails!.dateOfBirth!}",
                                                style: poppinsSemiBold.copyWith(
                                                    fontSize: 12,
                                                    height: 1,
                                                    color: ColorResources
                                                        .blickLifggt))),
                                      ),
                                      Expanded(
                                        child: Container(
                                            padding: EdgeInsets.only(left: 20),
                                            child: Text(
                                                "${logic.profileDetails!.height!}/${logic.profileDetails!.weight!}kg",
                                                style: poppinsSemiBold.copyWith(
                                                    fontSize: 12,
                                                    height: 1,
                                                    color: ColorResources
                                                        .blickLifggt))),
                                      )
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    height: 1.2,
                                    decoration: BoxDecoration(
                                        color: Colors.grey.withOpacity(0.4)),
                                  ),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Expanded(
                                      child: Container(
                                          child: Text("Blood Group",
                                              style: poppinsSemiBold.copyWith(
                                                  fontSize: 14,
                                                  height: 1,
                                                  color: Colors.black))),
                                    ),
                                    Expanded(
                                      child: Container(
                                          padding: EdgeInsets.only(left: 20),
                                          child: Text("Profession",
                                              style: poppinsSemiBold.copyWith(
                                                  fontSize: 14,
                                                  height: 1,
                                                  color: Colors.black))),
                                    )
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 8.0),
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Expanded(
                                        child: Container(
                                            child: Text(
                                                logic.profileDetails!
                                                    .bloodGroup!,
                                                style: poppinsSemiBold.copyWith(
                                                    fontSize: 12,
                                                    height: 1,
                                                    color: ColorResources
                                                        .blickLifggt))),
                                      ),
                                      Expanded(
                                        child: Container(
                                            padding: EdgeInsets.only(left: 20),
                                            child: Text(
                                                logic.profileDetails!
                                                    .professional!,
                                                style: poppinsSemiBold.copyWith(
                                                    fontSize: 12,
                                                    height: 1,
                                                    color: ColorResources
                                                        .blickLifggt))),
                                      )
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    height: 1.2,
                                    decoration: BoxDecoration(
                                        color: Colors.grey.withOpacity(0.4)),
                                  ),
                                ),
                                Padding(
                                    padding: const EdgeInsets.only(top: 8.0),
                                    child: Container(
                                        width: Get.width,
                                        //color: Colors.grey,
                                        child: Text("Medical Problem",
                                            style: poppinsSemiBold.copyWith(
                                                fontSize: 14,
                                                height: 1,
                                                color: Colors.black)))),
                                Padding(
                                    padding: const EdgeInsets.only(top: 8.0),
                                    child: Container(
                                        width: Get.width,
                                        //color: Colors.grey,
                                        child: Text(
                                            logic.profileDetails!
                                                .medicalProblem!,
                                            style: poppinsSemiBold.copyWith(
                                                fontSize: 14,
                                                height: 1,
                                                color: ColorResources
                                                    .blickLifggt)))),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    height: 1.2,
                                    decoration: BoxDecoration(
                                        color: Colors.grey.withOpacity(0.4)),
                                  ),
                                ),
                                Padding(
                                    padding: const EdgeInsets.only(top: 8.0),
                                    child: Container(
                                        width: Get.width,
                                        //color: Colors.grey,
                                        child: Text("Any Vitamin Deficiency",
                                            style: poppinsSemiBold.copyWith(
                                                fontSize: 14,
                                                height: 1,
                                                color: Colors.black)))),
                                Padding(
                                    padding: const EdgeInsets.only(top: 8.0),
                                    child: Container(
                                        width: Get.width,
                                        //color: Colors.grey,
                                        child: Text(
                                            logic.profileDetails!
                                                .anyVitaminDeficiency!,
                                            style: poppinsSemiBold.copyWith(
                                                fontSize: 14,
                                                height: 1,
                                                color: ColorResources
                                                    .blickLifggt)))),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    height: 1.2,
                                    decoration: BoxDecoration(
                                        color: Colors.grey.withOpacity(0.4)),
                                  ),
                                ),
                                Padding(
                                    padding: const EdgeInsets.only(top: 8.0),
                                    child: Container(
                                        width: Get.width,
                                        //color: Colors.grey,
                                        child: Text("Parents Medical Problem",
                                            style: poppinsSemiBold.copyWith(
                                                fontSize: 14,
                                                height: 1,
                                                color: Colors.black)))),
                                Padding(
                                    padding: const EdgeInsets.only(top: 8.0),
                                    child: Container(
                                        width: Get.width,
                                        //color: Colors.grey,
                                        child: Text(
                                            logic.profileDetails!
                                                .parentsMedicalProblem!,
                                            style: poppinsSemiBold.copyWith(
                                                fontSize: 14,
                                                height: 1,
                                                color: ColorResources
                                                    .blickLifggt)))),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    height: 1.2,
                                    decoration: BoxDecoration(
                                        color: Colors.grey.withOpacity(0.4)),
                                  ),
                                ),
                                Padding(
                                    padding: const EdgeInsets.only(top: 8.0),
                                    child: Container(
                                        width: Get.width,
                                        //color: Colors.grey,
                                        child: Text("Veg/Non Veg",
                                            style: poppinsSemiBold.copyWith(
                                                fontSize: 14,
                                                height: 1,
                                                color: Colors.black)))),
                                Padding(
                                    padding: const EdgeInsets.only(top: 8.0),
                                    child: Container(
                                        width: Get.width,
                                        //color: Colors.grey,
                                        child: Text(
                                            logic.profileDetails!.vegNonVeg!,
                                            style: poppinsSemiBold.copyWith(
                                                fontSize: 14,
                                                height: 1,
                                                color: ColorResources
                                                    .blickLifggt)))),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    height: 1.2,
                                    decoration: BoxDecoration(
                                        color: Colors.grey.withOpacity(0.4)),
                                  ),
                                ),
                                Padding(
                                    padding: const EdgeInsets.only(top: 8.0),
                                    child: Container(
                                        width: Get.width,
                                        //color: Colors.grey,
                                        child: Text("Constipation Problem",
                                            style: poppinsSemiBold.copyWith(
                                                fontSize: 14,
                                                height: 1,
                                                color: Colors.black)))),
                                Padding(
                                    padding: const EdgeInsets.only(top: 8.0),
                                    child: Container(
                                        width: Get.width,
                                        //color: Colors.grey,
                                        child: Text(
                                            logic.profileDetails!
                                                .constipationProblem!,
                                            style: poppinsSemiBold.copyWith(
                                                fontSize: 14,
                                                height: 1,
                                                color: ColorResources
                                                    .blickLifggt)))),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    height: 1.2,
                                    decoration: BoxDecoration(
                                        color: Colors.grey.withOpacity(0.4)),
                                  ),
                                ),
                                Padding(
                                    padding: const EdgeInsets.only(top: 8.0),
                                    child: Container(
                                        width: Get.width,
                                        //color: Colors.grey,
                                        child: Text("Gastritis Problem",
                                            style: poppinsSemiBold.copyWith(
                                                fontSize: 14,
                                                height: 1,
                                                color: Colors.black)))),
                                Padding(
                                    padding: const EdgeInsets.only(top: 8.0),
                                    child: Container(
                                        width: Get.width,
                                        //color: Colors.grey,
                                        child: Text(
                                            logic.profileDetails!
                                                .parentsMedicalProblem!,
                                            style: poppinsSemiBold.copyWith(
                                                fontSize: 14,
                                                height: 1,
                                                color: ColorResources
                                                    .blickLifggt)))),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    height: 1.2,
                                    decoration: BoxDecoration(
                                        color: Colors.grey.withOpacity(0.4)),
                                  ),
                                ),
                                Padding(
                                    padding: const EdgeInsets.only(top: 8.0),
                                    child: Container(
                                        width: Get.width,
                                        //color: Colors.grey,
                                        child: Text("Any Food Allergy",
                                            style: poppinsSemiBold.copyWith(
                                                fontSize: 14,
                                                height: 1,
                                                color: Colors.black)))),
                                Padding(
                                    padding: const EdgeInsets.only(top: 8.0),
                                    child: Container(
                                        width: Get.width,
                                        //color: Colors.grey,
                                        child: Text(
                                            logic.profileDetails!
                                                .anyFoodAllergy!,
                                            style: poppinsSemiBold.copyWith(
                                                fontSize: 14,
                                                height: 1,
                                                color: ColorResources
                                                    .blickLifggt)))),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    height: 1.2,
                                    decoration: BoxDecoration(
                                        color: Colors.grey.withOpacity(0.4)),
                                  ),
                                ),
                                Padding(
                                    padding: const EdgeInsets.only(top: 8.0),
                                    child: Container(
                                        width: Get.width,
                                        //color: Colors.grey,
                                        child: Text("Eating Pattern",
                                            style: poppinsSemiBold.copyWith(
                                                fontSize: 14,
                                                height: 1,
                                                color: Colors.black)))),
                                Padding(
                                    padding: const EdgeInsets.only(top: 8.0),
                                    child: Container(
                                        width: Get.width,
                                        //color: Colors.grey,
                                        child: Text(
                                            logic
                                                .profileDetails!.eatingPattern!,
                                            style: poppinsSemiBold.copyWith(
                                                fontSize: 14,
                                                height: 1,
                                                color: ColorResources
                                                    .blickLifggt)))),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    height: 1.2,
                                    decoration: BoxDecoration(
                                        color: Colors.grey.withOpacity(0.4)),
                                  ),
                                ),
                                Padding(
                                    padding: const EdgeInsets.only(top: 8.0),
                                    child: Container(
                                        width: Get.width,
                                        //color: Colors.grey,
                                        child: Text("Early Morning",
                                            style: poppinsSemiBold.copyWith(
                                                fontSize: 14,
                                                height: 1,
                                                color: Colors.black)))),
                                Padding(
                                    padding: const EdgeInsets.only(top: 8.0),
                                    child: Container(
                                        width: Get.width,
                                        //color: Colors.grey,
                                        child: Text(
                                            logic.profileDetails!.earlyMorning!,
                                            style: poppinsSemiBold.copyWith(
                                                fontSize: 14,
                                                height: 1,
                                                color: ColorResources
                                                    .blickLifggt)))),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    height: 1.2,
                                    decoration: BoxDecoration(
                                        color: Colors.grey.withOpacity(0.4)),
                                  ),
                                ),
                                Padding(
                                    padding: const EdgeInsets.only(top: 8.0),
                                    child: Container(
                                        width: Get.width,
                                        //color: Colors.grey,
                                        child: Text("Lunch",
                                            style: poppinsSemiBold.copyWith(
                                                fontSize: 14,
                                                height: 1,
                                                color: Colors.black)))),
                                Padding(
                                    padding: const EdgeInsets.only(top: 8.0),
                                    child: Container(
                                        width: Get.width,
                                        //color: Colors.grey,
                                        child: Text(
                                            logic.profileDetails!.lunch!,
                                            style: poppinsSemiBold.copyWith(
                                                fontSize: 14,
                                                height: 1,
                                                color: ColorResources
                                                    .blickLifggt)))),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    height: 1.2,
                                    decoration: BoxDecoration(
                                        color: Colors.grey.withOpacity(0.4)),
                                  ),
                                ),
                                Padding(
                                    padding: const EdgeInsets.only(top: 8.0),
                                    child: Container(
                                        width: Get.width,
                                        //color: Colors.grey,
                                        child: Text("Tea Time",
                                            style: poppinsSemiBold.copyWith(
                                                fontSize: 14,
                                                height: 1,
                                                color: Colors.black)))),
                                Padding(
                                    padding: const EdgeInsets.only(top: 8.0),
                                    child: Container(
                                        width: Get.width,
                                        //color: Colors.grey,
                                        child: Text(
                                            logic.profileDetails!.teaTime!,
                                            style: poppinsSemiBold.copyWith(
                                                fontSize: 14,
                                                height: 1,
                                                color: ColorResources
                                                    .blickLifggt)))),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    height: 1.2,
                                    decoration: BoxDecoration(
                                        color: Colors.grey.withOpacity(0.4)),
                                  ),
                                ),
                                Padding(
                                    padding: const EdgeInsets.only(top: 8.0),
                                    child: Container(
                                        width: Get.width,
                                        //color: Colors.grey,
                                        child: Text("Dinner",
                                            style: poppinsSemiBold.copyWith(
                                                fontSize: 14,
                                                height: 1,
                                                color: Colors.black)))),
                                Padding(
                                    padding: const EdgeInsets.only(top: 8.0),
                                    child: Container(
                                        width: Get.width,
                                        //color: Colors.grey,
                                        child: Text(
                                            logic.profileDetails!.dinner!,
                                            style: poppinsSemiBold.copyWith(
                                                fontSize: 14,
                                                height: 1,
                                                color: ColorResources
                                                    .blickLifggt)))),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    height: 1.2,
                                    decoration: BoxDecoration(
                                        color: Colors.grey.withOpacity(0.4)),
                                  ),
                                ),
                                Padding(
                                    padding: const EdgeInsets.only(top: 8.0),
                                    child: Container(
                                        width: Get.width,
                                        //color: Colors.grey,
                                        child: Text("Sleep Time",
                                            style: poppinsSemiBold.copyWith(
                                                fontSize: 14,
                                                height: 1,
                                                color: Colors.black)))),
                                Padding(
                                    padding: const EdgeInsets.only(top: 8.0),
                                    child: Container(
                                        width: Get.width,
                                        //color: Colors.grey,
                                        child: Text(
                                            logic.profileDetails!.sleepTime!,
                                            style: poppinsSemiBold.copyWith(
                                                fontSize: 14,
                                                height: 1,
                                                color: ColorResources
                                                    .blickLifggt)))),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    height: 1.2,
                                    decoration: BoxDecoration(
                                        color: Colors.grey.withOpacity(0.4)),
                                  ),
                                ),
                                Padding(
                                    padding: const EdgeInsets.only(top: 8.0),
                                    child: Container(
                                        width: Get.width,
                                        //color: Colors.grey,
                                        child: Text("Wake Up Time",
                                            style: poppinsSemiBold.copyWith(
                                                fontSize: 14,
                                                height: 1,
                                                color: Colors.black)))),
                                Padding(
                                    padding: const EdgeInsets.only(top: 8.0),
                                    child: Container(
                                        width: Get.width,
                                        //color: Colors.grey,
                                        child: Text(
                                            logic.profileDetails!.wakeUpTime!,
                                            style: poppinsSemiBold.copyWith(
                                                fontSize: 14,
                                                height: 1,
                                                color: ColorResources
                                                    .blickLifggt)))),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    height: 1.2,
                                    decoration: BoxDecoration(
                                        color: Colors.grey.withOpacity(0.4)),
                                  ),
                                ),
                                if (logic.profileDetails!.gender ==
                                    "Female") ...[
                                  Padding(
                                      padding: const EdgeInsets.only(top: 8.0),
                                      child: Container(
                                          width: Get.width,
                                          //color: Colors.grey,
                                          child: Text("Last Period’s Date",
                                              style: poppinsSemiBold.copyWith(
                                                  fontSize: 14,
                                                  height: 1,
                                                  color: Colors.black)))),
                                  Padding(
                                      padding: const EdgeInsets.only(top: 8.0),
                                      child: Container(
                                          width: Get.width,
                                          //color: Colors.grey,
                                          child: Text("1/01/2024",
                                              style: poppinsSemiBold.copyWith(
                                                  fontSize: 14,
                                                  height: 1,
                                                  color: ColorResources
                                                      .blickLifggt)))),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Container(
                                      height: 1.2,
                                      decoration: BoxDecoration(
                                          color: Colors.grey.withOpacity(0.4)),
                                    ),
                                  ),
                                ],
                                Padding(
                                    padding: const EdgeInsets.only(top: 8.0),
                                    child: Container(
                                        width: Get.width,
                                        //color: Colors.grey,
                                        child: Text("Water Intake",
                                            style: poppinsSemiBold.copyWith(
                                                fontSize: 14,
                                                height: 1,
                                                color: Colors.black)))),
                                Padding(
                                    padding: const EdgeInsets.only(top: 8.0),
                                    child: Container(
                                        width: Get.width,
                                        //color: Colors.grey,
                                        child: Text(
                                            logic.profileDetails!.waterIntake!,
                                            style: poppinsSemiBold.copyWith(
                                                fontSize: 14,
                                                height: 1,
                                                color: ColorResources
                                                    .blickLifggt)))),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    height: 1.2,
                                    decoration: BoxDecoration(
                                        color: Colors.grey.withOpacity(0.4)),
                                  ),
                                ),
                                Padding(
                                    padding: const EdgeInsets.only(top: 8.0),
                                    child: Container(
                                        width: Get.width,
                                        //color: Colors.grey,
                                        child: Text("Workout",
                                            style: poppinsSemiBold.copyWith(
                                                fontSize: 14,
                                                height: 1,
                                                color: Colors.black)))),
                                Padding(
                                    padding: const EdgeInsets.only(top: 8.0),
                                    child: Container(
                                        width: Get.width,
                                        //color: Colors.grey,
                                        child: Text(
                                            logic.profileDetails!.workout!,
                                            style: poppinsSemiBold.copyWith(
                                                fontSize: 14,
                                                height: 1,
                                                color: ColorResources
                                                    .blickLifggt)))),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    height: 1.2,
                                    decoration: BoxDecoration(
                                        color: Colors.grey.withOpacity(0.4)),
                                  ),
                                ),
                                Padding(
                                    padding: const EdgeInsets.only(top: 8.0),
                                    child: Container(
                                        width: Get.width,
                                        //color: Colors.grey,
                                        child: Text("Alcohol Intake",
                                            style: poppinsSemiBold.copyWith(
                                                fontSize: 14,
                                                height: 1,
                                                color: Colors.black)))),
                                Padding(
                                    padding: const EdgeInsets.only(top: 8.0),
                                    child: Container(
                                        width: Get.width,
                                        //color: Colors.grey,
                                        child: Text(
                                            logic
                                                .profileDetails!.alcoholIntake!,
                                            style: poppinsSemiBold.copyWith(
                                                fontSize: 14,
                                                height: 1,
                                                color: ColorResources
                                                    .blickLifggt)))),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    height: 1.2,
                                    decoration: BoxDecoration(
                                        color: Colors.grey.withOpacity(0.4)),
                                  ),
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                if (dietitianList == "Dietitian") ...[
                                  GestureDetector(
                                    onTap: () {
                                      Get.to(SpecialRemark(
                                          p_userId: logic.profileDetails!.id!));
                                    },
                                    child: Container(
                                      padding: EdgeInsets.only(top: 5),
                                      height: 30,
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                          color: Colors.green[500],
                                          borderRadius:
                                              BorderRadius.circular(6)),
                                      width: Get.width,
                                      child: Text(
                                          "Add Remark and Special Instruction",
                                          style: poppinsSemiBold.copyWith(
                                              fontSize: 14,
                                              height: 1,
                                              color: Colors.white)),
                                    ),
                                  )
                                ]
                              ],
                            ), // Your existing content here
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ]
            ] else ...[
              Center(child: CustomLoadingIndicator())
            ]
          ],
        );
      }),
    );
  }

  Widget _buildAlertSlotSuccessDialog(
      BuildContext context, ProfileDetails? profileDetails) {
    String? formattedNumber;
    String? formattedDate;
    if (profileDetails!.planPrice != null) {
      formattedNumber = NumberFormat('#,##0')
          .format(double.parse(profileDetails!.planPrice!));
    }

    if (profileDetails!.planExpiryDate != null) {
      String originalDateString = profileDetails!.planExpiryDate!;
      DateTime originalDate = DateTime.parse(originalDateString);
      formattedDate = DateFormat('dd MMMM yyyy').format(originalDate);
    }
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(top: 70.0, left: 5, right: 5),
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              Container(
                margin: EdgeInsets.all(30),
                decoration: BoxDecoration(
                    /*border: Border.all(
                        width: 1.2,
                        color: Colors.blue,
                      ),*/
                    gradient: LinearGradient(
                      colors: [
                        Colors.white,
                        Colors.white,
                      ], // Replace with your desired colors
                      begin: Alignment.topLeft,
                      end: Alignment.topRight,
                    ),
                    borderRadius: BorderRadius.circular(10)),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const SizedBox(
                      height: 30,
                    ),
                    Container(
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  height: 45,
                                  width: 45,
                                  decoration: BoxDecoration(
                                      color: ColorResources.buttonred,
                                      borderRadius: BorderRadius.circular(30)),
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
                          Text("${profileDetails!.planName!} PLAN",
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
                              height: 35,
                              width: Get.width,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                color: ColorResources.butongrey,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Text("₹$formattedNumber",
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
                                        fontSize: 17,
                                        color: ColorResources.textRedColor)),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 10.0),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("",
                          textAlign: TextAlign.center,
                          style: poppinstMedium.copyWith(
                              fontSize: 17, height: 1, color: Colors.black)),
                    ),
                    const SizedBox(height: 20.0),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(30.0, 0, 30, 10),
                      child: GestureDetector(
                        onTap: () {
                          Get.back();
                        },
                        child: Container(
                          height: 30,
                          padding: const EdgeInsets.only(left: 10, right: 10),
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              color: ColorResources.buttonYellow,
                              border: Border.all(width: 1, color: Colors.white),
                              borderRadius: BorderRadius.circular(5)),
                          child: Text("Ok",
                              style: poppinstMedium.copyWith(
                                  fontSize: 15,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600)),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10.0),
                  ],
                ),
              ),

              // //Circle Avatar
              // Positioned(
              //   top: -30,
              //   left: 0,
              //   right: 0,
              //   child: Container(
              //     height: 105,
              //     width: 105,
              //     decoration: BoxDecoration(
              //       border: Border.all(
              //         color: Colors.white,
              //         width: 3.0,
              //       ),
              //       gradient: LinearGradient(
              //         colors: [
              //           Colors.white,
              //           ColorResources.cardLenearColor
              //         ], // Replace with your desired colors
              //         begin: Alignment.topLeft,
              //         end: Alignment.topRight,
              //       ),
              //       shape: BoxShape.circle,
              //     ),
              //     child: CircleAvatar(
              //       radius: 70,
              //       backgroundColor: Colors.black,
              //       child: ClipOval(
              //         child: Image.asset(
              //           "assets/images/dlete.gif",
              //           fit: BoxFit.cover,
              //           height: 100,
              //           width: 100,
              //         ),
              //       ),
              //     ),
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
