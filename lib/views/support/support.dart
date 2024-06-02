import 'package:dietitian/utils/colors.dart';
import 'package:dietitian/utils/style.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class SupportScreen extends StatefulWidget {
  const SupportScreen({super.key});

  @override
  State<SupportScreen> createState() => _SupportScreenState();
}

class _SupportScreenState extends State<SupportScreen> {
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
                                  "Support",
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
                    child: Column(
                      children: [
                        SizedBox(
                          height: 30,
                        ),
                        Expanded(
                            child: SingleChildScrollView(
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 15),
                                child: Row(
                                  children: [
                                    Text(
                                      "For Diet Assistance Contact:",
                                      textAlign: TextAlign.center,
                                      style: poppinsSemiBold.copyWith(
                                        fontSize: 15,
                                        height: 1.2,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 15, top: 5, right: 15),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "+91-98109-20121",
                                      textAlign: TextAlign.center,
                                      style: poppinsSemiBold.copyWith(
                                        fontSize: 13,
                                        height: 1.2,
                                        color: Colors.black,
                                      ),
                                    ),
                                    Row(
                                      children: [
                                        GestureDetector(
                                          onTap: () =>
                                              launch("tel://9810920121"),
                                          child: Image.asset(
                                            'assets/phone.png',
                                            height: 25,
                                            width: 25,
                                          ),
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        GestureDetector(
                                          onTap: () async {
                                            await launchUrl(Uri.parse(
                                                "https://api.whatsapp.com/send/?phone=9810920121&text=Hello"));
                                          },
                                          child: Image.asset(
                                            'assets/what.png',
                                            height: 25,
                                            width: 25,
                                          ),
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Container(
                                height: 1,
                                width: 300,
                                color: Colors.grey.shade400,
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 15, top: 20),
                                child: Row(
                                  children: [
                                    Text(
                                      "For Other Assistance Contact:",
                                      textAlign: TextAlign.center,
                                      style: poppinsSemiBold.copyWith(
                                        fontSize: 15,
                                        height: 1.2,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 15, top: 5, right: 15),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "+91-74289-00322",
                                      textAlign: TextAlign.center,
                                      style: poppinsSemiBold.copyWith(
                                        fontSize: 13,
                                        height: 1.2,
                                        color: Colors.black,
                                      ),
                                    ),
                                    Row(
                                      children: [
                                        GestureDetector(
                                          onTap: () =>
                                              launch("tel://7428900322"),
                                          child: Image.asset(
                                            'assets/phone.png',
                                            height: 25,
                                            width: 25,
                                          ),
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        GestureDetector(
                                          onTap: () async {
                                            await launchUrl(Uri.parse(
                                                "https://api.whatsapp.com/send/?phone=7428900322&text=Hello"));
                                          },
                                          child: Image.asset(
                                            'assets/what.png',
                                            height: 25,
                                            width: 25,
                                          ),
                                        )
                                      ],
                                    ),
                                  ],
                                ),
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
