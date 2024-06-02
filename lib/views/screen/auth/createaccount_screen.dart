// //
import 'package:country_picker/country_picker.dart';
import 'package:dietitian/controller/auth_controller.dart';
import 'package:dietitian/route/route.dart';
import 'package:dietitian/utils/colors.dart';
import 'package:dietitian/utils/style.dart';
import 'package:dietitian/views/screen/auth/otp_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class CreateAccount extends StatefulWidget {
  const CreateAccount({super.key});

  @override
  State<CreateAccount> createState() => _CreateAccountState();
}

class _CreateAccountState extends State<CreateAccount> {
  TextEditingController txt_number = TextEditingController();
  GlobalKey<FormState> formKeyStep = GlobalKey<FormState>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  Future<void> signInWithPhoneNumber(String phoneNumber) async {
    FirebaseAuth auth = FirebaseAuth.instance;

    await auth.verifyPhoneNumber(
      phoneNumber: phoneNumber,
      verificationCompleted: (PhoneAuthCredential credential) async {
        await auth.signInWithCredential(credential);
      },
      verificationFailed: (FirebaseAuthException e) {},
      codeSent: (String verificationId, int? resendToken) async {
        print("OTP: $verificationId");

        Get.to(
          OTPScreen(
            number: txt_number.text,
          ),
          arguments: [verificationId],
        );
      },
      codeAutoRetrievalTimeout: (String verificationId) {},
    );
  }

  bool isLoading = false;

  void startLoading() {
    setState(() {
      isLoading = true;
    });
    Future.delayed(Duration(seconds: 5), () {
      setState(() {
        isLoading = false;
      });
    });
  }

  Country selectedCountry = Country(
    phoneCode: "91",
    countryCode: "IN",
    e164Sc: 0,
    geographic: true,
    level: 1,
    name: "India",
    example: "India",
    displayName: "India",
    displayNameNoCountryCode: "IN",
    e164Key: "",
  );

  void _userLogin() async {
    print('jnmkl');
    String mobile = txt_number.text;
    if (mobile == "") {
      Get.snackbar(
        "Please enter the mobile number!",
        "Failed",
        colorText: Colors.white,
      );
    } else {
      signInWithPhoneNumber("+${selectedCountry.phoneCode}$mobile");
    }
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: ColorResources.loginappColor,
        statusBarIconBrightness: Brightness.dark,
        statusBarBrightness: Brightness.light,
      ),
    );
    return Scaffold(
      backgroundColor: ColorResources.buttonDesmissColor,
      body: GetBuilder<AuthController>(
        builder: (logic) {
          return Stack(children: [
            SafeArea(
              child: Form(
                key: formKeyStep,
                child: SingleChildScrollView(
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
                            height: 40,
                          ),
                          Container(
                            height: 160,
                            width: 160,
                            child: Image.asset("assets/logo.png"),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Text("Hi User !",
                              style: poppinsSemiBold.copyWith(fontSize: 22)),
                          SizedBox(
                            height: 10,
                          ),
                          Text("Enter you mobile\nnumber to login",
                              textAlign: TextAlign.center,
                              style: poppinsSemiBold.copyWith(fontSize: 14)),
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 40.0, right: 40, top: 30),
                            child: TextFormField(
                              controller: txt_number,
                              textAlign: TextAlign.center,
                              style: poppinsSemiBold.copyWith(
                                color: Colors.black,
                                fontSize: 18.0,
                              ),
                              maxLength: 10,
                              cursorColor: Colors.black,
                              //  controller: _clientregController.client_name,
                              keyboardType: TextInputType.number,
                              textInputAction: TextInputAction.next,
                              validator: (value) {
                                // Validation function
                                if (value!.isEmpty) {
                                  // Check if input is empty
                                  return "Please Enter valid ";
                                } else if (value.length != 10) {
                                  // Check if input length is not 10
                                  return "Please Enter 10 digits";
                                }
                                return null; // Return null if validation passes
                              },
                              decoration: InputDecoration(
                                counterText: "",
                                hintText: 'XX-XX-XX-XX-XX',
                                contentPadding: const EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 0),
                                filled: true,
                                fillColor: ColorResources.loginappColor,
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide(
                                      color: ColorResources.appleButtonColor,
                                      width: 1.5,
                                    )),
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide(
                                      color: ColorResources.appleButtonColor,
                                      width: 1.5,
                                    )),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(
                                      color: ColorResources.appleButtonColor,
                                      width: 1.5),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 60.0, right: 60, top: 20),
                            child: Text(
                              "We will send you a OTP. This will\nbe your authentication for login",
                              textAlign: TextAlign.justify,
                              style: poppinstMedium.copyWith(
                                fontSize: 13,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          GestureDetector(
                            onTap: () async {
                              FocusScope.of(context).unfocus();
                              if (formKeyStep.currentState!.validate()) {
                                String number = txt_number.text;
                                isLoading ? null : startLoading();
                                // setState(() {
                                //   isLoading = true;
                                // });
                                //  await Future.delayed(Duration(seconds: 4));
                                _userLogin();
                                // setState(() {
                                //   isLoading = false;
                                // });
                              }
                            },
                            child: Container(
                              height: 40,
                              width: 260,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                  color: ColorResources.verifyScreenButton,
                                  borderRadius: BorderRadius.circular(5)),
                              child: Text(
                                "Send Otp",
                                style: poppinsRegular.copyWith(
                                  color: Colors.white,
                                  fontSize: 20,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Be healthy",
                                style: poppinstMedium.copyWith(
                                  color: Colors.black,
                                  fontSize: 13,
                                ),
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Image.asset(
                                "assets/smile.png",
                                height: 25,
                                width: 25,
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 40,
                          ),
                          GestureDetector(
                            onTap: () {
                              Get.toNamed(RouteHelper.login, arguments: true);
                            },
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset(
                                  "assets/loginAccount.png",
                                  height: 25,
                                  width: 25,
                                ),
                                Padding(
                                  padding: EdgeInsets.only(top: 8.0),
                                  child: Text(
                                    'Login as a Dietitian',
                                    style: poppinstMedium.copyWith(
                                      color: ColorResources.loginOpenButton,
                                      fontSize: 13,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          )
                        ],
                      )),
                ),
              ),
            ),
            if (isLoading)
              Positioned.fill(
                child: Container(
                  color: Colors.black.withOpacity(0.5),
                  child: Center(
                    child: CustomLoadingIndicator(),
                  ),
                ),
              ),
            // isLoading
            //     ? CircularProgressIndicator(
            //         color: ColorResources.buttonYellow,
            //       )
            //     : Container(),
            // if (logic.isLoad.value)
            //   Positioned.fill(
            //     child: Container(
            //       color: Colors.black.withOpacity(0.5),
            //       child: Center(
            //         child: CustomLoadingIndicator(),
            //       ),
            //     ),
            //   )
          ]);
        },
      ),
    );
  }
}
//
