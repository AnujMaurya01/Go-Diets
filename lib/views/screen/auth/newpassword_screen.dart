// import 'package:flutter/material.dart';
// import 'package:flutter_easyloading/flutter_easyloading.dart';
// import 'package:get/get.dart';
// import 'package:podcastapp/controller/auth_controller.dart';

// import 'package:podcastapp/utils/all_images.dart';
// import 'package:podcastapp/utils/app_constants.dart';
// import 'package:podcastapp/utils/colors.dart';
// import 'package:podcastapp/utils/dimensions.dart';
// import 'package:podcastapp/utils/style.dart';
// import 'package:podcastapp/views/widget/button.dart';
// import 'package:podcastapp/views/widget/custom_snackbar.dart';

// class ConfirmPassword extends StatefulWidget {
//   final String? token;
//   ConfirmPassword({Key? key, this.token}) : super(key: key);

//   @override
//   _ConfirmPasswordState createState() => _ConfirmPasswordState();
// }

// class _ConfirmPasswordState extends State<ConfirmPassword> {
//   final formKey = GlobalKey<FormState>();
//   final TextEditingController _passwordController = TextEditingController();
//   final TextEditingController _confirmPasswordController =
//       TextEditingController();

//   final emailController = TextEditingController();

//   String token = '';
//   bool isValidMobile = false;
//   bool isEmailFilled = false;
//   bool _newpasswordVisible = false;
//   bool _confirmpasswordVisible = false;

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
//                   Image.asset(
//                     Images.lock1Logo,
//                     height: Dimensions.hight82,
//                     width: Dimensions.hight82,
//                   ),
//                   const SizedBox(
//                     height: Dimensions.hight15,
//                   ),
//                   Text("new_password".tr,
//                       textAlign: TextAlign.center,
//                       style: montserratSemiBold.copyWith(
//                         fontSize: Dimensions.mediumSize,
//                       )),
//                   const SizedBox(
//                     height: Dimensions.border_Radius,
//                   ),
//                   Text("newPassDes".tr,
//                       textAlign: TextAlign.center,
//                       style: rubikRegular.copyWith(
//                           fontSize: Dimensions.RADIUS_SIZE_REGULAR)),
//                   const SizedBox(
//                     height: Dimensions.allPadding,
//                   ),
//                   Text("must_char".tr,
//                       textAlign: TextAlign.center,
//                       style: rubikRegular.copyWith(
//                           fontSize: Dimensions.RADIUS_SIZE_SMALL)),
//                   const SizedBox(
//                     height: Dimensions.smallPadding,
//                   ),
//                   TextFormField(
//                     autovalidateMode: AutovalidateMode.onUserInteraction,
//                     controller: _passwordController,
//                     // validator: (value) {
//                     //   if (value == null || value.isEmpty) {
//                     //     return "enterpasswordln".tr;
//                     //   } else if (_passwordController.text.length < 6) {
//                     //     return AppConstants.passwordln;
//                     //   }
//                     //   return null;
//                     // },
//                     obscureText: !_newpasswordVisible,
//                     decoration: InputDecoration(
//                       hintText: "newpassword".tr,
//                       hintStyle: TextStyle(color: Colors.grey.shade400),

//                       // labelStyle: TextStyle(color: ColorResources.hintColor),
//                       errorBorder: OutlineInputBorder(
//                         borderSide: BorderSide(
//                             color: ColorResources.textFieldBorderColor,
//                             width: Dimensions.borderRadiusSize),
//                         borderRadius: BorderRadius.circular(
//                             Dimensions.RADIUS_SIZE_VERY_SMALL),
//                       ),
//                       focusedBorder: OutlineInputBorder(
//                         borderSide: BorderSide(
//                             color: ColorResources.textFieldBorderColor,
//                             width: Dimensions.borderRadiusSize),
//                         borderRadius: BorderRadius.circular(
//                             Dimensions.RADIUS_SIZE_VERY_SMALL),
//                       ),
//                       border: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(
//                             Dimensions.RADIUS_SIZE_VERY_SMALL),
//                       ),
//                       enabledBorder: OutlineInputBorder(
//                         borderSide: BorderSide(
//                             color: ColorResources.textFieldBorderColor,
//                             width: Dimensions.borderRadiusSize),
//                         borderRadius: BorderRadius.circular(
//                             Dimensions.RADIUS_SIZE_VERY_SMALL),
//                       ),
//                       suffixIcon: Align(
//                         widthFactor: 1.0,
//                         heightFactor: 1.0,
//                         child: GestureDetector(
//                           onTap: () {
//                             setState(() {
//                               _newpasswordVisible = !_newpasswordVisible;
//                             });
//                           },
//                           child: Transform.scale(
//                             scale: _newpasswordVisible ? 0.8 : 0.8,
//                             child: Icon(
//                               _newpasswordVisible
//                                   ? Icons.visibility
//                                   : Icons.visibility_off,
//                               color: _newpasswordVisible
//                                   ? Colors.grey
//                                   : ColorResources.loginButtonColor,
//                               size: 24.0,
//                             ),
//                           ),
//                         ),
//                       ),
//                     ),
//                   ),
//                   const SizedBox(
//                     height: Dimensions.spacingSize10,
//                   ),
//                   TextFormField(
//                     autovalidateMode: AutovalidateMode.onUserInteraction,
//                     controller: _confirmPasswordController,
//                     validator: (value) {
//                       // if (value!.isEmpty) {
//                       //   return AppConstants.passErrror;
//                       // } else
//                       if (_confirmPasswordController.text !=
//                           _passwordController.text) {
//                         return "password_notMatch".tr;
//                       }
//                       return null;
//                     },
//                     obscureText: !_confirmpasswordVisible,
//                     decoration: InputDecoration(
//                       hintText: "confirmpassword".tr,
//                       hintStyle: TextStyle(color: Colors.grey.shade400),
//                       errorBorder: OutlineInputBorder(
//                         borderSide: BorderSide(
//                             color: ColorResources.textFieldBorderColor,
//                             width: Dimensions.borderRadiusSize),
//                         borderRadius: BorderRadius.circular(
//                             Dimensions.RADIUS_SIZE_VERY_SMALL),
//                       ),
//                       focusedBorder: OutlineInputBorder(
//                         borderSide: BorderSide(
//                             color: ColorResources.textFieldBorderColor,
//                             width: Dimensions.borderRadiusSize),
//                         borderRadius: BorderRadius.circular(
//                             Dimensions.RADIUS_SIZE_VERY_SMALL),
//                       ),
//                       border: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(
//                             Dimensions.RADIUS_SIZE_VERY_SMALL),
//                       ),
//                       enabledBorder: OutlineInputBorder(
//                         borderSide: BorderSide(
//                             color: ColorResources.textFieldBorderColor,
//                             width: Dimensions.borderRadiusSize),
//                         borderRadius: BorderRadius.circular(
//                             Dimensions.RADIUS_SIZE_VERY_SMALL),
//                       ),
//                       suffixIcon: Align(
//                         widthFactor: 1.0,
//                         heightFactor: 1.0,
//                         child: GestureDetector(
//                           onTap: () {
//                             setState(() {
//                               _confirmpasswordVisible =
//                                   !_confirmpasswordVisible;
//                             });
//                           },
//                           child: Transform.scale(
//                             scale: _confirmpasswordVisible ? 0.8 : 0.8,
//                             child: Icon(
//                               _confirmpasswordVisible
//                                   ? Icons.visibility
//                                   : Icons.visibility_off,
//                               color: _confirmpasswordVisible
//                                   ? Colors.grey
//                                   : ColorResources.loginButtonColor,
//                               size: 24.0,
//                             ),
//                           ),
//                         ),
//                       ),
//                     ),
//                   ),
//                   const SizedBox(
//                     height: Dimensions.hight20,
//                   ),
//                   CustomLoButton(
//                     onPressed: () {
//                       callForgotVerify(context);
//                       //Get.offAllNamed(RouteHelper.login, arguments: true);
//                     },
//                     buttonColor: ColorResources.loginButtonColor,
//                     lenearbuttonColor: ColorResources.loginlenearButtonColor,
//                     textColor: Colors.white,
//                     buttonText: "reset".tr,
//                   ),
//                   const SizedBox(
//                     height: Dimensions.SMALLSPACE_HIGHT_SIZE,
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Future<void> callForgotVerify(BuildContext context) async {
//     String password = _passwordController.text.trim();
//     String confirmpassword = _confirmPasswordController.text.trim();
//     if (password.isEmpty) {
//       showCustomSnackBar("yourPassword".tr, isError: true);
//     } else if (confirmpassword.isEmpty) {
//       showCustomSnackBar("confirmPass".tr, isError: true);
//     } else if (_confirmPasswordController.text != _passwordController.text) {
//       showCustomSnackBar(AppConstants.enterpassErrror, isError: true);
//     } else {
//       try {
//         EasyLoading.show(
//           status: "loading".tr,
//         );
//         Get.find<AuthController>().forgotVerify(
//             token: widget.token, newpassword: confirmpassword.trim());
//       } catch (e) {
//         EasyLoading.dismiss();

//         print(e);

//         showCustomSnackBar("valid_email".tr, isError: true);
//       }
//     }
//   }
// }
