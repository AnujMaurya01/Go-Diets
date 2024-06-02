import 'dart:io';

import 'package:dietitian/controller/auth_controller.dart';
import 'package:dietitian/utils/colors.dart';
import 'package:dietitian/utils/style.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UploadPrestionScreen extends StatefulWidget {
  const UploadPrestionScreen({super.key});

  @override
  State<UploadPrestionScreen> createState() => _UploadPrestionScreenState();
}

class _UploadPrestionScreenState extends State<UploadPrestionScreen> {
  String pictureName = "";
  String? _imageFile;
  final AuthController _authController = Get.find<AuthController>();

  Future<String?> takePicture() async {
    FilePickerResult? ima = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['jpg', 'jpeg', 'png'],
    );
    if (ima != null) {
      PlatformFile singNatureImage = ima.files.first;
      pictureName = singNatureImage.name;
      _imageFile = singNatureImage.path;
      print('Images:::::::${singNatureImage.path}');
      setState(() {});
      return _imageFile;
    } else {
      return null;
    }
  }

  bool isLoading = false;

  void deletePicture() {
    setState(() {
      _imageFile = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;

    return Scaffold(
      body: SingleChildScrollView(
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
                        height: 50,
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
                                  "Upload Prescription",
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
                    height: screenSize.height * 0.88,
                    child: Column(
                      children: [
                        SizedBox(
                          height: 10,
                        ),
                        Expanded(
                            child: SingleChildScrollView(
                          child: Column(
                            children: [
                              Column(children: [
                                Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Container(
                                      decoration: BoxDecoration(
                                          border: Border.all(),
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      child: Padding(
                                        padding: const EdgeInsets.all(10.0),
                                        child: Column(
                                          children: [
                                            SizedBox(
                                              height: 40,
                                            ),
                                            GestureDetector(
                                              onTap: takePicture,
                                              child: Text('+',
                                                  style:
                                                      poppinstMedium.copyWith(
                                                          fontSize: 50,
                                                          color: Colors.black)),
                                            ),
                                            SizedBox(
                                              height: 0,
                                            ),
                                            Text(
                                                'Tap Here To Upload  Profile Picture',
                                                style: poppinstMedium.copyWith(
                                                    fontSize: 14,
                                                    color: ColorResources
                                                        .TEXTgREY)),
                                            SizedBox(
                                              height: 40,
                                            ),
                                          ],
                                        ),
                                      ),
                                    )),
                                _imageFile != null
                                    ? Container(
                                        margin: EdgeInsets.all(20),
                                        height: 60,
                                        width: double.infinity,
                                        decoration: BoxDecoration(
                                            color: Colors.grey.shade200),
                                        child: Row(
                                          children: [
                                            Container(
                                              height: 80,
                                              width: 70,
                                              decoration: BoxDecoration(
                                                image: DecorationImage(
                                                  image: FileImage(
                                                    File(_imageFile!),
                                                  ),
                                                  fit: BoxFit.fill,
                                                ),
                                              ),
                                            ),
                                            Expanded(
                                              child: Row(
                                                children: [
                                                  SizedBox(
                                                    width: 5,
                                                  ),
                                                  Expanded(
                                                    child: Text(
                                                        '${pictureName}',
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                        style: poppinstMedium
                                                            .copyWith(
                                                                fontSize: 13,
                                                                color: ColorResources
                                                                    .TEXTgREY)),
                                                  ),
                                                  GestureDetector(
                                                      onTap: deletePicture,
                                                      child: Container(
                                                          height: 80,
                                                          color: ColorResources
                                                              .buttonYellow,
                                                          child: Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                    .all(8.0),
                                                            child: Icon(
                                                              Icons.delete,
                                                              color:
                                                                  Colors.black,
                                                            ),
                                                          )))
                                                ],
                                              ),
                                            )
                                          ],
                                        ),
                                      )
                                    : SizedBox(),
                                GestureDetector(
                                  onTap: () async {
                                    setState(() {
                                      isLoading = true;
                                    });
                                    await Future.delayed(Duration(seconds: 4));
                                    Get.find<AuthController>()
                                        .saveuploadprecription(
                                            context: context,
                                            UploadPictire: _imageFile);
                                    setState(() {
                                      isLoading = false;
                                      _imageFile = null;
                                      var snackBar = SnackBar(
                                          content:
                                              Text('Successfully uploaded'));
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(snackBar);
                                    });
                                  },
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.only(
                                            left: 0, right: 0, top: 50),
                                        height: 35,
                                        width: 100,
                                        alignment: Alignment.center,
                                        decoration: BoxDecoration(
                                            color: ColorResources.buttonYellow,
                                            borderRadius:
                                                BorderRadius.circular(5)),
                                        child: Text(
                                          "Submit",
                                          style: poppinsRegular.copyWith(
                                            color: Colors.black,
                                            fontSize: 15,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ]),
                              // if (_authController.isLoadingLogin.value)
                              //   Positioned.fill(
                              //       top: 410,
                              //       left: 0,
                              //       right: 0,
                              //       child: CustomLoadingIndicator())
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
              if (isLoading)
                Positioned.fill(
                  child: Center(
                    child:
                        CustomLoadingIndicator(), // Or your custom loader widget
                  ),
                ),
            ]),
          ],
        ),
      ),
    );
  }
}
