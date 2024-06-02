import 'package:dietitian/controller/auth_controller.dart';
import 'package:dietitian/route/route.dart';
import 'package:dietitian/utils/colors.dart';
import 'package:dietitian/utils/style.dart';
import 'package:dietitian/views/screen/DilogaLoder/loadingPage.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController textUserId = TextEditingController();
  TextEditingController textPassword = TextEditingController();
  GlobalKey<FormState> formKeyStep = GlobalKey<FormState>();
  bool _obscureText = true;
  final FirebaseMessaging _fcm = FirebaseMessaging.instance;
  var ic = Icons.remove_red_eye_rounded;
  String? fcmToken;

  fibase() async {
    fcmToken = await _fcm.getToken();
    print('MAMAIAMAMIAM${fcmToken}');
  }

  void _toggle() {
    if (_obscureText == true) {
      ic = Icons.visibility_off;
    } else {
      ic = Icons.remove_red_eye_rounded;
    }
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fibase();
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
        return SingleChildScrollView(
          child: Stack(
            children: [
              SafeArea(
                child: Form(
                  key: formKeyStep,
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
                          Text("Hi Dietitian !",
                              style: poppinsSemiBold.copyWith(fontSize: 22)),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            padding: const EdgeInsets.only(
                                left: 40.0, right: 40, top: 10),
                            alignment: Alignment.centerLeft,
                            child: Text("User Id",
                                textAlign: TextAlign.start,
                                style: poppinsSemiBold.copyWith(fontSize: 14)),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 40.0, right: 40, top: 10),
                            child: TextFormField(
                              maxLength: 10,
                              cursorColor: Colors.black,
                              controller: textUserId,
                              keyboardType: TextInputType.text,
                              textInputAction: TextInputAction.next,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "Please Enter valid Username";
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                counterText: "",
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
                          Container(
                            padding: const EdgeInsets.only(
                                left: 40.0, right: 40, top: 10),
                            alignment: Alignment.centerLeft,
                            child: Text("Password",
                                textAlign: TextAlign.start,
                                style: poppinsSemiBold.copyWith(fontSize: 14)),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 40.0, right: 40, top: 10),
                            child: TextFormField(
                              obscureText: _obscureText,
                              cursorColor: Colors.black,
                              controller: textPassword,
                              keyboardType: TextInputType.text,
                              textInputAction: TextInputAction.next,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "Please Enter valid Password";
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                suffixIcon: IconButton(
                                  onPressed: _toggle,
                                  icon: Icon(ic),
                                ),
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
                          SizedBox(
                            height: 30,
                          ),
                          GestureDetector(
                            onTap: () {
                              FocusScope.of(context).unfocus();
                              if (formKeyStep.currentState!.validate()) {
                                String number = textUserId.text;
                                String password = textPassword.text;
                                Get.find<AuthController>().dietitianLogin(
                                  context: context,
                                  number: number.trim(),
                                  password: password.trim(),
                                  fcmToken: fcmToken,
                                );
                              }
                              //  Get.toNamed(RouteHelper.dasboard, arguments: true);
                            },
                            child: Container(
                              height: 40,
                              width: 280,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                  color: ColorResources.verifyScreenButton,
                                  borderRadius: BorderRadius.circular(5)),
                              child: Text(
                                "Login",
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
}
//
