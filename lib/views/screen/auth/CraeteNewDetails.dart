import 'dart:async';
import 'package:dietitian/controller/auth_controller.dart';
import 'package:dietitian/controller/registraterAccountDetails.dart';
import 'package:dietitian/utils/all_images.dart';
import 'package:dietitian/utils/colors.dart';
import 'package:dietitian/utils/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:get/get.dart';

final RegisterController registerController = Get.find<RegisterController>();

class CreateNewDeatils extends StatefulWidget {
  String? Stepeer;

  CreateNewDeatils({super.key, this.Stepeer});

  @override
  State<CreateNewDeatils> createState() => _CreateNewDeatilsState();
}

class _CreateNewDeatilsState extends State<CreateNewDeatils> {
  String? gender;
  int _selectedIndex = 0;
  bool isLoading = false;
  String? nameText;
  static final List<Widget> _widgetOptions = <Widget>[
    steponecontainer1(),
    steponecontainer2(),
    steponecontainer3(),
  ];
  static final List<String> _widgetOption = <String>[
    Images.user_icon,
    Images.step2icon,
    Images.Vector,
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print('objectsMLDKMlmd${widget.Stepeer}');
    if (widget.Stepeer == "0") {
      setState(() {
        _selectedIndex = 0;
      });
    } else if (widget.Stepeer == "1") {
      setState(() {
        _selectedIndex = 1;
      });
    } else if (widget.Stepeer == "2") {
      setState(() {
        _selectedIndex = 2;
      });
    }
  }

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
    return Scaffold(
      //  backgroundColor: ColorResources.loginappColor,
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
          "Welcome to Go Diet",
          style: poppinsSemiBold.copyWith(fontSize: 20, color: Colors.black),
        ),
      ),
      body: GetBuilder<AuthController>(builder: (logic) {
        return SingleChildScrollView(
          ///physics: NeverScrollableScrollPhysics(),
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
                        height: 150,
                        child: Column(
                          children: [
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              "Are you joining as a User for the "
                              "first time (If No please mention your previous "
                              "results and the name of Dietician)",
                              textAlign: TextAlign.center,
                              style: poppinsSemiBold.copyWith(fontSize: 13),
                            )
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
                            color: ColorResources.registrationText,
                          ),
                          //  color: ColorResources.whiteColor,
                          height: screenSize.height * 0.76,
                          child: Column(
                            children: [
                              SizedBox(
                                height: 10,
                              ),
                              Container(
                                height: 110,
                                child: Column(
                                  children: [
                                    Container(
                                        height: 65,
                                        width: 65,
                                        decoration: BoxDecoration(
                                            color: ColorResources
                                                .faceStepperButton,
                                            border: Border.all(
                                                width: 1, color: Colors.white),
                                            borderRadius:
                                                BorderRadius.circular(90)),
                                        child: Image.asset(
                                          _widgetOption[_selectedIndex],
                                        )),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Container(
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Container(
                                            height: 15,
                                            width: 15,
                                            decoration: BoxDecoration(
                                                color:
                                                    ColorResources.whiteColor,
                                                borderRadius:
                                                    BorderRadius.circular(40)),
                                          ),
                                          Container(
                                            height: 2,
                                            width: 70,
                                            decoration: BoxDecoration(
                                              color: _selectedIndex >= 1
                                                  ? ColorResources.whiteColor
                                                  : ColorResources
                                                      .loginOpenButton,
                                            ),
                                          ),
                                          Container(
                                            height: 15,
                                            width: 15,
                                            decoration: BoxDecoration(
                                                color: _selectedIndex >= 1
                                                    ? ColorResources.whiteColor
                                                    : ColorResources
                                                        .loginOpenButton,
                                                borderRadius:
                                                    BorderRadius.circular(40)),
                                          ),
                                          Container(
                                            height: 2,
                                            width: 70,
                                            decoration: BoxDecoration(
                                              color: _selectedIndex == 2
                                                  ? ColorResources.whiteColor
                                                  : ColorResources
                                                      .loginOpenButton,
                                            ),
                                          ),
                                          Container(
                                            height: 15,
                                            width: 15,
                                            decoration: BoxDecoration(
                                                color: _selectedIndex == 2
                                                    ? ColorResources.whiteColor
                                                    : ColorResources
                                                        .loginOpenButton,
                                                borderRadius:
                                                    BorderRadius.circular(40)),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Expanded(
                                  child: SingleChildScrollView(
                                child: Stack(
                                  children: [
                                    Column(
                                      children: [
                                        Container(
                                            child: _widgetOptions
                                                .elementAt(_selectedIndex)),
                                        if (_selectedIndex == 0) ...[
                                          SizedBox(
                                            height: 30,
                                          ),
                                          Container(
                                            alignment: Alignment.bottomCenter,
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  GestureDetector(
                                                    onTap: () async {
                                                      FocusScope.of(context)
                                                          .unfocus();
                                                      if (_selectedIndex < 2) {
                                                        if (registerController
                                                                .selectedGender ==
                                                            null) {
                                                          /* setState(() {
                                                        nameText = "2";
                                                      });*/
                                                          registerController
                                                                  .errorText
                                                                  .value =
                                                              'Please select a gender.';
                                                        } else {
                                                          registerController
                                                              .errorText
                                                              .value = "";

                                                          if (registerController
                                                              .formKeyStep1
                                                              .currentState!
                                                              .validate()) {
                                                            setState(() {
                                                              nameText = "1";
                                                            });
                                                            setState(() {
                                                              isLoading = true;
                                                            });

                                                            Get.find<
                                                                    RegisterController>()
                                                                .registerUser(
                                                              name:
                                                                  registerController
                                                                      .textName
                                                                      .text
                                                                      .trim(),
                                                              age:
                                                                  registerController
                                                                      .textAge
                                                                      .text
                                                                      .trim(),
                                                              dob:
                                                                  registerController
                                                                      .textDOB
                                                                      .text
                                                                      .trim(),
                                                              gender: registerController
                                                                  .selectedGender,
                                                              address:
                                                                  registerController
                                                                      .textAddress
                                                                      .text
                                                                      .trim(),
                                                            );

                                                            Timer(
                                                                Duration(
                                                                    seconds: 2),
                                                                () {
                                                              setState(() {
                                                                _selectedIndex++;
                                                                isLoading =
                                                                    false;
                                                              });
                                                            });
                                                          } else {
                                                            setState(() {
                                                              nameText = "2";
                                                            });
                                                          }
                                                        }
                                                      }
                                                    },
                                                    child: Container(
                                                      height: 30,
                                                      width: 200,
                                                      alignment:
                                                          Alignment.center,
                                                      decoration: BoxDecoration(
                                                          color: ColorResources
                                                              .buttonYellow,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(5)),
                                                      child: Text(
                                                        "Save/Next",
                                                        style: poppinsRegular
                                                            .copyWith(
                                                          color: Colors.black,
                                                          fontSize: 16,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            height: 30,
                                          )
                                        ] else ...[
                                          Container(
                                            alignment: Alignment.bottomCenter,
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Row(
                                                // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                children: [
                                                  Expanded(
                                                    child: GestureDetector(
                                                      onTap: () {
                                                        if (_selectedIndex >
                                                            0) {
                                                          setState(() {
                                                            _selectedIndex--;
                                                          });
                                                        }
                                                      },
                                                      child: Container(
                                                        height: 30,
                                                        alignment:
                                                            Alignment.center,
                                                        decoration: BoxDecoration(
                                                            color:
                                                                ColorResources
                                                                    .backButton,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5)),
                                                        child: Text(
                                                          "Back",
                                                          style: poppinsRegular
                                                              .copyWith(
                                                            color: Colors.black,
                                                            fontSize: 16,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    width: 20,
                                                  ),
                                                  Expanded(
                                                    child: GestureDetector(
                                                      onTap: () {
                                                        if (_selectedIndex <
                                                            2) {}
                                                        if (registerController
                                                                .selectedVeg ==
                                                            null) {
                                                          registerController
                                                                  .errorVeg
                                                                  .value =
                                                              'Please select a Veg/Non Veg.';
                                                        } else {
                                                          print(
                                                              "objectSHDBSDBB${registerController.errorVeg.value}");
                                                          registerController
                                                              .errorVeg
                                                              .value = "";
                                                          if (_selectedIndex ==
                                                                  1 &&
                                                              registerController
                                                                  .formKeyStep2
                                                                  .currentState!
                                                                  .validate()) {
                                                            SecondStpper();
                                                          }
                                                        }
                                                        if (_selectedIndex ==
                                                                2 &&
                                                            registerController
                                                                .formKeyStep3
                                                                .currentState!
                                                                .validate()) {
                                                          ThreeStpper(context);
                                                        }
                                                      },
                                                      child: Container(
                                                        height: 30,
                                                        alignment:
                                                            Alignment.center,
                                                        decoration: BoxDecoration(
                                                            color: ColorResources
                                                                .buttonYellow,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5)),
                                                        child: Text(
                                                          "Save/Next",
                                                          style: poppinsRegular
                                                              .copyWith(
                                                            color: Colors.black,
                                                            fontSize: 16,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            height: 30,
                                          ),
                                        ],
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
          ),
        );
      }),
    );
  }

  void SecondStpper() async {
    try {
      setState(() {
        isLoading = true;
      });
      Get.find<RegisterController>().registerUser1(
        profession: registerController.textProfession.text.trim(),
        height: registerController.textHeight.text.trim(),
        weight: registerController.textWeight.text.trim(),
        bloodGroup: registerController.textBloodGroup.text.trim(),
        modeicalProblem: registerController.textMedicalProblem.text,
        vitaminDeficiency:
            registerController.textAnyVitaminDeficiency.text.trim(),
        parentMedicalProblem:
            registerController.textParentMedicalProblem.text.trim(),
        VegNonVeg: registerController.selectedVeg!.trim(),
        constipationProblem: registerController.textConstipation.text.trim(),
        gastritis: registerController.textGastritis.text.trim(),
        anyFoodAllgery: registerController.textAnyFood.text.trim(),
      );
      Timer(Duration(seconds: 2), () {
        SmartDialog.dismiss();
        setState(() {
          _selectedIndex++;
          isLoading = false;
        });
      });
      print('SJHDJJDS${_selectedIndex}');
    } catch (e) {}
  }

  void ThreeStpper(context) async {
    try {
      setState(() {
        isLoading = true;
      });
      Get.find<RegisterController>().registerUser2(
        context: context,
        eatingPattern: registerController.textEatingPattern.text.trim(),
        earlyMoring: registerController.textEarlyMorning.text.trim(),
        breakFastMoring: registerController.textBreakFast.text.trim(),
        midMorning: registerController.textMid.text.trim(),
        Lunch: registerController.textLunch.text,
        teaTime: registerController.textTeaTime.text.trim(),
        dinner: registerController.textDinner.text.trim(),
        SleepTime: registerController.textSleepTime.text.trim(),
        wakeTime: registerController.textWakeTime.text.trim(),
        lastPeriod: registerController.textLastPeriod.text.trim(),
        waterIntake: registerController.textWaterIntake.text.trim(),
        workOut: registerController.textWorkout.text.trim(),
        alchohalintake: registerController.textAlchohal.text.trim(),
      );
      Timer(Duration(seconds: 2), () {
        setState(() {
          isLoading = false;
        });
      });
    } catch (e) {}
  }
}

class steponecontainer2 extends StatefulWidget {
  const steponecontainer2({super.key});

  @override
  State<steponecontainer2> createState() => _steponecontainer2State();
}

class _steponecontainer2State extends State<steponecontainer2> {
  @override
  Widget build(BuildContext context) {
    return Form(
      key: registerController.formKeyStep2,
      child: Padding(
        padding: const EdgeInsets.only(left: 18.0, right: 18),
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                height: 30,
                child: Text(
                  "Profession",
                  style: poppinsRegular.copyWith(
                    color: Colors.white,
                    fontSize: 15.0,
                  ),
                ),
              ),
              Container(
                height: 45,
                child: TextFormField(
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter your Profession';
                    }
                    return null;
                  },
                  controller: registerController.textProfession,
                  style: poppinsRegular.copyWith(
                    color: Colors.white,
                    fontSize: 15.0,
                  ),
                  decoration: InputDecoration(
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(width: 1, color: Colors.blue),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Container(
                height: 25,
                child: Text(
                  "Height",
                  style: poppinsRegular.copyWith(
                    color: Colors.white,
                    fontSize: 15.0,
                  ),
                ),
              ),
              Container(
                height: 45,
                child: TextFormField(
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter your Height';
                    }
                    return null;
                  },
                  controller: registerController.textHeight,
                  style: poppinsRegular.copyWith(
                    color: Colors.white,
                    fontSize: 15.0,
                  ),
                  decoration: InputDecoration(
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(width: 1, color: Colors.blue),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Container(
                height: 25,
                child: Text(
                  "Weight",
                  style: poppinsRegular.copyWith(
                    color: Colors.white,
                    fontSize: 15.0,
                  ),
                ),
              ),
              Container(
                height: 45,
                child: TextFormField(
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter your Weight';
                    }
                    return null;
                  },
                  controller: registerController.textWeight,
                  style: poppinsRegular.copyWith(
                    color: Colors.white,
                    fontSize: 15.0,
                  ),
                  decoration: InputDecoration(
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(width: 1, color: Colors.blue),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                height: 25,
                child: Text(
                  "Blood Group",
                  style: poppinsRegular.copyWith(
                    color: Colors.white,
                    fontSize: 15.0,
                  ),
                ),
              ),
              Container(
                height: 45,
                child: TextFormField(
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter your Blood Group';
                    }
                    return null;
                  },
                  controller: registerController.textBloodGroup,
                  style: poppinsRegular.copyWith(
                    color: Colors.white,
                    fontSize: 15.0,
                  ),
                  decoration: InputDecoration(
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(width: 1, color: Colors.blue),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                child: Text(
                  "Medical Problem",
                  style: poppinsRegular.copyWith(
                    color: Colors.white,
                    fontSize: 15.0,
                  ),
                ),
              ),
              Container(
                height: 45,
                child: TextFormField(
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter your Medical Problem';
                    }
                    return null;
                  },
                  controller: registerController.textMedicalProblem,
                  style: poppinsRegular.copyWith(
                    color: Colors.white,
                    fontSize: 15.0,
                  ),
                  decoration: InputDecoration(
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(width: 1, color: Colors.blue),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                child: Text(
                  "Any vitamin Deficiency",
                  style: poppinsRegular.copyWith(
                    color: Colors.white,
                    fontSize: 15.0,
                  ),
                ),
              ),
              Container(
                height: 45,
                child: TextFormField(
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter your Any vitamin Deficiency';
                    }
                    return null;
                  },
                  controller: registerController.textAnyVitaminDeficiency,
                  style: poppinsRegular.copyWith(
                    color: Colors.white,
                    fontSize: 15.0,
                  ),
                  decoration: InputDecoration(
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(width: 1, color: Colors.blue),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                child: Text(
                  "Parents Medical Problem",
                  style: poppinsRegular.copyWith(
                    color: Colors.white,
                    fontSize: 15.0,
                  ),
                ),
              ),
              Container(
                height: 45,
                child: TextFormField(
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter your Parents Medical Problem';
                    }
                    return null;
                  },
                  controller: registerController.textParentMedicalProblem,
                  style: poppinsRegular.copyWith(
                    color: Colors.white,
                    fontSize: 15.0,
                  ),
                  decoration: InputDecoration(
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(width: 1, color: Colors.blue),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                height: 25,
                child: Text(
                  "Veg/Non-Veg",
                  style: poppinsRegular.copyWith(
                    color: Colors.white,
                    fontSize: 15.0,
                  ),
                ),
              ),
              Row(
                children: <Widget>[
                  Radio(
                    value: 'Veg',
                    groupValue: registerController.selectedVeg,
                    onChanged: (newValue) {
                      setState(() {
                        registerController.selectedVeg = newValue;
                      });
                    },
                    activeColor: ColorResources.buttonYellow,
                    // Color when selected
                    fillColor: MaterialStateProperty.resolveWith<Color>(
                      (Set<MaterialState> states) {
                        if (states.contains(MaterialState.selected)) {
                          return ColorResources
                              .buttonYellow; // Color when selected
                        }
                        return Colors.white; // Color when not selected
                      },
                    ),
                  ),
                  Text(
                    'Veg',
                    style: poppinstMedium.copyWith(
                        fontSize: 14, color: Colors.white),
                  ),
                  Radio(
                    value: 'Non-Veg',
                    groupValue: registerController.selectedVeg,
                    onChanged: (newValue) {
                      setState(() {
                        registerController.selectedVeg = newValue;
                      });
                    },
                    activeColor: ColorResources.buttonYellow,
                    fillColor: MaterialStateProperty.resolveWith<Color>(
                      (Set<MaterialState> states) {
                        if (states.contains(MaterialState.selected)) {
                          return ColorResources
                              .buttonYellow; // Color when selected
                        }
                        return Colors.white; // Color when not selected
                      },
                    ),
                  ),
                  Text(
                    'Non-Veg',
                    style: poppinstMedium.copyWith(
                        fontSize: 14, color: Colors.white),
                  ),
                ],
              ),
              Obx(() => Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      if (registerController.errorVeg.value != "")
                        Container(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            registerController.errorVeg.value!,
                            style: TextStyle(color: Colors.red),
                          ),
                        )
                    ],
                  )),
              /* Container(
                height: 45,
                child: TextFormField(
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter your Veg/non Veg';
                    }
                    return null;
                  },
                  controller: registerController.textVegNonVeg,
                  style: poppinsRegular.copyWith(
                    color: Colors.white,
                    fontSize: 15.0,
                  ),
                  decoration: InputDecoration(
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(width: 1, color: Colors.blue),
                    ),
                  ),
                ),
              ),*/
              SizedBox(
                height: 20,
              ),
              Container(
                child: Text(
                  "Constipation Problem",
                  style: poppinsRegular.copyWith(
                    color: Colors.white,
                    fontSize: 15.0,
                  ),
                ),
              ),
              Container(
                height: 45,
                child: TextFormField(
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter your Constipation Problem';
                    }
                    return null;
                  },
                  controller: registerController.textConstipation,
                  style: poppinsRegular.copyWith(
                    color: Colors.white,
                    fontSize: 15.0,
                  ),
                  decoration: InputDecoration(
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(width: 1, color: Colors.blue),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                child: Text(
                  "Gastritis Problem",
                  style: poppinsRegular.copyWith(
                    color: Colors.white,
                    fontSize: 15.0,
                  ),
                ),
              ),
              Container(
                height: 45,
                child: TextFormField(
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter your Gastritis Problem';
                    }
                    return null;
                  },
                  controller: registerController.textGastritis,
                  style: poppinsRegular.copyWith(
                    color: Colors.white,
                    fontSize: 15.0,
                  ),
                  decoration: InputDecoration(
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(width: 1, color: Colors.blue),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                child: Text(
                  "Any Food Allergy",
                  style: poppinsRegular.copyWith(
                    color: Colors.white,
                    fontSize: 15.0,
                  ),
                ),
              ),
              Container(
                height: 45,
                child: TextFormField(
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter your Any Food Allergy';
                    }
                    return null;
                  },
                  controller: registerController.textAnyFood,
                  style: poppinsRegular.copyWith(
                    color: Colors.white,
                    fontSize: 15.0,
                  ),
                  decoration: InputDecoration(
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(width: 1, color: Colors.blue),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 50,
              )
            ],
          ),
        ),
      ),
    );
  }
}

class steponecontainer1 extends StatefulWidget {
  const steponecontainer1({super.key});

  @override
  State<steponecontainer1> createState() => _Statesteponecontainer1();
}

class _Statesteponecontainer1 extends State<steponecontainer1> {
  _handDatePickerAnnivery() async {
    final DateTime? date = await showDatePicker(
        context: context,
        initialDate: registerController.AgeRange,
        firstDate: DateTime(1900),
        lastDate: DateTime.now());
    if (date != null && date != registerController.date) {
      setState(() {
        registerController.AgeRange = date;
      });
      registerController.textDOB.text =
          registerController.dateFormat.format(date);
      registerController.DOB = registerController.dateFormat.format(date);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: registerController.formKeyStep1,
      child: Padding(
        padding: const EdgeInsets.only(left: 18.0, right: 18),
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                height: 20,
                child: Text(
                  "Your Name",
                  style: poppinsRegular.copyWith(
                    color: Colors.white,
                    fontSize: 15.0,
                  ),
                ),
              ),
              Container(
                height: 45,
                child: TextFormField(
                  controller: registerController.textName,
                  style: poppinsRegular.copyWith(
                    color: Colors.white,
                    fontSize: 15.0,
                    height: 1,
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter your Name';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(width: 1, color: Colors.blue),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                height: 25,
                child: Text(
                  "Age",
                  style: poppinsRegular.copyWith(
                    color: Colors.white,
                    fontSize: 15.0,
                  ),
                ),
              ),
              Container(
                  height: 45,
                  child: TextFormField(
                      controller: registerController.textAge,
                      keyboardType: TextInputType.number,
                      style: poppinsRegular.copyWith(
                        color: Colors.white,
                        fontSize: 15.0,
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter your Age';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(width: 1, color: Colors.blue),
                        ),
                      ))),
              SizedBox(
                height: 20,
              ),
              Container(
                height: 25,
                child: Text(
                  "Date of Birth",
                  style: poppinsRegular.copyWith(
                    color: Colors.white,
                    fontSize: 15.0,
                  ),
                ),
              ),
              Container(
                height: 45,
                child: TextFormField(
                    style: poppinsRegular.copyWith(
                      color: Colors.white,
                      fontSize: 15.0,
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter your Date of Birth';
                      }
                      return null;
                    },
                    controller: registerController.textDOB,
                    //    onChanged: onChanged,
                    onTap: _handDatePickerAnnivery,
                    keyboardType: TextInputType.none,
                    decoration: InputDecoration(
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(width: 1, color: Colors.blue),
                      ),
                    )),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                height: 25,
                child: Text(
                  "Gender",
                  style: poppinsRegular.copyWith(
                    color: Colors.white,
                    fontSize: 15.0,
                  ),
                ),
              ),
              Row(
                children: <Widget>[
                  Radio(
                    value: 'Male',
                    groupValue: registerController.selectedGender,
                    onChanged: (newValue) {
                      setState(() {
                        registerController.selectedGender = newValue;
                      });
                    },
                    activeColor: ColorResources.buttonYellow,
                    // Color when selected
                    fillColor: MaterialStateProperty.resolveWith<Color>(
                      (Set<MaterialState> states) {
                        if (states.contains(MaterialState.selected)) {
                          return ColorResources
                              .buttonYellow; // Color when selected
                        }
                        return Colors.white; // Color when not selected
                      },
                    ),
                  ),
                  Text(
                    'Male',
                    style: poppinstMedium.copyWith(
                        fontSize: 14, color: Colors.white),
                  ),
                  Radio(
                    value: 'Female',
                    groupValue: registerController.selectedGender,
                    onChanged: (newValue) {
                      setState(() {
                        registerController.selectedGender = newValue;
                      });
                    },
                    activeColor: ColorResources.buttonYellow,
                    fillColor: MaterialStateProperty.resolveWith<Color>(
                      (Set<MaterialState> states) {
                        if (states.contains(MaterialState.selected)) {
                          return ColorResources
                              .buttonYellow; // Color when selected
                        }
                        return Colors.white; // Color when not selected
                      },
                    ),
                  ),
                  Text(
                    'Female',
                    style: poppinstMedium.copyWith(
                        fontSize: 14, color: Colors.white),
                  ),
                  Radio(
                    value: 'Other',
                    groupValue: registerController.selectedGender,
                    onChanged: (newValue) {
                      setState(() {
                        registerController.selectedGender = newValue;
                      });
                    },
                    activeColor: ColorResources.buttonYellow,
                    fillColor: MaterialStateProperty.resolveWith<Color>(
                      (Set<MaterialState> states) {
                        if (states.contains(MaterialState.selected)) {
                          return ColorResources
                              .buttonYellow; // Color when selected
                        }
                        return Colors.white; // Color when not selected
                      },
                    ),
                  ),
                  Text('Other',
                      style: poppinstMedium.copyWith(
                          fontSize: 14, color: Colors.white)),
                ],
              ),
              Obx(() => Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      if (registerController.errorText.value != "")
                        Container(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            registerController.errorText.value!,
                            style: TextStyle(color: Colors.red),
                          ),
                        )
                    ],
                  )),
              SizedBox(
                height: 20,
              ),
              Container(
                height: 25,
                child: Text(
                  "Address",
                  style: poppinsRegular.copyWith(
                    color: Colors.white,
                    fontSize: 15.0,
                  ),
                ),
              ),
              Container(
                height: 45,
                child: TextFormField(
                    controller: registerController.textAddress,
                    style: poppinsRegular.copyWith(
                      color: Colors.white,
                      fontSize: 15.0,
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter your Address';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(width: 1, color: Colors.blue),
                      ),
                    )),
              ),
              if (registerController.selectedGender == null) ...[
                SizedBox(
                  height: 20,
                )
              ] else
                ...[],
            ],
          ),
        ),
      ),
    );
  }
}

class steponecontainer3 extends StatefulWidget {
  const steponecontainer3({super.key});

  @override
  State<steponecontainer3> createState() => _steponecontainer3State();
}

class _steponecontainer3State extends State<steponecontainer3> {
  String? Gender;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Gender = Get.find<AuthController>().getGender();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: registerController.formKeyStep3,
      child: Padding(
        padding: const EdgeInsets.only(left: 18.0, right: 18),
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                height: 30,
                child: Text(
                  "Eating Pattern",
                  style: poppinsRegular.copyWith(
                    color: Colors.white,
                    fontSize: 15.0,
                  ),
                ),
              ),
              Container(
                height: 45,
                child: TextFormField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter your Eating Pattern';
                      }
                      return null;
                    },
                    controller: registerController.textEatingPattern,
                    style: poppinsRegular.copyWith(
                      color: Colors.white,
                      fontSize: 15.0,
                    ),
                    decoration: InputDecoration(
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(width: 1, color: Colors.blue),
                      ),
                    )),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                child: Text(
                  "Early morning",
                  style: poppinsRegular.copyWith(
                    color: Colors.white,
                    fontSize: 15.0,
                  ),
                ),
              ),
              Container(
                height: 45,
                child: TextFormField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter your Early morning';
                      }
                      return null;
                    },
                    controller: registerController.textEarlyMorning,
                    style: poppinsRegular.copyWith(
                      color: Colors.white,
                      fontSize: 15.0,
                    ),
                    decoration: InputDecoration(
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(width: 1, color: Colors.blue),
                      ),
                    )),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                child: Text(
                  "Breakfast(with time)",
                  style: poppinsRegular.copyWith(
                    color: Colors.white,
                    fontSize: 15.0,
                  ),
                ),
              ),
              Container(
                height: 45,
                child: TextFormField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter your Breakfast(with Time)';
                      }
                      return null;
                    },
                    controller: registerController.textBreakFast,
                    style: poppinsRegular.copyWith(
                      color: Colors.white,
                      fontSize: 15.0,
                    ),
                    decoration: InputDecoration(
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(width: 1, color: Colors.blue),
                      ),
                    )),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                child: Text(
                  "Mid Morning",
                  style: poppinsRegular.copyWith(
                    color: Colors.white,
                    fontSize: 15.0,
                  ),
                ),
              ),
              Container(
                height: 45,
                child: TextFormField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter your Mid Morning';
                      }
                      return null;
                    },
                    controller: registerController.textMid,
                    style: poppinsRegular.copyWith(
                      color: Colors.white,
                      fontSize: 15.0,
                    ),
                    decoration: InputDecoration(
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(width: 1, color: Colors.blue),
                      ),
                    )),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                child: Text(
                  "Lunch",
                  style: poppinsRegular.copyWith(
                    color: Colors.white,
                    fontSize: 15.0,
                  ),
                ),
              ),
              Container(
                height: 45,
                child: TextFormField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter your Lunch';
                      }
                      return null;
                    },
                    controller: registerController.textLunch,
                    style: poppinsRegular.copyWith(
                      color: Colors.white,
                      fontSize: 15.0,
                    ),
                    decoration: InputDecoration(
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(width: 1, color: Colors.blue),
                      ),
                    )),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                child: Text(
                  "Tea Time",
                  style: poppinsRegular.copyWith(
                    color: Colors.white,
                    fontSize: 15.0,
                  ),
                ),
              ),
              Container(
                height: 45,
                child: TextFormField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter your Tea Time';
                      }
                      return null;
                    },
                    controller: registerController.textTeaTime,
                    style: poppinsRegular.copyWith(
                      color: Colors.white,
                      fontSize: 15.0,
                    ),
                    decoration: InputDecoration(
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(width: 1, color: Colors.blue),
                      ),
                    )),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                child: Text(
                  "Dinner",
                  style: poppinsRegular.copyWith(
                    color: Colors.white,
                    fontSize: 15.0,
                  ),
                ),
              ),
              Container(
                height: 45,
                child: TextFormField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter your Dinner';
                      }
                      return null;
                    },
                    controller: registerController.textDinner,
                    style: poppinsRegular.copyWith(
                      color: Colors.white,
                      fontSize: 15.0,
                    ),
                    decoration: InputDecoration(
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(width: 1, color: Colors.blue),
                      ),
                    )),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                child: Text(
                  "Sleep Time",
                  style: poppinsRegular.copyWith(
                    color: Colors.white,
                    fontSize: 15.0,
                  ),
                ),
              ),
              Container(
                height: 45,
                child: TextFormField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter your Sleep Time';
                      }
                      return null;
                    },
                    controller: registerController.textSleepTime,
                    style: poppinsRegular.copyWith(
                      color: Colors.white,
                      fontSize: 15.0,
                    ),
                    decoration: InputDecoration(
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(width: 1, color: Colors.blue),
                      ),
                    )),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                height: 20,
                child: Text(
                  "Wake up time",
                  style: poppinsRegular.copyWith(
                    color: Colors.white,
                    fontSize: 15.0,
                  ),
                ),
              ),
              Container(
                height: 45,
                child: TextFormField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter your Wake Time';
                      }
                      return null;
                    },
                    controller: registerController.textWakeTime,
                    style: poppinsRegular.copyWith(
                      color: Colors.white,
                      fontSize: 15.0,
                    ),
                    decoration: InputDecoration(
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(width: 1, color: Colors.blue),
                      ),
                    )),
              ),
              SizedBox(
                height: 20,
              ),
              if (Gender == "Female") ...[
                Container(
                  height: 20,
                  child: Text(
                    "Last period’s Date",
                    style: poppinsRegular.copyWith(
                      color: Colors.white,
                      fontSize: 15.0,
                    ),
                  ),
                ),
                Container(
                  height: 45,
                  child: TextFormField(
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter your Last period’s Date';
                        }
                        return null;
                      },
                      controller: registerController.textLastPeriod,
                      style: poppinsRegular.copyWith(
                        color: Colors.white,
                        fontSize: 15.0,
                      ),
                      decoration: InputDecoration(
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(width: 1, color: Colors.blue),
                        ),
                      )),
                ),
                SizedBox(
                  height: 20,
                ),
              ],
              Container(
                height: 20,
                child: Text(
                  "Water intake",
                  style: poppinsRegular.copyWith(
                    color: Colors.white,
                    fontSize: 15.0,
                  ),
                ),
              ),
              Container(
                height: 45,
                child: TextFormField(
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter your Water Intake';
                    }
                    return null;
                  },
                  controller: registerController.textWaterIntake,
                  style: poppinsRegular.copyWith(
                    color: Colors.white,
                    fontSize: 15.0,
                  ),
                  decoration: InputDecoration(
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(width: 1, color: Colors.blue),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                child: Text(
                  "Workout",
                  style: poppinsRegular.copyWith(
                    color: Colors.white,
                    fontSize: 15.0,
                  ),
                ),
              ),
              Container(
                height: 45,
                child: TextFormField(
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter your Workout';
                    }
                    return null;
                  },
                  controller: registerController.textWorkout,
                  style: poppinsRegular.copyWith(
                    color: Colors.white,
                    fontSize: 15.0,
                  ),
                  decoration: InputDecoration(
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(width: 1, color: Colors.blue),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                child: Text(
                  "Alcohol Intake",
                  style: poppinsRegular.copyWith(
                    color: Colors.white,
                    fontSize: 15.0,
                  ),
                ),
              ),
              Container(
                height: 45,
                child: TextFormField(
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter your Alcohol Intake';
                    }
                    return null;
                  },
                  controller: registerController.textAlchohal,
                  style: poppinsRegular.copyWith(
                    color: Colors.white,
                    fontSize: 15.0,
                  ),
                  decoration: InputDecoration(
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(width: 1, color: Colors.blue),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 50,
              )
            ],
          ),
        ),
      ),
    );
  }
}
