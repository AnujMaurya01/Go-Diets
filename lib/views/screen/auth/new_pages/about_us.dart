import 'package:dietitian/utils/app_constants.dart';
import 'package:dietitian/utils/colors.dart';
import 'package:dietitian/utils/style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AboutUsSCreen extends StatefulWidget {
  const AboutUsSCreen({super.key});

  @override
  State<AboutUsSCreen> createState() => _AboutUsSCreenState();
}

class _AboutUsSCreenState extends State<AboutUsSCreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        title: Text(
          'About Us',
  style: poppinsSemiBold.copyWith(
                        fontSize: 17, color: Colors.black87),        ),
        backgroundColor: ColorResources.manui,
        shadowColor: Colors.white,
        leading: Builder(
          builder: (context) {
            return IconButton(
              onPressed: () {
                Get.back();
              },
              icon: const Icon(
                Icons.arrow_back_ios,
              ),
              color: Colors.black,
            );
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  color: Color.fromARGB(255, 246, 242, 210),
                  height: 300,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image.asset('assets/30.png'),
                      Image.asset('assets/28.png')
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(
                    '${AppConstants.ghjbjnkm}',
                    style: poppinsRegular.copyWith(
                        fontSize: 15, color: Colors.black87),
                  ),
                )
              ],
            ),
            Stack(
              children: [
                Container(
                  color: Color.fromARGB(255, 246, 242, 210),
                  height: 450,
                  width: double.infinity,
                  child: Image.asset(
                    'assets/bg123.png',
                    fit: BoxFit.fill,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
                  child: Column(
                    children: [
                      Image.asset(
                        'assets/5712.png',
                        fit: BoxFit.fill,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 20),
                        child: Text(
                          '${AppConstants.gvhbjnkml}',
                          style: poppinsRegular.copyWith(
                              fontSize: 15, color: Colors.white),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
            Container(
              color: Color.fromARGB(255, 246, 242, 210),
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Text(
                  '${AppConstants.nbnn}',
                  style: poppinsRegular.copyWith(
                      fontSize: 15, color: Colors.black87),
                ),
              ),
            ),
            Container(
              color: Color.fromARGB(255, 251, 248, 228),
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Text(
                  '${AppConstants.hjnkml}',
                  style: poppinsRegular.copyWith(
                      fontSize: 15, color: Colors.black87),
                ),
              ),
            ),
            Container(
              color: Color.fromARGB(255, 251, 248, 228),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Image.asset(
                  'assets/5712.png',
                  fit: BoxFit.fill,
                ),
              ),
            ),
            Container(
              color: Color.fromARGB(255, 251, 248, 228),
              child: Column(
                children: [
                  Text(
                    'Vision & Mission',
                    style: poppinsSemiBold.copyWith(
                        fontSize: 17, color: Colors.green),
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
                        decoration: BoxDecoration(color: Colors.grey),
                      ),
                      Container(
                        height: 5,
                        width: 70,
                        decoration: BoxDecoration(color: Colors.green),
                      ),
                      Container(
                        height: 1,
                        width: 70,
                        decoration: BoxDecoration(color: Colors.grey),
                      )
                    ],
                  )
                ],
              ),
            ),
            Container(
              color: Color.fromARGB(255, 251, 248, 228),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '1. A safe and effective medically supervised weight management program, tailored made to individual needs.',
                      style: poppinstMedium.copyWith(
                          fontSize: 15, color: Colors.black87),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      '2. Continuous Quality Improvement',
                      style: poppinstMedium.copyWith(
                          fontSize: 15, color: Colors.black87),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      '3. Fast, Friendly customer service.',
                      style: poppinstMedium.copyWith(
                          fontSize: 15, color: Colors.black87),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      '4. Excellence, eminence and reliability.',
                      style: poppinstMedium.copyWith(
                          fontSize: 15, color: Colors.black87),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      '5. Quality Weight Management Program at affordable prices.',
                      style: poppinstMedium.copyWith(
                          fontSize: 15, color: Colors.black87),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      '6. Professional services with a personalized touch with friendly and individual attention.',
                      style: poppinstMedium.copyWith(
                          fontSize: 15, color: Colors.black87),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      '7. Help in becoming healthy nation.',
                      style: poppinstMedium.copyWith(
                          fontSize: 15, color: Colors.black87),
                    ),
                    SizedBox(
                      height: 30,
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
