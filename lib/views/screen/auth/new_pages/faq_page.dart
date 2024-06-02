import 'package:dietitian/utils/colors.dart';
import 'package:dietitian/utils/style.dart';
import 'package:flutter/material.dart';

class FaqScreen extends StatefulWidget {
  const FaqScreen({super.key});

  @override
  State<FaqScreen> createState() => _FaqScreenState();
}

class _FaqScreenState extends State<FaqScreen> {
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
                                  "FAQs",
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
                              Theme(
                                data: ThemeData()
                                    .copyWith(dividerColor: Colors.transparent),
                                child: ExpansionTile(
                                  iconColor: ColorResources.verifyScreenButton,
                                  title: Row(
                                    children: [
                                      SizedBox(
                                        width: 0,
                                      ),
                                      Container(
                                        padding: EdgeInsets.only(top: 0),
                                        child: Text("What is Go diet ?",
                                            style: poppinsSemiBold.copyWith(
                                                color: ColorResources
                                                    .verifyScreenButton,
                                                height: 1,
                                                fontSize: 15)),
                                      )
                                    ],
                                  ),
                                  children: <Widget>[
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 15.0, vertical: 8.0),
                                      child: Column(
                                        children: [
                                          Container(
                                            alignment: Alignment.centerLeft,
                                            child: Text(
                                              "Lorempsum is simply dummy text of the printing typesetting industry. Lorem is aergt has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.",
                                              style: poppinstMedium.copyWith(
                                                fontSize: 14.0,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Theme(
                                data: ThemeData()
                                    .copyWith(dividerColor: Colors.transparent),
                                child: ExpansionTile(
                                  iconColor: ColorResources.verifyScreenButton,
                                  title: Row(
                                    children: [
                                      SizedBox(
                                        width: 0,
                                      ),
                                      Container(
                                        padding: EdgeInsets.only(top: 0),
                                        child: Text(
                                            "Why i need to join Go diet ?",
                                            style: poppinsSemiBold.copyWith(
                                                color: ColorResources
                                                    .verifyScreenButton,
                                                height: 1,
                                                fontSize: 15)),
                                      )
                                    ],
                                  ),
                                  children: <Widget>[
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 15.0, vertical: 8.0),
                                      child: Column(
                                        children: [
                                          Container(
                                            alignment: Alignment.centerLeft,
                                            child: Text(
                                              "Lorempsum is simply dummy text of the printing typesetting industry. Lorem is aergt has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.",
                                              style: poppinstMedium.copyWith(
                                                fontSize: 14.0,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
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
