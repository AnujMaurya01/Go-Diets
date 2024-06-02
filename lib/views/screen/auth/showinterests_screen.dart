// import 'dart:convert';

// import 'package:flutter/material.dart';
// import 'package:flutter_easyloading/flutter_easyloading.dart';
// import 'package:get/get.dart';
// import 'package:podcastapp/controller/home/home_controller.dart';
// import 'package:podcastapp/route/route.dart';
// import 'package:podcastapp/utils/app_constants.dart';
// import 'package:podcastapp/utils/colors.dart';
// import 'package:podcastapp/utils/dimensions.dart';
// import 'package:podcastapp/utils/style.dart';
// import 'package:podcastapp/views/widget/button.dart';
// import 'package:podcastapp/views/widget/custom_snackbar.dart';

// class InterestScreen extends StatefulWidget {
//   const InterestScreen({super.key});

//   @override
//   _InterestScreenState createState() => _InterestScreenState();
// }

// class _InterestScreenState extends State<InterestScreen> {
//   final HomeController apiController =
//       Get.put(HomeController(homeRepo: Get.find())); // Access the controller

//   List<String> selectedInterests = [];
//   var res;

//   String selecteVAlue = '';

//   @override
//   void initState() {
//     apiController.getIntersetApi(
//       context,
//     );
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Theme.of(context).primaryColor,
//       body: SafeArea(
//         child: Padding(
//           padding: const EdgeInsets.only(
//               top: Dimensions.PADDING_SIZE_EXTRA_LARGE,
//               left: Dimensions.PADDING_SIZE_DEFAULT,
//               right: Dimensions.PADDING_SIZE_DEFAULT
//               ),
//           child: Column(children: [
//             Row(
//               mainAxisAlignment: MainAxisAlignment.end,
//               children: [
//                 InkWell(
//                   onTap: () {
//                     Get.find<HomeController>().skipfollowpodcastlist(context);
//                     Get.offNamed(RouteHelper.dasboard, arguments: true);
//                   },
//                   child: Text("skip".tr,
//                       style: rubikRegular.copyWith(
//                         decoration: TextDecoration.underline,
//                         fontSize: Dimensions.smallFont,
//                       )),
//                 ),
//               ],
//             ),
//             const SizedBox(height: Dimensions.allPadding),
//             Text("interrst".tr,
//                 style: montserratSemiBold.copyWith(
//                   fontSize: Dimensions.largeFont,
//                 )),
//             const SizedBox(height: Dimensions.borderRadius),
//             Text(AppConstants.chooseMore,
//                 style: rubikRegular.copyWith(
//                   fontSize: Dimensions.smallFont,
//                 )),
//             SizedBox(
//               height: Dimensions.spacingSize25,
//             ),
//             intersetContainer(),
//             CustomLoButton(
//               onPressed: () {
//                 saveInterest(context);
//                 // Get.offNamed(
//                 //   RouteHelper.getDashBoardRoute(),
//                 // );
//               },
//               buttonColor: ColorResources.loginButtonColor,
//               lenearbuttonColor: ColorResources.loginlenearButtonColor,
//               textColor: Colors.white,
//               buttonText: "continue".tr,
//             ),
//           ]),
//         ),
//       ),
//     );
//   }

//   void toggleInterestSelection(String interest, int indxxx) {
//     setState(() {
//       selecteVAlue = interest.toString();
//       if (selectedInterests.contains(interest)) {
//         selectedInterests.remove(interest);
//         selectedInterests.remove(indxxx);
//       } else {
//         selectedInterests.add(interest);
//         final Map<String, dynamic> postData = {"category_names": {}};

//         for (int i = 0; i < selectedInterests.length; i++) {
//           postData["category_names"]["$i"] = selectedInterests[i];
//         }
//         res = jsonEncode(postData);

//         print("post data $res");
//       }
//     });
//   }

//   Future<void> saveInterest(BuildContext context) async {
//     String selectedValue = selecteVAlue.trim();

//     if (selectedValue.isEmpty) {
//       showCustomSnackBar("choose_interest".tr, isError: true);
//     } else {
//       try {
//         EasyLoading.show(
//             status: "loading".tr, maskType: EasyLoadingMaskType.black);
//         Get.find<HomeController>().saveInterest(data: res);
//       } catch (e) {
//         EasyLoading.dismiss();
//         print(e);
//         showCustomSnackBar("choose_interest".tr, isError: true);
//       }
//     }
//   }

//   Widget intersetContainer() {
//     //  String separatedValues =

//     return Container(
//       height: MediaQuery.of(context).size.height * 0.67,
//       child: GetBuilder<HomeController>(
//         builder: (controller) {
//           // Center(child: zzzzzzz):

//           return controller.interlist.isEmpty
//               ? Center(child: CircularProgressIndicator())
//               : GridView.builder(
//                   gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//                     crossAxisCount: 3,
//                     childAspectRatio: 16 / 8,
//                     crossAxisSpacing: 0.1,
//                     mainAxisSpacing: 0.1,
//                   ),
//                   itemCount: (controller.interlist.length).ceil(),
//                   itemBuilder: (context, index) {
//                     final interest = controller.interlist[index];
//                     final isSelected =
//                         selectedInterests.contains(interest.categoryName);
//                     return InkWell(
//                       onTap: () {},
//                       child: InterestTile(
//                         interest: interest.categoryName.toString(),
//                         isSelected: isSelected,
//                         onTap: () => toggleInterestSelection(
//                             interest.categoryName!, index),
//                       ),
//                     );
//                   },
//                 );
//         },
//       ),
//     );
//   }
// }

// class InterestTile extends StatelessWidget {
//   final String interest;
//   final bool isSelected;

//   final VoidCallback onTap;

//   InterestTile({
//     required this.interest,
//     required this.isSelected,
//     required this.onTap,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return InkWell(
//       onTap: onTap,
//       child: Card(
//         elevation: 0,
//         child: Container(
//           decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(Dimensions.borderRadius4),
//             color:
//                 isSelected ? ColorResources.loginButtonColor : Colors.white,
//             border: Border.all(
//               color: ColorResources.bodrColor,
//               width: 1,
//             ),
//           ),
//           // margin: EdgeInsets.all(Dimensions.DIVIDER_SIZE_SMALL),
//           height: Dimensions.BOTTOM_PERSIST_HEIGHT,
//           alignment: Alignment.center,
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               Wrap(children: [
//                 Chip(
//                   backgroundColor:  isSelected ? ColorResources.loginButtonColor : Colors.white,
//                   label: Text(interest,
//                   maxLines: 2,
//                   style: montserratMedium.copyWith(
//                       fontSize: Dimensions.smallFont,
//                       color: isSelected
//                           ? Colors.white
//                           : ColorResources.interestColor)),)
//               ],)
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
// //  Card(
// //         elevation: 0,
// //         child: Container(
// //           decoration: BoxDecoration(
// //             borderRadius: BorderRadius.circular(Dimensions.borderRadius4),
// //             color:
// //                 isSelected ? ColorResources.loginButtonColor : Colors.white,
// //             border: Border.all(
// //               color: ColorResources.bodrColor,
// //               width: 1,
// //             ),
// //           ),
// //           // margin: EdgeInsets.all(Dimensions.DIVIDER_SIZE_SMALL),
// //           height: Dimensions.BOTTOM_PERSIST_HEIGHT,
// //           alignment: Alignment.center,
// //           child: Column(
// //             crossAxisAlignment: CrossAxisAlignment.center,
// //             children: [
// //               Wrap(children: [
// //                 Chip(
// //                   backgroundColor:  isSelected ? ColorResources.loginButtonColor : Colors.white,
// //                   label: Text(interest,
// //                   maxLines: 2,
// //                   style: montserratMedium.copyWith(
// //                       fontSize: Dimensions.smallFont,
// //                       color: isSelected
// //                           ? Colors.white
// //                           : ColorResources.interestColor)),)
// //               ],)
// //             ],
// //           ),
// //         ),
// //       ),