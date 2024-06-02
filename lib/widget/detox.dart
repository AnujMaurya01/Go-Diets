import 'package:dietitian/controller/auth_controller.dart';
import 'package:dietitian/utils/colors.dart';
import 'package:dietitian/utils/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class DetoxScreen extends StatefulWidget {
  const DetoxScreen({super.key});

  @override
  State<DetoxScreen> createState() => _DetoxScreenState();
}

class _DetoxScreenState extends State<DetoxScreen> {
  final TextEditingController templateenameController = TextEditingController();
  final TextEditingController contennttController = TextEditingController();
  bool emailerrer = false;
  bool isLoading = false;
  final AuthController _authController = Get.find<AuthController>();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  bool passwordError = false;
  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;

    return Scaffold(
      body: SingleChildScrollView(
        physics: NeverScrollableScrollPhysics(),
        child: Stack(children: [
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
                              "Detox Diet",
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
                child: Column(
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    Stack(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 20, bottom: 5, top: 20),
                              child: Text(
                                "Template Name",
                                textAlign: TextAlign.center,
                                style: poppinsSemiBold.copyWith(
                                  fontSize: 15,
                                  height: 1.2,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 20, right: 20, top: 0),
                              child: Container(
                                height: 45,
                                child: TextFormField(
                                  controller: templateenameController,
                                  decoration: InputDecoration(
                                    filled: true,
                                    fillColor: Colors.grey.shade200,
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: BorderSide(
                                        color: emailerrer
                                            ? Colors.red
                                            : Colors.grey.shade400,
                                      ),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: BorderSide(
                                        color: emailerrer
                                            ? Colors.red
                                            : Colors.grey.shade400,
                                      ),
                                    ),
                                    contentPadding:
                                        EdgeInsets.only(top: 5, left: 10),
                                    // hintText: AppConstants.password,
                                    hintStyle: poppinstMedium.copyWith(
                                        color: Colors.grey),
                                  ),
                                  onChanged: (value) {
                                    setState(() {
                                      emailerrer = false;
                                    });
                                  },
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 20, bottom: 5, top: 20),
                              child: Row(
                                children: [
                                  Text(
                                    "Content",
                                    textAlign: TextAlign.center,
                                    style: poppinsSemiBold.copyWith(
                                      fontSize: 15,
                                      height: 1.2,
                                      color: Colors.black,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 20, right: 20, top: 0),
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
                                    contentPadding:
                                        EdgeInsets.only(top: 5, left: 10),
                                    // hintText: AppConstants.password,
                                    hintStyle: poppinstMedium.copyWith(
                                        color: Colors.grey),
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
                                detoxxdiett(context);
                              },
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(
                                        left: 0, right: 30, top: 20),
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
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 20, right: 20),
                      child: Container(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Detox Diet",
                          textAlign: TextAlign.center,
                          style: poppinsSemiBold.copyWith(
                            fontSize: 18,
                            height: 1.2,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                    Expanded(child: SingleChildScrollView(child:
                        GetBuilder<AuthController>(
                            builder: (detoxxxxlisttdata) {
                      if (detoxxxxlisttdata.isLoading.value &&
                          detoxxxxlisttdata.detoxlistdatata.isEmpty) {
                        return Center(child: CustomLoadingIndicator());
                      } else if (detoxxxxlisttdata.detoxlistdatata.isEmpty) {
                        return const Center(
                            child: Padding(
                          padding: EdgeInsets.only(top: 200),
                          child: Text('No Data found!'),
                        ));
                      } else {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              ...detoxxxxlisttdata.detoxlistdatata
                                  .asMap()
                                  .entries
                                  .map((e) {
                                return Padding(
                                    padding: EdgeInsets.only(
                                        left: 0.0, right: 0, top: 0, bottom: 5),
                                    child: Container(
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                              color: Colors.grey.shade500),

                                          //color: Colors.red,
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
                                            Text(
                                              'Template Name:   ${e.value.templateName}',
                                              textAlign: TextAlign.start,
                                              style: poppinstMedium.copyWith(
                                                fontSize: 14,
                                                height: 1,
                                                color: Colors.black,
                                              ),
                                            ),
                                            Text(
                                              'Content:   ${e.value.content}',
                                              textAlign: TextAlign.start,
                                              style: poppinstMedium.copyWith(
                                                fontSize: 12,
                                                height: 1.2,
                                                color: Colors.black,
                                              ),
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceAround,
                                              children: [
                                                GestureDetector(
                                                  onTap: () async {
                                                    Clipboard.setData(ClipboardData(
                                                        text:
                                                            '${e.value.templateName}${e.value.content}'));
                                                    ScaffoldMessenger.of(
                                                            context)
                                                        .showSnackBar(
                                                      SnackBar(
                                                          content: Text(
                                                              'Text copied to clipboard')),
                                                    );
                                                  },
                                                  child: Container(
                                                    margin: EdgeInsets.only(
                                                        left: 0,
                                                        right: 0,
                                                        top: 10),
                                                    height: 25,
                                                    width: 100,
                                                    alignment: Alignment.center,
                                                    decoration: BoxDecoration(
                                                        color: Colors.green,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(5)),
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceEvenly,
                                                      children: [
                                                        Icon(
                                                          Icons.copy,
                                                          color: Colors.white,
                                                          size: 15,
                                                        ),
                                                        Text(
                                                          "Copy Diet",
                                                          style: poppinsRegular
                                                              .copyWith(
                                                            color: Colors.white,
                                                            fontSize: 12,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                                GestureDetector(
                                                  onTap: () async {
                                                    setState(() {
                                                      isLoading = true;
                                                    });
                                                    await Future.delayed(
                                                        Duration(seconds: 2));
                                                    Get.find<AuthController>()
                                                        .detoccdeleteapiii(
                                                            id: e.value.id);
                                                    setState(() {
                                                      isLoading = false;
                                                    });
                                                  },
                                                  child: Container(
                                                    margin: EdgeInsets.only(
                                                        left: 0,
                                                        right: 0,
                                                        top: 10),
                                                    height: 25,
                                                    width: 100,
                                                    alignment: Alignment.center,
                                                    decoration: BoxDecoration(
                                                        color: Colors
                                                            .grey.shade300,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(5)),
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceEvenly,
                                                      children: [
                                                        Icon(
                                                          Icons
                                                              .delete_forever_outlined,
                                                          color: Colors.red,
                                                          size: 22,
                                                        ),
                                                        Text(
                                                          "Delete",
                                                          style: poppinsRegular
                                                              .copyWith(
                                                            color: Colors.red,
                                                            fontSize: 15,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            )
                                          ],
                                        ),
                                      ),
                                    ));
                              }).toList(),
                            ],
                          ),
                        );
                      }
                    }))),
                    SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ]),
      ),
    );
  }

  Future<void> detoxxdiett(BuildContext context) async {
    String templetee = templateenameController.text.trim();
    String contenntt = contennttController.text.trim();
    if (templetee.isEmpty) {
      setState(() {
        emailerrer = true;
        passwordError = true;
      });
    } else if (contenntt.isEmpty) {
    } else {
      try {
        setState(() {
          isLoading = true;
        });
        await Future.delayed(Duration(seconds: 2));

        Get.find<AuthController>().detoxxxxpostapiiii(
            templatename: templetee.trim(),
            contenttname: contenntt.trim(),
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
