import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:dietitian/controller/auth_controller.dart';
import 'package:dietitian/utils/colors.dart';
import 'package:dietitian/utils/dimensions.dart';
import 'package:dietitian/utils/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';

class RatingScreen extends StatefulWidget {
  const RatingScreen({super.key});

  @override
  State<RatingScreen> createState() => _RatingScreenState();
}

class _RatingScreenState extends State<RatingScreen> {
  bool _isVertical = false;
  double _initialRating = 0.0;
  IconData? _selectedIcon;
  double? _rating = 0.0;

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
                                  "Rate Your Counsellor ",
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
                top: 120,
                left: 0,
                right: 0,
                child: Padding(
                  padding: EdgeInsets.only(left: 20, right: 20),
                  child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          color: Colors.white),
                      height: screenSize.height * 0.88,
                      child: GetBuilder<AuthController>(builder: (logic) {
                        return Column(
                          children: [
                            SizedBox(
                              height: 10,
                            ),
                            Expanded(
                                child: SingleChildScrollView(
                              child: Column(
                                children: [
                                  Image.asset(
                                    'assets/star.png',
                                    height: 250,
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Text(
                                    "Rate Your Counsellor  Below",
                                    textAlign: TextAlign.center,
                                    maxLines: 2,
                                    style: poppinsSemiBold.copyWith(
                                      fontSize: 18,
                                      height: 1.2,
                                      color: Colors.black,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  RatingBar.builder(
                                    initialRating: _initialRating,
                                    minRating: 1,
                                    direction: _isVertical
                                        ? Axis.vertical
                                        : Axis.horizontal,
                                    allowHalfRating: true,
                                    unratedColor: Colors.amber.withAlpha(50),
                                    itemCount: 5,
                                    itemSize: 50.0,
                                    itemPadding:
                                        EdgeInsets.symmetric(horizontal: 4.0),
                                    itemBuilder: (context, _) => Icon(
                                      _selectedIcon ?? Icons.star,
                                      color: Colors.amber,
                                    ),
                                    onRatingUpdate: (rating) {
                                      setState(() {
                                        _rating = rating;
                                      });
                                    },
                                    updateOnDrag: true,
                                  ),

                                  SizedBox(
                                    height: 20,
                                  ),
                                  Text(
                                    "1 Star: Poor        5 Star: Good",
                                    textAlign: TextAlign.center,
                                    maxLines: 2,
                                    style: poppinsSemiBold.copyWith(
                                      fontSize: 14,
                                      height: 1.2,
                                      color: Colors.black,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 50,
                                  ),
                                  GestureDetector(
                                    onTap: () async {
                                      if (_rating == 0.0) {
                                        AwesomeDialog(
                                          context: context,
                                          dialogType: DialogType.error,
                                          animType: AnimType.topSlide,
                                          closeIcon: const Icon(
                                              Icons.close_fullscreen_outlined),
                                          title: 'Rating Error',
                                          titleTextStyle:
                                              poppinstMedium.copyWith(
                                                  fontSize: Dimensions
                                                      .PADDING_SIZE_DEFAULT,
                                                  color: Colors.black),
                                          desc: 'Select 1 to 5 star rating',
                                          descTextStyle:
                                              poppinstMedium.copyWith(
                                                  fontSize: 17,
                                                  color: Colors.black),
                                          btnCancelColor: Colors.grey[500],
                                          btnOkColor:
                                              ColorResources.verifyScreenButton,
                                          btnOkOnPress: () {},
                                        ).show();
                                      } else {
                                        try {
                                          Get.find<AuthController>()
                                              .ratingpostapiii(
                                                  ratringfg: _rating,
                                                  duseridd: logic
                                                      .profileDetails!
                                                      .dieticianId
                                                      .toString(),
                                                  context: context);
                                        } catch (e) {}
                                      }
                                    },
                                    child: Container(
                                      margin:
                                          EdgeInsets.only(left: 50, right: 50),
                                      height: 40,
                                      width: MediaQuery.of(context).size.width,
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                          color: Colors.green,
                                          borderRadius:
                                              BorderRadius.circular(5)),
                                      child: Text(
                                        "Submit",
                                        style: poppinsRegular.copyWith(
                                          color: Colors.white,
                                          fontSize: 16,
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Text(
                                    "No Thanks",
                                    textAlign: TextAlign.center,
                                    maxLines: 2,
                                    style: poppinsRegular.copyWith(
                                      fontSize: 14,
                                      height: 1,
                                      color: Colors.grey,
                                    ),
                                  ),
//                            RatingBar(
//    initialRating: 3,
//    minRating: 1,
//    direction: Axis.horizontal,
//    allowHalfRating: true,
//    itemCount: 5,
//    itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
//    itemBuilder: (context, _) => Icon(
//      Icons.star,
//      color: Colors.amber,
//    ),
//    onRatingUpdate: (rating) {
//      print(rating);
//    },
// );
                                ],
                              ),
                            )),
                            SizedBox(
                              height: 10,
                            ),
                          ],
                        );
                      })),
                ),
              ),
            ]),
          ],
        ),
      ),
    );
  }
}
