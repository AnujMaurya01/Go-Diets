// import 'dart:async';

// import 'package:flutter/material.dart';
// import 'package:flutter_easyloading/flutter_easyloading.dart';
// import 'package:get/get.dart';
// import 'package:otp_text_field/otp_field.dart';
// import 'package:otp_text_field/style.dart';
// import 'package:podcastapp/route/route.dart';

// import 'package:podcastapp/utils/all_images.dart';

// import 'package:podcastapp/utils/colors.dart';
// import 'package:podcastapp/utils/dimensions.dart';
// import 'package:podcastapp/utils/style.dart';

// import 'package:podcastapp/views/widget/custom_snackbar.dart';

// class VerificationScreen extends StatefulWidget {
//   final String? emailAddress;
//   final String? token;

//   VerificationScreen({super.key, this.emailAddress, this.token});
//   @override
//   State<VerificationScreen> createState() => _VerificationScreenState();
// }

// class _VerificationScreenState extends State<VerificationScreen> {
//   OtpFieldController otpController = OtpFieldController();

//   @override
//   void initState() {
//     super.initState();
//     startOneShotTimer();
//   }

//   void startOneShotTimer() {
//     Timer(Duration(seconds: 2), () {
//       Get.toNamed(
//         RouteHelper.getConfirmPasswordRoute(token: widget.token!),
//       );
//     });
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
//                   left: Dimensions.PADDING_SIZE_DEFAULT,
//                   right: Dimensions.PADDING_SIZE_DEFAULT),
//               child: Column(
//                 children: [
//                   const SizedBox(
//                     height: Dimensions.SPACE_HIGHT_SIZE,
//                   ),
//                   Image.asset(
//                     Images.smartphoneLogo,
//                     height: Dimensions.hight82,
//                     width: Dimensions.hight81,
//                   ),
//                   const SizedBox(
//                     height: Dimensions.hight15,
//                   ),
//                   Text("verification_code".tr,
//                       textAlign: TextAlign.center,
//                       style: montserratSemiBold.copyWith(
//                         fontSize: Dimensions.mediumSize,
//                       )),
//                   const SizedBox(
//                     height: Dimensions.border_Radius,
//                   ),
//                   Text("sent_verification".tr,
//                       textAlign: TextAlign.center,
//                       style: rubikRegular.copyWith(
//                         fontSize: Dimensions.RADIUS_SIZE_REGULAR,
//                       )),
//                   const SizedBox(
//                     height: Dimensions.hight57,
//                   ),
//                   OTPTextField(
//                     controller: otpController,
//                     length: 4,
//                     fieldWidth: Dimensions.SPACE_HIGHT,
//                     fieldStyle: FieldStyle.box,
//                     width: MediaQuery.of(context).size.width * 10,
//                     textFieldAlignment: MainAxisAlignment.spaceAround,
//                     onCompleted: (pin) {},
//                   ),
//                   const SizedBox(
//                     height: Dimensions.spacingSize44,
//                   ),
//                   Text("dontget_code".tr,
//                       style: rubikRegular.copyWith(
//                         fontSize: Dimensions.smallFont,
//                       )),
//                   const SizedBox(
//                     height: Dimensions.spacingSize10,
//                   ),
//                   Text('resend'.tr,
//                       style: montserratSemiBold.copyWith(
//                           decoration: TextDecoration.underline,
//                           // fontWeight: FontWeight.bold,
//                           fontSize: Dimensions.RADIUS_SIZE_REGULAR,
//                           color: ColorResources.loginButtonColor)),
//                   const SizedBox(
//                     height: Dimensions.spacingSize10,
//                   ),
//                   // CustomLoButton(
//                   //   onPressed: () {
//                   //     Get.toNamed(
//                   //       RouteHelper.getConfirmPasswordRoute(
//                   //           token: widget.token!),
//                   //     );
//                   //     //  otpVerify(context);
//                   //   },
//                   //   buttonColor: ColorResources.loginButtonColor,
//                   //   lenearbuttonColor: ColorResources.loginlenearButtonColor,
//                   //   textColor: Colors.white,
//                   //   buttonText: AppConstants.submit,
//                   // ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Future<void> otpVerify(BuildContext context) async {
//     String otp = otpController.obs.value.toString();

//     if (otp.isEmpty) {
//       showCustomSnackBar("enter_otp".tr, isError: true);
//     } else {
//       EasyLoading.show(
//           status: "loading".tr, maskType: EasyLoadingMaskType.black);
//       try {
//         // Get.toNamed(
//         //   RouteHelper.getConfirmPasswordRoute(),
//         // );

//         EasyLoading.dismiss();
//       } catch (e) {
//         EasyLoading.dismiss();
//         print(e);
//         showCustomSnackBar("valid_email".tr, isError: true);
//       }
//     }
//   }
// }
