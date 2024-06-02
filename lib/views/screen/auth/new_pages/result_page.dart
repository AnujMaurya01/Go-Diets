import 'package:dietitian/utils/colors.dart';
import 'package:dietitian/utils/style.dart';
import 'package:dietitian/views/screen/auth/new_pages/Components/BottomContainer_Button.dart';
import 'package:dietitian/views/screen/auth/new_pages/Components/Reusable_Bg.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ResultPage extends StatelessWidget {
  final String resultText;
  final String bmi;
  final String advise;
  final Color textColor;

  ResultPage(
      {required this.textColor,
      required this.resultText,
      required this.bmi,
      required this.advise});

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
                                  "BMI Calculator Result",
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
                top: 100,
                left: 0,
                right: 0,
                child: Padding(
                  padding: EdgeInsets.only(left: 20, right: 20),
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        color: Colors.white),
                    height: screenSize.height * 0.88,
                    child: Column(
                      children: [
                        SizedBox(
                          height: 10,
                        ),
                        Expanded(
                            child: SingleChildScrollView(
                          child: Column(
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  SizedBox(
                                    height: 30,
                                  ),
                                  Text(
                                    resultText,
                                    style: poppinsSemiBold.copyWith(
                                        fontSize: 20, color: Colors.black87),
                                  ),
                                  SizedBox(
                                    height: 30,
                                  ),
                                  Text(
                                    bmi,
                                    style: poppinsSemiBold.copyWith(
                                        fontSize: 50, color: Colors.black87),
                                  ),
                                  SizedBox(
                                    height: 30,
                                  ),
                                  Text(
                                    'Normal BMI range:',
                                    style: poppinstMedium.copyWith(
                                        fontSize: 20, color: Colors.black87),
                                  ),
                                  Text(
                                    '18.5 - 25 kg/m2',
                                    style: poppinstMedium.copyWith(
                                        fontSize: 20, color: Colors.black87),
                                  ),
                                  SizedBox(
                                    height: 30,
                                  ),
                                  Text(
                                    advise,
                                    textAlign: TextAlign.center,
                                    style: poppinstMedium.copyWith(
                                        fontSize: 19, color: Colors.black87),
                                  ),
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.all(15.0),
                                child: BottomContainer(
                                    text: 'Re- Calculate',
                                    onTap: () {
                                      Navigator.pop(context);
                                    }),
                              ),
                            ],
                          ),
                        )),
                        SizedBox(
                          height: 10,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ]),
          ],
        ),
      ),
    );
  }
}
