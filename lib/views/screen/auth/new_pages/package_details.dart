import 'package:dietitian/utils/colors.dart';
import 'package:dietitian/utils/style.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class PackageDetailsScreen extends StatefulWidget {
  String? packagename;
  PackageDetailsScreen({super.key, this.packagename});

  @override
  State<PackageDetailsScreen> createState() => _PackageDetailsScreenState();
}

class _PackageDetailsScreenState extends State<PackageDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;

    return Scaffold(
      body: Column(
        children: [
          if (widget.packagename == 'Weight Loss')
            Stack(children: [
              Container(
                height: MediaQuery.of(context).size.height,
              ),
              Positioned(
                top: 0,
                left: 0,
                right: 0,
                child: Container(
                  color: ColorResources.buttonYellow,
                  height: 300,
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
                                  "${widget.packagename} Package",
                                  textAlign: TextAlign.center,
                                  style: poppinsSemiBold.copyWith(
                                    fontSize: 19,
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
                      Padding(
                        padding:
                            const EdgeInsets.only(left: 20, right: 20, top: 10),
                        child: Text(
                          "Weight Loss And Management Of Lifestyle Diseases With Nutrition.",
                          textAlign: TextAlign.center,
                          style: poppinsRegular.copyWith(
                            fontSize: 15,
                            height: 1.2,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                top: 170,
                left: 0,
                right: 0,
                child: Padding(
                  padding: EdgeInsets.only(left: 0, right: 10),
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        color: Colors.transparent),
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
                                padding: EdgeInsets.only(left: 20, right: 20),
                                child: Container(
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                          image: AssetImage(
                                            'assets/wloss.png',
                                          ),
                                          fit: BoxFit.fill),
                                      borderRadius: BorderRadius.circular(25),
                                      color: Colors.white),
                                  height: 250,
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Row(
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.only(
                                          topRight: Radius.circular(20),
                                          bottomRight: Radius.circular(20)),
                                      color: ColorResources.bukdeudfji,
                                    ),
                                    height: 40,
                                    width: 250,
                                    child: Center(
                                      child: Text(
                                        'Ideal For Weight Loss In',
                                        style: poppinstMedium.copyWith(
                                          fontSize: 15,
                                          height: 1.2,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 20),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Container(
                                          decoration: BoxDecoration(
                                            image: DecorationImage(
                                                image: AssetImage(
                                                  'assets/tivk.png',
                                                ),
                                                fit: BoxFit.cover),
                                            borderRadius: BorderRadius.only(
                                                topRight: Radius.circular(20),
                                                bottomRight:
                                                    Radius.circular(20)),
                                          ),
                                          height: 30,
                                          width: 30,
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Text(
                                          'Thyroid',
                                          style: poppinstMedium.copyWith(
                                            fontSize: 15,
                                            height: 1.2,
                                            color: Colors.black,
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Row(
                                      children: [
                                        Container(
                                          decoration: BoxDecoration(
                                            image: DecorationImage(
                                                image: AssetImage(
                                                  'assets/tivk.png',
                                                ),
                                                fit: BoxFit.cover),
                                            borderRadius: BorderRadius.only(
                                                topRight: Radius.circular(20),
                                                bottomRight:
                                                    Radius.circular(20)),
                                          ),
                                          height: 30,
                                          width: 30,
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Text(
                                          'Diabetes',
                                          style: poppinstMedium.copyWith(
                                            fontSize: 15,
                                            height: 1.2,
                                            color: Colors.black,
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Row(
                                      children: [
                                        Container(
                                          decoration: BoxDecoration(
                                            image: DecorationImage(
                                                image: AssetImage(
                                                  'assets/tivk.png',
                                                ),
                                                fit: BoxFit.cover),
                                            borderRadius: BorderRadius.only(
                                                topRight: Radius.circular(20),
                                                bottomRight:
                                                    Radius.circular(20)),
                                          ),
                                          height: 30,
                                          width: 30,
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Text(
                                          'Special care – athlete',
                                          style: poppinstMedium.copyWith(
                                            fontSize: 15,
                                            height: 1.2,
                                            color: Colors.black,
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Row(
                                      children: [
                                        Container(
                                          decoration: BoxDecoration(
                                            image: DecorationImage(
                                                image: AssetImage(
                                                  'assets/tivk.png',
                                                ),
                                                fit: BoxFit.cover),
                                            borderRadius: BorderRadius.only(
                                                topRight: Radius.circular(20),
                                                bottomRight:
                                                    Radius.circular(20)),
                                          ),
                                          height: 30,
                                          width: 30,
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Text(
                                          'Breastfeeding, etc.',
                                          style: poppinstMedium.copyWith(
                                            fontSize: 15,
                                            height: 1.2,
                                            color: Colors.black,
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Row(
                                      children: [
                                        Container(
                                          decoration: BoxDecoration(
                                            image: DecorationImage(
                                                image: AssetImage(
                                                  'assets/tivk.png',
                                                ),
                                                fit: BoxFit.cover),
                                            borderRadius: BorderRadius.only(
                                                topRight: Radius.circular(20),
                                                bottomRight:
                                                    Radius.circular(20)),
                                          ),
                                          height: 30,
                                          width: 30,
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Text(
                                          'High BP, Cholesterol',
                                          style: poppinstMedium.copyWith(
                                            fontSize: 15,
                                            height: 1.2,
                                            color: Colors.black,
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Row(
                                      children: [
                                        Container(
                                          decoration: BoxDecoration(
                                            image: DecorationImage(
                                                image: AssetImage(
                                                  'assets/tivk.png',
                                                ),
                                                fit: BoxFit.cover),
                                            borderRadius: BorderRadius.only(
                                                topRight: Radius.circular(20),
                                                bottomRight:
                                                    Radius.circular(20)),
                                          ),
                                          height: 30,
                                          width: 30,
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Text(
                                          'Pcod/s',
                                          style: poppinstMedium.copyWith(
                                            fontSize: 15,
                                            height: 1.2,
                                            color: Colors.black,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Container(
                                //height: 400,
                                width: MediaQuery.of(context).size.width,
                                color: Color.fromARGB(255, 251, 248, 228),
                                child: Padding(
                                  padding: const EdgeInsets.all(0.0),
                                  child: Column(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(10.0),
                                        child: Row(
                                          children: [
                                            Text(
                                              'Vision & Mission',
                                              style: poppinsSemiBold.copyWith(
                                                  fontSize: 17,
                                                  color: Colors.green),
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        height: 0,
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 10),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Container(
                                              height: 5,
                                              width: 70,
                                              decoration: BoxDecoration(
                                                  color: Colors.green),
                                            ),
                                            Container(
                                              height: 1,
                                              width: 70,
                                              decoration: BoxDecoration(
                                                  color: Colors.grey),
                                            )
                                          ],
                                        ),
                                      ),
                                      Container(
                                        child: Padding(
                                          padding: const EdgeInsets.all(10.0),
                                          child: Text(
                                            'This program is for you if you’re looking for weight loss and have current medical conditions like Thyroid, PCOS/D, Hypertension (BP), Diabetes, Cholesterol, Renal issues, fatty liver, etc. This program also applies if you have a special care requirement that requires specific nutrients in your diet, for example if you’re an athlete or a breastfeeding women.\n\nJust to give you a bit of overview, our weight loss program purely works on the basis of balanced healthy food and nutrition. We believe in creating a healthy lifestyle rather than promoting quick weight loss/gain diets, pills or use of supplements.\n\nWe DO NOT guarantee 5, 10 or 20 kilo weight loss programs. Your body can safely lose 2-3 kilos in a month and weight you lose with us will not bounce back as long as you remain self-disciplined. Our diet plans are not short term diet plans that you follow for temporary results. Instead, the food prescribed is which you can sustain for lifelong, and hence get permanent outcomes resulting in a lifestyle change.',
                                            style: poppinsRegular.copyWith(
                                                fontSize: 14,
                                                color: Colors.black87),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      Row(
                                        children: [
                                          Container(
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.only(
                                                  topRight: Radius.circular(20),
                                                  bottomRight:
                                                      Radius.circular(20)),
                                              color: Colors.green.shade100,
                                            ),
                                            height: 40,
                                            width: 250,
                                            child: Center(
                                              child: Text(
                                                'Program Features',
                                                style: poppinstMedium.copyWith(
                                                  fontSize: 15,
                                                  height: 1.2,
                                                  color: Colors.black,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 20),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              children: [
                                                Container(
                                                  decoration: BoxDecoration(
                                                    image: DecorationImage(
                                                        image: AssetImage(
                                                          'assets/tivk.png',
                                                        ),
                                                        fit: BoxFit.cover),
                                                    borderRadius:
                                                        BorderRadius.only(
                                                            topRight: Radius
                                                                .circular(20),
                                                            bottomRight:
                                                                Radius.circular(
                                                                    20)),
                                                  ),
                                                  height: 30,
                                                  width: 30,
                                                ),
                                                SizedBox(
                                                  width: 10,
                                                ),
                                                Text(
                                                  'No. 1 healthiest weight loss program',
                                                  style:
                                                      poppinstMedium.copyWith(
                                                    fontSize: 15,
                                                    height: 1.2,
                                                    color: Colors.black,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            SizedBox(
                                              height: 5,
                                            ),
                                            Row(
                                              children: [
                                                Container(
                                                  decoration: BoxDecoration(
                                                    image: DecorationImage(
                                                        image: AssetImage(
                                                          'assets/tivk.png',
                                                        ),
                                                        fit: BoxFit.cover),
                                                    borderRadius:
                                                        BorderRadius.only(
                                                            topRight: Radius
                                                                .circular(20),
                                                            bottomRight:
                                                                Radius.circular(
                                                                    20)),
                                                  ),
                                                  height: 30,
                                                  width: 30,
                                                ),
                                                SizedBox(
                                                  width: 10,
                                                ),
                                                Text(
                                                  '99.9% success rate',
                                                  style:
                                                      poppinstMedium.copyWith(
                                                    fontSize: 15,
                                                    height: 1.2,
                                                    color: Colors.black,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            SizedBox(
                                              height: 5,
                                            ),
                                            Row(
                                              children: [
                                                Container(
                                                  decoration: BoxDecoration(
                                                    image: DecorationImage(
                                                        image: AssetImage(
                                                          'assets/tivk.png',
                                                        ),
                                                        fit: BoxFit.cover),
                                                    borderRadius:
                                                        BorderRadius.only(
                                                            topRight: Radius
                                                                .circular(20),
                                                            bottomRight:
                                                                Radius.circular(
                                                                    20)),
                                                  ),
                                                  height: 30,
                                                  width: 30,
                                                ),
                                                SizedBox(
                                                  width: 10,
                                                ),
                                                Text(
                                                  'Your commitment is essential',
                                                  style:
                                                      poppinstMedium.copyWith(
                                                    fontSize: 15,
                                                    height: 1.2,
                                                    color: Colors.black,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            SizedBox(
                                              height: 5,
                                            ),
                                            Row(
                                              children: [
                                                Container(
                                                  decoration: BoxDecoration(
                                                    image: DecorationImage(
                                                        image: AssetImage(
                                                          'assets/tivk.png',
                                                        ),
                                                        fit: BoxFit.cover),
                                                    borderRadius:
                                                        BorderRadius.only(
                                                            topRight: Radius
                                                                .circular(20),
                                                            bottomRight:
                                                                Radius.circular(
                                                                    20)),
                                                  ),
                                                  height: 30,
                                                  width: 30,
                                                ),
                                                SizedBox(
                                                  width: 10,
                                                ),
                                                Text(
                                                  'Consult with Dt. Ektta Jain\ndirectly (in person or on-phone)',
                                                  style:
                                                      poppinstMedium.copyWith(
                                                    fontSize: 15,
                                                    height: 1.2,
                                                    color: Colors.black,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            SizedBox(
                                              height: 5,
                                            ),
                                            Row(
                                              children: [
                                                Container(
                                                  decoration: BoxDecoration(
                                                    image: DecorationImage(
                                                        image: AssetImage(
                                                          'assets/tivk.png',
                                                        ),
                                                        fit: BoxFit.cover),
                                                    borderRadius:
                                                        BorderRadius.only(
                                                            topRight: Radius
                                                                .circular(20),
                                                            bottomRight:
                                                                Radius.circular(
                                                                    20)),
                                                  ),
                                                  height: 30,
                                                  width: 30,
                                                ),
                                                SizedBox(
                                                  width: 10,
                                                ),
                                                Text(
                                                  'Safe and permanent weight loss',
                                                  style:
                                                      poppinstMedium.copyWith(
                                                    fontSize: 15,
                                                    height: 1.2,
                                                    color: Colors.black,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            SizedBox(
                                              height: 5,
                                            ),
                                            Row(
                                              children: [
                                                Container(
                                                  decoration: BoxDecoration(
                                                    image: DecorationImage(
                                                        image: AssetImage(
                                                          'assets/tivk.png',
                                                        ),
                                                        fit: BoxFit.cover),
                                                    borderRadius:
                                                        BorderRadius.only(
                                                            topRight: Radius
                                                                .circular(20),
                                                            bottomRight:
                                                                Radius.circular(
                                                                    20)),
                                                  ),
                                                  height: 30,
                                                  width: 30,
                                                ),
                                                SizedBox(
                                                  width: 10,
                                                ),
                                                Text(
                                                  'Weekly calls/visits. Excellent any-time support.',
                                                  style:
                                                      poppinstMedium.copyWith(
                                                    fontSize: 14,
                                                    height: 1.2,
                                                    color: Colors.black,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      Row(
                                        children: [
                                          Container(
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.only(
                                                  topRight: Radius.circular(20),
                                                  bottomRight:
                                                      Radius.circular(20)),
                                              color: Colors.white70,
                                            ),
                                            height: 40,
                                            width: 250,
                                            child: Center(
                                              child: Text(
                                                'Diet Style',
                                                style: poppinstMedium.copyWith(
                                                  fontSize: 15,
                                                  height: 1.2,
                                                  color: Colors.black,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 20),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              children: [
                                                Container(
                                                  decoration: BoxDecoration(
                                                    image: DecorationImage(
                                                        image: AssetImage(
                                                          'assets/tivk.png',
                                                        ),
                                                        fit: BoxFit.cover),
                                                    borderRadius:
                                                        BorderRadius.only(
                                                            topRight: Radius
                                                                .circular(20),
                                                            bottomRight:
                                                                Radius.circular(
                                                                    20)),
                                                  ),
                                                  height: 30,
                                                  width: 30,
                                                ),
                                                SizedBox(
                                                  width: 10,
                                                ),
                                                Text(
                                                  '100% customized diet plans; no\npre-defined or fixed diets',
                                                  style:
                                                      poppinstMedium.copyWith(
                                                    fontSize: 15,
                                                    height: 1.2,
                                                    color: Colors.black,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            SizedBox(
                                              height: 5,
                                            ),
                                            Row(
                                              children: [
                                                Container(
                                                  decoration: BoxDecoration(
                                                    image: DecorationImage(
                                                        image: AssetImage(
                                                          'assets/tivk.png',
                                                        ),
                                                        fit: BoxFit.cover),
                                                    borderRadius:
                                                        BorderRadius.only(
                                                            topRight: Radius
                                                                .circular(20),
                                                            bottomRight:
                                                                Radius.circular(
                                                                    20)),
                                                  ),
                                                  height: 30,
                                                  width: 30,
                                                ),
                                                SizedBox(
                                                  width: 10,
                                                ),
                                                Text(
                                                  'Homely and traditional food; \nno crash dieting',
                                                  style:
                                                      poppinstMedium.copyWith(
                                                    fontSize: 15,
                                                    height: 1.2,
                                                    color: Colors.black,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            SizedBox(
                                              height: 5,
                                            ),
                                            Row(
                                              children: [
                                                Container(
                                                  decoration: BoxDecoration(
                                                    image: DecorationImage(
                                                        image: AssetImage(
                                                          'assets/tivk.png',
                                                        ),
                                                        fit: BoxFit.cover),
                                                    borderRadius:
                                                        BorderRadius.only(
                                                            topRight: Radius
                                                                .circular(20),
                                                            bottomRight:
                                                                Radius.circular(
                                                                    20)),
                                                  ),
                                                  height: 30,
                                                  width: 30,
                                                ),
                                                SizedBox(
                                                  width: 10,
                                                ),
                                                Text(
                                                  'Only real food; no pills or supplements',
                                                  style:
                                                      poppinstMedium.copyWith(
                                                    fontSize: 14,
                                                    height: 1.2,
                                                    color: Colors.black,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            SizedBox(
                                              height: 5,
                                            ),
                                            Row(
                                              children: [
                                                Container(
                                                  decoration: BoxDecoration(
                                                    image: DecorationImage(
                                                        image: AssetImage(
                                                          'assets/tivk.png',
                                                        ),
                                                        fit: BoxFit.cover),
                                                    borderRadius:
                                                        BorderRadius.only(
                                                            topRight: Radius
                                                                .circular(20),
                                                            bottomRight:
                                                                Radius.circular(
                                                                    20)),
                                                  ),
                                                  height: 30,
                                                  width: 30,
                                                ),
                                                SizedBox(
                                                  width: 10,
                                                ),
                                                Text(
                                                  'Long-term sustainable diets',
                                                  style:
                                                      poppinstMedium.copyWith(
                                                    fontSize: 14,
                                                    height: 1.2,
                                                    color: Colors.black,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            SizedBox(
                                              height: 5,
                                            ),
                                            Row(
                                              children: [
                                                Container(
                                                  decoration: BoxDecoration(
                                                    image: DecorationImage(
                                                        image: AssetImage(
                                                          'assets/tivk.png',
                                                        ),
                                                        fit: BoxFit.cover),
                                                    borderRadius:
                                                        BorderRadius.only(
                                                            topRight: Radius
                                                                .circular(20),
                                                            bottomRight:
                                                                Radius.circular(
                                                                    20)),
                                                  ),
                                                  height: 30,
                                                  width: 30,
                                                ),
                                                SizedBox(
                                                  width: 10,
                                                ),
                                                Text(
                                                  'Learn portion control. No\nneed for kitchen scale.',
                                                  style:
                                                      poppinstMedium.copyWith(
                                                    fontSize: 14,
                                                    height: 1.2,
                                                    color: Colors.black,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      Row(
                                        children: [
                                          Container(
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.only(
                                                  topRight: Radius.circular(20),
                                                  bottomRight:
                                                      Radius.circular(20)),
                                              color: ColorResources.bukdeudfji,
                                            ),
                                            height: 40,
                                            width: 250,
                                            child: Center(
                                              child: Text(
                                                'What You Get',
                                                style: poppinstMedium.copyWith(
                                                  fontSize: 15,
                                                  height: 1.2,
                                                  color: Colors.black,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            left: 20, bottom: 30),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              children: [
                                                Container(
                                                  decoration: BoxDecoration(
                                                    image: DecorationImage(
                                                        image: AssetImage(
                                                          'assets/tivk.png',
                                                        ),
                                                        fit: BoxFit.cover),
                                                    borderRadius:
                                                        BorderRadius.only(
                                                            topRight: Radius
                                                                .circular(20),
                                                            bottomRight:
                                                                Radius.circular(
                                                                    20)),
                                                  ),
                                                  height: 30,
                                                  width: 30,
                                                ),
                                                SizedBox(
                                                  width: 10,
                                                ),
                                                Text(
                                                  'No. 1 healthiest weight loss program',
                                                  style:
                                                      poppinstMedium.copyWith(
                                                    fontSize: 15,
                                                    height: 1.2,
                                                    color: Colors.black,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            SizedBox(
                                              height: 5,
                                            ),
                                            Row(
                                              children: [
                                                Container(
                                                  decoration: BoxDecoration(
                                                    image: DecorationImage(
                                                        image: AssetImage(
                                                          'assets/tivk.png',
                                                        ),
                                                        fit: BoxFit.cover),
                                                    borderRadius:
                                                        BorderRadius.only(
                                                            topRight: Radius
                                                                .circular(20),
                                                            bottomRight:
                                                                Radius.circular(
                                                                    20)),
                                                  ),
                                                  height: 30,
                                                  width: 30,
                                                ),
                                                SizedBox(
                                                  width: 10,
                                                ),
                                                Text(
                                                  '99.9% success rate',
                                                  style:
                                                      poppinstMedium.copyWith(
                                                    fontSize: 15,
                                                    height: 1.2,
                                                    color: Colors.black,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            SizedBox(
                                              height: 5,
                                            ),
                                            Row(
                                              children: [
                                                Container(
                                                  decoration: BoxDecoration(
                                                    image: DecorationImage(
                                                        image: AssetImage(
                                                          'assets/tivk.png',
                                                        ),
                                                        fit: BoxFit.cover),
                                                    borderRadius:
                                                        BorderRadius.only(
                                                            topRight: Radius
                                                                .circular(20),
                                                            bottomRight:
                                                                Radius.circular(
                                                                    20)),
                                                  ),
                                                  height: 30,
                                                  width: 30,
                                                ),
                                                SizedBox(
                                                  width: 10,
                                                ),
                                                Text(
                                                  'Your commitment is essential',
                                                  style:
                                                      poppinstMedium.copyWith(
                                                    fontSize: 14,
                                                    height: 1.2,
                                                    color: Colors.black,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            SizedBox(
                                              height: 5,
                                            ),
                                            Row(
                                              children: [
                                                Container(
                                                  decoration: BoxDecoration(
                                                    image: DecorationImage(
                                                        image: AssetImage(
                                                          'assets/tivk.png',
                                                        ),
                                                        fit: BoxFit.cover),
                                                    borderRadius:
                                                        BorderRadius.only(
                                                            topRight: Radius
                                                                .circular(20),
                                                            bottomRight:
                                                                Radius.circular(
                                                                    20)),
                                                  ),
                                                  height: 30,
                                                  width: 30,
                                                ),
                                                SizedBox(
                                                  width: 10,
                                                ),
                                                Text(
                                                  'Consult with Dt. Ektta Jain directly\n(in person or on-phone)',
                                                  style:
                                                      poppinstMedium.copyWith(
                                                    fontSize: 14,
                                                    height: 1.2,
                                                    color: Colors.black,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            SizedBox(
                                              height: 5,
                                            ),
                                            Row(
                                              children: [
                                                Container(
                                                  decoration: BoxDecoration(
                                                    image: DecorationImage(
                                                        image: AssetImage(
                                                          'assets/tivk.png',
                                                        ),
                                                        fit: BoxFit.cover),
                                                    borderRadius:
                                                        BorderRadius.only(
                                                            topRight: Radius
                                                                .circular(20),
                                                            bottomRight:
                                                                Radius.circular(
                                                                    20)),
                                                  ),
                                                  height: 30,
                                                  width: 30,
                                                ),
                                                SizedBox(
                                                  width: 10,
                                                ),
                                                Text(
                                                  'Safe and permanent weight loss',
                                                  style:
                                                      poppinstMedium.copyWith(
                                                    fontSize: 14,
                                                    height: 1.2,
                                                    color: Colors.black,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                      GestureDetector(
                                        onTap: () async {
                                          await launchUrl(Uri.parse(
                                              "mailto:info.godiets@gmail.com?subject=Weight Loss&body=Hello"));
                                        },
                                        child: Container(
                                          margin: EdgeInsets.only(
                                              left: 30, right: 30),
                                          height: 40,
                                          width:
                                              MediaQuery.of(context).size.width,
                                          alignment: Alignment.center,
                                          decoration: BoxDecoration(
                                              color: ColorResources
                                                  .verifyScreenButton,
                                              borderRadius:
                                                  BorderRadius.circular(5)),
                                          child: Text(
                                            "Book an Appointment",
                                            style: poppinsRegular.copyWith(
                                              color: Colors.white,
                                              fontSize: 16,
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 100,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )),
                      ],
                    ),
                  ),
                ),
              ),
            ]),
          if (widget.packagename == 'Weight Gain')
            Stack(children: [
              Container(
                height: MediaQuery.of(context).size.height,
              ),
              Positioned(
                top: 0,
                left: 0,
                right: 0,
                child: Container(
                  color: ColorResources.buttonYellow,
                  height: 300,
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
                                  "${widget.packagename} Package",
                                  textAlign: TextAlign.center,
                                  style: poppinsSemiBold.copyWith(
                                    fontSize: 19,
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
                      Padding(
                        padding:
                            const EdgeInsets.only(left: 20, right: 20, top: 10),
                        child: Text(
                          "Weight Gain And Management Of Lifestyle Diseases With Nutrition.",
                          textAlign: TextAlign.center,
                          style: poppinsRegular.copyWith(
                            fontSize: 15,
                            height: 1.2,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                top: 170,
                left: 0,
                right: 0,
                child: Padding(
                  padding: EdgeInsets.only(left: 0, right: 10),
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        color: Colors.transparent),
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
                                padding: EdgeInsets.only(left: 20, right: 20),
                                child: Container(
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                          image: NetworkImage(
                                            'https://godiets.in/wp-content/uploads/2020/06/xxxxxxxxx.png',
                                          ),
                                          fit: BoxFit.fill),
                                      borderRadius: BorderRadius.circular(25),
                                      color: Colors.white),
                                  height: 250,
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Row(
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.only(
                                          topRight: Radius.circular(20),
                                          bottomRight: Radius.circular(20)),
                                      color: ColorResources.bukdeudfji,
                                    ),
                                    height: 40,
                                    width: 250,
                                    child: Center(
                                      child: Text(
                                        'Ideal For Weight Gain In',
                                        style: poppinstMedium.copyWith(
                                          fontSize: 15,
                                          height: 1.2,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 20),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Container(
                                          decoration: BoxDecoration(
                                            image: DecorationImage(
                                                image: AssetImage(
                                                  'assets/tivk.png',
                                                ),
                                                fit: BoxFit.cover),
                                            borderRadius: BorderRadius.only(
                                                topRight: Radius.circular(20),
                                                bottomRight:
                                                    Radius.circular(20)),
                                          ),
                                          height: 30,
                                          width: 30,
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Text(
                                          'DIGESTION PROBLEMS',
                                          style: poppinstMedium.copyWith(
                                            fontSize: 15,
                                            height: 1.2,
                                            color: Colors.black,
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Row(
                                      children: [
                                        Container(
                                          decoration: BoxDecoration(
                                            image: DecorationImage(
                                                image: AssetImage(
                                                  'assets/tivk.png',
                                                ),
                                                fit: BoxFit.cover),
                                            borderRadius: BorderRadius.only(
                                                topRight: Radius.circular(20),
                                                bottomRight:
                                                    Radius.circular(20)),
                                          ),
                                          height: 30,
                                          width: 30,
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Text(
                                          'GENERAL WEAKNES',
                                          style: poppinstMedium.copyWith(
                                            fontSize: 15,
                                            height: 1.2,
                                            color: Colors.black,
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Row(
                                      children: [
                                        Container(
                                          decoration: BoxDecoration(
                                            image: DecorationImage(
                                                image: AssetImage(
                                                  'assets/tivk.png',
                                                ),
                                                fit: BoxFit.cover),
                                            borderRadius: BorderRadius.only(
                                                topRight: Radius.circular(20),
                                                bottomRight:
                                                    Radius.circular(20)),
                                          ),
                                          height: 30,
                                          width: 30,
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Text(
                                          'FOOD INTOLERANCE',
                                          style: poppinstMedium.copyWith(
                                            fontSize: 15,
                                            height: 1.2,
                                            color: Colors.black,
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Container(
                                //height: 400,
                                width: MediaQuery.of(context).size.width,
                                color: Color.fromARGB(255, 251, 248, 228),
                                child: Padding(
                                  padding: const EdgeInsets.all(0.0),
                                  child: Column(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(10.0),
                                        child: Row(
                                          children: [
                                            Text(
                                              'Vision & Mission',
                                              style: poppinsSemiBold.copyWith(
                                                  fontSize: 17,
                                                  color: Colors.green),
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        height: 0,
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 10),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Container(
                                              height: 5,
                                              width: 70,
                                              decoration: BoxDecoration(
                                                  color: Colors.green),
                                            ),
                                            Container(
                                              height: 1,
                                              width: 70,
                                              decoration: BoxDecoration(
                                                  color: Colors.grey),
                                            )
                                          ],
                                        ),
                                      ),
                                      Container(
                                        child: Padding(
                                          padding: const EdgeInsets.all(10.0),
                                          child: Text(
                                            'Do you roll your eyes at the never-ending tips and guides to lose weight every time you open the fitness section of any magazine?\n\nDo you need to put on a few kilos to make a sports team, better your health, or simply to bulk up? Most people are out to lose weight, but you can reverse some basic dieting principles to gain some girth. However, many people do not realize how difficult is weight gain\n\n.Luckily, weight gain is fairly intuitive and need not be strenuous or expensive; some basic calculations and lifestyle changes can garner impressive results. And YES! We help you achieve this with our special weight gain diet plan.',
                                            style: poppinsRegular.copyWith(
                                                fontSize: 14,
                                                color: Colors.black87),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      Row(
                                        children: [
                                          Container(
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.only(
                                                  topRight: Radius.circular(20),
                                                  bottomRight:
                                                      Radius.circular(20)),
                                              color: Colors.green.shade100,
                                            ),
                                            height: 40,
                                            width: 250,
                                            child: Center(
                                              child: Text(
                                                'Program Features',
                                                style: poppinstMedium.copyWith(
                                                  fontSize: 15,
                                                  height: 1.2,
                                                  color: Colors.black,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 20),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              children: [
                                                Container(
                                                  decoration: BoxDecoration(
                                                    image: DecorationImage(
                                                        image: AssetImage(
                                                          'assets/tivk.png',
                                                        ),
                                                        fit: BoxFit.cover),
                                                    borderRadius:
                                                        BorderRadius.only(
                                                            topRight: Radius
                                                                .circular(20),
                                                            bottomRight:
                                                                Radius.circular(
                                                                    20)),
                                                  ),
                                                  height: 30,
                                                  width: 30,
                                                ),
                                                SizedBox(
                                                  width: 10,
                                                ),
                                                Text(
                                                  'No. 1 healthiest weight loss program',
                                                  style:
                                                      poppinstMedium.copyWith(
                                                    fontSize: 15,
                                                    height: 1.2,
                                                    color: Colors.black,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            SizedBox(
                                              height: 5,
                                            ),
                                            Row(
                                              children: [
                                                Container(
                                                  decoration: BoxDecoration(
                                                    image: DecorationImage(
                                                        image: AssetImage(
                                                          'assets/tivk.png',
                                                        ),
                                                        fit: BoxFit.cover),
                                                    borderRadius:
                                                        BorderRadius.only(
                                                            topRight: Radius
                                                                .circular(20),
                                                            bottomRight:
                                                                Radius.circular(
                                                                    20)),
                                                  ),
                                                  height: 30,
                                                  width: 30,
                                                ),
                                                SizedBox(
                                                  width: 10,
                                                ),
                                                Text(
                                                  '99.9% success rate',
                                                  style:
                                                      poppinstMedium.copyWith(
                                                    fontSize: 15,
                                                    height: 1.2,
                                                    color: Colors.black,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            SizedBox(
                                              height: 5,
                                            ),
                                            Row(
                                              children: [
                                                Container(
                                                  decoration: BoxDecoration(
                                                    image: DecorationImage(
                                                        image: AssetImage(
                                                          'assets/tivk.png',
                                                        ),
                                                        fit: BoxFit.cover),
                                                    borderRadius:
                                                        BorderRadius.only(
                                                            topRight: Radius
                                                                .circular(20),
                                                            bottomRight:
                                                                Radius.circular(
                                                                    20)),
                                                  ),
                                                  height: 30,
                                                  width: 30,
                                                ),
                                                SizedBox(
                                                  width: 10,
                                                ),
                                                Text(
                                                  'Your commitment is essential',
                                                  style:
                                                      poppinstMedium.copyWith(
                                                    fontSize: 15,
                                                    height: 1.2,
                                                    color: Colors.black,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            SizedBox(
                                              height: 5,
                                            ),
                                            Row(
                                              children: [
                                                Container(
                                                  decoration: BoxDecoration(
                                                    image: DecorationImage(
                                                        image: AssetImage(
                                                          'assets/tivk.png',
                                                        ),
                                                        fit: BoxFit.cover),
                                                    borderRadius:
                                                        BorderRadius.only(
                                                            topRight: Radius
                                                                .circular(20),
                                                            bottomRight:
                                                                Radius.circular(
                                                                    20)),
                                                  ),
                                                  height: 30,
                                                  width: 30,
                                                ),
                                                SizedBox(
                                                  width: 10,
                                                ),
                                                Text(
                                                  'Consult with Dt. Ektta Jain\ndirectly (in person or on-phone)',
                                                  style:
                                                      poppinstMedium.copyWith(
                                                    fontSize: 15,
                                                    height: 1.2,
                                                    color: Colors.black,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            SizedBox(
                                              height: 5,
                                            ),
                                            Row(
                                              children: [
                                                Container(
                                                  decoration: BoxDecoration(
                                                    image: DecorationImage(
                                                        image: AssetImage(
                                                          'assets/tivk.png',
                                                        ),
                                                        fit: BoxFit.cover),
                                                    borderRadius:
                                                        BorderRadius.only(
                                                            topRight: Radius
                                                                .circular(20),
                                                            bottomRight:
                                                                Radius.circular(
                                                                    20)),
                                                  ),
                                                  height: 30,
                                                  width: 30,
                                                ),
                                                SizedBox(
                                                  width: 10,
                                                ),
                                                Text(
                                                  'Safe and permanent weight loss',
                                                  style:
                                                      poppinstMedium.copyWith(
                                                    fontSize: 15,
                                                    height: 1.2,
                                                    color: Colors.black,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            SizedBox(
                                              height: 5,
                                            ),
                                            Row(
                                              children: [
                                                Container(
                                                  decoration: BoxDecoration(
                                                    image: DecorationImage(
                                                        image: AssetImage(
                                                          'assets/tivk.png',
                                                        ),
                                                        fit: BoxFit.cover),
                                                    borderRadius:
                                                        BorderRadius.only(
                                                            topRight: Radius
                                                                .circular(20),
                                                            bottomRight:
                                                                Radius.circular(
                                                                    20)),
                                                  ),
                                                  height: 30,
                                                  width: 30,
                                                ),
                                                SizedBox(
                                                  width: 10,
                                                ),
                                                Text(
                                                  'Weekly calls/visits. Excellent any-time support.',
                                                  style:
                                                      poppinstMedium.copyWith(
                                                    fontSize: 14,
                                                    height: 1.2,
                                                    color: Colors.black,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      Row(
                                        children: [
                                          Container(
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.only(
                                                  topRight: Radius.circular(20),
                                                  bottomRight:
                                                      Radius.circular(20)),
                                              color: Colors.white70,
                                            ),
                                            height: 40,
                                            width: 250,
                                            child: Center(
                                              child: Text(
                                                'Diet Style',
                                                style: poppinstMedium.copyWith(
                                                  fontSize: 15,
                                                  height: 1.2,
                                                  color: Colors.black,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 20),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              children: [
                                                Container(
                                                  decoration: BoxDecoration(
                                                    image: DecorationImage(
                                                        image: AssetImage(
                                                          'assets/tivk.png',
                                                        ),
                                                        fit: BoxFit.cover),
                                                    borderRadius:
                                                        BorderRadius.only(
                                                            topRight: Radius
                                                                .circular(20),
                                                            bottomRight:
                                                                Radius.circular(
                                                                    20)),
                                                  ),
                                                  height: 30,
                                                  width: 30,
                                                ),
                                                SizedBox(
                                                  width: 10,
                                                ),
                                                Text(
                                                  '100% customized diet plans; no\npre-defined or fixed diets',
                                                  style:
                                                      poppinstMedium.copyWith(
                                                    fontSize: 15,
                                                    height: 1.2,
                                                    color: Colors.black,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            SizedBox(
                                              height: 5,
                                            ),
                                            Row(
                                              children: [
                                                Container(
                                                  decoration: BoxDecoration(
                                                    image: DecorationImage(
                                                        image: AssetImage(
                                                          'assets/tivk.png',
                                                        ),
                                                        fit: BoxFit.cover),
                                                    borderRadius:
                                                        BorderRadius.only(
                                                            topRight: Radius
                                                                .circular(20),
                                                            bottomRight:
                                                                Radius.circular(
                                                                    20)),
                                                  ),
                                                  height: 30,
                                                  width: 30,
                                                ),
                                                SizedBox(
                                                  width: 10,
                                                ),
                                                Text(
                                                  'Homely and traditional food; \nno crash dieting',
                                                  style:
                                                      poppinstMedium.copyWith(
                                                    fontSize: 15,
                                                    height: 1.2,
                                                    color: Colors.black,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            SizedBox(
                                              height: 5,
                                            ),
                                            Row(
                                              children: [
                                                Container(
                                                  decoration: BoxDecoration(
                                                    image: DecorationImage(
                                                        image: AssetImage(
                                                          'assets/tivk.png',
                                                        ),
                                                        fit: BoxFit.cover),
                                                    borderRadius:
                                                        BorderRadius.only(
                                                            topRight: Radius
                                                                .circular(20),
                                                            bottomRight:
                                                                Radius.circular(
                                                                    20)),
                                                  ),
                                                  height: 30,
                                                  width: 30,
                                                ),
                                                SizedBox(
                                                  width: 10,
                                                ),
                                                Text(
                                                  'Only real food; no pills or supplements',
                                                  style:
                                                      poppinstMedium.copyWith(
                                                    fontSize: 14,
                                                    height: 1.2,
                                                    color: Colors.black,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            SizedBox(
                                              height: 5,
                                            ),
                                            Row(
                                              children: [
                                                Container(
                                                  decoration: BoxDecoration(
                                                    image: DecorationImage(
                                                        image: AssetImage(
                                                          'assets/tivk.png',
                                                        ),
                                                        fit: BoxFit.cover),
                                                    borderRadius:
                                                        BorderRadius.only(
                                                            topRight: Radius
                                                                .circular(20),
                                                            bottomRight:
                                                                Radius.circular(
                                                                    20)),
                                                  ),
                                                  height: 30,
                                                  width: 30,
                                                ),
                                                SizedBox(
                                                  width: 10,
                                                ),
                                                Text(
                                                  'Long-term sustainable diets',
                                                  style:
                                                      poppinstMedium.copyWith(
                                                    fontSize: 14,
                                                    height: 1.2,
                                                    color: Colors.black,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            SizedBox(
                                              height: 5,
                                            ),
                                            Row(
                                              children: [
                                                Container(
                                                  decoration: BoxDecoration(
                                                    image: DecorationImage(
                                                        image: AssetImage(
                                                          'assets/tivk.png',
                                                        ),
                                                        fit: BoxFit.cover),
                                                    borderRadius:
                                                        BorderRadius.only(
                                                            topRight: Radius
                                                                .circular(20),
                                                            bottomRight:
                                                                Radius.circular(
                                                                    20)),
                                                  ),
                                                  height: 30,
                                                  width: 30,
                                                ),
                                                SizedBox(
                                                  width: 10,
                                                ),
                                                Text(
                                                  'Learn portion control. No\nneed for kitchen scale.',
                                                  style:
                                                      poppinstMedium.copyWith(
                                                    fontSize: 14,
                                                    height: 1.2,
                                                    color: Colors.black,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      Row(
                                        children: [
                                          Container(
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.only(
                                                  topRight: Radius.circular(20),
                                                  bottomRight:
                                                      Radius.circular(20)),
                                              color: ColorResources.bukdeudfji,
                                            ),
                                            height: 40,
                                            width: 250,
                                            child: Center(
                                              child: Text(
                                                'What You Get',
                                                style: poppinstMedium.copyWith(
                                                  fontSize: 15,
                                                  height: 1.2,
                                                  color: Colors.black,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            left: 20, bottom: 30),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              children: [
                                                Container(
                                                  decoration: BoxDecoration(
                                                    image: DecorationImage(
                                                        image: AssetImage(
                                                          'assets/tivk.png',
                                                        ),
                                                        fit: BoxFit.cover),
                                                    borderRadius:
                                                        BorderRadius.only(
                                                            topRight: Radius
                                                                .circular(20),
                                                            bottomRight:
                                                                Radius.circular(
                                                                    20)),
                                                  ),
                                                  height: 30,
                                                  width: 30,
                                                ),
                                                SizedBox(
                                                  width: 10,
                                                ),
                                                Text(
                                                  'No. 1 healthiest weight loss program',
                                                  style:
                                                      poppinstMedium.copyWith(
                                                    fontSize: 15,
                                                    height: 1.2,
                                                    color: Colors.black,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            SizedBox(
                                              height: 5,
                                            ),
                                            Row(
                                              children: [
                                                Container(
                                                  decoration: BoxDecoration(
                                                    image: DecorationImage(
                                                        image: AssetImage(
                                                          'assets/tivk.png',
                                                        ),
                                                        fit: BoxFit.cover),
                                                    borderRadius:
                                                        BorderRadius.only(
                                                            topRight: Radius
                                                                .circular(20),
                                                            bottomRight:
                                                                Radius.circular(
                                                                    20)),
                                                  ),
                                                  height: 30,
                                                  width: 30,
                                                ),
                                                SizedBox(
                                                  width: 10,
                                                ),
                                                Text(
                                                  '99.9% success rate',
                                                  style:
                                                      poppinstMedium.copyWith(
                                                    fontSize: 15,
                                                    height: 1.2,
                                                    color: Colors.black,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            SizedBox(
                                              height: 5,
                                            ),
                                            Row(
                                              children: [
                                                Container(
                                                  decoration: BoxDecoration(
                                                    image: DecorationImage(
                                                        image: AssetImage(
                                                          'assets/tivk.png',
                                                        ),
                                                        fit: BoxFit.cover),
                                                    borderRadius:
                                                        BorderRadius.only(
                                                            topRight: Radius
                                                                .circular(20),
                                                            bottomRight:
                                                                Radius.circular(
                                                                    20)),
                                                  ),
                                                  height: 30,
                                                  width: 30,
                                                ),
                                                SizedBox(
                                                  width: 10,
                                                ),
                                                Text(
                                                  'Your commitment is essential',
                                                  style:
                                                      poppinstMedium.copyWith(
                                                    fontSize: 14,
                                                    height: 1.2,
                                                    color: Colors.black,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            SizedBox(
                                              height: 5,
                                            ),
                                            Row(
                                              children: [
                                                Container(
                                                  decoration: BoxDecoration(
                                                    image: DecorationImage(
                                                        image: AssetImage(
                                                          'assets/tivk.png',
                                                        ),
                                                        fit: BoxFit.cover),
                                                    borderRadius:
                                                        BorderRadius.only(
                                                            topRight: Radius
                                                                .circular(20),
                                                            bottomRight:
                                                                Radius.circular(
                                                                    20)),
                                                  ),
                                                  height: 30,
                                                  width: 30,
                                                ),
                                                SizedBox(
                                                  width: 10,
                                                ),
                                                Text(
                                                  'Consult with Dt. Ektta Jain directly\n(in person or on-phone)',
                                                  style:
                                                      poppinstMedium.copyWith(
                                                    fontSize: 14,
                                                    height: 1.2,
                                                    color: Colors.black,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            SizedBox(
                                              height: 5,
                                            ),
                                            Row(
                                              children: [
                                                Container(
                                                  decoration: BoxDecoration(
                                                    image: DecorationImage(
                                                        image: AssetImage(
                                                          'assets/tivk.png',
                                                        ),
                                                        fit: BoxFit.cover),
                                                    borderRadius:
                                                        BorderRadius.only(
                                                            topRight: Radius
                                                                .circular(20),
                                                            bottomRight:
                                                                Radius.circular(
                                                                    20)),
                                                  ),
                                                  height: 30,
                                                  width: 30,
                                                ),
                                                SizedBox(
                                                  width: 10,
                                                ),
                                                Text(
                                                  'Safe and permanent weight loss',
                                                  style:
                                                      poppinstMedium.copyWith(
                                                    fontSize: 14,
                                                    height: 1.2,
                                                    color: Colors.black,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                      GestureDetector(
                                        onTap: () async {
                                          await launchUrl(Uri.parse(
                                              "mailto:info.godiets@gmail.com?subject=Weight Gain&body=Hello"));
                                        },
                                        child: Container(
                                          margin: EdgeInsets.only(
                                              left: 30, right: 30),
                                          height: 40,
                                          width:
                                              MediaQuery.of(context).size.width,
                                          alignment: Alignment.center,
                                          decoration: BoxDecoration(
                                              color: ColorResources
                                                  .verifyScreenButton,
                                              borderRadius:
                                                  BorderRadius.circular(5)),
                                          child: Text(
                                            "Book an Appointment",
                                            style: poppinsRegular.copyWith(
                                              color: Colors.white,
                                              fontSize: 16,
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 100,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )),
                      ],
                    ),
                  ),
                ),
              ),
            ]),
          if (widget.packagename == 'Therapeutic (Medical Issues)')
            Stack(children: [
              Container(
                height: MediaQuery.of(context).size.height,
              ),
              Positioned(
                top: 0,
                left: 0,
                right: 0,
                child: Container(
                  color: ColorResources.buttonYellow,
                  height: 300,
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
                                  "${widget.packagename} Package",
                                  textAlign: TextAlign.center,
                                  style: poppinsSemiBold.copyWith(
                                    fontSize: 19,
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
                      Padding(
                        padding:
                            const EdgeInsets.only(left: 20, right: 20, top: 10),
                        child: Text(
                          "Therapeutic Issues And Management Of Lifestyle Diseases With Nutrition.",
                          textAlign: TextAlign.center,
                          style: poppinsRegular.copyWith(
                            fontSize: 15,
                            height: 1.2,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                top: 170,
                left: 0,
                right: 0,
                child: Padding(
                  padding: EdgeInsets.only(left: 0, right: 10),
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        color: Colors.transparent),
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
                                padding: EdgeInsets.only(left: 20, right: 20),
                                child: Container(
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                          image: NetworkImage(
                                            'https://godiets.in/wp-content/uploads/2020/06/zzzzzz.png',
                                          ),
                                          fit: BoxFit.fill),
                                      borderRadius: BorderRadius.circular(25),
                                      color: Colors.white),
                                  height: 250,
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Row(
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.only(
                                          topRight: Radius.circular(20),
                                          bottomRight: Radius.circular(20)),
                                      color: ColorResources.bukdeudfji,
                                    ),
                                    height: 40,
                                    width: 250,
                                    child: Center(
                                      child: Text(
                                        'Ideal For Therapeutic Issues In',
                                        style: poppinstMedium.copyWith(
                                          fontSize: 15,
                                          height: 1.2,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 20),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Container(
                                          decoration: BoxDecoration(
                                            image: DecorationImage(
                                                image: AssetImage(
                                                  'assets/tivk.png',
                                                ),
                                                fit: BoxFit.cover),
                                            borderRadius: BorderRadius.only(
                                                topRight: Radius.circular(20),
                                                bottomRight:
                                                    Radius.circular(20)),
                                          ),
                                          height: 30,
                                          width: 30,
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Text(
                                          'THYROID',
                                          style: poppinstMedium.copyWith(
                                            fontSize: 15,
                                            height: 1.2,
                                            color: Colors.black,
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Row(
                                      children: [
                                        Container(
                                          decoration: BoxDecoration(
                                            image: DecorationImage(
                                                image: AssetImage(
                                                  'assets/tivk.png',
                                                ),
                                                fit: BoxFit.cover),
                                            borderRadius: BorderRadius.only(
                                                topRight: Radius.circular(20),
                                                bottomRight:
                                                    Radius.circular(20)),
                                          ),
                                          height: 30,
                                          width: 30,
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Text(
                                          'PCOS/D',
                                          style: poppinstMedium.copyWith(
                                            fontSize: 15,
                                            height: 1.2,
                                            color: Colors.black,
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Row(
                                      children: [
                                        Container(
                                          decoration: BoxDecoration(
                                            image: DecorationImage(
                                                image: AssetImage(
                                                  'assets/tivk.png',
                                                ),
                                                fit: BoxFit.cover),
                                            borderRadius: BorderRadius.only(
                                                topRight: Radius.circular(20),
                                                bottomRight:
                                                    Radius.circular(20)),
                                          ),
                                          height: 30,
                                          width: 30,
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Text(
                                          'HP',
                                          style: poppinstMedium.copyWith(
                                            fontSize: 15,
                                            height: 1.2,
                                            color: Colors.black,
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Row(
                                      children: [
                                        Container(
                                          decoration: BoxDecoration(
                                            image: DecorationImage(
                                                image: AssetImage(
                                                  'assets/tivk.png',
                                                ),
                                                fit: BoxFit.cover),
                                            borderRadius: BorderRadius.only(
                                                topRight: Radius.circular(20),
                                                bottomRight:
                                                    Radius.circular(20)),
                                          ),
                                          height: 30,
                                          width: 30,
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Text(
                                          'DIABETES',
                                          style: poppinstMedium.copyWith(
                                            fontSize: 15,
                                            height: 1.2,
                                            color: Colors.black,
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Row(
                                      children: [
                                        Container(
                                          decoration: BoxDecoration(
                                            image: DecorationImage(
                                                image: AssetImage(
                                                  'assets/tivk.png',
                                                ),
                                                fit: BoxFit.cover),
                                            borderRadius: BorderRadius.only(
                                                topRight: Radius.circular(20),
                                                bottomRight:
                                                    Radius.circular(20)),
                                          ),
                                          height: 30,
                                          width: 30,
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Text(
                                          'CHOLESTEROL',
                                          style: poppinstMedium.copyWith(
                                            fontSize: 15,
                                            height: 1.2,
                                            color: Colors.black,
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Row(
                                      children: [
                                        Container(
                                          decoration: BoxDecoration(
                                            image: DecorationImage(
                                                image: AssetImage(
                                                  'assets/tivk.png',
                                                ),
                                                fit: BoxFit.cover),
                                            borderRadius: BorderRadius.only(
                                                topRight: Radius.circular(20),
                                                bottomRight:
                                                    Radius.circular(20)),
                                          ),
                                          height: 30,
                                          width: 30,
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Text(
                                          'RENAL ISSUES',
                                          style: poppinstMedium.copyWith(
                                            fontSize: 15,
                                            height: 1.2,
                                            color: Colors.black,
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Row(
                                      children: [
                                        Container(
                                          decoration: BoxDecoration(
                                            image: DecorationImage(
                                                image: AssetImage(
                                                  'assets/tivk.png',
                                                ),
                                                fit: BoxFit.cover),
                                            borderRadius: BorderRadius.only(
                                                topRight: Radius.circular(20),
                                                bottomRight:
                                                    Radius.circular(20)),
                                          ),
                                          height: 30,
                                          width: 30,
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Text(
                                          'FOOD INTOLERANCE',
                                          style: poppinstMedium.copyWith(
                                            fontSize: 15,
                                            height: 1.2,
                                            color: Colors.black,
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Row(
                                      children: [
                                        Container(
                                          decoration: BoxDecoration(
                                            image: DecorationImage(
                                                image: AssetImage(
                                                  'assets/tivk.png',
                                                ),
                                                fit: BoxFit.cover),
                                            borderRadius: BorderRadius.only(
                                                topRight: Radius.circular(20),
                                                bottomRight:
                                                    Radius.circular(20)),
                                          ),
                                          height: 30,
                                          width: 30,
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Text(
                                          'SKIN DISORDERS',
                                          style: poppinstMedium.copyWith(
                                            fontSize: 15,
                                            height: 1.2,
                                            color: Colors.black,
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Container(
                                //height: 400,
                                width: MediaQuery.of(context).size.width,
                                color: Color.fromARGB(255, 251, 248, 228),
                                child: Padding(
                                  padding: const EdgeInsets.all(0.0),
                                  child: Column(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(10.0),
                                        child: Row(
                                          children: [
                                            Text(
                                              'Vision & Mission',
                                              style: poppinsSemiBold.copyWith(
                                                  fontSize: 17,
                                                  color: Colors.green),
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        height: 0,
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 10),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Container(
                                              height: 5,
                                              width: 70,
                                              decoration: BoxDecoration(
                                                  color: Colors.green),
                                            ),
                                            Container(
                                              height: 1,
                                              width: 70,
                                              decoration: BoxDecoration(
                                                  color: Colors.grey),
                                            )
                                          ],
                                        ),
                                      ),
                                      Container(
                                        child: Padding(
                                          padding: const EdgeInsets.all(10.0),
                                          child: Text(
                                            'So your weight is normal but you have a special requirement or a medical condition that needs specific nutrients in your diet? That includes low calorie diet, low sodium diet, low cholesterol diet, high fiber diet, food intolerance. We can help you!\n\nA therapeutic diet is a meal plan that controls the intake of certain foods or nutrients. It is part of the treatment of a medical condition and are normally prescribed by a physician and planned by us. A therapeutic diet is usually a modification of a regular diet. It is modified or tailored to fit the nutrition needs of a particular person.\n\nTherapeutic diets are modified for (1) nutrients, (2) texture, and/or (3) food allergies or food intolerance.',
                                            style: poppinsRegular.copyWith(
                                                fontSize: 14,
                                                color: Colors.black87),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      Row(
                                        children: [
                                          Container(
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.only(
                                                  topRight: Radius.circular(20),
                                                  bottomRight:
                                                      Radius.circular(20)),
                                              color: Colors.green.shade100,
                                            ),
                                            height: 40,
                                            width: 250,
                                            child: Center(
                                              child: Text(
                                                'Program Features',
                                                style: poppinstMedium.copyWith(
                                                  fontSize: 15,
                                                  height: 1.2,
                                                  color: Colors.black,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 20),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              children: [
                                                Container(
                                                  decoration: BoxDecoration(
                                                    image: DecorationImage(
                                                        image: AssetImage(
                                                          'assets/tivk.png',
                                                        ),
                                                        fit: BoxFit.cover),
                                                    borderRadius:
                                                        BorderRadius.only(
                                                            topRight: Radius
                                                                .circular(20),
                                                            bottomRight:
                                                                Radius.circular(
                                                                    20)),
                                                  ),
                                                  height: 30,
                                                  width: 30,
                                                ),
                                                SizedBox(
                                                  width: 10,
                                                ),
                                                Text(
                                                  'No. 1 healthiest weight loss program',
                                                  style:
                                                      poppinstMedium.copyWith(
                                                    fontSize: 15,
                                                    height: 1.2,
                                                    color: Colors.black,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            SizedBox(
                                              height: 5,
                                            ),
                                            Row(
                                              children: [
                                                Container(
                                                  decoration: BoxDecoration(
                                                    image: DecorationImage(
                                                        image: AssetImage(
                                                          'assets/tivk.png',
                                                        ),
                                                        fit: BoxFit.cover),
                                                    borderRadius:
                                                        BorderRadius.only(
                                                            topRight: Radius
                                                                .circular(20),
                                                            bottomRight:
                                                                Radius.circular(
                                                                    20)),
                                                  ),
                                                  height: 30,
                                                  width: 30,
                                                ),
                                                SizedBox(
                                                  width: 10,
                                                ),
                                                Text(
                                                  '99.9% success rate',
                                                  style:
                                                      poppinstMedium.copyWith(
                                                    fontSize: 15,
                                                    height: 1.2,
                                                    color: Colors.black,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            SizedBox(
                                              height: 5,
                                            ),
                                            Row(
                                              children: [
                                                Container(
                                                  decoration: BoxDecoration(
                                                    image: DecorationImage(
                                                        image: AssetImage(
                                                          'assets/tivk.png',
                                                        ),
                                                        fit: BoxFit.cover),
                                                    borderRadius:
                                                        BorderRadius.only(
                                                            topRight: Radius
                                                                .circular(20),
                                                            bottomRight:
                                                                Radius.circular(
                                                                    20)),
                                                  ),
                                                  height: 30,
                                                  width: 30,
                                                ),
                                                SizedBox(
                                                  width: 10,
                                                ),
                                                Text(
                                                  'Your commitment is essential',
                                                  style:
                                                      poppinstMedium.copyWith(
                                                    fontSize: 15,
                                                    height: 1.2,
                                                    color: Colors.black,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            SizedBox(
                                              height: 5,
                                            ),
                                            Row(
                                              children: [
                                                Container(
                                                  decoration: BoxDecoration(
                                                    image: DecorationImage(
                                                        image: AssetImage(
                                                          'assets/tivk.png',
                                                        ),
                                                        fit: BoxFit.cover),
                                                    borderRadius:
                                                        BorderRadius.only(
                                                            topRight: Radius
                                                                .circular(20),
                                                            bottomRight:
                                                                Radius.circular(
                                                                    20)),
                                                  ),
                                                  height: 30,
                                                  width: 30,
                                                ),
                                                SizedBox(
                                                  width: 10,
                                                ),
                                                Text(
                                                  'Consult with Dt. Ektta Jain\ndirectly (in person or on-phone)',
                                                  style:
                                                      poppinstMedium.copyWith(
                                                    fontSize: 15,
                                                    height: 1.2,
                                                    color: Colors.black,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            SizedBox(
                                              height: 5,
                                            ),
                                            Row(
                                              children: [
                                                Container(
                                                  decoration: BoxDecoration(
                                                    image: DecorationImage(
                                                        image: AssetImage(
                                                          'assets/tivk.png',
                                                        ),
                                                        fit: BoxFit.cover),
                                                    borderRadius:
                                                        BorderRadius.only(
                                                            topRight: Radius
                                                                .circular(20),
                                                            bottomRight:
                                                                Radius.circular(
                                                                    20)),
                                                  ),
                                                  height: 30,
                                                  width: 30,
                                                ),
                                                SizedBox(
                                                  width: 10,
                                                ),
                                                Text(
                                                  'Safe and permanent weight loss',
                                                  style:
                                                      poppinstMedium.copyWith(
                                                    fontSize: 15,
                                                    height: 1.2,
                                                    color: Colors.black,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            SizedBox(
                                              height: 5,
                                            ),
                                            Row(
                                              children: [
                                                Container(
                                                  decoration: BoxDecoration(
                                                    image: DecorationImage(
                                                        image: AssetImage(
                                                          'assets/tivk.png',
                                                        ),
                                                        fit: BoxFit.cover),
                                                    borderRadius:
                                                        BorderRadius.only(
                                                            topRight: Radius
                                                                .circular(20),
                                                            bottomRight:
                                                                Radius.circular(
                                                                    20)),
                                                  ),
                                                  height: 30,
                                                  width: 30,
                                                ),
                                                SizedBox(
                                                  width: 10,
                                                ),
                                                Text(
                                                  'Weekly calls/visits. Excellent any-time support.',
                                                  style:
                                                      poppinstMedium.copyWith(
                                                    fontSize: 14,
                                                    height: 1.2,
                                                    color: Colors.black,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      Row(
                                        children: [
                                          Container(
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.only(
                                                  topRight: Radius.circular(20),
                                                  bottomRight:
                                                      Radius.circular(20)),
                                              color: Colors.white70,
                                            ),
                                            height: 40,
                                            width: 250,
                                            child: Center(
                                              child: Text(
                                                'Diet Style',
                                                style: poppinstMedium.copyWith(
                                                  fontSize: 15,
                                                  height: 1.2,
                                                  color: Colors.black,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 20),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              children: [
                                                Container(
                                                  decoration: BoxDecoration(
                                                    image: DecorationImage(
                                                        image: AssetImage(
                                                          'assets/tivk.png',
                                                        ),
                                                        fit: BoxFit.cover),
                                                    borderRadius:
                                                        BorderRadius.only(
                                                            topRight: Radius
                                                                .circular(20),
                                                            bottomRight:
                                                                Radius.circular(
                                                                    20)),
                                                  ),
                                                  height: 30,
                                                  width: 30,
                                                ),
                                                SizedBox(
                                                  width: 10,
                                                ),
                                                Text(
                                                  '100% customized diet plans; no\npre-defined or fixed diets',
                                                  style:
                                                      poppinstMedium.copyWith(
                                                    fontSize: 15,
                                                    height: 1.2,
                                                    color: Colors.black,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            SizedBox(
                                              height: 5,
                                            ),
                                            Row(
                                              children: [
                                                Container(
                                                  decoration: BoxDecoration(
                                                    image: DecorationImage(
                                                        image: AssetImage(
                                                          'assets/tivk.png',
                                                        ),
                                                        fit: BoxFit.cover),
                                                    borderRadius:
                                                        BorderRadius.only(
                                                            topRight: Radius
                                                                .circular(20),
                                                            bottomRight:
                                                                Radius.circular(
                                                                    20)),
                                                  ),
                                                  height: 30,
                                                  width: 30,
                                                ),
                                                SizedBox(
                                                  width: 10,
                                                ),
                                                Text(
                                                  'Homely and traditional food; \nno crash dieting',
                                                  style:
                                                      poppinstMedium.copyWith(
                                                    fontSize: 15,
                                                    height: 1.2,
                                                    color: Colors.black,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            SizedBox(
                                              height: 5,
                                            ),
                                            Row(
                                              children: [
                                                Container(
                                                  decoration: BoxDecoration(
                                                    image: DecorationImage(
                                                        image: AssetImage(
                                                          'assets/tivk.png',
                                                        ),
                                                        fit: BoxFit.cover),
                                                    borderRadius:
                                                        BorderRadius.only(
                                                            topRight: Radius
                                                                .circular(20),
                                                            bottomRight:
                                                                Radius.circular(
                                                                    20)),
                                                  ),
                                                  height: 30,
                                                  width: 30,
                                                ),
                                                SizedBox(
                                                  width: 10,
                                                ),
                                                Text(
                                                  'Only real food; no pills or supplements',
                                                  style:
                                                      poppinstMedium.copyWith(
                                                    fontSize: 14,
                                                    height: 1.2,
                                                    color: Colors.black,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            SizedBox(
                                              height: 5,
                                            ),
                                            Row(
                                              children: [
                                                Container(
                                                  decoration: BoxDecoration(
                                                    image: DecorationImage(
                                                        image: AssetImage(
                                                          'assets/tivk.png',
                                                        ),
                                                        fit: BoxFit.cover),
                                                    borderRadius:
                                                        BorderRadius.only(
                                                            topRight: Radius
                                                                .circular(20),
                                                            bottomRight:
                                                                Radius.circular(
                                                                    20)),
                                                  ),
                                                  height: 30,
                                                  width: 30,
                                                ),
                                                SizedBox(
                                                  width: 10,
                                                ),
                                                Text(
                                                  'Long-term sustainable diets',
                                                  style:
                                                      poppinstMedium.copyWith(
                                                    fontSize: 14,
                                                    height: 1.2,
                                                    color: Colors.black,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            SizedBox(
                                              height: 5,
                                            ),
                                            Row(
                                              children: [
                                                Container(
                                                  decoration: BoxDecoration(
                                                    image: DecorationImage(
                                                        image: AssetImage(
                                                          'assets/tivk.png',
                                                        ),
                                                        fit: BoxFit.cover),
                                                    borderRadius:
                                                        BorderRadius.only(
                                                            topRight: Radius
                                                                .circular(20),
                                                            bottomRight:
                                                                Radius.circular(
                                                                    20)),
                                                  ),
                                                  height: 30,
                                                  width: 30,
                                                ),
                                                SizedBox(
                                                  width: 10,
                                                ),
                                                Text(
                                                  'Learn portion control. No\nneed for kitchen scale.',
                                                  style:
                                                      poppinstMedium.copyWith(
                                                    fontSize: 14,
                                                    height: 1.2,
                                                    color: Colors.black,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      Row(
                                        children: [
                                          Container(
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.only(
                                                  topRight: Radius.circular(20),
                                                  bottomRight:
                                                      Radius.circular(20)),
                                              color: ColorResources.bukdeudfji,
                                            ),
                                            height: 40,
                                            width: 250,
                                            child: Center(
                                              child: Text(
                                                'What You Get',
                                                style: poppinstMedium.copyWith(
                                                  fontSize: 15,
                                                  height: 1.2,
                                                  color: Colors.black,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            left: 20, bottom: 30),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              children: [
                                                Container(
                                                  decoration: BoxDecoration(
                                                    image: DecorationImage(
                                                        image: AssetImage(
                                                          'assets/tivk.png',
                                                        ),
                                                        fit: BoxFit.cover),
                                                    borderRadius:
                                                        BorderRadius.only(
                                                            topRight: Radius
                                                                .circular(20),
                                                            bottomRight:
                                                                Radius.circular(
                                                                    20)),
                                                  ),
                                                  height: 30,
                                                  width: 30,
                                                ),
                                                SizedBox(
                                                  width: 10,
                                                ),
                                                Text(
                                                  'No. 1 healthiest weight loss program',
                                                  style:
                                                      poppinstMedium.copyWith(
                                                    fontSize: 15,
                                                    height: 1.2,
                                                    color: Colors.black,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            SizedBox(
                                              height: 5,
                                            ),
                                            Row(
                                              children: [
                                                Container(
                                                  decoration: BoxDecoration(
                                                    image: DecorationImage(
                                                        image: AssetImage(
                                                          'assets/tivk.png',
                                                        ),
                                                        fit: BoxFit.cover),
                                                    borderRadius:
                                                        BorderRadius.only(
                                                            topRight: Radius
                                                                .circular(20),
                                                            bottomRight:
                                                                Radius.circular(
                                                                    20)),
                                                  ),
                                                  height: 30,
                                                  width: 30,
                                                ),
                                                SizedBox(
                                                  width: 10,
                                                ),
                                                Text(
                                                  '99.9% success rate',
                                                  style:
                                                      poppinstMedium.copyWith(
                                                    fontSize: 15,
                                                    height: 1.2,
                                                    color: Colors.black,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            SizedBox(
                                              height: 5,
                                            ),
                                            Row(
                                              children: [
                                                Container(
                                                  decoration: BoxDecoration(
                                                    image: DecorationImage(
                                                        image: AssetImage(
                                                          'assets/tivk.png',
                                                        ),
                                                        fit: BoxFit.cover),
                                                    borderRadius:
                                                        BorderRadius.only(
                                                            topRight: Radius
                                                                .circular(20),
                                                            bottomRight:
                                                                Radius.circular(
                                                                    20)),
                                                  ),
                                                  height: 30,
                                                  width: 30,
                                                ),
                                                SizedBox(
                                                  width: 10,
                                                ),
                                                Text(
                                                  'Your commitment is essential',
                                                  style:
                                                      poppinstMedium.copyWith(
                                                    fontSize: 14,
                                                    height: 1.2,
                                                    color: Colors.black,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            SizedBox(
                                              height: 5,
                                            ),
                                            Row(
                                              children: [
                                                Container(
                                                  decoration: BoxDecoration(
                                                    image: DecorationImage(
                                                        image: AssetImage(
                                                          'assets/tivk.png',
                                                        ),
                                                        fit: BoxFit.cover),
                                                    borderRadius:
                                                        BorderRadius.only(
                                                            topRight: Radius
                                                                .circular(20),
                                                            bottomRight:
                                                                Radius.circular(
                                                                    20)),
                                                  ),
                                                  height: 30,
                                                  width: 30,
                                                ),
                                                SizedBox(
                                                  width: 10,
                                                ),
                                                Text(
                                                  'Consult with Dt. Ektta Jain directly\n(in person or on-phone)',
                                                  style:
                                                      poppinstMedium.copyWith(
                                                    fontSize: 14,
                                                    height: 1.2,
                                                    color: Colors.black,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            SizedBox(
                                              height: 5,
                                            ),
                                            Row(
                                              children: [
                                                Container(
                                                  decoration: BoxDecoration(
                                                    image: DecorationImage(
                                                        image: AssetImage(
                                                          'assets/tivk.png',
                                                        ),
                                                        fit: BoxFit.cover),
                                                    borderRadius:
                                                        BorderRadius.only(
                                                            topRight: Radius
                                                                .circular(20),
                                                            bottomRight:
                                                                Radius.circular(
                                                                    20)),
                                                  ),
                                                  height: 30,
                                                  width: 30,
                                                ),
                                                SizedBox(
                                                  width: 10,
                                                ),
                                                Text(
                                                  'Safe and permanent weight loss',
                                                  style:
                                                      poppinstMedium.copyWith(
                                                    fontSize: 14,
                                                    height: 1.2,
                                                    color: Colors.black,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                      GestureDetector(
                                        onTap: () async {
                                          await launchUrl(Uri.parse(
                                              "mailto:info.godiets@gmail.com?subject=Therapeutic(Medical Issue)&body=Hello"));
                                        },
                                        child: Container(
                                          margin: EdgeInsets.only(
                                              left: 30, right: 30),
                                          height: 40,
                                          width:
                                              MediaQuery.of(context).size.width,
                                          alignment: Alignment.center,
                                          decoration: BoxDecoration(
                                              color: ColorResources
                                                  .verifyScreenButton,
                                              borderRadius:
                                                  BorderRadius.circular(5)),
                                          child: Text(
                                            "Book an Appointment",
                                            style: poppinsRegular.copyWith(
                                              color: Colors.white,
                                              fontSize: 16,
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 100,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )),
                      ],
                    ),
                  ),
                ),
              ),
            ]),
          if (widget.packagename == 'Maintenance')
            Stack(children: [
              Container(
                height: MediaQuery.of(context).size.height,
              ),
              Positioned(
                top: 0,
                left: 0,
                right: 0,
                child: Container(
                  color: ColorResources.buttonYellow,
                  height: 300,
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
                                  "${widget.packagename} Package",
                                  textAlign: TextAlign.center,
                                  style: poppinsSemiBold.copyWith(
                                    fontSize: 19,
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
                      Padding(
                        padding:
                            const EdgeInsets.only(left: 20, right: 20, top: 10),
                        child: Text(
                          "Maintenance And Management Of Lifestyle Diseases With Nutrition.",
                          textAlign: TextAlign.center,
                          style: poppinsRegular.copyWith(
                            fontSize: 15,
                            height: 1.2,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                top: 170,
                left: 0,
                right: 0,
                child: Padding(
                  padding: EdgeInsets.only(left: 0, right: 10),
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        color: Colors.transparent),
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
                                padding: EdgeInsets.only(left: 20, right: 20),
                                child: Container(
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                          image: NetworkImage(
                                            'https://godiets.in/wp-content/uploads/2020/06/sssss.png',
                                          ),
                                          fit: BoxFit.fill),
                                      borderRadius: BorderRadius.circular(25),
                                      color: Colors.white),
                                  height: 250,
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Row(
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.only(
                                          topRight: Radius.circular(20),
                                          bottomRight: Radius.circular(20)),
                                      color: ColorResources.bukdeudfji,
                                    ),
                                    height: 40,
                                    width: 250,
                                    child: Center(
                                      child: Text(
                                        'Ideal For Weight Gain In',
                                        style: poppinstMedium.copyWith(
                                          fontSize: 15,
                                          height: 1.2,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 20),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Container(
                                          decoration: BoxDecoration(
                                            image: DecorationImage(
                                                image: AssetImage(
                                                  'assets/tivk.png',
                                                ),
                                                fit: BoxFit.cover),
                                            borderRadius: BorderRadius.only(
                                                topRight: Radius.circular(20),
                                                bottomRight:
                                                    Radius.circular(20)),
                                          ),
                                          height: 30,
                                          width: 30,
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Text(
                                          'HEALTHY LIFESTYLE',
                                          style: poppinstMedium.copyWith(
                                            fontSize: 15,
                                            height: 1.2,
                                            color: Colors.black,
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Row(
                                      children: [
                                        Container(
                                          decoration: BoxDecoration(
                                            image: DecorationImage(
                                                image: AssetImage(
                                                  'assets/tivk.png',
                                                ),
                                                fit: BoxFit.cover),
                                            borderRadius: BorderRadius.only(
                                                topRight: Radius.circular(20),
                                                bottomRight:
                                                    Radius.circular(20)),
                                          ),
                                          height: 30,
                                          width: 30,
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Text(
                                          'WEIGHT MAINTENANCE',
                                          style: poppinstMedium.copyWith(
                                            fontSize: 15,
                                            height: 1.2,
                                            color: Colors.black,
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Row(
                                      children: [
                                        Container(
                                          decoration: BoxDecoration(
                                            image: DecorationImage(
                                                image: AssetImage(
                                                  'assets/tivk.png',
                                                ),
                                                fit: BoxFit.cover),
                                            borderRadius: BorderRadius.only(
                                                topRight: Radius.circular(20),
                                                bottomRight:
                                                    Radius.circular(20)),
                                          ),
                                          height: 30,
                                          width: 30,
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Text(
                                          'HEALTHY RECIPE FINDERS',
                                          style: poppinstMedium.copyWith(
                                            fontSize: 15,
                                            height: 1.2,
                                            color: Colors.black,
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Container(
                                //height: 400,
                                width: MediaQuery.of(context).size.width,
                                color: Color.fromARGB(255, 251, 248, 228),
                                child: Padding(
                                  padding: const EdgeInsets.all(0.0),
                                  child: Column(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(10.0),
                                        child: Row(
                                          children: [
                                            Text(
                                              'Vision & Mission',
                                              style: poppinsSemiBold.copyWith(
                                                  fontSize: 17,
                                                  color: Colors.green),
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        height: 0,
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 10),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Container(
                                              height: 5,
                                              width: 70,
                                              decoration: BoxDecoration(
                                                  color: Colors.green),
                                            ),
                                            Container(
                                              height: 1,
                                              width: 70,
                                              decoration: BoxDecoration(
                                                  color: Colors.grey),
                                            )
                                          ],
                                        ),
                                      ),
                                      Container(
                                        child: Padding(
                                          padding: const EdgeInsets.all(10.0),
                                          child: Text(
                                            'If you are just looking to switch to healthy eating or wish to maintain your weight but not sure what to eat, when to eat, how much to eat, etc., then this service is for you.\n\nOther than that, if you are suffering from acidity, constipation or digestion related issues, then this service will also assist you. The diet plans will assist you to integrate healthy eating into your lifestyle and help you remain fit. You will be prescribed a variety of food items every week and you will be able to learn what is good for your body and what is not.\n\nNote: If you have a weight loss or gain goal, then please select the weight loss or weight gain services.',
                                            style: poppinsRegular.copyWith(
                                                fontSize: 14,
                                                color: Colors.black87),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      Row(
                                        children: [
                                          Container(
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.only(
                                                  topRight: Radius.circular(20),
                                                  bottomRight:
                                                      Radius.circular(20)),
                                              color: Colors.green.shade100,
                                            ),
                                            height: 40,
                                            width: 250,
                                            child: Center(
                                              child: Text(
                                                'Program Features',
                                                style: poppinstMedium.copyWith(
                                                  fontSize: 15,
                                                  height: 1.2,
                                                  color: Colors.black,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 20),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              children: [
                                                Container(
                                                  decoration: BoxDecoration(
                                                    image: DecorationImage(
                                                        image: AssetImage(
                                                          'assets/tivk.png',
                                                        ),
                                                        fit: BoxFit.cover),
                                                    borderRadius:
                                                        BorderRadius.only(
                                                            topRight: Radius
                                                                .circular(20),
                                                            bottomRight:
                                                                Radius.circular(
                                                                    20)),
                                                  ),
                                                  height: 30,
                                                  width: 30,
                                                ),
                                                SizedBox(
                                                  width: 10,
                                                ),
                                                Text(
                                                  'No. 1 healthiest weight loss program',
                                                  style:
                                                      poppinstMedium.copyWith(
                                                    fontSize: 15,
                                                    height: 1.2,
                                                    color: Colors.black,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            SizedBox(
                                              height: 5,
                                            ),
                                            Row(
                                              children: [
                                                Container(
                                                  decoration: BoxDecoration(
                                                    image: DecorationImage(
                                                        image: AssetImage(
                                                          'assets/tivk.png',
                                                        ),
                                                        fit: BoxFit.cover),
                                                    borderRadius:
                                                        BorderRadius.only(
                                                            topRight: Radius
                                                                .circular(20),
                                                            bottomRight:
                                                                Radius.circular(
                                                                    20)),
                                                  ),
                                                  height: 30,
                                                  width: 30,
                                                ),
                                                SizedBox(
                                                  width: 10,
                                                ),
                                                Text(
                                                  '99.9% success rate',
                                                  style:
                                                      poppinstMedium.copyWith(
                                                    fontSize: 15,
                                                    height: 1.2,
                                                    color: Colors.black,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            SizedBox(
                                              height: 5,
                                            ),
                                            Row(
                                              children: [
                                                Container(
                                                  decoration: BoxDecoration(
                                                    image: DecorationImage(
                                                        image: AssetImage(
                                                          'assets/tivk.png',
                                                        ),
                                                        fit: BoxFit.cover),
                                                    borderRadius:
                                                        BorderRadius.only(
                                                            topRight: Radius
                                                                .circular(20),
                                                            bottomRight:
                                                                Radius.circular(
                                                                    20)),
                                                  ),
                                                  height: 30,
                                                  width: 30,
                                                ),
                                                SizedBox(
                                                  width: 10,
                                                ),
                                                Text(
                                                  'Your commitment is essential',
                                                  style:
                                                      poppinstMedium.copyWith(
                                                    fontSize: 15,
                                                    height: 1.2,
                                                    color: Colors.black,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            SizedBox(
                                              height: 5,
                                            ),
                                            Row(
                                              children: [
                                                Container(
                                                  decoration: BoxDecoration(
                                                    image: DecorationImage(
                                                        image: AssetImage(
                                                          'assets/tivk.png',
                                                        ),
                                                        fit: BoxFit.cover),
                                                    borderRadius:
                                                        BorderRadius.only(
                                                            topRight: Radius
                                                                .circular(20),
                                                            bottomRight:
                                                                Radius.circular(
                                                                    20)),
                                                  ),
                                                  height: 30,
                                                  width: 30,
                                                ),
                                                SizedBox(
                                                  width: 10,
                                                ),
                                                Text(
                                                  'Consult with Dt. Ektta Jain\ndirectly (in person or on-phone)',
                                                  style:
                                                      poppinstMedium.copyWith(
                                                    fontSize: 15,
                                                    height: 1.2,
                                                    color: Colors.black,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            SizedBox(
                                              height: 5,
                                            ),
                                            Row(
                                              children: [
                                                Container(
                                                  decoration: BoxDecoration(
                                                    image: DecorationImage(
                                                        image: AssetImage(
                                                          'assets/tivk.png',
                                                        ),
                                                        fit: BoxFit.cover),
                                                    borderRadius:
                                                        BorderRadius.only(
                                                            topRight: Radius
                                                                .circular(20),
                                                            bottomRight:
                                                                Radius.circular(
                                                                    20)),
                                                  ),
                                                  height: 30,
                                                  width: 30,
                                                ),
                                                SizedBox(
                                                  width: 10,
                                                ),
                                                Text(
                                                  'Safe and permanent weight loss',
                                                  style:
                                                      poppinstMedium.copyWith(
                                                    fontSize: 15,
                                                    height: 1.2,
                                                    color: Colors.black,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            SizedBox(
                                              height: 5,
                                            ),
                                            Row(
                                              children: [
                                                Container(
                                                  decoration: BoxDecoration(
                                                    image: DecorationImage(
                                                        image: AssetImage(
                                                          'assets/tivk.png',
                                                        ),
                                                        fit: BoxFit.cover),
                                                    borderRadius:
                                                        BorderRadius.only(
                                                            topRight: Radius
                                                                .circular(20),
                                                            bottomRight:
                                                                Radius.circular(
                                                                    20)),
                                                  ),
                                                  height: 30,
                                                  width: 30,
                                                ),
                                                SizedBox(
                                                  width: 10,
                                                ),
                                                Text(
                                                  'Weekly calls/visits. Excellent any-time support.',
                                                  style:
                                                      poppinstMedium.copyWith(
                                                    fontSize: 14,
                                                    height: 1.2,
                                                    color: Colors.black,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      Row(
                                        children: [
                                          Container(
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.only(
                                                  topRight: Radius.circular(20),
                                                  bottomRight:
                                                      Radius.circular(20)),
                                              color: Colors.white70,
                                            ),
                                            height: 40,
                                            width: 250,
                                            child: Center(
                                              child: Text(
                                                'Diet Style',
                                                style: poppinstMedium.copyWith(
                                                  fontSize: 15,
                                                  height: 1.2,
                                                  color: Colors.black,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 20),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              children: [
                                                Container(
                                                  decoration: BoxDecoration(
                                                    image: DecorationImage(
                                                        image: AssetImage(
                                                          'assets/tivk.png',
                                                        ),
                                                        fit: BoxFit.cover),
                                                    borderRadius:
                                                        BorderRadius.only(
                                                            topRight: Radius
                                                                .circular(20),
                                                            bottomRight:
                                                                Radius.circular(
                                                                    20)),
                                                  ),
                                                  height: 30,
                                                  width: 30,
                                                ),
                                                SizedBox(
                                                  width: 10,
                                                ),
                                                Text(
                                                  '100% customized diet plans; no\npre-defined or fixed diets',
                                                  style:
                                                      poppinstMedium.copyWith(
                                                    fontSize: 15,
                                                    height: 1.2,
                                                    color: Colors.black,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            SizedBox(
                                              height: 5,
                                            ),
                                            Row(
                                              children: [
                                                Container(
                                                  decoration: BoxDecoration(
                                                    image: DecorationImage(
                                                        image: AssetImage(
                                                          'assets/tivk.png',
                                                        ),
                                                        fit: BoxFit.cover),
                                                    borderRadius:
                                                        BorderRadius.only(
                                                            topRight: Radius
                                                                .circular(20),
                                                            bottomRight:
                                                                Radius.circular(
                                                                    20)),
                                                  ),
                                                  height: 30,
                                                  width: 30,
                                                ),
                                                SizedBox(
                                                  width: 10,
                                                ),
                                                Text(
                                                  'Homely and traditional food; \nno crash dieting',
                                                  style:
                                                      poppinstMedium.copyWith(
                                                    fontSize: 15,
                                                    height: 1.2,
                                                    color: Colors.black,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            SizedBox(
                                              height: 5,
                                            ),
                                            Row(
                                              children: [
                                                Container(
                                                  decoration: BoxDecoration(
                                                    image: DecorationImage(
                                                        image: AssetImage(
                                                          'assets/tivk.png',
                                                        ),
                                                        fit: BoxFit.cover),
                                                    borderRadius:
                                                        BorderRadius.only(
                                                            topRight: Radius
                                                                .circular(20),
                                                            bottomRight:
                                                                Radius.circular(
                                                                    20)),
                                                  ),
                                                  height: 30,
                                                  width: 30,
                                                ),
                                                SizedBox(
                                                  width: 10,
                                                ),
                                                Text(
                                                  'Only real food; no pills or supplements',
                                                  style:
                                                      poppinstMedium.copyWith(
                                                    fontSize: 14,
                                                    height: 1.2,
                                                    color: Colors.black,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            SizedBox(
                                              height: 5,
                                            ),
                                            Row(
                                              children: [
                                                Container(
                                                  decoration: BoxDecoration(
                                                    image: DecorationImage(
                                                        image: AssetImage(
                                                          'assets/tivk.png',
                                                        ),
                                                        fit: BoxFit.cover),
                                                    borderRadius:
                                                        BorderRadius.only(
                                                            topRight: Radius
                                                                .circular(20),
                                                            bottomRight:
                                                                Radius.circular(
                                                                    20)),
                                                  ),
                                                  height: 30,
                                                  width: 30,
                                                ),
                                                SizedBox(
                                                  width: 10,
                                                ),
                                                Text(
                                                  'Long-term sustainable diets',
                                                  style:
                                                      poppinstMedium.copyWith(
                                                    fontSize: 14,
                                                    height: 1.2,
                                                    color: Colors.black,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            SizedBox(
                                              height: 5,
                                            ),
                                            Row(
                                              children: [
                                                Container(
                                                  decoration: BoxDecoration(
                                                    image: DecorationImage(
                                                        image: AssetImage(
                                                          'assets/tivk.png',
                                                        ),
                                                        fit: BoxFit.cover),
                                                    borderRadius:
                                                        BorderRadius.only(
                                                            topRight: Radius
                                                                .circular(20),
                                                            bottomRight:
                                                                Radius.circular(
                                                                    20)),
                                                  ),
                                                  height: 30,
                                                  width: 30,
                                                ),
                                                SizedBox(
                                                  width: 10,
                                                ),
                                                Text(
                                                  'Learn portion control. No\nneed for kitchen scale.',
                                                  style:
                                                      poppinstMedium.copyWith(
                                                    fontSize: 14,
                                                    height: 1.2,
                                                    color: Colors.black,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      Row(
                                        children: [
                                          Container(
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.only(
                                                  topRight: Radius.circular(20),
                                                  bottomRight:
                                                      Radius.circular(20)),
                                              color: ColorResources.bukdeudfji,
                                            ),
                                            height: 40,
                                            width: 250,
                                            child: Center(
                                              child: Text(
                                                'What You Get',
                                                style: poppinstMedium.copyWith(
                                                  fontSize: 15,
                                                  height: 1.2,
                                                  color: Colors.black,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            left: 20, bottom: 30),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              children: [
                                                Container(
                                                  decoration: BoxDecoration(
                                                    image: DecorationImage(
                                                        image: AssetImage(
                                                          'assets/tivk.png',
                                                        ),
                                                        fit: BoxFit.cover),
                                                    borderRadius:
                                                        BorderRadius.only(
                                                            topRight: Radius
                                                                .circular(20),
                                                            bottomRight:
                                                                Radius.circular(
                                                                    20)),
                                                  ),
                                                  height: 30,
                                                  width: 30,
                                                ),
                                                SizedBox(
                                                  width: 10,
                                                ),
                                                Text(
                                                  'No. 1 healthiest weight loss program',
                                                  style:
                                                      poppinstMedium.copyWith(
                                                    fontSize: 15,
                                                    height: 1.2,
                                                    color: Colors.black,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            SizedBox(
                                              height: 5,
                                            ),
                                            Row(
                                              children: [
                                                Container(
                                                  decoration: BoxDecoration(
                                                    image: DecorationImage(
                                                        image: AssetImage(
                                                          'assets/tivk.png',
                                                        ),
                                                        fit: BoxFit.cover),
                                                    borderRadius:
                                                        BorderRadius.only(
                                                            topRight: Radius
                                                                .circular(20),
                                                            bottomRight:
                                                                Radius.circular(
                                                                    20)),
                                                  ),
                                                  height: 30,
                                                  width: 30,
                                                ),
                                                SizedBox(
                                                  width: 10,
                                                ),
                                                Text(
                                                  '99.9% success rate',
                                                  style:
                                                      poppinstMedium.copyWith(
                                                    fontSize: 15,
                                                    height: 1.2,
                                                    color: Colors.black,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            SizedBox(
                                              height: 5,
                                            ),
                                            Row(
                                              children: [
                                                Container(
                                                  decoration: BoxDecoration(
                                                    image: DecorationImage(
                                                        image: AssetImage(
                                                          'assets/tivk.png',
                                                        ),
                                                        fit: BoxFit.cover),
                                                    borderRadius:
                                                        BorderRadius.only(
                                                            topRight: Radius
                                                                .circular(20),
                                                            bottomRight:
                                                                Radius.circular(
                                                                    20)),
                                                  ),
                                                  height: 30,
                                                  width: 30,
                                                ),
                                                SizedBox(
                                                  width: 10,
                                                ),
                                                Text(
                                                  'Your commitment is essential',
                                                  style:
                                                      poppinstMedium.copyWith(
                                                    fontSize: 14,
                                                    height: 1.2,
                                                    color: Colors.black,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            SizedBox(
                                              height: 5,
                                            ),
                                            Row(
                                              children: [
                                                Container(
                                                  decoration: BoxDecoration(
                                                    image: DecorationImage(
                                                        image: AssetImage(
                                                          'assets/tivk.png',
                                                        ),
                                                        fit: BoxFit.cover),
                                                    borderRadius:
                                                        BorderRadius.only(
                                                            topRight: Radius
                                                                .circular(20),
                                                            bottomRight:
                                                                Radius.circular(
                                                                    20)),
                                                  ),
                                                  height: 30,
                                                  width: 30,
                                                ),
                                                SizedBox(
                                                  width: 10,
                                                ),
                                                Text(
                                                  'Consult with Dt. Ektta Jain directly\n(in person or on-phone)',
                                                  style:
                                                      poppinstMedium.copyWith(
                                                    fontSize: 14,
                                                    height: 1.2,
                                                    color: Colors.black,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            SizedBox(
                                              height: 5,
                                            ),
                                            Row(
                                              children: [
                                                Container(
                                                  decoration: BoxDecoration(
                                                    image: DecorationImage(
                                                        image: AssetImage(
                                                          'assets/tivk.png',
                                                        ),
                                                        fit: BoxFit.cover),
                                                    borderRadius:
                                                        BorderRadius.only(
                                                            topRight: Radius
                                                                .circular(20),
                                                            bottomRight:
                                                                Radius.circular(
                                                                    20)),
                                                  ),
                                                  height: 30,
                                                  width: 30,
                                                ),
                                                SizedBox(
                                                  width: 10,
                                                ),
                                                Text(
                                                  'Safe and permanent weight loss',
                                                  style:
                                                      poppinstMedium.copyWith(
                                                    fontSize: 14,
                                                    height: 1.2,
                                                    color: Colors.black,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                      GestureDetector(
                                        onTap: () async {
                                          await launchUrl(Uri.parse(
                                              "mailto:info.godiets@gmail.com?subject=Maintenance&body=Hello"));
                                        },
                                        child: Container(
                                          margin: EdgeInsets.only(
                                              left: 30, right: 30),
                                          height: 40,
                                          width:
                                              MediaQuery.of(context).size.width,
                                          alignment: Alignment.center,
                                          decoration: BoxDecoration(
                                              color: ColorResources
                                                  .verifyScreenButton,
                                              borderRadius:
                                                  BorderRadius.circular(5)),
                                          child: Text(
                                            "Book an Appointment",
                                            style: poppinsRegular.copyWith(
                                              color: Colors.white,
                                              fontSize: 16,
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 100,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )),
                      ],
                    ),
                  ),
                ),
              ),
            ]),
          if (widget.packagename == 'Kids Nourish')
            Stack(children: [
              Container(
                height: MediaQuery.of(context).size.height,
              ),
              Positioned(
                top: 0,
                left: 0,
                right: 0,
                child: Container(
                  color: ColorResources.buttonYellow,
                  height: 300,
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
                                  "${widget.packagename} Package",
                                  textAlign: TextAlign.center,
                                  style: poppinsSemiBold.copyWith(
                                    fontSize: 19,
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
                      Padding(
                        padding:
                            const EdgeInsets.only(left: 20, right: 20, top: 10),
                        child: Text(
                          "Kids Nourish And Management Of Lifestyle Diseases With Nutrition.",
                          textAlign: TextAlign.center,
                          style: poppinsRegular.copyWith(
                            fontSize: 15,
                            height: 1.2,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                top: 170,
                left: 0,
                right: 0,
                child: Padding(
                  padding: EdgeInsets.only(left: 0, right: 10),
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        color: Colors.transparent),
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
                                padding: EdgeInsets.only(left: 20, right: 20),
                                child: Container(
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                          image: NetworkImage(
                                            'https://godiets.in/wp-content/uploads/2020/06/zzzzzzzzz.png',
                                          ),
                                          fit: BoxFit.fill),
                                      borderRadius: BorderRadius.circular(25),
                                      color: Colors.white),
                                  height: 250,
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Row(
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.only(
                                          topRight: Radius.circular(20),
                                          bottomRight: Radius.circular(20)),
                                      color: ColorResources.bukdeudfji,
                                    ),
                                    height: 40,
                                    width: 250,
                                    child: Center(
                                      child: Text(
                                        'Ideal For Weight Gain In',
                                        style: poppinstMedium.copyWith(
                                          fontSize: 15,
                                          height: 1.2,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 20),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Container(
                                          decoration: BoxDecoration(
                                            image: DecorationImage(
                                                image: AssetImage(
                                                  'assets/tivk.png',
                                                ),
                                                fit: BoxFit.cover),
                                            borderRadius: BorderRadius.only(
                                                topRight: Radius.circular(20),
                                                bottomRight:
                                                    Radius.circular(20)),
                                          ),
                                          height: 30,
                                          width: 30,
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Text(
                                          'TODDLERS',
                                          style: poppinstMedium.copyWith(
                                            fontSize: 15,
                                            height: 1.2,
                                            color: Colors.black,
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Row(
                                      children: [
                                        Container(
                                          decoration: BoxDecoration(
                                            image: DecorationImage(
                                                image: AssetImage(
                                                  'assets/tivk.png',
                                                ),
                                                fit: BoxFit.cover),
                                            borderRadius: BorderRadius.only(
                                                topRight: Radius.circular(20),
                                                bottomRight:
                                                    Radius.circular(20)),
                                          ),
                                          height: 30,
                                          width: 30,
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Text(
                                          'STUDENTS',
                                          style: poppinstMedium.copyWith(
                                            fontSize: 15,
                                            height: 1.2,
                                            color: Colors.black,
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Row(
                                      children: [
                                        Container(
                                          decoration: BoxDecoration(
                                            image: DecorationImage(
                                                image: AssetImage(
                                                  'assets/tivk.png',
                                                ),
                                                fit: BoxFit.cover),
                                            borderRadius: BorderRadius.only(
                                                topRight: Radius.circular(20),
                                                bottomRight:
                                                    Radius.circular(20)),
                                          ),
                                          height: 30,
                                          width: 30,
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Text(
                                          'PICKY/FUSSY EATERS',
                                          style: poppinstMedium.copyWith(
                                            fontSize: 15,
                                            height: 1.2,
                                            color: Colors.black,
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Row(
                                      children: [
                                        Container(
                                          decoration: BoxDecoration(
                                            image: DecorationImage(
                                                image: AssetImage(
                                                  'assets/tivk.png',
                                                ),
                                                fit: BoxFit.cover),
                                            borderRadius: BorderRadius.only(
                                                topRight: Radius.circular(20),
                                                bottomRight:
                                                    Radius.circular(20)),
                                          ),
                                          height: 30,
                                          width: 30,
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Text(
                                          'MALNOURISHED',
                                          style: poppinstMedium.copyWith(
                                            fontSize: 15,
                                            height: 1.2,
                                            color: Colors.black,
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Container(
                                //height: 400,
                                width: MediaQuery.of(context).size.width,
                                color: Color.fromARGB(255, 251, 248, 228),
                                child: Padding(
                                  padding: const EdgeInsets.all(0.0),
                                  child: Column(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(10.0),
                                        child: Row(
                                          children: [
                                            Text(
                                              'Vision & Mission',
                                              style: poppinsSemiBold.copyWith(
                                                  fontSize: 17,
                                                  color: Colors.green),
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        height: 0,
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 10),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Container(
                                              height: 5,
                                              width: 70,
                                              decoration: BoxDecoration(
                                                  color: Colors.green),
                                            ),
                                            Container(
                                              height: 1,
                                              width: 70,
                                              decoration: BoxDecoration(
                                                  color: Colors.grey),
                                            )
                                          ],
                                        ),
                                      ),
                                      Container(
                                        child: Padding(
                                          padding: const EdgeInsets.all(10.0),
                                          child: Text(
                                            'If you are a parent, you are familiar with the struggle of making your fussy child gulp down a glass of milk loaded with taste enhancers; sneak in healthy vegetables in dishes and push them to eat fruits; blackmail them into eating another serving of rice or an added chapati\n\n.The struggle doesn’t end there. You have to ensure they have enough water in a day to keep their bowel movements strong. With so much on the plate (literally!) it’s possible for mothers to miss out on a lot of healthy ingredients that should ideally be a part of their kids’ diet. Here we decode your little one’s dietary needs.',
                                            style: poppinsRegular.copyWith(
                                                fontSize: 14,
                                                color: Colors.black87),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      Row(
                                        children: [
                                          Container(
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.only(
                                                  topRight: Radius.circular(20),
                                                  bottomRight:
                                                      Radius.circular(20)),
                                              color: Colors.green.shade100,
                                            ),
                                            height: 40,
                                            width: 250,
                                            child: Center(
                                              child: Text(
                                                'Program Features',
                                                style: poppinstMedium.copyWith(
                                                  fontSize: 15,
                                                  height: 1.2,
                                                  color: Colors.black,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 20),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              children: [
                                                Container(
                                                  decoration: BoxDecoration(
                                                    image: DecorationImage(
                                                        image: AssetImage(
                                                          'assets/tivk.png',
                                                        ),
                                                        fit: BoxFit.cover),
                                                    borderRadius:
                                                        BorderRadius.only(
                                                            topRight: Radius
                                                                .circular(20),
                                                            bottomRight:
                                                                Radius.circular(
                                                                    20)),
                                                  ),
                                                  height: 30,
                                                  width: 30,
                                                ),
                                                SizedBox(
                                                  width: 10,
                                                ),
                                                Text(
                                                  'No. 1 healthiest weight loss program',
                                                  style:
                                                      poppinstMedium.copyWith(
                                                    fontSize: 15,
                                                    height: 1.2,
                                                    color: Colors.black,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            SizedBox(
                                              height: 5,
                                            ),
                                            Row(
                                              children: [
                                                Container(
                                                  decoration: BoxDecoration(
                                                    image: DecorationImage(
                                                        image: AssetImage(
                                                          'assets/tivk.png',
                                                        ),
                                                        fit: BoxFit.cover),
                                                    borderRadius:
                                                        BorderRadius.only(
                                                            topRight: Radius
                                                                .circular(20),
                                                            bottomRight:
                                                                Radius.circular(
                                                                    20)),
                                                  ),
                                                  height: 30,
                                                  width: 30,
                                                ),
                                                SizedBox(
                                                  width: 10,
                                                ),
                                                Text(
                                                  '99.9% success rate',
                                                  style:
                                                      poppinstMedium.copyWith(
                                                    fontSize: 15,
                                                    height: 1.2,
                                                    color: Colors.black,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            SizedBox(
                                              height: 5,
                                            ),
                                            Row(
                                              children: [
                                                Container(
                                                  decoration: BoxDecoration(
                                                    image: DecorationImage(
                                                        image: AssetImage(
                                                          'assets/tivk.png',
                                                        ),
                                                        fit: BoxFit.cover),
                                                    borderRadius:
                                                        BorderRadius.only(
                                                            topRight: Radius
                                                                .circular(20),
                                                            bottomRight:
                                                                Radius.circular(
                                                                    20)),
                                                  ),
                                                  height: 30,
                                                  width: 30,
                                                ),
                                                SizedBox(
                                                  width: 10,
                                                ),
                                                Text(
                                                  'Your commitment is essential',
                                                  style:
                                                      poppinstMedium.copyWith(
                                                    fontSize: 15,
                                                    height: 1.2,
                                                    color: Colors.black,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            SizedBox(
                                              height: 5,
                                            ),
                                            Row(
                                              children: [
                                                Container(
                                                  decoration: BoxDecoration(
                                                    image: DecorationImage(
                                                        image: AssetImage(
                                                          'assets/tivk.png',
                                                        ),
                                                        fit: BoxFit.cover),
                                                    borderRadius:
                                                        BorderRadius.only(
                                                            topRight: Radius
                                                                .circular(20),
                                                            bottomRight:
                                                                Radius.circular(
                                                                    20)),
                                                  ),
                                                  height: 30,
                                                  width: 30,
                                                ),
                                                SizedBox(
                                                  width: 10,
                                                ),
                                                Text(
                                                  'Consult with Dt. Ektta Jain\ndirectly (in person or on-phone)',
                                                  style:
                                                      poppinstMedium.copyWith(
                                                    fontSize: 15,
                                                    height: 1.2,
                                                    color: Colors.black,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            SizedBox(
                                              height: 5,
                                            ),
                                            Row(
                                              children: [
                                                Container(
                                                  decoration: BoxDecoration(
                                                    image: DecorationImage(
                                                        image: AssetImage(
                                                          'assets/tivk.png',
                                                        ),
                                                        fit: BoxFit.cover),
                                                    borderRadius:
                                                        BorderRadius.only(
                                                            topRight: Radius
                                                                .circular(20),
                                                            bottomRight:
                                                                Radius.circular(
                                                                    20)),
                                                  ),
                                                  height: 30,
                                                  width: 30,
                                                ),
                                                SizedBox(
                                                  width: 10,
                                                ),
                                                Text(
                                                  'Safe and permanent weight loss',
                                                  style:
                                                      poppinstMedium.copyWith(
                                                    fontSize: 15,
                                                    height: 1.2,
                                                    color: Colors.black,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            SizedBox(
                                              height: 5,
                                            ),
                                            Row(
                                              children: [
                                                Container(
                                                  decoration: BoxDecoration(
                                                    image: DecorationImage(
                                                        image: AssetImage(
                                                          'assets/tivk.png',
                                                        ),
                                                        fit: BoxFit.cover),
                                                    borderRadius:
                                                        BorderRadius.only(
                                                            topRight: Radius
                                                                .circular(20),
                                                            bottomRight:
                                                                Radius.circular(
                                                                    20)),
                                                  ),
                                                  height: 30,
                                                  width: 30,
                                                ),
                                                SizedBox(
                                                  width: 10,
                                                ),
                                                Text(
                                                  'Weekly calls/visits. Excellent any-time support.',
                                                  style:
                                                      poppinstMedium.copyWith(
                                                    fontSize: 14,
                                                    height: 1.2,
                                                    color: Colors.black,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      Row(
                                        children: [
                                          Container(
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.only(
                                                  topRight: Radius.circular(20),
                                                  bottomRight:
                                                      Radius.circular(20)),
                                              color: Colors.white70,
                                            ),
                                            height: 40,
                                            width: 250,
                                            child: Center(
                                              child: Text(
                                                'Diet Style',
                                                style: poppinstMedium.copyWith(
                                                  fontSize: 15,
                                                  height: 1.2,
                                                  color: Colors.black,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 20),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              children: [
                                                Container(
                                                  decoration: BoxDecoration(
                                                    image: DecorationImage(
                                                        image: AssetImage(
                                                          'assets/tivk.png',
                                                        ),
                                                        fit: BoxFit.cover),
                                                    borderRadius:
                                                        BorderRadius.only(
                                                            topRight: Radius
                                                                .circular(20),
                                                            bottomRight:
                                                                Radius.circular(
                                                                    20)),
                                                  ),
                                                  height: 30,
                                                  width: 30,
                                                ),
                                                SizedBox(
                                                  width: 10,
                                                ),
                                                Text(
                                                  '100% customized diet plans; no\npre-defined or fixed diets',
                                                  style:
                                                      poppinstMedium.copyWith(
                                                    fontSize: 15,
                                                    height: 1.2,
                                                    color: Colors.black,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            SizedBox(
                                              height: 5,
                                            ),
                                            Row(
                                              children: [
                                                Container(
                                                  decoration: BoxDecoration(
                                                    image: DecorationImage(
                                                        image: AssetImage(
                                                          'assets/tivk.png',
                                                        ),
                                                        fit: BoxFit.cover),
                                                    borderRadius:
                                                        BorderRadius.only(
                                                            topRight: Radius
                                                                .circular(20),
                                                            bottomRight:
                                                                Radius.circular(
                                                                    20)),
                                                  ),
                                                  height: 30,
                                                  width: 30,
                                                ),
                                                SizedBox(
                                                  width: 10,
                                                ),
                                                Text(
                                                  'Homely and traditional food; \nno crash dieting',
                                                  style:
                                                      poppinstMedium.copyWith(
                                                    fontSize: 15,
                                                    height: 1.2,
                                                    color: Colors.black,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            SizedBox(
                                              height: 5,
                                            ),
                                            Row(
                                              children: [
                                                Container(
                                                  decoration: BoxDecoration(
                                                    image: DecorationImage(
                                                        image: AssetImage(
                                                          'assets/tivk.png',
                                                        ),
                                                        fit: BoxFit.cover),
                                                    borderRadius:
                                                        BorderRadius.only(
                                                            topRight: Radius
                                                                .circular(20),
                                                            bottomRight:
                                                                Radius.circular(
                                                                    20)),
                                                  ),
                                                  height: 30,
                                                  width: 30,
                                                ),
                                                SizedBox(
                                                  width: 10,
                                                ),
                                                Text(
                                                  'Only real food; no pills or supplements',
                                                  style:
                                                      poppinstMedium.copyWith(
                                                    fontSize: 14,
                                                    height: 1.2,
                                                    color: Colors.black,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            SizedBox(
                                              height: 5,
                                            ),
                                            Row(
                                              children: [
                                                Container(
                                                  decoration: BoxDecoration(
                                                    image: DecorationImage(
                                                        image: AssetImage(
                                                          'assets/tivk.png',
                                                        ),
                                                        fit: BoxFit.cover),
                                                    borderRadius:
                                                        BorderRadius.only(
                                                            topRight: Radius
                                                                .circular(20),
                                                            bottomRight:
                                                                Radius.circular(
                                                                    20)),
                                                  ),
                                                  height: 30,
                                                  width: 30,
                                                ),
                                                SizedBox(
                                                  width: 10,
                                                ),
                                                Text(
                                                  'Long-term sustainable diets',
                                                  style:
                                                      poppinstMedium.copyWith(
                                                    fontSize: 14,
                                                    height: 1.2,
                                                    color: Colors.black,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            SizedBox(
                                              height: 5,
                                            ),
                                            Row(
                                              children: [
                                                Container(
                                                  decoration: BoxDecoration(
                                                    image: DecorationImage(
                                                        image: AssetImage(
                                                          'assets/tivk.png',
                                                        ),
                                                        fit: BoxFit.cover),
                                                    borderRadius:
                                                        BorderRadius.only(
                                                            topRight: Radius
                                                                .circular(20),
                                                            bottomRight:
                                                                Radius.circular(
                                                                    20)),
                                                  ),
                                                  height: 30,
                                                  width: 30,
                                                ),
                                                SizedBox(
                                                  width: 10,
                                                ),
                                                Text(
                                                  'Learn portion control. No\nneed for kitchen scale.',
                                                  style:
                                                      poppinstMedium.copyWith(
                                                    fontSize: 14,
                                                    height: 1.2,
                                                    color: Colors.black,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      Row(
                                        children: [
                                          Container(
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.only(
                                                  topRight: Radius.circular(20),
                                                  bottomRight:
                                                      Radius.circular(20)),
                                              color: ColorResources.bukdeudfji,
                                            ),
                                            height: 40,
                                            width: 250,
                                            child: Center(
                                              child: Text(
                                                'What You Get',
                                                style: poppinstMedium.copyWith(
                                                  fontSize: 15,
                                                  height: 1.2,
                                                  color: Colors.black,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            left: 20, bottom: 30),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              children: [
                                                Container(
                                                  decoration: BoxDecoration(
                                                    image: DecorationImage(
                                                        image: AssetImage(
                                                          'assets/tivk.png',
                                                        ),
                                                        fit: BoxFit.cover),
                                                    borderRadius:
                                                        BorderRadius.only(
                                                            topRight: Radius
                                                                .circular(20),
                                                            bottomRight:
                                                                Radius.circular(
                                                                    20)),
                                                  ),
                                                  height: 30,
                                                  width: 30,
                                                ),
                                                SizedBox(
                                                  width: 10,
                                                ),
                                                Text(
                                                  'No. 1 healthiest weight loss program',
                                                  style:
                                                      poppinstMedium.copyWith(
                                                    fontSize: 15,
                                                    height: 1.2,
                                                    color: Colors.black,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            SizedBox(
                                              height: 5,
                                            ),
                                            Row(
                                              children: [
                                                Container(
                                                  decoration: BoxDecoration(
                                                    image: DecorationImage(
                                                        image: AssetImage(
                                                          'assets/tivk.png',
                                                        ),
                                                        fit: BoxFit.cover),
                                                    borderRadius:
                                                        BorderRadius.only(
                                                            topRight: Radius
                                                                .circular(20),
                                                            bottomRight:
                                                                Radius.circular(
                                                                    20)),
                                                  ),
                                                  height: 30,
                                                  width: 30,
                                                ),
                                                SizedBox(
                                                  width: 10,
                                                ),
                                                Text(
                                                  '99.9% success rate',
                                                  style:
                                                      poppinstMedium.copyWith(
                                                    fontSize: 15,
                                                    height: 1.2,
                                                    color: Colors.black,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            SizedBox(
                                              height: 5,
                                            ),
                                            Row(
                                              children: [
                                                Container(
                                                  decoration: BoxDecoration(
                                                    image: DecorationImage(
                                                        image: AssetImage(
                                                          'assets/tivk.png',
                                                        ),
                                                        fit: BoxFit.cover),
                                                    borderRadius:
                                                        BorderRadius.only(
                                                            topRight: Radius
                                                                .circular(20),
                                                            bottomRight:
                                                                Radius.circular(
                                                                    20)),
                                                  ),
                                                  height: 30,
                                                  width: 30,
                                                ),
                                                SizedBox(
                                                  width: 10,
                                                ),
                                                Text(
                                                  'Your commitment is essential',
                                                  style:
                                                      poppinstMedium.copyWith(
                                                    fontSize: 14,
                                                    height: 1.2,
                                                    color: Colors.black,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            SizedBox(
                                              height: 5,
                                            ),
                                            Row(
                                              children: [
                                                Container(
                                                  decoration: BoxDecoration(
                                                    image: DecorationImage(
                                                        image: AssetImage(
                                                          'assets/tivk.png',
                                                        ),
                                                        fit: BoxFit.cover),
                                                    borderRadius:
                                                        BorderRadius.only(
                                                            topRight: Radius
                                                                .circular(20),
                                                            bottomRight:
                                                                Radius.circular(
                                                                    20)),
                                                  ),
                                                  height: 30,
                                                  width: 30,
                                                ),
                                                SizedBox(
                                                  width: 10,
                                                ),
                                                Text(
                                                  'Consult with Dt. Ektta Jain directly\n(in person or on-phone)',
                                                  style:
                                                      poppinstMedium.copyWith(
                                                    fontSize: 14,
                                                    height: 1.2,
                                                    color: Colors.black,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            SizedBox(
                                              height: 5,
                                            ),
                                            Row(
                                              children: [
                                                Container(
                                                  decoration: BoxDecoration(
                                                    image: DecorationImage(
                                                        image: AssetImage(
                                                          'assets/tivk.png',
                                                        ),
                                                        fit: BoxFit.cover),
                                                    borderRadius:
                                                        BorderRadius.only(
                                                            topRight: Radius
                                                                .circular(20),
                                                            bottomRight:
                                                                Radius.circular(
                                                                    20)),
                                                  ),
                                                  height: 30,
                                                  width: 30,
                                                ),
                                                SizedBox(
                                                  width: 10,
                                                ),
                                                Text(
                                                  'Safe and permanent weight loss',
                                                  style:
                                                      poppinstMedium.copyWith(
                                                    fontSize: 14,
                                                    height: 1.2,
                                                    color: Colors.black,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                      GestureDetector(
                                        onTap: () async {
                                          await launchUrl(Uri.parse(
                                              "mailto:info.godiets@gmail.com?subject=Kids Nourish&body=Hello"));
                                        },
                                        child: Container(
                                          margin: EdgeInsets.only(
                                              left: 30, right: 30),
                                          height: 40,
                                          width:
                                              MediaQuery.of(context).size.width,
                                          alignment: Alignment.center,
                                          decoration: BoxDecoration(
                                              color: ColorResources
                                                  .verifyScreenButton,
                                              borderRadius:
                                                  BorderRadius.circular(5)),
                                          child: Text(
                                            "Book an Appointment",
                                            style: poppinsRegular.copyWith(
                                              color: Colors.white,
                                              fontSize: 16,
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 100,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )),
                      ],
                    ),
                  ),
                ),
              ),
            ]),
          if (widget.packagename == 'Skin / Hair Care')
            Stack(children: [
              Container(
                height: MediaQuery.of(context).size.height,
              ),
              Positioned(
                top: 0,
                left: 0,
                right: 0,
                child: Container(
                  color: ColorResources.buttonYellow,
                  height: 300,
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
                                  "${widget.packagename} Package",
                                  textAlign: TextAlign.center,
                                  style: poppinsSemiBold.copyWith(
                                    fontSize: 19,
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
                      Padding(
                        padding:
                            const EdgeInsets.only(left: 20, right: 20, top: 10),
                        child: Text(
                          "Skin And Management Of Lifestyle Diseases With Nutrition.",
                          textAlign: TextAlign.center,
                          style: poppinsRegular.copyWith(
                            fontSize: 15,
                            height: 1.2,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                top: 170,
                left: 0,
                right: 0,
                child: Padding(
                  padding: EdgeInsets.only(left: 0, right: 10),
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        color: Colors.transparent),
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
                                padding: EdgeInsets.only(left: 20, right: 20),
                                child: Container(
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                          image: NetworkImage(
                                            'https://godiets.in/wp-content/uploads/2020/06/xxxxxxxx.png',
                                          ),
                                          fit: BoxFit.fill),
                                      borderRadius: BorderRadius.circular(25),
                                      color: Colors.white),
                                  height: 250,
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Row(
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.only(
                                          topRight: Radius.circular(20),
                                          bottomRight: Radius.circular(20)),
                                      color: ColorResources.bukdeudfji,
                                    ),
                                    height: 40,
                                    width: 250,
                                    child: Center(
                                      child: Text(
                                        'Ideal For Weight Gain In',
                                        style: poppinstMedium.copyWith(
                                          fontSize: 15,
                                          height: 1.2,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 20),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Container(
                                          decoration: BoxDecoration(
                                            image: DecorationImage(
                                                image: AssetImage(
                                                  'assets/tivk.png',
                                                ),
                                                fit: BoxFit.cover),
                                            borderRadius: BorderRadius.only(
                                                topRight: Radius.circular(20),
                                                bottomRight:
                                                    Radius.circular(20)),
                                          ),
                                          height: 30,
                                          width: 30,
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Text(
                                          'DRY/DULL SKIN',
                                          style: poppinstMedium.copyWith(
                                            fontSize: 15,
                                            height: 1.2,
                                            color: Colors.black,
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Row(
                                      children: [
                                        Container(
                                          decoration: BoxDecoration(
                                            image: DecorationImage(
                                                image: AssetImage(
                                                  'assets/tivk.png',
                                                ),
                                                fit: BoxFit.cover),
                                            borderRadius: BorderRadius.only(
                                                topRight: Radius.circular(20),
                                                bottomRight:
                                                    Radius.circular(20)),
                                          ),
                                          height: 30,
                                          width: 30,
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Text(
                                          'HAIR FALL',
                                          style: poppinstMedium.copyWith(
                                            fontSize: 15,
                                            height: 1.2,
                                            color: Colors.black,
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Row(
                                      children: [
                                        Container(
                                          decoration: BoxDecoration(
                                            image: DecorationImage(
                                                image: AssetImage(
                                                  'assets/tivk.png',
                                                ),
                                                fit: BoxFit.cover),
                                            borderRadius: BorderRadius.only(
                                                topRight: Radius.circular(20),
                                                bottomRight:
                                                    Radius.circular(20)),
                                          ),
                                          height: 30,
                                          width: 30,
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Text(
                                          'ACNE/PIGMENTATION',
                                          style: poppinstMedium.copyWith(
                                            fontSize: 15,
                                            height: 1.2,
                                            color: Colors.black,
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Container(
                                //height: 400,
                                width: MediaQuery.of(context).size.width,
                                color: Color.fromARGB(255, 251, 248, 228),
                                child: Padding(
                                  padding: const EdgeInsets.all(0.0),
                                  child: Column(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(10.0),
                                        child: Row(
                                          children: [
                                            Text(
                                              'Vision & Mission',
                                              style: poppinsSemiBold.copyWith(
                                                  fontSize: 17,
                                                  color: Colors.green),
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        height: 0,
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 10),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Container(
                                              height: 5,
                                              width: 70,
                                              decoration: BoxDecoration(
                                                  color: Colors.green),
                                            ),
                                            Container(
                                              height: 1,
                                              width: 70,
                                              decoration: BoxDecoration(
                                                  color: Colors.grey),
                                            )
                                          ],
                                        ),
                                      ),
                                      Container(
                                        child: Padding(
                                          padding: const EdgeInsets.all(10.0),
                                          child: Text(
                                            'You probably think about how nutrition affects your internal health and your weight, but eating the right foods can also improve the quality of your skin and hair.\n\nThe skin is the largest organ. And it can also be your biggest problem! Pollution, sun, stress, hormones, and unhealthy food can make your skin dull and prone to acne and pigmentation. And you end up spending a ton of money on skin care and makeup products without any sustainable results. This is precisely why you need to be on a skin-friendly diet and consume fruits, veggies, and healthy fats.\n\nWe give you the best diet plan for glowing skin and a list of foods to eat and avoid. You also get skin and hair special recipes and home-made face packs. Incorporate it into your lifestyle to get a healthy and natural glow that will outdo any makeup artist’s smart hacks.',
                                            style: poppinsRegular.copyWith(
                                                fontSize: 14,
                                                color: Colors.black87),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      Row(
                                        children: [
                                          Container(
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.only(
                                                  topRight: Radius.circular(20),
                                                  bottomRight:
                                                      Radius.circular(20)),
                                              color: Colors.green.shade100,
                                            ),
                                            height: 40,
                                            width: 250,
                                            child: Center(
                                              child: Text(
                                                'Program Features',
                                                style: poppinstMedium.copyWith(
                                                  fontSize: 15,
                                                  height: 1.2,
                                                  color: Colors.black,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 20),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              children: [
                                                Container(
                                                  decoration: BoxDecoration(
                                                    image: DecorationImage(
                                                        image: AssetImage(
                                                          'assets/tivk.png',
                                                        ),
                                                        fit: BoxFit.cover),
                                                    borderRadius:
                                                        BorderRadius.only(
                                                            topRight: Radius
                                                                .circular(20),
                                                            bottomRight:
                                                                Radius.circular(
                                                                    20)),
                                                  ),
                                                  height: 30,
                                                  width: 30,
                                                ),
                                                SizedBox(
                                                  width: 10,
                                                ),
                                                Text(
                                                  'No. 1 healthiest weight loss program',
                                                  style:
                                                      poppinstMedium.copyWith(
                                                    fontSize: 15,
                                                    height: 1.2,
                                                    color: Colors.black,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            SizedBox(
                                              height: 5,
                                            ),
                                            Row(
                                              children: [
                                                Container(
                                                  decoration: BoxDecoration(
                                                    image: DecorationImage(
                                                        image: AssetImage(
                                                          'assets/tivk.png',
                                                        ),
                                                        fit: BoxFit.cover),
                                                    borderRadius:
                                                        BorderRadius.only(
                                                            topRight: Radius
                                                                .circular(20),
                                                            bottomRight:
                                                                Radius.circular(
                                                                    20)),
                                                  ),
                                                  height: 30,
                                                  width: 30,
                                                ),
                                                SizedBox(
                                                  width: 10,
                                                ),
                                                Text(
                                                  '99.9% success rate',
                                                  style:
                                                      poppinstMedium.copyWith(
                                                    fontSize: 15,
                                                    height: 1.2,
                                                    color: Colors.black,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            SizedBox(
                                              height: 5,
                                            ),
                                            Row(
                                              children: [
                                                Container(
                                                  decoration: BoxDecoration(
                                                    image: DecorationImage(
                                                        image: AssetImage(
                                                          'assets/tivk.png',
                                                        ),
                                                        fit: BoxFit.cover),
                                                    borderRadius:
                                                        BorderRadius.only(
                                                            topRight: Radius
                                                                .circular(20),
                                                            bottomRight:
                                                                Radius.circular(
                                                                    20)),
                                                  ),
                                                  height: 30,
                                                  width: 30,
                                                ),
                                                SizedBox(
                                                  width: 10,
                                                ),
                                                Text(
                                                  'Your commitment is essential',
                                                  style:
                                                      poppinstMedium.copyWith(
                                                    fontSize: 15,
                                                    height: 1.2,
                                                    color: Colors.black,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            SizedBox(
                                              height: 5,
                                            ),
                                            Row(
                                              children: [
                                                Container(
                                                  decoration: BoxDecoration(
                                                    image: DecorationImage(
                                                        image: AssetImage(
                                                          'assets/tivk.png',
                                                        ),
                                                        fit: BoxFit.cover),
                                                    borderRadius:
                                                        BorderRadius.only(
                                                            topRight: Radius
                                                                .circular(20),
                                                            bottomRight:
                                                                Radius.circular(
                                                                    20)),
                                                  ),
                                                  height: 30,
                                                  width: 30,
                                                ),
                                                SizedBox(
                                                  width: 10,
                                                ),
                                                Text(
                                                  'Consult with Dt. Ektta Jain\ndirectly (in person or on-phone)',
                                                  style:
                                                      poppinstMedium.copyWith(
                                                    fontSize: 15,
                                                    height: 1.2,
                                                    color: Colors.black,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            SizedBox(
                                              height: 5,
                                            ),
                                            Row(
                                              children: [
                                                Container(
                                                  decoration: BoxDecoration(
                                                    image: DecorationImage(
                                                        image: AssetImage(
                                                          'assets/tivk.png',
                                                        ),
                                                        fit: BoxFit.cover),
                                                    borderRadius:
                                                        BorderRadius.only(
                                                            topRight: Radius
                                                                .circular(20),
                                                            bottomRight:
                                                                Radius.circular(
                                                                    20)),
                                                  ),
                                                  height: 30,
                                                  width: 30,
                                                ),
                                                SizedBox(
                                                  width: 10,
                                                ),
                                                Text(
                                                  'Safe and permanent weight loss',
                                                  style:
                                                      poppinstMedium.copyWith(
                                                    fontSize: 15,
                                                    height: 1.2,
                                                    color: Colors.black,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            SizedBox(
                                              height: 5,
                                            ),
                                            Row(
                                              children: [
                                                Container(
                                                  decoration: BoxDecoration(
                                                    image: DecorationImage(
                                                        image: AssetImage(
                                                          'assets/tivk.png',
                                                        ),
                                                        fit: BoxFit.cover),
                                                    borderRadius:
                                                        BorderRadius.only(
                                                            topRight: Radius
                                                                .circular(20),
                                                            bottomRight:
                                                                Radius.circular(
                                                                    20)),
                                                  ),
                                                  height: 30,
                                                  width: 30,
                                                ),
                                                SizedBox(
                                                  width: 10,
                                                ),
                                                Text(
                                                  'Weekly calls/visits. Excellent any-time support.',
                                                  style:
                                                      poppinstMedium.copyWith(
                                                    fontSize: 14,
                                                    height: 1.2,
                                                    color: Colors.black,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      Row(
                                        children: [
                                          Container(
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.only(
                                                  topRight: Radius.circular(20),
                                                  bottomRight:
                                                      Radius.circular(20)),
                                              color: Colors.white70,
                                            ),
                                            height: 40,
                                            width: 250,
                                            child: Center(
                                              child: Text(
                                                'Diet Style',
                                                style: poppinstMedium.copyWith(
                                                  fontSize: 15,
                                                  height: 1.2,
                                                  color: Colors.black,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 20),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              children: [
                                                Container(
                                                  decoration: BoxDecoration(
                                                    image: DecorationImage(
                                                        image: AssetImage(
                                                          'assets/tivk.png',
                                                        ),
                                                        fit: BoxFit.cover),
                                                    borderRadius:
                                                        BorderRadius.only(
                                                            topRight: Radius
                                                                .circular(20),
                                                            bottomRight:
                                                                Radius.circular(
                                                                    20)),
                                                  ),
                                                  height: 30,
                                                  width: 30,
                                                ),
                                                SizedBox(
                                                  width: 10,
                                                ),
                                                Text(
                                                  '100% customized diet plans; no\npre-defined or fixed diets',
                                                  style:
                                                      poppinstMedium.copyWith(
                                                    fontSize: 15,
                                                    height: 1.2,
                                                    color: Colors.black,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            SizedBox(
                                              height: 5,
                                            ),
                                            Row(
                                              children: [
                                                Container(
                                                  decoration: BoxDecoration(
                                                    image: DecorationImage(
                                                        image: AssetImage(
                                                          'assets/tivk.png',
                                                        ),
                                                        fit: BoxFit.cover),
                                                    borderRadius:
                                                        BorderRadius.only(
                                                            topRight: Radius
                                                                .circular(20),
                                                            bottomRight:
                                                                Radius.circular(
                                                                    20)),
                                                  ),
                                                  height: 30,
                                                  width: 30,
                                                ),
                                                SizedBox(
                                                  width: 10,
                                                ),
                                                Text(
                                                  'Homely and traditional food; \nno crash dieting',
                                                  style:
                                                      poppinstMedium.copyWith(
                                                    fontSize: 15,
                                                    height: 1.2,
                                                    color: Colors.black,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            SizedBox(
                                              height: 5,
                                            ),
                                            Row(
                                              children: [
                                                Container(
                                                  decoration: BoxDecoration(
                                                    image: DecorationImage(
                                                        image: AssetImage(
                                                          'assets/tivk.png',
                                                        ),
                                                        fit: BoxFit.cover),
                                                    borderRadius:
                                                        BorderRadius.only(
                                                            topRight: Radius
                                                                .circular(20),
                                                            bottomRight:
                                                                Radius.circular(
                                                                    20)),
                                                  ),
                                                  height: 30,
                                                  width: 30,
                                                ),
                                                SizedBox(
                                                  width: 10,
                                                ),
                                                Text(
                                                  'Only real food; no pills or supplements',
                                                  style:
                                                      poppinstMedium.copyWith(
                                                    fontSize: 14,
                                                    height: 1.2,
                                                    color: Colors.black,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            SizedBox(
                                              height: 5,
                                            ),
                                            Row(
                                              children: [
                                                Container(
                                                  decoration: BoxDecoration(
                                                    image: DecorationImage(
                                                        image: AssetImage(
                                                          'assets/tivk.png',
                                                        ),
                                                        fit: BoxFit.cover),
                                                    borderRadius:
                                                        BorderRadius.only(
                                                            topRight: Radius
                                                                .circular(20),
                                                            bottomRight:
                                                                Radius.circular(
                                                                    20)),
                                                  ),
                                                  height: 30,
                                                  width: 30,
                                                ),
                                                SizedBox(
                                                  width: 10,
                                                ),
                                                Text(
                                                  'Long-term sustainable diets',
                                                  style:
                                                      poppinstMedium.copyWith(
                                                    fontSize: 14,
                                                    height: 1.2,
                                                    color: Colors.black,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            SizedBox(
                                              height: 5,
                                            ),
                                            Row(
                                              children: [
                                                Container(
                                                  decoration: BoxDecoration(
                                                    image: DecorationImage(
                                                        image: AssetImage(
                                                          'assets/tivk.png',
                                                        ),
                                                        fit: BoxFit.cover),
                                                    borderRadius:
                                                        BorderRadius.only(
                                                            topRight: Radius
                                                                .circular(20),
                                                            bottomRight:
                                                                Radius.circular(
                                                                    20)),
                                                  ),
                                                  height: 30,
                                                  width: 30,
                                                ),
                                                SizedBox(
                                                  width: 10,
                                                ),
                                                Text(
                                                  'Learn portion control. No\nneed for kitchen scale.',
                                                  style:
                                                      poppinstMedium.copyWith(
                                                    fontSize: 14,
                                                    height: 1.2,
                                                    color: Colors.black,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      Row(
                                        children: [
                                          Container(
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.only(
                                                  topRight: Radius.circular(20),
                                                  bottomRight:
                                                      Radius.circular(20)),
                                              color: ColorResources.bukdeudfji,
                                            ),
                                            height: 40,
                                            width: 250,
                                            child: Center(
                                              child: Text(
                                                'What You Get',
                                                style: poppinstMedium.copyWith(
                                                  fontSize: 15,
                                                  height: 1.2,
                                                  color: Colors.black,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            left: 20, bottom: 30),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              children: [
                                                Container(
                                                  decoration: BoxDecoration(
                                                    image: DecorationImage(
                                                        image: AssetImage(
                                                          'assets/tivk.png',
                                                        ),
                                                        fit: BoxFit.cover),
                                                    borderRadius:
                                                        BorderRadius.only(
                                                            topRight: Radius
                                                                .circular(20),
                                                            bottomRight:
                                                                Radius.circular(
                                                                    20)),
                                                  ),
                                                  height: 30,
                                                  width: 30,
                                                ),
                                                SizedBox(
                                                  width: 10,
                                                ),
                                                Text(
                                                  'No. 1 healthiest weight loss program',
                                                  style:
                                                      poppinstMedium.copyWith(
                                                    fontSize: 15,
                                                    height: 1.2,
                                                    color: Colors.black,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            SizedBox(
                                              height: 5,
                                            ),
                                            Row(
                                              children: [
                                                Container(
                                                  decoration: BoxDecoration(
                                                    image: DecorationImage(
                                                        image: AssetImage(
                                                          'assets/tivk.png',
                                                        ),
                                                        fit: BoxFit.cover),
                                                    borderRadius:
                                                        BorderRadius.only(
                                                            topRight: Radius
                                                                .circular(20),
                                                            bottomRight:
                                                                Radius.circular(
                                                                    20)),
                                                  ),
                                                  height: 30,
                                                  width: 30,
                                                ),
                                                SizedBox(
                                                  width: 10,
                                                ),
                                                Text(
                                                  '99.9% success rate',
                                                  style:
                                                      poppinstMedium.copyWith(
                                                    fontSize: 15,
                                                    height: 1.2,
                                                    color: Colors.black,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            SizedBox(
                                              height: 5,
                                            ),
                                            Row(
                                              children: [
                                                Container(
                                                  decoration: BoxDecoration(
                                                    image: DecorationImage(
                                                        image: AssetImage(
                                                          'assets/tivk.png',
                                                        ),
                                                        fit: BoxFit.cover),
                                                    borderRadius:
                                                        BorderRadius.only(
                                                            topRight: Radius
                                                                .circular(20),
                                                            bottomRight:
                                                                Radius.circular(
                                                                    20)),
                                                  ),
                                                  height: 30,
                                                  width: 30,
                                                ),
                                                SizedBox(
                                                  width: 10,
                                                ),
                                                Text(
                                                  'Your commitment is essential',
                                                  style:
                                                      poppinstMedium.copyWith(
                                                    fontSize: 14,
                                                    height: 1.2,
                                                    color: Colors.black,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            SizedBox(
                                              height: 5,
                                            ),
                                            Row(
                                              children: [
                                                Container(
                                                  decoration: BoxDecoration(
                                                    image: DecorationImage(
                                                        image: AssetImage(
                                                          'assets/tivk.png',
                                                        ),
                                                        fit: BoxFit.cover),
                                                    borderRadius:
                                                        BorderRadius.only(
                                                            topRight: Radius
                                                                .circular(20),
                                                            bottomRight:
                                                                Radius.circular(
                                                                    20)),
                                                  ),
                                                  height: 30,
                                                  width: 30,
                                                ),
                                                SizedBox(
                                                  width: 10,
                                                ),
                                                Text(
                                                  'Consult with Dt. Ektta Jain directly\n(in person or on-phone)',
                                                  style:
                                                      poppinstMedium.copyWith(
                                                    fontSize: 14,
                                                    height: 1.2,
                                                    color: Colors.black,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            SizedBox(
                                              height: 5,
                                            ),
                                            Row(
                                              children: [
                                                Container(
                                                  decoration: BoxDecoration(
                                                    image: DecorationImage(
                                                        image: AssetImage(
                                                          'assets/tivk.png',
                                                        ),
                                                        fit: BoxFit.cover),
                                                    borderRadius:
                                                        BorderRadius.only(
                                                            topRight: Radius
                                                                .circular(20),
                                                            bottomRight:
                                                                Radius.circular(
                                                                    20)),
                                                  ),
                                                  height: 30,
                                                  width: 30,
                                                ),
                                                SizedBox(
                                                  width: 10,
                                                ),
                                                Text(
                                                  'Safe and permanent weight loss',
                                                  style:
                                                      poppinstMedium.copyWith(
                                                    fontSize: 14,
                                                    height: 1.2,
                                                    color: Colors.black,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                      GestureDetector(
                                        onTap: () async {
                                          await launchUrl(Uri.parse(
                                              "mailto:info.godiets@gmail.com?subject=Skin / Hair Care&body=Hello"));
                                        },
                                        child: Container(
                                          margin: EdgeInsets.only(
                                              left: 30, right: 30),
                                          height: 40,
                                          width:
                                              MediaQuery.of(context).size.width,
                                          alignment: Alignment.center,
                                          decoration: BoxDecoration(
                                              color: ColorResources
                                                  .verifyScreenButton,
                                              borderRadius:
                                                  BorderRadius.circular(5)),
                                          child: Text(
                                            "Book an Appointment",
                                            style: poppinsRegular.copyWith(
                                              color: Colors.white,
                                              fontSize: 16,
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 100,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )),
                      ],
                    ),
                  ),
                ),
              ),
            ]),
          if (widget.packagename == 'Pregna Care')
            Stack(children: [
              Container(
                height: MediaQuery.of(context).size.height,
              ),
              Positioned(
                top: 0,
                left: 0,
                right: 0,
                child: Container(
                  color: ColorResources.buttonYellow,
                  height: 300,
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
                                  "${widget.packagename} Package",
                                  textAlign: TextAlign.center,
                                  style: poppinsSemiBold.copyWith(
                                    fontSize: 19,
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
                      Padding(
                        padding:
                            const EdgeInsets.only(left: 20, right: 20, top: 10),
                        child: Text(
                          "Pregna Care And Management Of Lifestyle Diseases With Nutrition.",
                          textAlign: TextAlign.center,
                          style: poppinsRegular.copyWith(
                            fontSize: 15,
                            height: 1.2,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                top: 170,
                left: 0,
                right: 0,
                child: Padding(
                  padding: EdgeInsets.only(left: 0, right: 10),
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        color: Colors.transparent),
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
                                padding: EdgeInsets.only(left: 20, right: 20),
                                child: Container(
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                          image: NetworkImage(
                                            'https://godiets.in/wp-content/uploads/2020/06/xxxxxxxxx-2.png',
                                          ),
                                          fit: BoxFit.fill),
                                      borderRadius: BorderRadius.circular(25),
                                      color: Colors.white),
                                  height: 250,
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Row(
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.only(
                                          topRight: Radius.circular(20),
                                          bottomRight: Radius.circular(20)),
                                      color: ColorResources.bukdeudfji,
                                    ),
                                    height: 40,
                                    width: 250,
                                    child: Center(
                                      child: Text(
                                        'Ideal For Pregna Care In',
                                        style: poppinstMedium.copyWith(
                                          fontSize: 15,
                                          height: 1.2,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 20),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Container(
                                          decoration: BoxDecoration(
                                            image: DecorationImage(
                                                image: AssetImage(
                                                  'assets/tivk.png',
                                                ),
                                                fit: BoxFit.cover),
                                            borderRadius: BorderRadius.only(
                                                topRight: Radius.circular(20),
                                                bottomRight:
                                                    Radius.circular(20)),
                                          ),
                                          height: 30,
                                          width: 30,
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Text(
                                          'DRY/DULL SKIN',
                                          style: poppinstMedium.copyWith(
                                            fontSize: 15,
                                            height: 1.2,
                                            color: Colors.black,
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Row(
                                      children: [
                                        Container(
                                          decoration: BoxDecoration(
                                            image: DecorationImage(
                                                image: AssetImage(
                                                  'assets/tivk.png',
                                                ),
                                                fit: BoxFit.cover),
                                            borderRadius: BorderRadius.only(
                                                topRight: Radius.circular(20),
                                                bottomRight:
                                                    Radius.circular(20)),
                                          ),
                                          height: 30,
                                          width: 30,
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Text(
                                          'HAIR FALL',
                                          style: poppinstMedium.copyWith(
                                            fontSize: 15,
                                            height: 1.2,
                                            color: Colors.black,
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Row(
                                      children: [
                                        Container(
                                          decoration: BoxDecoration(
                                            image: DecorationImage(
                                                image: AssetImage(
                                                  'assets/tivk.png',
                                                ),
                                                fit: BoxFit.cover),
                                            borderRadius: BorderRadius.only(
                                                topRight: Radius.circular(20),
                                                bottomRight:
                                                    Radius.circular(20)),
                                          ),
                                          height: 30,
                                          width: 30,
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Text(
                                          'ACNE/PIGMENTATION',
                                          style: poppinstMedium.copyWith(
                                            fontSize: 15,
                                            height: 1.2,
                                            color: Colors.black,
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Container(
                                //height: 400,
                                width: MediaQuery.of(context).size.width,
                                color: Color.fromARGB(255, 251, 248, 228),
                                child: Padding(
                                  padding: const EdgeInsets.all(0.0),
                                  child: Column(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(10.0),
                                        child: Row(
                                          children: [
                                            Text(
                                              'Vision & Mission',
                                              style: poppinsSemiBold.copyWith(
                                                  fontSize: 17,
                                                  color: Colors.green),
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        height: 0,
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 10),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Container(
                                              height: 5,
                                              width: 70,
                                              decoration: BoxDecoration(
                                                  color: Colors.green),
                                            ),
                                            Container(
                                              height: 1,
                                              width: 70,
                                              decoration: BoxDecoration(
                                                  color: Colors.grey),
                                            )
                                          ],
                                        ),
                                      ),
                                      Container(
                                        child: Padding(
                                          padding: const EdgeInsets.all(10.0),
                                          child: Text(
                                            'Are you pregnant and not sure what to eat, when to eat that’s good for you and your baby’s development? And also worried that you will gain too much weight? This diet plan service assists you throughout your pregnancy journey.\n\nOR you’ve already taken bub home and are settling into life as a new mum, you’re probably itching to squeeze back into your favorite pair of skinny jeans. But before you dive back into any type of physical activity or change your diet you need some expert advice. You’re recovering, and you’ll need ample rest and nutrition to regain your energy and, if you’re breastfeeding, keep your breast milk flowing. Instead of going on a crash diet, you should be on a well-balanced breastfeeding diet rich in nutrients for you and your baby.',
                                            style: poppinsRegular.copyWith(
                                                fontSize: 14,
                                                color: Colors.black87),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      Row(
                                        children: [
                                          Container(
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.only(
                                                  topRight: Radius.circular(20),
                                                  bottomRight:
                                                      Radius.circular(20)),
                                              color: Colors.green.shade100,
                                            ),
                                            height: 40,
                                            width: 250,
                                            child: Center(
                                              child: Text(
                                                'Program Features',
                                                style: poppinstMedium.copyWith(
                                                  fontSize: 15,
                                                  height: 1.2,
                                                  color: Colors.black,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 20),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              children: [
                                                Container(
                                                  decoration: BoxDecoration(
                                                    image: DecorationImage(
                                                        image: AssetImage(
                                                          'assets/tivk.png',
                                                        ),
                                                        fit: BoxFit.cover),
                                                    borderRadius:
                                                        BorderRadius.only(
                                                            topRight: Radius
                                                                .circular(20),
                                                            bottomRight:
                                                                Radius.circular(
                                                                    20)),
                                                  ),
                                                  height: 30,
                                                  width: 30,
                                                ),
                                                SizedBox(
                                                  width: 10,
                                                ),
                                                Text(
                                                  'No. 1 healthiest weight loss program',
                                                  style:
                                                      poppinstMedium.copyWith(
                                                    fontSize: 15,
                                                    height: 1.2,
                                                    color: Colors.black,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            SizedBox(
                                              height: 5,
                                            ),
                                            Row(
                                              children: [
                                                Container(
                                                  decoration: BoxDecoration(
                                                    image: DecorationImage(
                                                        image: AssetImage(
                                                          'assets/tivk.png',
                                                        ),
                                                        fit: BoxFit.cover),
                                                    borderRadius:
                                                        BorderRadius.only(
                                                            topRight: Radius
                                                                .circular(20),
                                                            bottomRight:
                                                                Radius.circular(
                                                                    20)),
                                                  ),
                                                  height: 30,
                                                  width: 30,
                                                ),
                                                SizedBox(
                                                  width: 10,
                                                ),
                                                Text(
                                                  '99.9% success rate',
                                                  style:
                                                      poppinstMedium.copyWith(
                                                    fontSize: 15,
                                                    height: 1.2,
                                                    color: Colors.black,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            SizedBox(
                                              height: 5,
                                            ),
                                            Row(
                                              children: [
                                                Container(
                                                  decoration: BoxDecoration(
                                                    image: DecorationImage(
                                                        image: AssetImage(
                                                          'assets/tivk.png',
                                                        ),
                                                        fit: BoxFit.cover),
                                                    borderRadius:
                                                        BorderRadius.only(
                                                            topRight: Radius
                                                                .circular(20),
                                                            bottomRight:
                                                                Radius.circular(
                                                                    20)),
                                                  ),
                                                  height: 30,
                                                  width: 30,
                                                ),
                                                SizedBox(
                                                  width: 10,
                                                ),
                                                Text(
                                                  'Your commitment is essential',
                                                  style:
                                                      poppinstMedium.copyWith(
                                                    fontSize: 15,
                                                    height: 1.2,
                                                    color: Colors.black,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            SizedBox(
                                              height: 5,
                                            ),
                                            Row(
                                              children: [
                                                Container(
                                                  decoration: BoxDecoration(
                                                    image: DecorationImage(
                                                        image: AssetImage(
                                                          'assets/tivk.png',
                                                        ),
                                                        fit: BoxFit.cover),
                                                    borderRadius:
                                                        BorderRadius.only(
                                                            topRight: Radius
                                                                .circular(20),
                                                            bottomRight:
                                                                Radius.circular(
                                                                    20)),
                                                  ),
                                                  height: 30,
                                                  width: 30,
                                                ),
                                                SizedBox(
                                                  width: 10,
                                                ),
                                                Text(
                                                  'Consult with Dt. Ektta Jain\ndirectly (in person or on-phone)',
                                                  style:
                                                      poppinstMedium.copyWith(
                                                    fontSize: 15,
                                                    height: 1.2,
                                                    color: Colors.black,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            SizedBox(
                                              height: 5,
                                            ),
                                            Row(
                                              children: [
                                                Container(
                                                  decoration: BoxDecoration(
                                                    image: DecorationImage(
                                                        image: AssetImage(
                                                          'assets/tivk.png',
                                                        ),
                                                        fit: BoxFit.cover),
                                                    borderRadius:
                                                        BorderRadius.only(
                                                            topRight: Radius
                                                                .circular(20),
                                                            bottomRight:
                                                                Radius.circular(
                                                                    20)),
                                                  ),
                                                  height: 30,
                                                  width: 30,
                                                ),
                                                SizedBox(
                                                  width: 10,
                                                ),
                                                Text(
                                                  'Safe and permanent weight loss',
                                                  style:
                                                      poppinstMedium.copyWith(
                                                    fontSize: 15,
                                                    height: 1.2,
                                                    color: Colors.black,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            SizedBox(
                                              height: 5,
                                            ),
                                            Row(
                                              children: [
                                                Container(
                                                  decoration: BoxDecoration(
                                                    image: DecorationImage(
                                                        image: AssetImage(
                                                          'assets/tivk.png',
                                                        ),
                                                        fit: BoxFit.cover),
                                                    borderRadius:
                                                        BorderRadius.only(
                                                            topRight: Radius
                                                                .circular(20),
                                                            bottomRight:
                                                                Radius.circular(
                                                                    20)),
                                                  ),
                                                  height: 30,
                                                  width: 30,
                                                ),
                                                SizedBox(
                                                  width: 10,
                                                ),
                                                Text(
                                                  'Weekly calls/visits. Excellent any-time support.',
                                                  style:
                                                      poppinstMedium.copyWith(
                                                    fontSize: 14,
                                                    height: 1.2,
                                                    color: Colors.black,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      Row(
                                        children: [
                                          Container(
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.only(
                                                  topRight: Radius.circular(20),
                                                  bottomRight:
                                                      Radius.circular(20)),
                                              color: Colors.white70,
                                            ),
                                            height: 40,
                                            width: 250,
                                            child: Center(
                                              child: Text(
                                                'Diet Style',
                                                style: poppinstMedium.copyWith(
                                                  fontSize: 15,
                                                  height: 1.2,
                                                  color: Colors.black,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 20),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              children: [
                                                Container(
                                                  decoration: BoxDecoration(
                                                    image: DecorationImage(
                                                        image: AssetImage(
                                                          'assets/tivk.png',
                                                        ),
                                                        fit: BoxFit.cover),
                                                    borderRadius:
                                                        BorderRadius.only(
                                                            topRight: Radius
                                                                .circular(20),
                                                            bottomRight:
                                                                Radius.circular(
                                                                    20)),
                                                  ),
                                                  height: 30,
                                                  width: 30,
                                                ),
                                                SizedBox(
                                                  width: 10,
                                                ),
                                                Text(
                                                  '100% customized diet plans; no\npre-defined or fixed diets',
                                                  style:
                                                      poppinstMedium.copyWith(
                                                    fontSize: 15,
                                                    height: 1.2,
                                                    color: Colors.black,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            SizedBox(
                                              height: 5,
                                            ),
                                            Row(
                                              children: [
                                                Container(
                                                  decoration: BoxDecoration(
                                                    image: DecorationImage(
                                                        image: AssetImage(
                                                          'assets/tivk.png',
                                                        ),
                                                        fit: BoxFit.cover),
                                                    borderRadius:
                                                        BorderRadius.only(
                                                            topRight: Radius
                                                                .circular(20),
                                                            bottomRight:
                                                                Radius.circular(
                                                                    20)),
                                                  ),
                                                  height: 30,
                                                  width: 30,
                                                ),
                                                SizedBox(
                                                  width: 10,
                                                ),
                                                Text(
                                                  'Homely and traditional food; \nno crash dieting',
                                                  style:
                                                      poppinstMedium.copyWith(
                                                    fontSize: 15,
                                                    height: 1.2,
                                                    color: Colors.black,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            SizedBox(
                                              height: 5,
                                            ),
                                            Row(
                                              children: [
                                                Container(
                                                  decoration: BoxDecoration(
                                                    image: DecorationImage(
                                                        image: AssetImage(
                                                          'assets/tivk.png',
                                                        ),
                                                        fit: BoxFit.cover),
                                                    borderRadius:
                                                        BorderRadius.only(
                                                            topRight: Radius
                                                                .circular(20),
                                                            bottomRight:
                                                                Radius.circular(
                                                                    20)),
                                                  ),
                                                  height: 30,
                                                  width: 30,
                                                ),
                                                SizedBox(
                                                  width: 10,
                                                ),
                                                Text(
                                                  'Only real food; no pills or supplements',
                                                  style:
                                                      poppinstMedium.copyWith(
                                                    fontSize: 14,
                                                    height: 1.2,
                                                    color: Colors.black,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            SizedBox(
                                              height: 5,
                                            ),
                                            Row(
                                              children: [
                                                Container(
                                                  decoration: BoxDecoration(
                                                    image: DecorationImage(
                                                        image: AssetImage(
                                                          'assets/tivk.png',
                                                        ),
                                                        fit: BoxFit.cover),
                                                    borderRadius:
                                                        BorderRadius.only(
                                                            topRight: Radius
                                                                .circular(20),
                                                            bottomRight:
                                                                Radius.circular(
                                                                    20)),
                                                  ),
                                                  height: 30,
                                                  width: 30,
                                                ),
                                                SizedBox(
                                                  width: 10,
                                                ),
                                                Text(
                                                  'Long-term sustainable diets',
                                                  style:
                                                      poppinstMedium.copyWith(
                                                    fontSize: 14,
                                                    height: 1.2,
                                                    color: Colors.black,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            SizedBox(
                                              height: 5,
                                            ),
                                            Row(
                                              children: [
                                                Container(
                                                  decoration: BoxDecoration(
                                                    image: DecorationImage(
                                                        image: AssetImage(
                                                          'assets/tivk.png',
                                                        ),
                                                        fit: BoxFit.cover),
                                                    borderRadius:
                                                        BorderRadius.only(
                                                            topRight: Radius
                                                                .circular(20),
                                                            bottomRight:
                                                                Radius.circular(
                                                                    20)),
                                                  ),
                                                  height: 30,
                                                  width: 30,
                                                ),
                                                SizedBox(
                                                  width: 10,
                                                ),
                                                Text(
                                                  'Learn portion control. No\nneed for kitchen scale.',
                                                  style:
                                                      poppinstMedium.copyWith(
                                                    fontSize: 14,
                                                    height: 1.2,
                                                    color: Colors.black,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      Row(
                                        children: [
                                          Container(
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.only(
                                                  topRight: Radius.circular(20),
                                                  bottomRight:
                                                      Radius.circular(20)),
                                              color: ColorResources.bukdeudfji,
                                            ),
                                            height: 40,
                                            width: 250,
                                            child: Center(
                                              child: Text(
                                                'What You Get',
                                                style: poppinstMedium.copyWith(
                                                  fontSize: 15,
                                                  height: 1.2,
                                                  color: Colors.black,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            left: 20, bottom: 30),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              children: [
                                                Container(
                                                  decoration: BoxDecoration(
                                                    image: DecorationImage(
                                                        image: AssetImage(
                                                          'assets/tivk.png',
                                                        ),
                                                        fit: BoxFit.cover),
                                                    borderRadius:
                                                        BorderRadius.only(
                                                            topRight: Radius
                                                                .circular(20),
                                                            bottomRight:
                                                                Radius.circular(
                                                                    20)),
                                                  ),
                                                  height: 30,
                                                  width: 30,
                                                ),
                                                SizedBox(
                                                  width: 10,
                                                ),
                                                Text(
                                                  'No. 1 healthiest weight loss program',
                                                  style:
                                                      poppinstMedium.copyWith(
                                                    fontSize: 15,
                                                    height: 1.2,
                                                    color: Colors.black,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            SizedBox(
                                              height: 5,
                                            ),
                                            Row(
                                              children: [
                                                Container(
                                                  decoration: BoxDecoration(
                                                    image: DecorationImage(
                                                        image: AssetImage(
                                                          'assets/tivk.png',
                                                        ),
                                                        fit: BoxFit.cover),
                                                    borderRadius:
                                                        BorderRadius.only(
                                                            topRight: Radius
                                                                .circular(20),
                                                            bottomRight:
                                                                Radius.circular(
                                                                    20)),
                                                  ),
                                                  height: 30,
                                                  width: 30,
                                                ),
                                                SizedBox(
                                                  width: 10,
                                                ),
                                                Text(
                                                  '99.9% success rate',
                                                  style:
                                                      poppinstMedium.copyWith(
                                                    fontSize: 15,
                                                    height: 1.2,
                                                    color: Colors.black,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            SizedBox(
                                              height: 5,
                                            ),
                                            Row(
                                              children: [
                                                Container(
                                                  decoration: BoxDecoration(
                                                    image: DecorationImage(
                                                        image: AssetImage(
                                                          'assets/tivk.png',
                                                        ),
                                                        fit: BoxFit.cover),
                                                    borderRadius:
                                                        BorderRadius.only(
                                                            topRight: Radius
                                                                .circular(20),
                                                            bottomRight:
                                                                Radius.circular(
                                                                    20)),
                                                  ),
                                                  height: 30,
                                                  width: 30,
                                                ),
                                                SizedBox(
                                                  width: 10,
                                                ),
                                                Text(
                                                  'Your commitment is essential',
                                                  style:
                                                      poppinstMedium.copyWith(
                                                    fontSize: 14,
                                                    height: 1.2,
                                                    color: Colors.black,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            SizedBox(
                                              height: 5,
                                            ),
                                            Row(
                                              children: [
                                                Container(
                                                  decoration: BoxDecoration(
                                                    image: DecorationImage(
                                                        image: AssetImage(
                                                          'assets/tivk.png',
                                                        ),
                                                        fit: BoxFit.cover),
                                                    borderRadius:
                                                        BorderRadius.only(
                                                            topRight: Radius
                                                                .circular(20),
                                                            bottomRight:
                                                                Radius.circular(
                                                                    20)),
                                                  ),
                                                  height: 30,
                                                  width: 30,
                                                ),
                                                SizedBox(
                                                  width: 10,
                                                ),
                                                Text(
                                                  'Consult with Dt. Ektta Jain directly\n(in person or on-phone)',
                                                  style:
                                                      poppinstMedium.copyWith(
                                                    fontSize: 14,
                                                    height: 1.2,
                                                    color: Colors.black,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            SizedBox(
                                              height: 5,
                                            ),
                                            Row(
                                              children: [
                                                Container(
                                                  decoration: BoxDecoration(
                                                    image: DecorationImage(
                                                        image: AssetImage(
                                                          'assets/tivk.png',
                                                        ),
                                                        fit: BoxFit.cover),
                                                    borderRadius:
                                                        BorderRadius.only(
                                                            topRight: Radius
                                                                .circular(20),
                                                            bottomRight:
                                                                Radius.circular(
                                                                    20)),
                                                  ),
                                                  height: 30,
                                                  width: 30,
                                                ),
                                                SizedBox(
                                                  width: 10,
                                                ),
                                                Text(
                                                  'Safe and permanent weight loss',
                                                  style:
                                                      poppinstMedium.copyWith(
                                                    fontSize: 14,
                                                    height: 1.2,
                                                    color: Colors.black,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                      GestureDetector(
                                        onTap: () async {
                                          await launchUrl(Uri.parse(
                                              "mailto:info.godiets@gmail.com?subject=Pregna Care&body=Hello"));
                                        },
                                        child: Container(
                                          margin: EdgeInsets.only(
                                              left: 30, right: 30),
                                          height: 40,
                                          width:
                                              MediaQuery.of(context).size.width,
                                          alignment: Alignment.center,
                                          decoration: BoxDecoration(
                                              color: ColorResources
                                                  .verifyScreenButton,
                                              borderRadius:
                                                  BorderRadius.circular(5)),
                                          child: Text(
                                            "Book an Appointment",
                                            style: poppinsRegular.copyWith(
                                              color: Colors.white,
                                              fontSize: 16,
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 100,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )),
                      ],
                    ),
                  ),
                ),
              ),
            ]),
          if (widget.packagename == 'Pre-Wedding')
            Stack(children: [
              Container(
                height: MediaQuery.of(context).size.height,
              ),
              Positioned(
                top: 0,
                left: 0,
                right: 0,
                child: Container(
                  color: ColorResources.buttonYellow,
                  height: 300,
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
                                  "${widget.packagename} Package",
                                  textAlign: TextAlign.center,
                                  style: poppinsSemiBold.copyWith(
                                    fontSize: 19,
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
                      Padding(
                        padding:
                            const EdgeInsets.only(left: 20, right: 20, top: 10),
                        child: Text(
                          "Pre-Wedding And Management Of Lifestyle Diseases With Nutrition.",
                          textAlign: TextAlign.center,
                          style: poppinsRegular.copyWith(
                            fontSize: 15,
                            height: 1.2,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                top: 170,
                left: 0,
                right: 0,
                child: Padding(
                  padding: EdgeInsets.only(left: 0, right: 10),
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        color: Colors.transparent),
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
                                padding: EdgeInsets.only(left: 20, right: 20),
                                child: Container(
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                          image: NetworkImage(
                                            'https://godiets.in/wp-content/uploads/2020/06/xxxxxxxxx-3.png',
                                          ),
                                          fit: BoxFit.fill),
                                      borderRadius: BorderRadius.circular(25),
                                      color: Colors.white),
                                  height: 250,
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Row(
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.only(
                                          topRight: Radius.circular(20),
                                          bottomRight: Radius.circular(20)),
                                      color: ColorResources.bukdeudfji,
                                    ),
                                    height: 40,
                                    width: 250,
                                    child: Center(
                                      child: Text(
                                        'Ideal For Pregna Care In',
                                        style: poppinstMedium.copyWith(
                                          fontSize: 15,
                                          height: 1.2,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 20),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Container(
                                          decoration: BoxDecoration(
                                            image: DecorationImage(
                                                image: AssetImage(
                                                  'assets/tivk.png',
                                                ),
                                                fit: BoxFit.cover),
                                            borderRadius: BorderRadius.only(
                                                topRight: Radius.circular(20),
                                                bottomRight:
                                                    Radius.circular(20)),
                                          ),
                                          height: 30,
                                          width: 30,
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Text(
                                          'LOSING FEW EXTRA KILOS ',
                                          style: poppinstMedium.copyWith(
                                            fontSize: 15,
                                            height: 1.2,
                                            color: Colors.black,
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Row(
                                      children: [
                                        Container(
                                          decoration: BoxDecoration(
                                            image: DecorationImage(
                                                image: AssetImage(
                                                  'assets/tivk.png',
                                                ),
                                                fit: BoxFit.cover),
                                            borderRadius: BorderRadius.only(
                                                topRight: Radius.circular(20),
                                                bottomRight:
                                                    Radius.circular(20)),
                                          ),
                                          height: 30,
                                          width: 30,
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Text(
                                          'GETTING IN SHAPE',
                                          style: poppinstMedium.copyWith(
                                            fontSize: 15,
                                            height: 1.2,
                                            color: Colors.black,
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Row(
                                      children: [
                                        Container(
                                          decoration: BoxDecoration(
                                            image: DecorationImage(
                                                image: AssetImage(
                                                  'assets/tivk.png',
                                                ),
                                                fit: BoxFit.cover),
                                            borderRadius: BorderRadius.only(
                                                topRight: Radius.circular(20),
                                                bottomRight:
                                                    Radius.circular(20)),
                                          ),
                                          height: 30,
                                          width: 30,
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Text(
                                          'SKIN GLOW',
                                          style: poppinstMedium.copyWith(
                                            fontSize: 15,
                                            height: 1.2,
                                            color: Colors.black,
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Container(
                                //height: 400,
                                width: MediaQuery.of(context).size.width,
                                color: Color.fromARGB(255, 251, 248, 228),
                                child: Padding(
                                  padding: const EdgeInsets.all(0.0),
                                  child: Column(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(10.0),
                                        child: Row(
                                          children: [
                                            Text(
                                              'Vision & Mission',
                                              style: poppinsSemiBold.copyWith(
                                                  fontSize: 17,
                                                  color: Colors.green),
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        height: 0,
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 10),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Container(
                                              height: 5,
                                              width: 70,
                                              decoration: BoxDecoration(
                                                  color: Colors.green),
                                            ),
                                            Container(
                                              height: 1,
                                              width: 70,
                                              decoration: BoxDecoration(
                                                  color: Colors.grey),
                                            )
                                          ],
                                        ),
                                      ),
                                      Container(
                                        child: Padding(
                                          padding: const EdgeInsets.all(10.0),
                                          child: Text(
                                            'Whether you just want to lose that extra fat on your tummy or want a natural charming and glowing skin for your special day, this diet package is for you.\n\nThis special program is designed to help you lose up to 6 kg of weight and improve your skin texture with the power of healthy food and nutrition. No medicines or supplements!\n\nApart from this, your body and mind will also feel healthy like never before.',
                                            style: poppinsRegular.copyWith(
                                                fontSize: 14,
                                                color: Colors.black87),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      Row(
                                        children: [
                                          Container(
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.only(
                                                  topRight: Radius.circular(20),
                                                  bottomRight:
                                                      Radius.circular(20)),
                                              color: Colors.green.shade100,
                                            ),
                                            height: 40,
                                            width: 250,
                                            child: Center(
                                              child: Text(
                                                'Program Features',
                                                style: poppinstMedium.copyWith(
                                                  fontSize: 15,
                                                  height: 1.2,
                                                  color: Colors.black,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 20),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              children: [
                                                Container(
                                                  decoration: BoxDecoration(
                                                    image: DecorationImage(
                                                        image: AssetImage(
                                                          'assets/tivk.png',
                                                        ),
                                                        fit: BoxFit.cover),
                                                    borderRadius:
                                                        BorderRadius.only(
                                                            topRight: Radius
                                                                .circular(20),
                                                            bottomRight:
                                                                Radius.circular(
                                                                    20)),
                                                  ),
                                                  height: 30,
                                                  width: 30,
                                                ),
                                                SizedBox(
                                                  width: 10,
                                                ),
                                                Text(
                                                  'No. 1 healthiest weight loss program',
                                                  style:
                                                      poppinstMedium.copyWith(
                                                    fontSize: 15,
                                                    height: 1.2,
                                                    color: Colors.black,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            SizedBox(
                                              height: 5,
                                            ),
                                            Row(
                                              children: [
                                                Container(
                                                  decoration: BoxDecoration(
                                                    image: DecorationImage(
                                                        image: AssetImage(
                                                          'assets/tivk.png',
                                                        ),
                                                        fit: BoxFit.cover),
                                                    borderRadius:
                                                        BorderRadius.only(
                                                            topRight: Radius
                                                                .circular(20),
                                                            bottomRight:
                                                                Radius.circular(
                                                                    20)),
                                                  ),
                                                  height: 30,
                                                  width: 30,
                                                ),
                                                SizedBox(
                                                  width: 10,
                                                ),
                                                Text(
                                                  '99.9% success rate',
                                                  style:
                                                      poppinstMedium.copyWith(
                                                    fontSize: 15,
                                                    height: 1.2,
                                                    color: Colors.black,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            SizedBox(
                                              height: 5,
                                            ),
                                            Row(
                                              children: [
                                                Container(
                                                  decoration: BoxDecoration(
                                                    image: DecorationImage(
                                                        image: AssetImage(
                                                          'assets/tivk.png',
                                                        ),
                                                        fit: BoxFit.cover),
                                                    borderRadius:
                                                        BorderRadius.only(
                                                            topRight: Radius
                                                                .circular(20),
                                                            bottomRight:
                                                                Radius.circular(
                                                                    20)),
                                                  ),
                                                  height: 30,
                                                  width: 30,
                                                ),
                                                SizedBox(
                                                  width: 10,
                                                ),
                                                Text(
                                                  'Your commitment is essential',
                                                  style:
                                                      poppinstMedium.copyWith(
                                                    fontSize: 15,
                                                    height: 1.2,
                                                    color: Colors.black,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            SizedBox(
                                              height: 5,
                                            ),
                                            Row(
                                              children: [
                                                Container(
                                                  decoration: BoxDecoration(
                                                    image: DecorationImage(
                                                        image: AssetImage(
                                                          'assets/tivk.png',
                                                        ),
                                                        fit: BoxFit.cover),
                                                    borderRadius:
                                                        BorderRadius.only(
                                                            topRight: Radius
                                                                .circular(20),
                                                            bottomRight:
                                                                Radius.circular(
                                                                    20)),
                                                  ),
                                                  height: 30,
                                                  width: 30,
                                                ),
                                                SizedBox(
                                                  width: 10,
                                                ),
                                                Text(
                                                  'Consult with Dt. Ektta Jain\ndirectly (in person or on-phone)',
                                                  style:
                                                      poppinstMedium.copyWith(
                                                    fontSize: 15,
                                                    height: 1.2,
                                                    color: Colors.black,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            SizedBox(
                                              height: 5,
                                            ),
                                            Row(
                                              children: [
                                                Container(
                                                  decoration: BoxDecoration(
                                                    image: DecorationImage(
                                                        image: AssetImage(
                                                          'assets/tivk.png',
                                                        ),
                                                        fit: BoxFit.cover),
                                                    borderRadius:
                                                        BorderRadius.only(
                                                            topRight: Radius
                                                                .circular(20),
                                                            bottomRight:
                                                                Radius.circular(
                                                                    20)),
                                                  ),
                                                  height: 30,
                                                  width: 30,
                                                ),
                                                SizedBox(
                                                  width: 10,
                                                ),
                                                Text(
                                                  'Safe and permanent weight loss',
                                                  style:
                                                      poppinstMedium.copyWith(
                                                    fontSize: 15,
                                                    height: 1.2,
                                                    color: Colors.black,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            SizedBox(
                                              height: 5,
                                            ),
                                            Row(
                                              children: [
                                                Container(
                                                  decoration: BoxDecoration(
                                                    image: DecorationImage(
                                                        image: AssetImage(
                                                          'assets/tivk.png',
                                                        ),
                                                        fit: BoxFit.cover),
                                                    borderRadius:
                                                        BorderRadius.only(
                                                            topRight: Radius
                                                                .circular(20),
                                                            bottomRight:
                                                                Radius.circular(
                                                                    20)),
                                                  ),
                                                  height: 30,
                                                  width: 30,
                                                ),
                                                SizedBox(
                                                  width: 10,
                                                ),
                                                Text(
                                                  'Weekly calls/visits. Excellent any-time support.',
                                                  style:
                                                      poppinstMedium.copyWith(
                                                    fontSize: 14,
                                                    height: 1.2,
                                                    color: Colors.black,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      Row(
                                        children: [
                                          Container(
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.only(
                                                  topRight: Radius.circular(20),
                                                  bottomRight:
                                                      Radius.circular(20)),
                                              color: Colors.white70,
                                            ),
                                            height: 40,
                                            width: 250,
                                            child: Center(
                                              child: Text(
                                                'Diet Style',
                                                style: poppinstMedium.copyWith(
                                                  fontSize: 15,
                                                  height: 1.2,
                                                  color: Colors.black,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 20),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              children: [
                                                Container(
                                                  decoration: BoxDecoration(
                                                    image: DecorationImage(
                                                        image: AssetImage(
                                                          'assets/tivk.png',
                                                        ),
                                                        fit: BoxFit.cover),
                                                    borderRadius:
                                                        BorderRadius.only(
                                                            topRight: Radius
                                                                .circular(20),
                                                            bottomRight:
                                                                Radius.circular(
                                                                    20)),
                                                  ),
                                                  height: 30,
                                                  width: 30,
                                                ),
                                                SizedBox(
                                                  width: 10,
                                                ),
                                                Text(
                                                  '100% customized diet plans; no\npre-defined or fixed diets',
                                                  style:
                                                      poppinstMedium.copyWith(
                                                    fontSize: 15,
                                                    height: 1.2,
                                                    color: Colors.black,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            SizedBox(
                                              height: 5,
                                            ),
                                            Row(
                                              children: [
                                                Container(
                                                  decoration: BoxDecoration(
                                                    image: DecorationImage(
                                                        image: AssetImage(
                                                          'assets/tivk.png',
                                                        ),
                                                        fit: BoxFit.cover),
                                                    borderRadius:
                                                        BorderRadius.only(
                                                            topRight: Radius
                                                                .circular(20),
                                                            bottomRight:
                                                                Radius.circular(
                                                                    20)),
                                                  ),
                                                  height: 30,
                                                  width: 30,
                                                ),
                                                SizedBox(
                                                  width: 10,
                                                ),
                                                Text(
                                                  'Homely and traditional food; \nno crash dieting',
                                                  style:
                                                      poppinstMedium.copyWith(
                                                    fontSize: 15,
                                                    height: 1.2,
                                                    color: Colors.black,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            SizedBox(
                                              height: 5,
                                            ),
                                            Row(
                                              children: [
                                                Container(
                                                  decoration: BoxDecoration(
                                                    image: DecorationImage(
                                                        image: AssetImage(
                                                          'assets/tivk.png',
                                                        ),
                                                        fit: BoxFit.cover),
                                                    borderRadius:
                                                        BorderRadius.only(
                                                            topRight: Radius
                                                                .circular(20),
                                                            bottomRight:
                                                                Radius.circular(
                                                                    20)),
                                                  ),
                                                  height: 30,
                                                  width: 30,
                                                ),
                                                SizedBox(
                                                  width: 10,
                                                ),
                                                Text(
                                                  'Only real food; no pills or supplements',
                                                  style:
                                                      poppinstMedium.copyWith(
                                                    fontSize: 14,
                                                    height: 1.2,
                                                    color: Colors.black,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            SizedBox(
                                              height: 5,
                                            ),
                                            Row(
                                              children: [
                                                Container(
                                                  decoration: BoxDecoration(
                                                    image: DecorationImage(
                                                        image: AssetImage(
                                                          'assets/tivk.png',
                                                        ),
                                                        fit: BoxFit.cover),
                                                    borderRadius:
                                                        BorderRadius.only(
                                                            topRight: Radius
                                                                .circular(20),
                                                            bottomRight:
                                                                Radius.circular(
                                                                    20)),
                                                  ),
                                                  height: 30,
                                                  width: 30,
                                                ),
                                                SizedBox(
                                                  width: 10,
                                                ),
                                                Text(
                                                  'Long-term sustainable diets',
                                                  style:
                                                      poppinstMedium.copyWith(
                                                    fontSize: 14,
                                                    height: 1.2,
                                                    color: Colors.black,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            SizedBox(
                                              height: 5,
                                            ),
                                            Row(
                                              children: [
                                                Container(
                                                  decoration: BoxDecoration(
                                                    image: DecorationImage(
                                                        image: AssetImage(
                                                          'assets/tivk.png',
                                                        ),
                                                        fit: BoxFit.cover),
                                                    borderRadius:
                                                        BorderRadius.only(
                                                            topRight: Radius
                                                                .circular(20),
                                                            bottomRight:
                                                                Radius.circular(
                                                                    20)),
                                                  ),
                                                  height: 30,
                                                  width: 30,
                                                ),
                                                SizedBox(
                                                  width: 10,
                                                ),
                                                Text(
                                                  'Learn portion control. No\nneed for kitchen scale.',
                                                  style:
                                                      poppinstMedium.copyWith(
                                                    fontSize: 14,
                                                    height: 1.2,
                                                    color: Colors.black,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      Row(
                                        children: [
                                          Container(
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.only(
                                                  topRight: Radius.circular(20),
                                                  bottomRight:
                                                      Radius.circular(20)),
                                              color: ColorResources.bukdeudfji,
                                            ),
                                            height: 40,
                                            width: 250,
                                            child: Center(
                                              child: Text(
                                                'What You Get',
                                                style: poppinstMedium.copyWith(
                                                  fontSize: 15,
                                                  height: 1.2,
                                                  color: Colors.black,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            left: 20, bottom: 30),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              children: [
                                                Container(
                                                  decoration: BoxDecoration(
                                                    image: DecorationImage(
                                                        image: AssetImage(
                                                          'assets/tivk.png',
                                                        ),
                                                        fit: BoxFit.cover),
                                                    borderRadius:
                                                        BorderRadius.only(
                                                            topRight: Radius
                                                                .circular(20),
                                                            bottomRight:
                                                                Radius.circular(
                                                                    20)),
                                                  ),
                                                  height: 30,
                                                  width: 30,
                                                ),
                                                SizedBox(
                                                  width: 10,
                                                ),
                                                Text(
                                                  'No. 1 healthiest weight loss program',
                                                  style:
                                                      poppinstMedium.copyWith(
                                                    fontSize: 15,
                                                    height: 1.2,
                                                    color: Colors.black,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            SizedBox(
                                              height: 5,
                                            ),
                                            Row(
                                              children: [
                                                Container(
                                                  decoration: BoxDecoration(
                                                    image: DecorationImage(
                                                        image: AssetImage(
                                                          'assets/tivk.png',
                                                        ),
                                                        fit: BoxFit.cover),
                                                    borderRadius:
                                                        BorderRadius.only(
                                                            topRight: Radius
                                                                .circular(20),
                                                            bottomRight:
                                                                Radius.circular(
                                                                    20)),
                                                  ),
                                                  height: 30,
                                                  width: 30,
                                                ),
                                                SizedBox(
                                                  width: 10,
                                                ),
                                                Text(
                                                  '99.9% success rate',
                                                  style:
                                                      poppinstMedium.copyWith(
                                                    fontSize: 15,
                                                    height: 1.2,
                                                    color: Colors.black,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            SizedBox(
                                              height: 5,
                                            ),
                                            Row(
                                              children: [
                                                Container(
                                                  decoration: BoxDecoration(
                                                    image: DecorationImage(
                                                        image: AssetImage(
                                                          'assets/tivk.png',
                                                        ),
                                                        fit: BoxFit.cover),
                                                    borderRadius:
                                                        BorderRadius.only(
                                                            topRight: Radius
                                                                .circular(20),
                                                            bottomRight:
                                                                Radius.circular(
                                                                    20)),
                                                  ),
                                                  height: 30,
                                                  width: 30,
                                                ),
                                                SizedBox(
                                                  width: 10,
                                                ),
                                                Text(
                                                  'Your commitment is essential',
                                                  style:
                                                      poppinstMedium.copyWith(
                                                    fontSize: 14,
                                                    height: 1.2,
                                                    color: Colors.black,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            SizedBox(
                                              height: 5,
                                            ),
                                            Row(
                                              children: [
                                                Container(
                                                  decoration: BoxDecoration(
                                                    image: DecorationImage(
                                                        image: AssetImage(
                                                          'assets/tivk.png',
                                                        ),
                                                        fit: BoxFit.cover),
                                                    borderRadius:
                                                        BorderRadius.only(
                                                            topRight: Radius
                                                                .circular(20),
                                                            bottomRight:
                                                                Radius.circular(
                                                                    20)),
                                                  ),
                                                  height: 30,
                                                  width: 30,
                                                ),
                                                SizedBox(
                                                  width: 10,
                                                ),
                                                Text(
                                                  'Consult with Dt. Ektta Jain directly\n(in person or on-phone)',
                                                  style:
                                                      poppinstMedium.copyWith(
                                                    fontSize: 14,
                                                    height: 1.2,
                                                    color: Colors.black,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            SizedBox(
                                              height: 5,
                                            ),
                                            Row(
                                              children: [
                                                Container(
                                                  decoration: BoxDecoration(
                                                    image: DecorationImage(
                                                        image: AssetImage(
                                                          'assets/tivk.png',
                                                        ),
                                                        fit: BoxFit.cover),
                                                    borderRadius:
                                                        BorderRadius.only(
                                                            topRight: Radius
                                                                .circular(20),
                                                            bottomRight:
                                                                Radius.circular(
                                                                    20)),
                                                  ),
                                                  height: 30,
                                                  width: 30,
                                                ),
                                                SizedBox(
                                                  width: 10,
                                                ),
                                                Text(
                                                  'Safe and permanent weight loss',
                                                  style:
                                                      poppinstMedium.copyWith(
                                                    fontSize: 14,
                                                    height: 1.2,
                                                    color: Colors.black,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                      GestureDetector(
                                        onTap: () async {
                                          await launchUrl(Uri.parse(
                                              "mailto:info.godiets@gmail.com?subject=Pre-Wedding&body=Hello"));
                                        },
                                        child: Container(
                                          margin: EdgeInsets.only(
                                              left: 30, right: 30),
                                          height: 40,
                                          width:
                                              MediaQuery.of(context).size.width,
                                          alignment: Alignment.center,
                                          decoration: BoxDecoration(
                                              color: ColorResources
                                                  .verifyScreenButton,
                                              borderRadius:
                                                  BorderRadius.circular(5)),
                                          child: Text(
                                            "Book an Appointment",
                                            style: poppinsRegular.copyWith(
                                              color: Colors.white,
                                              fontSize: 16,
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 100,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )),
                      ],
                    ),
                  ),
                ),
              ),
            ]),
        ],
      ),
    );
  }
}
