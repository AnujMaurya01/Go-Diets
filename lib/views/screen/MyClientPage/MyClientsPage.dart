import 'dart:async';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:dietitian/controller/auth_controller.dart';
import 'package:dietitian/route/route.dart';
import 'package:dietitian/utils/colors.dart';
import 'package:dietitian/utils/constants.dart';
import 'package:dietitian/utils/dimensions.dart';
import 'package:dietitian/utils/style.dart';
import 'package:dietitian/views/screen/ViewRemarks/ViewRemarksDetails.dart';
import 'package:dietitian/views/screen/ViewWeight/ViewWeight.dart';
import 'package:dietitian/views/screen/ViewWeight/only_weight.dart';
import 'package:dietitian/views/screen/diititanPicture/dititanPictue.dart';
import 'package:dietitian/widget/doctor_assign.dart';
import 'package:dietitian/widget/doctor_dondont.dart';
import 'package:dietitian/widget/doctor_payment.dart';
import 'package:dietitian/widget/doctor_report.dart';
import 'package:dietitian/widget/doctor_view_diets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

final AuthController _authController = Get.find<AuthController>();

class MyClientPage extends StatefulWidget {
  const MyClientPage({super.key});

  @override
  State<MyClientPage> createState() => _MyClientPageState();
}

class _MyClientPageState extends State<MyClientPage> {
  bool isValid = false;
  bool isLoading = false;
  bool isBreakLoading = false;
  int selectedIndex = 0;
  final _scrollController = ScrollController();
  int page = 1;
  bool showLoader = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(Duration(seconds: 1), () {
      setState(() {
        isValid = true;
      });
    });
    Timer(Duration(seconds: 1), () {
      setState(() {
        showLoader = false;
      });
    });
  }

  int ind = 0;
  List<String> wieght = [
    "View Weight",
    "View Special Instructions",
    "View Picture",
    "View Medical Report",
    "View Measurement",
    "Break",
    "Payment History"
  ];
  final TextEditingController nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: ColorResources.buttonYellow,

      // Status bar brightness (optional)
      statusBarIconBrightness: Brightness.dark, // For Android (dark icons)
      statusBarBrightness: Brightness
          .light, // Yahaan aap apne pasandeeda rang ka istemal kar sakte hain
    ));
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        _authController.dietitianDetails(page: page++);
      }
    });
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
          "My Client",
          style: poppinsSemiBold.copyWith(fontSize: 18, color: Colors.black),
        ),
        actions: [
          IconButton(
              onPressed: () {
                _showBottomSheet(context);
              },
              icon: Icon(Icons.filter_alt))
        ],
      ),
      body: GetBuilder<AuthController>(
        builder: (logic) {
          return SingleChildScrollView(
            physics: const NeverScrollableScrollPhysics(),
            child: Column(
              children: [
                Stack(
                  children: [
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
                        height: 150,
                        child: const Column(
                          children: [],
                        ),
                      ),
                    ),
                    Positioned(
                      top: 10,
                      left: 0,
                      right: 0,
                      child: Padding(
                        padding: EdgeInsets.only(left: 20, right: 20),
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25),
                              color: Colors.white),
                          height: screenSize.height * 0.86,
                          child: Column(
                            children: [
                              const SizedBox(
                                height: 10,
                              ),
                              Expanded(
                                child: Obx(
                                  () {
                                    if (_authController.isLoading.value &&
                                        _authController.clientData.isEmpty) {
                                      return Center(
                                          child: CustomLoadingIndicator());
                                    } else if (_authController
                                        .clientData.isEmpty) {
                                      return const Center(
                                          child: Text('No Data found'));
                                    } else {
                                      return Padding(
                                        padding:
                                            EdgeInsets.fromLTRB(8.0, 0, 8, 0),
                                        child: SingleChildScrollView(
                                          child: Column(
                                            children: [
                                              ..._authController.clientData
                                                  .asMap()
                                                  .entries
                                                  .map(
                                                (e) {
                                                  int index = e.key;
                                                  return Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            left: 8.0,
                                                            right: 8,
                                                            top: 0,
                                                            bottom: 5),
                                                    child: Column(
                                                      children: [
                                                        Row(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .end,
                                                          children: [
                                                            Column(
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .start,
                                                              children: [
                                                                e.value.name ==
                                                                        null
                                                                    ? SizedBox()
                                                                    : Text(
                                                                        e.value
                                                                            .name!,
                                                                        style: poppinsSemiBold.copyWith(
                                                                            color:
                                                                                ColorResources.verifyScreenButton,
                                                                            fontSize: 17)),
                                                                e.value.address ==
                                                                        null
                                                                    ? SizedBox()
                                                                    : Text(
                                                                        e.value
                                                                            .address!,
                                                                        style: poppinstMedium.copyWith(
                                                                            color:
                                                                                Colors.black,
                                                                            fontSize: 14)),
                                                              ],
                                                            ),
                                                            const Spacer(),
                                                            GestureDetector(
                                                              onTap: () {
                                                                Get.find<
                                                                        AuthController>()
                                                                    .dietitianUser(
                                                                        id: e
                                                                            .value
                                                                            .id
                                                                            .toString());
                                                                Get.toNamed(
                                                                    RouteHelper
                                                                        .profileNav,
                                                                    arguments:
                                                                        true);
                                                              },
                                                              child: Padding(
                                                                padding:
                                                                    const EdgeInsets
                                                                            .only(
                                                                        top:
                                                                            8.0,
                                                                        right:
                                                                            0.0,
                                                                        left:
                                                                            8.0),
                                                                child:
                                                                    Container(
                                                                  width: 70,
                                                                  height: 25,
                                                                  alignment:
                                                                      Alignment
                                                                          .center,
                                                                  decoration: BoxDecoration(
                                                                      color: ColorResources
                                                                          .buttongreem,
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              5)),
                                                                  child: Text(
                                                                    "DETAILS",
                                                                    style: poppinstMedium.copyWith(
                                                                        color: ColorResources
                                                                            .whiteColor,
                                                                        fontSize:
                                                                            13),
                                                                  ),
                                                                ),
                                                              ),
                                                            )
                                                          ],
                                                        ),
                                                        const SizedBox(
                                                          height: 10,
                                                        ),
                                                        SizedBox(
                                                          height: 35,
                                                          child: Stack(
                                                            children: [
                                                              SingleChildScrollView(
                                                                scrollDirection:
                                                                    Axis.horizontal,
                                                                child: Padding(
                                                                  padding: const EdgeInsets
                                                                          .only(
                                                                      left: 0,
                                                                      right: 0),
                                                                  child: Row(
                                                                    children: [
                                                                      Icon(
                                                                          Icons
                                                                              .visibility,
                                                                          size:
                                                                              20,
                                                                          color:
                                                                              ColorResources.buttongreem),
                                                                      GestureDetector(
                                                                        onTap:
                                                                            () {
                                                                          if (e.value.planExpiryDate ==
                                                                              null) {
                                                                            AwesomeDialog(
                                                                              context: context,
                                                                              dialogType: DialogType.warning,
                                                                              animType: AnimType.topSlide,
                                                                              closeIcon: const Icon(Icons.close_fullscreen_outlined),
                                                                              title: 'User Plan not activated',
                                                                              titleTextStyle: poppinstMedium.copyWith(fontSize: Dimensions.PADDING_SIZE_DEFAULT, color: Colors.black),
                                                                              // desc: 'Plan not activated please purchase plan!',
                                                                              descTextStyle: poppinstMedium.copyWith(fontSize: 17, color: Colors.black),
                                                                              btnCancelColor: Colors.grey[500],
                                                                              btnOkColor: ColorResources.verifyScreenButton,
                                                                              btnOkOnPress: () {},
                                                                            ).show();
                                                                          } else {
                                                                            Get.find<AuthController>().dietitianWeeklys(
                                                                                dititianID: e.value.id.toString(),
                                                                                page: 1);
                                                                            Get.to(
                                                                                OnlyWeightScreen(
                                                                                  nameId: e.value.id.toString(),
                                                                                ),
                                                                                duration: const Duration(milliseconds: ApiConstants.screenTransitionTime),
                                                                                transition: Transition.rightToLeft);
                                                                          }
                                                                        },
                                                                        child:
                                                                            Text(
                                                                          ' View Weight',
                                                                          style: poppinstMedium.copyWith(
                                                                              color: ColorResources.buttongreem,
                                                                              fontSize: 13,
                                                                              height: 1),
                                                                        ),
                                                                      ),
                                                                      const SizedBox(
                                                                        width:
                                                                            10,
                                                                      ),
                                                                      Icon(
                                                                          Icons
                                                                              .visibility,
                                                                          size:
                                                                              20,
                                                                          color:
                                                                              ColorResources.buttongreem),
                                                                      GestureDetector(
                                                                        onTap:
                                                                            () {
                                                                          if (e.value.planExpiryDate ==
                                                                              null) {
                                                                            AwesomeDialog(
                                                                              context: context,
                                                                              dialogType: DialogType.warning,
                                                                              animType: AnimType.topSlide,
                                                                              closeIcon: const Icon(Icons.close_fullscreen_outlined),
                                                                              title: 'User Plan not activated',
                                                                              titleTextStyle: poppinstMedium.copyWith(fontSize: Dimensions.PADDING_SIZE_DEFAULT, color: Colors.black),
                                                                              // desc: 'Plan not activated please purchase plan!',
                                                                              descTextStyle: poppinstMedium.copyWith(fontSize: 17, color: Colors.black),
                                                                              btnCancelColor: Colors.grey[500],
                                                                              btnOkColor: ColorResources.verifyScreenButton,
                                                                              btnOkOnPress: () {},
                                                                            ).show();
                                                                          } else {
                                                                            Get.find<AuthController>().viewDietitan(id: e.value.id.toString());
                                                                            Get.to(ViewRemarksDetails(),
                                                                                duration: const Duration(milliseconds: ApiConstants.screenTransitionTime),
                                                                                transition: Transition.rightToLeft);
                                                                          }
                                                                        },
                                                                        child:
                                                                            Text(
                                                                          ' View Special Instructions',
                                                                          style: poppinstMedium.copyWith(
                                                                              color: ColorResources.buttongreem,
                                                                              fontSize: 13,
                                                                              height: 1),
                                                                        ),
                                                                      ),
                                                                      SizedBox(
                                                                        width:
                                                                            10,
                                                                      ),
                                                                      Icon(
                                                                          Icons
                                                                              .visibility,
                                                                          size:
                                                                              20,
                                                                          color:
                                                                              ColorResources.buttongreem),
                                                                      GestureDetector(
                                                                        onTap:
                                                                            () {
                                                                          if (e.value.planExpiryDate ==
                                                                              null) {
                                                                            AwesomeDialog(
                                                                              context: context,
                                                                              dialogType: DialogType.warning,
                                                                              animType: AnimType.topSlide,
                                                                              closeIcon: const Icon(Icons.close_fullscreen_outlined),
                                                                              title: 'User Plan not activated',
                                                                              titleTextStyle: poppinstMedium.copyWith(fontSize: Dimensions.PADDING_SIZE_DEFAULT, color: Colors.black),
                                                                              // desc: 'Plan not activated please purchase plan!',
                                                                              descTextStyle: poppinstMedium.copyWith(fontSize: 17, color: Colors.black),
                                                                              btnCancelColor: Colors.grey[500],
                                                                              btnOkColor: ColorResources.verifyScreenButton,
                                                                              btnOkOnPress: () {},
                                                                            ).show();
                                                                          } else {
                                                                            Get.find<AuthController>().viewDietitan(id: e.value.id.toString());
                                                                            Get.to(
                                                                                DititanPick(
                                                                                  nameId: e.value.id.toString(),
                                                                                ),
                                                                                duration: Duration(milliseconds: ApiConstants.screenTransitionTime),
                                                                                transition: Transition.rightToLeft);
                                                                          }
                                                                        },
                                                                        child:
                                                                            Text(
                                                                          'View Picture',
                                                                          style: poppinstMedium.copyWith(
                                                                              color: ColorResources.buttongreem,
                                                                              fontSize: 13,
                                                                              height: 1),
                                                                        ),
                                                                      ),
                                                                      SizedBox(
                                                                        width:
                                                                            10,
                                                                      ),
                                                                      Icon(
                                                                          Icons
                                                                              .visibility,
                                                                          size:
                                                                              20,
                                                                          color:
                                                                              ColorResources.buttongreem),
                                                                      GestureDetector(
                                                                        onTap:
                                                                            () {
                                                                          if (e.value.planExpiryDate ==
                                                                              null) {
                                                                            AwesomeDialog(
                                                                              context: context,
                                                                              dialogType: DialogType.warning,
                                                                              animType: AnimType.topSlide,
                                                                              closeIcon: const Icon(Icons.close_fullscreen_outlined),
                                                                              title: 'User Plan not activated',
                                                                              titleTextStyle: poppinstMedium.copyWith(fontSize: Dimensions.PADDING_SIZE_DEFAULT, color: Colors.black),
                                                                              // desc: 'Plan not activated please purchase plan!',
                                                                              descTextStyle: poppinstMedium.copyWith(fontSize: 17, color: Colors.black),
                                                                              btnCancelColor: Colors.grey[500],
                                                                              btnOkColor: ColorResources.verifyScreenButton,
                                                                              btnOkOnPress: () {},
                                                                            ).show();
                                                                          } else {
                                                                            Get.find<AuthController>().doctorviewrepoertttt(puseridd: e.value.id.toString());
                                                                            Get.to(const DoctorReport(),
                                                                                duration: const Duration(milliseconds: ApiConstants.screenTransitionTime),
                                                                                transition: Transition.rightToLeft);
                                                                          }
                                                                        },
                                                                        child:
                                                                            Text(
                                                                          ' View Medical Report',
                                                                          style: poppinstMedium.copyWith(
                                                                              color: ColorResources.buttongreem,
                                                                              fontSize: 13,
                                                                              height: 1),
                                                                        ),
                                                                      ),
                                                                      const SizedBox(
                                                                        width:
                                                                            10,
                                                                      ),
                                                                      Icon(
                                                                          Icons
                                                                              .visibility,
                                                                          size:
                                                                              20,
                                                                          color:
                                                                              ColorResources.buttongreem),
                                                                      GestureDetector(
                                                                        onTap:
                                                                            () {
                                                                          if (e.value.planExpiryDate ==
                                                                              null) {
                                                                            AwesomeDialog(
                                                                              context: context,
                                                                              dialogType: DialogType.warning,
                                                                              animType: AnimType.topSlide,
                                                                              closeIcon: const Icon(Icons.close_fullscreen_outlined),
                                                                              title: 'User Plan not activated',
                                                                              titleTextStyle: poppinstMedium.copyWith(fontSize: Dimensions.PADDING_SIZE_DEFAULT, color: Colors.black),
                                                                              // desc: 'Plan not activated please purchase plan!',
                                                                              descTextStyle: poppinstMedium.copyWith(fontSize: 17, color: Colors.black),
                                                                              btnCancelColor: Colors.grey[500],
                                                                              btnOkColor: ColorResources.verifyScreenButton,
                                                                              btnOkOnPress: () {},
                                                                            ).show();
                                                                          } else {
                                                                            Get.find<AuthController>().dietitianWeeklys(
                                                                                dititianID: e.value.id.toString(),
                                                                                page: 1);
                                                                            Get.to(
                                                                                ViewWeight(
                                                                                  nameId: e.value.id.toString(),
                                                                                ),
                                                                                duration: const Duration(milliseconds: ApiConstants.screenTransitionTime),
                                                                                transition: Transition.rightToLeft);
                                                                          }
                                                                        },
                                                                        child:
                                                                            Text(
                                                                          ' View Measurement',
                                                                          style: poppinstMedium.copyWith(
                                                                              color: ColorResources.buttongreem,
                                                                              fontSize: 13,
                                                                              height: 1),
                                                                        ),
                                                                      ),
                                                                      const SizedBox(
                                                                        width:
                                                                            10,
                                                                      ),
                                                                      Icon(
                                                                          Icons
                                                                              .visibility,
                                                                          size:
                                                                              20,
                                                                          color:
                                                                              ColorResources.buttongreem),
                                                                      e.value.userBreak ==
                                                                              "On"
                                                                          ? GestureDetector(
                                                                              onTap: () async {
                                                                                if (e.value.planExpiryDate == null) {
                                                                                  AwesomeDialog(
                                                                                    context: context,
                                                                                    dialogType: DialogType.warning,
                                                                                    animType: AnimType.topSlide,
                                                                                    closeIcon: const Icon(Icons.close_fullscreen_outlined),
                                                                                    title: 'User Plan not activated',
                                                                                    titleTextStyle: poppinstMedium.copyWith(fontSize: Dimensions.PADDING_SIZE_DEFAULT, color: Colors.black),
                                                                                    // desc: 'Plan not activated please purchase plan!',
                                                                                    descTextStyle: poppinstMedium.copyWith(fontSize: 17, color: Colors.black),
                                                                                    btnCancelColor: Colors.grey[500],
                                                                                    btnOkColor: ColorResources.verifyScreenButton,
                                                                                    btnOkOnPress: () {},
                                                                                  ).show();
                                                                                } else {
                                                                                  setState(() {
                                                                                    selectedIndex = index;
                                                                                    isBreakLoading = true;
                                                                                  });
                                                                                  await Future.delayed(const Duration(seconds: 2));
                                                                                  Get.find<AuthController>().doctorrrbareckkk(dititianID: e.value.id.toString(), staetsss: 'Off');
                                                                                  setState(() {
                                                                                    isBreakLoading = false;
                                                                                  });
                                                                                }
                                                                              },
                                                                              child: Text(
                                                                                ' Break',
                                                                                style: poppinstMedium.copyWith(color: ColorResources.buttongreem, fontSize: 13, height: 1),
                                                                              ),
                                                                            )
                                                                          : GestureDetector(
                                                                              onTap: () async {
                                                                                if (e.value.planExpiryDate == null) {
                                                                                  AwesomeDialog(
                                                                                    context: context,
                                                                                    dialogType: DialogType.warning,
                                                                                    animType: AnimType.topSlide,
                                                                                    closeIcon: const Icon(Icons.close_fullscreen_outlined),
                                                                                    title: 'User Plan not activated',
                                                                                    titleTextStyle: poppinstMedium.copyWith(fontSize: Dimensions.PADDING_SIZE_DEFAULT, color: Colors.black),
                                                                                    // desc: 'Plan not activated please purchase plan!',
                                                                                    descTextStyle: poppinstMedium.copyWith(fontSize: 17, color: Colors.black),
                                                                                    btnCancelColor: Colors.grey[500],
                                                                                    btnOkColor: ColorResources.verifyScreenButton,
                                                                                    btnOkOnPress: () {},
                                                                                  ).show();
                                                                                } else {
                                                                                  setState(() {
                                                                                    selectedIndex = index;

                                                                                    isBreakLoading = true;
                                                                                  });
                                                                                  await Future.delayed(const Duration(seconds: 2));
                                                                                  Get.find<AuthController>().doctorrrbareckkk(dititianID: e.value.id.toString(), staetsss: 'On');
                                                                                  setState(() {
                                                                                    isBreakLoading = false;
                                                                                  });
                                                                                }
                                                                              },
                                                                              child: Text(
                                                                                ' Break Off',
                                                                                style: poppinstMedium.copyWith(color: Colors.red, fontSize: 13, height: 1),
                                                                              ),
                                                                            ),
                                                                      const SizedBox(
                                                                        width:
                                                                            10,
                                                                      ),
                                                                      Icon(
                                                                          Icons
                                                                              .visibility,
                                                                          size:
                                                                              20,
                                                                          color:
                                                                              ColorResources.buttongreem),
                                                                      GestureDetector(
                                                                        onTap:
                                                                            () {
                                                                          if (e.value.planExpiryDate ==
                                                                              null) {
                                                                            AwesomeDialog(
                                                                              context: context,
                                                                              dialogType: DialogType.warning,
                                                                              animType: AnimType.topSlide,
                                                                              closeIcon: const Icon(Icons.close_fullscreen_outlined),
                                                                              title: 'User Plan not activated',
                                                                              titleTextStyle: poppinstMedium.copyWith(fontSize: Dimensions.PADDING_SIZE_DEFAULT, color: Colors.black),
                                                                              // desc: 'Plan not activated please purchase plan!',
                                                                              descTextStyle: poppinstMedium.copyWith(fontSize: 17, color: Colors.black),
                                                                              btnCancelColor: Colors.grey[500],
                                                                              btnOkColor: ColorResources.verifyScreenButton,
                                                                              btnOkOnPress: () {},
                                                                            ).show();
                                                                          } else {
                                                                            Get.find<UserTransactionHistoryController>().fetchUserTransactions(
                                                                              iddd: e.value.id.toString(),
                                                                            );
                                                                            Get.to(DoctorPaymentHistory(),
                                                                                duration: Duration(milliseconds: ApiConstants.screenTransitionTime),
                                                                                transition: Transition.rightToLeft);
                                                                          }
                                                                        },
                                                                        child:
                                                                            Text(
                                                                          ' Payment History',
                                                                          style: poppinstMedium.copyWith(
                                                                              color: ColorResources.buttongreem,
                                                                              fontSize: 13,
                                                                              height: 1),
                                                                        ),
                                                                      ),
                                                                      const SizedBox(
                                                                        width:
                                                                            10,
                                                                      ),
                                                                      Icon(
                                                                          Icons
                                                                              .visibility,
                                                                          size:
                                                                              20,
                                                                          color:
                                                                              ColorResources.buttongreem),
                                                                      GestureDetector(
                                                                        onTap:
                                                                            () {
                                                                          Get.find<AuthController>()
                                                                              .doctoreedondontttt(psuerdidd: e.value.id.toString());
                                                                          //
                                                                          Get.to(
                                                                              DoctorDondontScreen(
                                                                                puseridd: e.value.id.toString(),
                                                                                username: e.value.name,
                                                                              ),
                                                                              duration: Duration(milliseconds: ApiConstants.screenTransitionTime),
                                                                              transition: Transition.rightToLeft);
                                                                          //
                                                                        },
                                                                        child:
                                                                            Text(
                                                                          ' Do n don\'t ',
                                                                          style: poppinstMedium.copyWith(
                                                                              color: ColorResources.buttongreem,
                                                                              fontSize: 13,
                                                                              height: 1),
                                                                        ),
                                                                      ),
                                                                      const SizedBox(
                                                                        width:
                                                                            10,
                                                                      ),
                                                                      Icon(
                                                                          Icons
                                                                              .visibility,
                                                                          size:
                                                                              20,
                                                                          color:
                                                                              ColorResources.buttongreem),
                                                                      GestureDetector(
                                                                        onTap:
                                                                            () {
                                                                          Get.find<AuthController>().weeklyydeitsss(
                                                                              context,
                                                                              isupdate: false);
                                                                          Get.find<AuthController>().specialdiett(
                                                                              context,
                                                                              isupdate: false);
                                                                          Get.to(
                                                                              AssignDietTemplete(
                                                                                puserid: e.value.id.toString(),
                                                                              ),
                                                                              duration: Duration(milliseconds: ApiConstants.screenTransitionTime),
                                                                              transition: Transition.rightToLeft);
                                                                          //
                                                                        },
                                                                        child:
                                                                            Text(
                                                                          ' Assign Diet Template',
                                                                          style: poppinstMedium.copyWith(
                                                                              color: ColorResources.buttongreem,
                                                                              fontSize: 13,
                                                                              height: 1),
                                                                        ),
                                                                      ),
                                                                      const SizedBox(
                                                                        width:
                                                                            10,
                                                                      ),
                                                                      Icon(
                                                                          Icons
                                                                              .visibility,
                                                                          size:
                                                                              20,
                                                                          color:
                                                                              ColorResources.buttongreem),
                                                                      GestureDetector(
                                                                        onTap:
                                                                            () {
                                                                          Get.find<AuthController>().doctorweeklyyviewsietss(
                                                                              context,
                                                                              templeteidd: e.value.dietTemplateId,
                                                                              puseridd: e.value.id.toString());
                                                                          Get.find<AuthController>().doctorspecialliewsietss(
                                                                              context,
                                                                              templeteidd: e.value.specialDietId.toString(),
                                                                              puseridd: e.value.id.toString());
                                                                          //
                                                                          Get.to(
                                                                              DoctorviewDietsScreen(
                                                                                puseridd: e.value.id.toString(),
                                                                                templeteid: e.value.dietTemplateId,
                                                                                specialidd: e.value.specialDietId.toString(),
                                                                              ),
                                                                              duration: Duration(milliseconds: ApiConstants.screenTransitionTime),
                                                                              transition: Transition.rightToLeft);
                                                                          //
                                                                        },
                                                                        child:
                                                                            Text(
                                                                          ' View Diet',
                                                                          style: poppinstMedium.copyWith(
                                                                              color: ColorResources.buttongreem,
                                                                              fontSize: 13,
                                                                              height: 1),
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                              ),
                                                              if (selectedIndex ==
                                                                  index) ...[
                                                                if (isBreakLoading)
                                                                  Positioned
                                                                      .fill(
                                                                    child:
                                                                        CustomLoadingIndicator1(),
                                                                  )
                                                              ]
                                                            ],
                                                          ),
                                                        ),
                                                        Container(
                                                          height: 1.5,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: Colors.grey
                                                                .withOpacity(
                                                                    0.4),
                                                          ),
                                                        )
                                                      ],
                                                    ),
                                                  );
                                                },
                                              ).toList(),
                                            ],
                                          ),
                                        ),
                                      );
                                    }
                                  },
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
            ),
          );
        },
      ),
    );
  }

  void _showBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30.0),
          topRight: Radius.circular(30.0),
        ),
      ),
      builder: (BuildContext context) {
        return Column(
          children: [
            Container(
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30.0),
                  topRight: Radius.circular(30.0),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 0,
                    ),
                    Text(
                      "Filter By",
                      style: poppinsSemiBold.copyWith(
                          fontSize: 18, color: Colors.black),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 0, bottom: 5, top: 20),
                      child: Container(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Name",
                          textAlign: TextAlign.center,
                          style: poppinsSemiBold.copyWith(
                            fontSize: 15,
                            height: 1.2,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 0, right: 0, top: 0),
                      child: SizedBox(
                        height: 45,
                        child: TextFormField(
                          controller: nameController,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.grey.shade200,
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(
                                color: Colors.grey.shade400,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(
                                color: Colors.grey.shade400,
                              ),
                            ),
                            contentPadding:
                                const EdgeInsets.only(top: 5, left: 10),
                            // hintText: AppConstants.password,
                            hintStyle:
                                poppinstMedium.copyWith(color: Colors.grey),
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () async {
                        setState(() {
                          isLoading = true;
                        });
                        Navigator.pop(context);
                        await Future.delayed(const Duration(seconds: 1));
                        Get.find<AuthController>().dietitianDetails(
                            page: 1, filtername: nameController.text);
                        setState(
                          () {
                            isLoading = false;
                            nameController.clear();
                          },
                        );
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(
                            top: 30.0, right: 0.0, left: 8.0),
                        child: Container(
                          width: 250,
                          height: 40,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: ColorResources.buttongreem,
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Text(
                            "Submit",
                            style: poppinstMedium.copyWith(
                                color: ColorResources.whiteColor, fontSize: 13),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
