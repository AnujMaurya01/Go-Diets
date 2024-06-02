import 'package:dietitian/utils/colors.dart';
import 'package:dietitian/utils/constants.dart';
import 'package:dietitian/utils/style.dart';
import 'package:dietitian/views/screen/auth/new_pages/Components/BottomContainer_Button.dart';
import 'package:dietitian/views/screen/auth/new_pages/Components/Icon_Content.dart';
import 'package:dietitian/views/screen/auth/new_pages/Components/Reusable_Bg.dart';
import 'package:dietitian/views/screen/auth/new_pages/Components/RoundIcon_Button.dart';
import 'package:dietitian/views/screen/auth/new_pages/caluter_brain.dart';
import 'package:dietitian/views/screen/auth/new_pages/result_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class BmiCalScreen extends StatefulWidget {
  @override
  _BmiCalScreenState createState() => _BmiCalScreenState();
}

enum Gender {
  male,
  female,
}

class _BmiCalScreenState extends State<BmiCalScreen> {
  late Gender selectedGender = Gender.male;
  int height = 180;
  int weight = 50;
  int age = 20;
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
                                  'BMI Calculator',
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
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 30, right: 30),
                                child: Image.asset(
                                  'assets/bmi.png',
                                  height: 150,
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Column(
                                children: [
                                  Text(
                                    'Enter Your Info',
                                    style: poppinsSemiBold.copyWith(
                                        fontSize: 18, color: Colors.black87),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Container(
                                        height: 1,
                                        width: 70,
                                        decoration:
                                            BoxDecoration(color: Colors.grey),
                                      ),
                                      Container(
                                        height: 5,
                                        width: 70,
                                        decoration:
                                            BoxDecoration(color: Colors.green),
                                      ),
                                      Container(
                                        height: 1,
                                        width: 70,
                                        decoration:
                                            BoxDecoration(color: Colors.grey),
                                      )
                                    ],
                                  )
                                ],
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 20, top: 10),
                                child: Row(
                                  children: [
                                    Text(
                                      'Your Gender',
                                      style: poppinsSemiBold.copyWith(
                                          fontSize: 18, color: Colors.black87),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            selectedGender = Gender.male;
                                          });
                                        },
                                        child: ReusableBg(
                                          colour: selectedGender == Gender.male
                                              ? Colors.green.shade200
                                              : Colors.grey.shade400,
                                          cardChild: IconContent(
                                              myicon: FontAwesomeIcons.male,
                                              text: 'MALE'),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            selectedGender = Gender.female;
                                          });
                                        },
                                        child: ReusableBg(
                                          colour:
                                              selectedGender == Gender.female
                                                  ? Colors.green.shade200
                                                  : Colors.grey.shade400,
                                          cardChild: IconContent(
                                              myicon: FontAwesomeIcons.female,
                                              text: 'FEMALE'),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 20, top: 0, bottom: 10),
                                child: Row(
                                  children: [
                                    Text(
                                      'Height',
                                      style: poppinsSemiBold.copyWith(
                                          fontSize: 17, color: Colors.black87),
                                    ),
                                  ],
                                ),
                              ),
                              ReusableBg1(
                                //colour: Colors.white,
                                cardChild: Column(
                                  // mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Text(
                                          '${height.toString()} cm',
                                          style: poppinsSemiBold.copyWith(
                                              fontSize: 17,
                                              color: Colors.black87),
                                        ),
                                      ],
                                    ),
                                    SliderTheme(
                                      data: SliderTheme.of(context).copyWith(
                                        activeTrackColor: Colors.green.shade200,
                                        inactiveTrackColor:
                                            ksliderInactiveColor,
                                        thumbColor: Colors.green,
                                        overlayColor: ColorResources.manui,
                                        thumbShape: RoundSliderThumbShape(
                                            enabledThumbRadius: 15.0),
                                        overlayShape: RoundSliderOverlayShape(
                                            overlayRadius: 35.0),
                                      ),
                                      child: Slider(
                                        value: height.toDouble(),
                                        min: 120,
                                        max: 220,
                                        onChanged: (double newValue) {
                                          setState(() {
                                            height = newValue.round();
                                          });
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  ReusableBg2(
                                    // colour: kactiveCardColor,
                                    cardChild: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            'Weight(KG)',
                                            style: poppinsSemiBold.copyWith(
                                                fontSize: 15,
                                                color: Colors.black87),
                                          ),
                                          Text(
                                            weight.toString(),
                                            style: poppinsSemiBold.copyWith(
                                                fontSize: 30,
                                                color: Colors.black87),
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              RoundIconButton(
                                                icon: FontAwesomeIcons.minus,
                                                onPressed: () {
                                                  setState(() {
                                                    weight--;
                                                  });
                                                },
                                              ),
                                              SizedBox(
                                                width: 15.0,
                                              ),
                                              RoundIconButton(
                                                icon: FontAwesomeIcons.plus,
                                                onPressed: () {
                                                  setState(() {
                                                    weight++;
                                                  });
                                                },
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  ReusableBg2(
                                    // colour: kactiveCardColor,
                                    cardChild: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            'Age',
                                            style: poppinsSemiBold.copyWith(
                                                fontSize: 15,
                                                color: Colors.black87),
                                          ),
                                          Text(
                                            age.toString(),
                                            style: poppinsSemiBold.copyWith(
                                                fontSize: 30,
                                                color: Colors.black87),
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              RoundIconButton(
                                                icon: FontAwesomeIcons.minus,
                                                onPressed: () {
                                                  setState(() {
                                                    age--;
                                                  });
                                                },
                                              ),
                                              SizedBox(width: 15.0),
                                              RoundIconButton(
                                                icon: FontAwesomeIcons.plus,
                                                onPressed: () {
                                                  setState(() {
                                                    age++;
                                                  });
                                                },
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.all(15.0),
                                child: BottomContainer(
                                  text: 'Calculate BMI',
                                  onTap: () {
                                    Calculate calc = Calculate(
                                        height: height, weight: weight);
                                    Get.to(
                                        ResultPage(
                                          bmi: calc.result(),
                                          resultText: calc.getText(),
                                          advise: calc.getAdvise(),
                                          textColor: calc.getTextColor(),
                                        ),
                                        duration: Duration(
                                            milliseconds: ApiConstants
                                                .screenTransitionTime),
                                        transition: Transition.rightToLeft);
                                  },
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 20, top: 0, bottom: 10),
                                child: Text(
                                  'Your BMR calculator generates the number of calories your body burns per day at rest. Your BMR with activity factor is the number of calories your body burns per day based on the activity factor you selected.',
                                  textAlign: TextAlign.center,
                                  style: poppinsRegular.copyWith(
                                      fontSize: 14, color: Colors.black87),
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
