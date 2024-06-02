// //
import 'dart:async';

import 'package:dietitian/controller/auth_controller.dart';
import 'package:dietitian/utils/colors.dart';
import 'package:dietitian/utils/style.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

final AuthController _authController = Get.find<AuthController>();

class OTPScreen extends StatefulWidget {
  String? number;

  OTPScreen({super.key, this.number});

  @override
  State<OTPScreen> createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {
  late Timer timer;
  final TextEditingController _controller1 = TextEditingController();
  final TextEditingController _controller2 = TextEditingController();
  final TextEditingController _controller3 = TextEditingController();
  final TextEditingController _controller4 = TextEditingController();
  final TextEditingController _controller5 = TextEditingController();

  final TextEditingController _controller6 = TextEditingController();

  late FocusNode _focusNode1;
  late FocusNode _focusNode2;
  final FirebaseMessaging _fcm = FirebaseMessaging.instance;
  late FocusNode _focusNode3;
  late FocusNode _focusNode4;
  late FocusNode _focusNode5;
  late FocusNode _focusNode6;
  String? fcmToken;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  fibase() async {
    fcmToken = await _fcm.getToken();
    print('MAMAIAMAMIAM${fcmToken}');
  }

  @override
  void initState() {
    super.initState();
    startTimer();
    fibase();
    _focusNode1 = FocusNode();
    _focusNode2 = FocusNode();
    _focusNode3 = FocusNode();
    _focusNode4 = FocusNode();
    _focusNode5 = FocusNode();
    _focusNode6 = FocusNode();
    _focusNode1.addListener(_onFocusChange);
    _focusNode2.addListener(_onFocusChange);
    _focusNode3.addListener(_onFocusChange);
    _focusNode4.addListener(_onFocusChange);
    _focusNode5.addListener(_onFocusChange);
    _focusNode6.addListener(_onFocusChange);
  }

  @override
  void dispose() {
    _focusNode1.dispose();
    _focusNode2.dispose();
    _focusNode3.dispose();
    _focusNode4.dispose();
    _focusNode6.dispose();
    _focusNode5.dispose();
    super.dispose();
  }

  String? _otpValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'OTP is required';
    }
    if (value.length != 4) {
      return 'Invalid OTP';
    }
    return null;
  }

  int timerDuration = 300; // Timer duration in seconds
  int countdownValue = 300; //

  void startTimer() {
    timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        if (countdownValue > 0) {
          countdownValue--;
        } else {
          timer.cancel(); // Stop the timer when countdown reaches zero
          // Perform action when timer reaches zero (e.g., show a message)
        }
      });
    });
  }

  String? otpCode;
  final String verificationId = Get.arguments[0];
  FirebaseAuth auth = FirebaseAuth.instance;
  Timer? _timer;

  void _onFocusChange() {
    if (_focusNode1.hasFocus) {
      _controller1.selection = TextSelection.fromPosition(
          TextPosition(offset: _controller1.text.length));
    } else if (_focusNode2.hasFocus) {
      _controller2.selection = TextSelection.fromPosition(
          TextPosition(offset: _controller2.text.length));
    } else if (_focusNode3.hasFocus) {
      _controller3.selection = TextSelection.fromPosition(
          TextPosition(offset: _controller3.text.length));
    } else if (_focusNode4.hasFocus) {
      _controller4.selection = TextSelection.fromPosition(
          TextPosition(offset: _controller4.text.length));
    }
  }

  void verifyOtp(
    String verificationId,
    String userOtp,
  ) async {
    try {
      PhoneAuthCredential creds = PhoneAuthProvider.credential(
          verificationId: verificationId, smsCode: userOtp);
      User? user = (await auth.signInWithCredential(creds)).user;
      if (user != null) {
        Get.find<AuthController>().login(
            context: context, number: widget.number, firebaseotp: otpCode);
      }
    } on FirebaseAuthException catch (e) {
      // EasyLoading.dismiss();

      Get.snackbar(
        e.message.toString(),
        "Failed",
        colorText: Colors.black87,
      );
    }
  }

  void _login() {
    if (otpCode != null) {
      verifyOtp(verificationId, otpCode!);
    } else {
      // EasyLoading.dismiss();

      Get.snackbar(
        "Enter 6-Digit code",
        "Failed",
        colorText: Colors.white,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: ColorResources.loginappColor,

      // Status bar brightness (optional)
      statusBarIconBrightness: Brightness.dark, // For Android (dark icons)
      statusBarBrightness: Brightness
          .light, // Yahaan aap apne pasandeeda rang ka istemal kar sakte hain
    ));
    return Scaffold(
      backgroundColor: ColorResources.buttonDesmissColor,
      body: GetBuilder<AuthController>(builder: (logic) {
        return Stack(
          children: [
            SafeArea(
              child: SingleChildScrollView(
                child: Form(
                  key: _formKey,
                  child: Container(
                      alignment: Alignment.topCenter,
                      height: Get.height,
                      width: Get.width,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/numberOtplogin.png'),
                          fit: BoxFit.cover,
                        ),
                      ),
                      child: Column(
                        children: [
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                              padding: EdgeInsets.only(left: 20),
                              alignment: Alignment.centerLeft,
                              child: Icon(
                                Icons.arrow_back_ios,
                                color: ColorResources.loginOpenButton,
                              )),
                          SizedBox(
                            height: 40,
                          ),
                          Container(
                            height: 160,
                            width: 160,
                            child: Image.asset("assets/logo.png"),
                          ),
                          SizedBox(
                            height: 25,
                          ),
                          Text("Enter 4 Digit OTP Code",
                              style: poppinsSemiBold.copyWith(fontSize: 17)),
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 60.0, right: 55, top: 30),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("Send to:",
                                    style:
                                        poppinstMedium.copyWith(fontSize: 13)),
                                Text("+91-${widget.number}",
                                    style:
                                        poppinstMedium.copyWith(fontSize: 13)),
                                Spacer(),
                                if (countdownValue > 0)
                                  Text(
                                      "${countdownValue ~/ 60}:${(countdownValue % 60).toString().padLeft(2, '0')}",
                                      style: poppinstMedium.copyWith(
                                          fontSize: 16, color: Colors.green)),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                width: 40,
                                child: TextFormField(
                                  style: poppinsSemiBold.copyWith(
                                    color: Colors.black,
                                    fontSize: 18.0,
                                  ),
                                  controller: _controller1,
                                  maxLength: 1,
                                  keyboardType: TextInputType.number,
                                  textAlign: TextAlign.center,
                                  focusNode: _focusNode1,
                                  onChanged: (value) {
                                    if (value.length == 1) {
                                      _focusNode2.requestFocus();
                                    }
                                  },
                                  decoration: InputDecoration(
                                    counterText: "",
                                    hintText: "0",
                                    contentPadding: const EdgeInsets.symmetric(
                                        horizontal: 10, vertical: 0),
                                    filled: true,
                                    fillColor: ColorResources.loginappColor,
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide: BorderSide(
                                          color:
                                              ColorResources.appleButtonColor,
                                          width: 2,
                                        )),
                                    enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide: BorderSide(
                                          color:
                                              ColorResources.appleButtonColor,
                                          width: 2,
                                        )),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: BorderSide(
                                          color:
                                              ColorResources.appleButtonColor,
                                          width: 2),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 15,
                              ),
                              SizedBox(
                                width: 40,
                                child: TextFormField(
                                  style: poppinsSemiBold.copyWith(
                                    color: Colors.black,
                                    fontSize: 18.0,
                                  ),
                                  controller: _controller2,
                                  maxLength: 1,
                                  keyboardType: TextInputType.number,
                                  textAlign: TextAlign.center,
                                  focusNode: _focusNode2,
                                  onChanged: (value) {
                                    if (value.length == 1) {
                                      _focusNode3.requestFocus();
                                    } else if (value.isEmpty) {
                                      _focusNode1.requestFocus();
                                    }
                                  },
                                  decoration: InputDecoration(
                                    counterText: "",
                                    hintText: "0",
                                    contentPadding: const EdgeInsets.symmetric(
                                        horizontal: 10, vertical: 0),
                                    filled: true,
                                    fillColor: ColorResources.loginappColor,
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: BorderSide(
                                        color: ColorResources.appleButtonColor,
                                        width: 2,
                                      ),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: BorderSide(
                                        color: ColorResources.appleButtonColor,
                                        width: 2,
                                      ),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: BorderSide(
                                          color:
                                              ColorResources.appleButtonColor,
                                          width: 2),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 15,
                              ),
                              SizedBox(
                                width: 40,
                                child: TextFormField(
                                  style: poppinsSemiBold.copyWith(
                                    color: Colors.black,
                                    fontSize: 18.0,
                                  ),
                                  controller: _controller3,
                                  maxLength: 1,
                                  keyboardType: TextInputType.number,
                                  textAlign: TextAlign.center,
                                  focusNode: _focusNode3,
                                  onChanged: (value) {
                                    if (value.length == 1) {
                                      _focusNode4.requestFocus();
                                    } else if (value.isEmpty) {
                                      _focusNode2.requestFocus();
                                    }
                                  },
                                  decoration: InputDecoration(
                                    counterText: "",
                                    hintText: "0",
                                    contentPadding: const EdgeInsets.symmetric(
                                        horizontal: 10, vertical: 0),
                                    filled: true,
                                    fillColor: ColorResources.loginappColor,
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide: BorderSide(
                                          color:
                                              ColorResources.appleButtonColor,
                                          width: 2,
                                        )),
                                    enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide: BorderSide(
                                          color:
                                              ColorResources.appleButtonColor,
                                          width: 2,
                                        )),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: BorderSide(
                                          color:
                                              ColorResources.appleButtonColor,
                                          width: 2),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 15,
                              ),
                              SizedBox(
                                width: 40,
                                child: TextFormField(
                                  style: poppinsSemiBold.copyWith(
                                    color: Colors.black,
                                    fontSize: 18.0,
                                  ),
                                  controller: _controller4,
                                  maxLength: 1,
                                  keyboardType: TextInputType.number,
                                  textAlign: TextAlign.center,
                                  focusNode: _focusNode4,
                                  onChanged: (value) {
                                    if (value.length == 1) {
                                      _focusNode5.requestFocus();
                                    } else {
                                      _focusNode3.requestFocus();
                                    }
                                  },
                                  decoration: InputDecoration(
                                    counterText: "",
                                    hintText: "0",
                                    contentPadding: const EdgeInsets.symmetric(
                                        horizontal: 10, vertical: 0),
                                    filled: true,
                                    fillColor: ColorResources.loginappColor,
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide: BorderSide(
                                          color:
                                              ColorResources.appleButtonColor,
                                          width: 2,
                                        )),
                                    enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide: BorderSide(
                                          color:
                                              ColorResources.appleButtonColor,
                                          width: 2,
                                        )),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: BorderSide(
                                          color:
                                              ColorResources.appleButtonColor,
                                          width: 2),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 15,
                              ),
                              SizedBox(
                                width: 40,
                                child: TextFormField(
                                  style: poppinsSemiBold.copyWith(
                                    color: Colors.black,
                                    fontSize: 18.0,
                                  ),
                                  controller: _controller5,
                                  maxLength: 1,
                                  keyboardType: TextInputType.number,
                                  textAlign: TextAlign.center,
                                  focusNode: _focusNode5,
                                  onChanged: (value) {
                                    if (value.length == 1) {
                                      _focusNode6.requestFocus();
                                    } else {
                                      _focusNode5.requestFocus();
                                    }
                                  },
                                  decoration: InputDecoration(
                                    counterText: "",
                                    hintText: "0",
                                    contentPadding: const EdgeInsets.symmetric(
                                        horizontal: 10, vertical: 0),
                                    filled: true,
                                    fillColor: ColorResources.loginappColor,
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide: BorderSide(
                                          color:
                                              ColorResources.appleButtonColor,
                                          width: 2,
                                        )),
                                    enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide: BorderSide(
                                          color:
                                              ColorResources.appleButtonColor,
                                          width: 2,
                                        )),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: BorderSide(
                                          color:
                                              ColorResources.appleButtonColor,
                                          width: 2),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 15,
                              ),
                              SizedBox(
                                width: 40,
                                child: TextFormField(
                                  style: poppinsSemiBold.copyWith(
                                    color: Colors.black,
                                    fontSize: 18.0,
                                  ),
                                  controller: _controller6,
                                  maxLength: 1,
                                  keyboardType: TextInputType.number,
                                  textAlign: TextAlign.center,
                                  focusNode: _focusNode6,
                                  onChanged: (value) {
                                    if (value.isEmpty) {
                                      _focusNode5.requestFocus();
                                    }
                                  },
                                  decoration: InputDecoration(
                                    counterText: "",
                                    hintText: "0",
                                    contentPadding: const EdgeInsets.symmetric(
                                        horizontal: 10, vertical: 0),
                                    filled: true,
                                    fillColor: ColorResources.loginappColor,
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide: BorderSide(
                                          color:
                                              ColorResources.appleButtonColor,
                                          width: 2,
                                        )),
                                    enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide: BorderSide(
                                          color:
                                              ColorResources.appleButtonColor,
                                          width: 2,
                                        )),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: BorderSide(
                                          color:
                                              ColorResources.appleButtonColor,
                                          width: 2),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 60.0, right: 60, top: 20),
                            child: Text(
                              "Did Not Receive An Otp ?",
                              textAlign: TextAlign.justify,
                              style: poppinstMedium.copyWith(
                                fontSize: 13,
                              ),
                            ),
                          ),
                          //   if (countdownValue > 0)
                          GestureDetector(
                            onTap: () {
                              if (countdownValue == 0) {
                                countdownValue = timerDuration;
                                setState(() {
                                  startTimer();
                                });
                              }
                            },
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  left: 60.0, right: 60, top: 0),
                              child: Text(
                                "Send me OTP Again",
                                textAlign: TextAlign.justify,
                                style: poppinsSemiBold.copyWith(
                                    fontSize: 13,
                                    color: countdownValue > 0
                                        ? ColorResources.loginOpenButton
                                            .withOpacity(0.4)
                                        : ColorResources.loginOpenButton),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 35,
                          ),
                          GestureDetector(
                            onTap: () {
                              FocusScope.of(context).unfocus();
                              otpCode =
                                  "${_controller1.text}${_controller2.text}${_controller3.text}${_controller4.text}${_controller5.text}${_controller6.text}";
                              print('fghjkl${otpCode}');
                              _login();

                              // FocusScope.of(context).unfocus();

                              //

                              // Get.toNamed(RouteHelper.createNewDeatils, arguments: true);
                            },
                            child: Container(
                              height: 40,
                              width: 260,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                  color: ColorResources.verifyScreenButton,
                                  borderRadius: BorderRadius.circular(5)),
                              child: Text(
                                "Submit & Proceed",
                                style: poppinsRegular.copyWith(
                                  color: Colors.white,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ),
                        ],
                      )),
                ),
              ),
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
      }),
    );
  }
}
//
