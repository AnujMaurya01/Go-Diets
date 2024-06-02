import 'package:dietitian/utils/colors.dart';
import 'package:dietitian/utils/constants.dart';
import 'package:dietitian/utils/style.dart';
import 'package:dietitian/views/screen/auth/new_pages/package_details.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PackageScreen extends StatefulWidget {
  const PackageScreen({super.key});

  @override
  State<PackageScreen> createState() => _PackageScreenState();
}

class _PackageScreenState extends State<PackageScreen> {
  final List<Map<String, String>> imageUrls = [
    {'name': 'Weight Loss', 'url': 'assets/plan.png'},
    {'name': 'Weight Gain', 'url': 'assets/oo.png'},
    {'name': 'Therapeutic (Medical Issues)', 'url': 'assets/plan3.png'},
    {'name': 'Maintenance', 'url': 'assets/plan4.png'},
    {'name': 'Kids Nourish', 'url': 'assets/plan5.png'},
    {'name': 'Skin / Hair Care', 'url': 'assets/pp.png'},
    {'name': 'Pregna Care', 'url': 'assets/plan7.png'},
    {'name': 'Pre-Wedding', 'url': 'assets/plan8.png'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          elevation: 0,
          title: Text(
            'Packages',
            style:
                poppinsSemiBold.copyWith(fontSize: 17, color: Colors.black87),
          ),
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
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: ListView.builder(
              itemCount: imageUrls.length,
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  onTap: () {
                    Get.to(
                        PackageDetailsScreen(
                          packagename: imageUrls[index]['name'],
                        ),
                        duration: Duration(
                            milliseconds: ApiConstants.screenTransitionTime),
                        transition: Transition.rightToLeft);
                  },
                  child: Image.asset(
                    imageUrls[index]['url']!,
                    fit: BoxFit.cover,
                  ),
                );
              }),
        ));
  }
}
