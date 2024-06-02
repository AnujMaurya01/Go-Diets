import 'package:dietitian/controller/auth_controller.dart';
import 'package:dietitian/route/route.dart';
import 'package:dietitian/utils/all_images.dart';
import 'package:dietitian/utils/colors.dart';
import 'package:dietitian/utils/style.dart';
import 'package:dietitian/views/screen/RemarksandSpecial/RemarkandSpecial.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class DietitanProfileDetails extends StatefulWidget {
  const DietitanProfileDetails({super.key});

  @override
  State<DietitanProfileDetails> createState() => _DietitanProfileDetailsState();
}

class _DietitanProfileDetailsState extends State<DietitanProfileDetails> {
  var dietitianList;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    dietitianList = Get.find<AuthController>().getDietitian();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: ColorResources.buttonYellow,

      // Status bar brightness (optional)
      statusBarIconBrightness: Brightness.dark, // For Android (dark icons)
      statusBarBrightness: Brightness
          .light, // Yahaan aap apne pasandeeda rang ka istemal kar sakte hain
    ));
    final Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: ColorResources.whiteColor,
      body: GetBuilder<AuthController>(builder: (logic) {
        return SingleChildScrollView(
          physics: NeverScrollableScrollPhysics(),
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
                    decoration: BoxDecoration(
                      color: ColorResources.buttonYellow,
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(20),
                          bottomRight: Radius.circular(20)),
                    ),
                    height: 200,
                    child: Column(
                      children: [
                        SizedBox(
                          height: 30,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              /*  Icon(
                              Icons.arrow_back_ios,
                              color: Colors.black,
                            ),*/
                              Container(
                                child: Text(
                                  "My Client",
                                  textAlign: TextAlign.center,
                                  style: poppinsSemiBold.copyWith(
                                    fontSize: 20,
                                    height: 1.2,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ],
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
                      //  color: ColorResources.whiteColor,
                      height: screenSize.height * 0.80,
                      child: Column(
                        children: [
                          SizedBox(
                            height: 10,
                          ),
                          Expanded(
                              child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 20.0, right: 20, top: 20),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    children: [
                                      Image.asset('assets/group_icon.png'),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Text(
                                        logic.userDetails!.name!,
                                        style: poppinsSemiBold.copyWith(
                                            fontSize: 18,
                                            color: ColorResources.enableColor),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 20.0, right: 20, top: 0),
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      left: 8.0, right: 8, top: 0),
                                  child: Row(
                                    children: [
                                      SizedBox(
                                        width: 25,
                                      ),
                                      Text(
                                        "${logic.userDetails!.age!} Yrs Old",
                                        style: poppinsSemiBold.copyWith(
                                            fontSize: 16,
                                            color: ColorResources.cultureCor),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 20.0, right: 20, top: 10),
                                child: Container(
                                  height: 40,
                                  decoration: BoxDecoration(
                                      color: ColorResources.decorctionCoor),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      children: [
                                        Image.asset('assets/Vector_pajs.png'),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Text(
                                          "${logic.userDetails!.mobileNo!}",
                                          style: poppinsRegular.copyWith(
                                              fontSize: 16,
                                              color: Colors.black),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 20.0, right: 20, top: 10),
                                child: Container(
                                  height: 40,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      children: [
                                        Image.asset(
                                            'assets/briefcase_svgre.png'),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Text(
                                          "${logic.userDetails!.totalWorkExperience!}",
                                          style: poppinsRegular.copyWith(
                                              fontSize: 16,
                                              color: Colors.black),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 20.0, right: 20, top: 10),
                                child: Container(
                                  height: 40,
                                  decoration: BoxDecoration(
                                      color: ColorResources.decorctionCoor),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      children: [
                                        Image.asset('assets/book_svgrepo.png'),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Text(
                                          "${logic.userDetails!.qualification!}",
                                          style: poppinsRegular.copyWith(
                                              fontSize: 16,
                                              color: Colors.black),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 20.0, right: 20, top: 10),
                                child: Container(
                                  height: 40,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      children: [
                                        Image.asset(
                                            'assets/location_svgrepo.png'),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Text(
                                          "${logic.userDetails!.address!}",
                                          style: poppinsRegular.copyWith(
                                              fontSize: 16,
                                              color: Colors.black),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ))
                        ],
                      ),
                    ),
                  ),
                ),
              ]),
            ],
          ),
        );
      }),
    );
  }
}
