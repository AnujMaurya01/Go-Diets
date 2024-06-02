import 'package:dietitian/controller/auth_controller.dart';
import 'package:dietitian/utils/all_images.dart';
import 'package:dietitian/utils/colors.dart';
import 'package:dietitian/utils/style.dart';
import 'package:dietitian/views/screen/DilogaLoder/loadingPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:zego_zimkit/zego_zimkit.dart';

final AuthController _authController = Get.find<AuthController>();

class WeeklyPicture extends StatefulWidget {
  const WeeklyPicture({super.key});

  @override
  State<WeeklyPicture> createState() => _WeeklyPictureState();
}

class _WeeklyPictureState extends State<WeeklyPicture> {
  String? _imageFile;
  String pictureName = "";
  GlobalKey<FormState> formKeyStep = GlobalKey<FormState>();

  Future<String?> takePicture() async {
    FilePickerResult? ima = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['jpg', 'jpeg', 'png'], // Specify image file types
    );
    if (ima != null) {
      PlatformFile singNatureImage = ima.files.first;
      setState(() {
        _authController.textUploadPicture.text = singNatureImage.name;
        _imageFile = singNatureImage.path;
      }); // Get the path of the picked image
      return _imageFile;
    } else {
      // User canceled the file picking
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: GetBuilder<AuthController>(builder: (logic) {
        return Obx(() {
          return SingleChildScrollView(
            //  physics: NeverScrollableScrollPhysics(),
            child: Stack(
              children: [
                Column(
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
                                padding: const EdgeInsets.all(20.0),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        Get.back();
                                      },
                                      child: Icon(
                                        Icons.arrow_back_ios,
                                        color: Colors.black,
                                      ),
                                    ),
                                    Spacer(),
                                    Container(
                                      child: Text(
                                        "Weekly Picture\n& Measurements",
                                        textAlign: TextAlign.center,
                                        style: poppinsSemiBold.copyWith(
                                          fontSize: 18,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ),
                                    Spacer(),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        top: 130,
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
                                  // physics: NeverScrollableScrollPhysics(),
                                  child: Column(
                                    children: [
                                      steponecontainer2(),
                                    ],
                                  ),
                                )),
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
            ),
          );
        });
      }),
    );
  }

  Widget steponecontainer2() {
    return Padding(
      padding: const EdgeInsets.only(left: 10.0, right: 10, top: 0),
      child: Form(
        key: formKeyStep,
        child: Container(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                // for (int i = 0; i < 30; i++)
                Container(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'CHEST/BUST',
                    style: poppinstMedium.copyWith(
                        color: ColorResources.greenText, fontSize: 19),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter your CHEST/BUST';
                    }
                    return null;
                  },
                  controller: _authController.textChestBust,
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
                Container(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'WAIST',
                    style: poppinstMedium.copyWith(
                        color: ColorResources.greenText, fontSize: 19),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter your WAIST';
                    }
                    return null;
                  },
                  controller: _authController.textWaist,
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
                Container(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'HIP',
                    style: poppinstMedium.copyWith(
                        color: ColorResources.greenText, fontSize: 19),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter your HIP';
                    }
                    return null;
                  },
                  controller: _authController.textHip,
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
                Container(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'ARMS',
                    style: poppinstMedium.copyWith(
                        color: ColorResources.greenText, fontSize: 19),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter your ARMS';
                    }
                    return null;
                  },
                  controller: _authController.textARMS,
                  decoration: InputDecoration(
                    fillColor: Colors.grey[200],
                    filled: true,
                    border: UnderlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      //  borderSide: BorderSide.none,
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Weight',
                    style: poppinstMedium.copyWith(
                        color: ColorResources.greenText, fontSize: 19),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter your weight';
                    }
                    return null;
                  },
                  controller: _authController.weighttt,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    fillColor: Colors.grey[200],
                    filled: true,
                    border: UnderlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      //  borderSide: BorderSide.none,
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Upload Picture'.toUpperCase(),
                    style: poppinstMedium.copyWith(
                        color: ColorResources.greenText, fontSize: 19),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 12,
                  ),
                  textAlign: TextAlign.start,
                  controller: _authController.textUploadPicture,
                  readOnly: true,
                  decoration: InputDecoration(
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 10.0, vertical: 18),
                      fillColor: Colors.grey[200],
                      filled: true,
                      border: UnderlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      suffixIcon: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: GestureDetector(
                          onTap: () {
                            takePicture();
                          },
                          child: Container(
                            width: 90,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                color: Colors.white70,
                                borderRadius: BorderRadius.circular(5)),
                            child: Text(
                              "Upload",
                              style: poppinstMedium.copyWith(
                                  fontSize: 14,
                                  color: Colors.black.withOpacity(0.8)),
                            ),
                          ),
                        ),
                      )),
                ),
                SizedBox(
                  height: 30,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 40, right: 40),
                  child: GestureDetector(
                    onTap: () {
                      String? Path;
                      String data = _imageFile!;
                      if (data.isNotEmpty) {
                        Path = data;
                      }
                      if (formKeyStep.currentState!.validate()) {
                        String ARMs = _authController.textARMS.text;
                        String chest = _authController.textChestBust.text;
                        String waist = _authController.textWaist.text;
                        String hip = _authController.textWaist.text;
                        String weighttt = _authController.weighttt.text;

                        Get.find<AuthController>().saveWeeklyMeasurements(
                            context: context,
                            ARMs: ARMs.trim(),
                            chest: chest.trim(),
                            waist: waist.trim(),
                            hip: hip.trim(),
                            weightt: weighttt,
                            UploadPictire: data);
                      }
                    },
                    child: Container(
                      height: 35,
                      alignment: Alignment.center,
                      width: Get.width,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: ColorResources.butgreem),
                      child: Text(
                        "Submit",
                        style: poppinsRegular.copyWith(
                            color: Colors.white, fontSize: 16),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
