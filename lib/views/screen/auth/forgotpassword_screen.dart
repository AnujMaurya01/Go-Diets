// import 'package:flutter/material.dart';
// import 'package:flutter_easyloading/flutter_easyloading.dart';
// import 'package:get/get.dart';
// import 'package:podcastapp/controller/auth_controller.dart';

// import 'package:podcastapp/utils/all_images.dart';

// import 'package:podcastapp/utils/colors.dart';
// import 'package:podcastapp/utils/dimensions.dart';
// import 'package:podcastapp/utils/style.dart';
// import 'package:podcastapp/utils/textfield.dart';
// import 'package:podcastapp/views/widget/button.dart';
// import 'package:podcastapp/views/widget/custom_snackbar.dart';

// class ForgetPassword extends StatefulWidget {
//   const ForgetPassword({super.key});

//   @override
//   State<ForgetPassword> createState() => _ForgetPasswordState();
// }

// class _ForgetPasswordState extends State<ForgetPassword> {
//   bool rememberMe = false;
//   final _formKey = GlobalKey<FormState>();
//   final TextEditingController emailController = TextEditingController();
//   bool isButtonEnabled = false;

//   @override
//   void initState() {
//     super.initState();
//     emailController.addListener(_checkEmail);
//   }

//   @override
//   void dispose() {
//     emailController.dispose();
//     super.dispose();
//   }

//   void _checkEmail() {
//     setState(() {
//       isButtonEnabled = emailController.text.trim().isNotEmpty;
//     });
//   }

//   bool isValidEmail(String email) {
//     final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
//     return emailRegex.hasMatch(email);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Theme.of(context).primaryColor,
//       body: SingleChildScrollView(
//         child: Column(
//           children: [
//             Padding(
//               padding: const EdgeInsets.only(
//                   left: Dimensions.padding22,
//                   right: Dimensions.THEME_SIZE,
//                   bottom: Dimensions.PADDING_SIZE,
//                   top: Dimensions.PADDING_SIZE_EXTRA_OVER_LARGE),
//               child: GestureDetector(
//                 onTap: () => Get.back(),
//                 child: Icon(
//                   Icons.arrow_back_ios,
//                   color: ColorResources.backColor,
//                 ),
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.only(
//                   top: Dimensions.PADDING_SIZE,
//                   left: Dimensions.PADDING_SIZE_DEFAULT,
//                   right: Dimensions.PADDING_SIZE_DEFAULT),
//               child: Form(
//                 key: _formKey,
//                 child: Column(
//                   children: [
//                     Center(
//                         child: Image.asset(
//                       Images.lockLogo,
//                       height: Dimensions.hight72,
//                       width: Dimensions.hight63,
//                     )),
//                     const SizedBox(
//                       height: Dimensions.hight13,
//                     ),
//                     Text("Forgot_Password".tr,
//                         style: montserratSemiBold.copyWith(
//                           fontSize: Dimensions.mediumSize,
//                         )),
//                     const SizedBox(
//                       height: Dimensions.border_Radius,
//                     ),
//                     Text("dont_werry".tr,
//                         textAlign: TextAlign.center,
//                         style: rubikRegular.copyWith(
//                             fontSize: Dimensions.smallFont)),
//                     const SizedBox(
//                       height: Dimensions.hight39,
//                     ),
//                     EmailFormField(
//                       hint: "Email".tr,
//                       Controllervalue: emailController,
//                     ),
//                     const SizedBox(
//                       height: Dimensions.hight20,
//                     ),
//                     CustomLoButton(
//                       onPressed: () {
//                         isButtonEnabled
//                             ? forgotpassword(context)
//                             : showCustomSnackBar("enter_email".tr,
//                                 isError: true);
//                       },
//                       buttonColor: isButtonEnabled
//                           ? ColorResources.loginButtonColor
//                           : ColorResources.enableColor,
//                       lenearbuttonColor: ColorResources.loginlenearButtonColor,
//                       textColor: Colors.white,
//                       buttonText: "submit".tr,
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Future<void> forgotpassword(BuildContext context) async {
//     String emaiId = emailController.text.trim();

//     if (emaiId.isEmpty) {
//       showCustomSnackBar("enter_email".tr, isError: true);
//     } else {
//       try {
//         EasyLoading.show(
//           status: "loading".tr,
//         );
//         Get.find<AuthController>().forgotPassword(
//           emailId: emailController.text.trim(),
//         );
//       } catch (e) {
//         EasyLoading.dismiss();
//         print(e);
//         showCustomSnackBar('valid_email'.tr, isError: true);
//       }
//     }
//   }
// }
