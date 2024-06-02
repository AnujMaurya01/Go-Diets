import 'package:dietitian/controller/auth_controller.dart';
import 'package:dietitian/route/route.dart';
import 'package:dietitian/utils/all_images.dart';
import 'package:dietitian/utils/colors.dart';
import 'package:dietitian/utils/style.dart';
import 'package:dietitian/views/screen/DilogaLoder/loadingPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class SpecialRemark extends StatefulWidget {
  int? p_userId;

  SpecialRemark({super.key, this.p_userId});

  @override
  State<SpecialRemark> createState() => _SpecialRemarkState();
}

class _SpecialRemarkState extends State<SpecialRemark> {
  GlobalKey<FormState> formKeyStep = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery
        .of(context)
        .size;
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: ColorResources.buttonYellow,

      // Status bar brightness (optional)
      statusBarIconBrightness: Brightness.dark, // For Android (dark icons)
      statusBarBrightness: Brightness
          .light, // Yahaan aap apne pasandeeda rang ka istemal kar sakte hain
    ));
    return Scaffold(
      //  backgroundColor: ColorResources.loginappColor,
      body: SingleChildScrollView(
        //  physics: NeverScrollableScrollPhysics(),
        child: GetBuilder<AuthController>(builder: (logic) {
          return Obx(() {
            return Stack(
              children: [
                Column(
                  children: [
                    Stack(children: [
                      Container(
                        height: MediaQuery
                            .of(context)
                            .size
                            .height,
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
                                padding: const EdgeInsets.all(15.0),
                                child: GestureDetector(
                                  onTap: () {
                                    Get.back();
                                  },
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment
                                        .start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(
                                        Icons.arrow_back_ios,
                                        color: Colors.black,
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Container(
                                        child: Text(
                                          "Add Remark and\nSpecial Instruction",
                                          textAlign: TextAlign.center,
                                          style: poppinsSemiBold.copyWith(
                                            fontSize: 20,
                                            height: 1.2,
                                            color: Colors.black,
                                          ),
                                        ),
                                      ),
                                      Spacer(),
                                      GestureDetector(
                                        onTap: () {
                                          Get.find<AuthController>()
                                              .viewDietitan(
                                              id: widget.p_userId.toString());
                                          Get.toNamed(
                                              RouteHelper.viewRemarksDetails,
                                              arguments: true);
                                        },
                                        child: Container(
                                          height: 55,
                                          width: 50,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                            BorderRadius.circular(8),
                                            color: ColorResources.manui,
                                          ),
                                          child: Column(
                                            children: [
                                              SizedBox(
                                                height: 5,
                                              ),
                                              Image.asset(
                                                Images.Eyses,
                                                height: 20,
                                              ),
                                              Text(
                                                "View\nList",
                                                textAlign: TextAlign.center,
                                                style: poppinsSemiBold.copyWith(
                                                    fontSize: 13,
                                                    height: 1,
                                                    color: Colors.black),
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
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
                            //  color: ColorResources.whiteColor,
                            height: screenSize.height * 0.84,
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
                                    ))
                              ],
                            ),
                          ),
                        ),
                      ),
                    ]),
                  ],
                ),
                if (logic.isLoad.value)
                  Positioned.fill(
                    child: Container(
                      color: Colors.black.withOpacity(0.5),
                      child: Center(
                        child: CustomLoadingIndicator(),
                      ),
                    ),
                  )
              ],
            );
          });
        }),
      ),
    );
  }

  Widget steponecontainer2() {
    return GetBuilder<AuthController>(builder: (logic) {
      return Form(
        key: formKeyStep,
        child: Padding(
          padding: const EdgeInsets.only(left: 10.0, right: 10, top: 0),
          child: Container(
            child: Padding(
              padding: const EdgeInsets.only(left: 10.0, right: 10, top: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "Add Remark:",
                    style: poppinsSemiBold.copyWith(
                        fontSize: 19, color: ColorResources.buttongreem),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter your Add Remarks';
                      }
                      return null;
                    },
                    maxLines: 10,
                    controller: logic.textAddRemarks,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(
                          horizontal: 15.0,
                          vertical: 10), // Adjust padding as needed
                      fillColor: Colors.grey[200],
                      filled: true,
                      border: UnderlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        //  borderSide: BorderSide.none,
                      ), // Remove the border
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Add Special Instruction:",
                    style: poppinsSemiBold.copyWith(
                        fontSize: 19, color: ColorResources.buttongreem),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter your Add Special Instruction';
                      }
                      return null;
                    },
                    maxLines: 10,
                    controller: logic.textAddSpecialData,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(
                          horizontal: 15.0,
                          vertical: 10), // Adjust padding as needed
                      fillColor: Colors.grey[200],
                      filled: true,
                      border: UnderlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        //  borderSide: BorderSide.none,
                      ), // Remove the border
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  GestureDetector(
                    onTap: () {
                      if (formKeyStep.currentState!.validate()) {
                        String ARMs = logic.textAddRemarks.text;
                        String chest = logic.textAddSpecialData.text;
                        Get.find<AuthController>().addRemarksDetails(
                            context: context,
                            addRemarks: ARMs.trim(),
                            addSpecialInstrction: chest.trim(),
                            p_userId: widget.p_userId.toString());
                      }
                    },
                    child: Container(
                      width: Get.width,
                      height: 30,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: ColorResources.buttongreem,
                      ),
                      child: Text(
                        "Submit",
                        style: poppinstMedium.copyWith(
                            fontSize: 16, color: Colors.white),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}
