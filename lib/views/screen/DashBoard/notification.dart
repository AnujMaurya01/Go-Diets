import 'package:dietitian/utils/colors.dart';
import 'package:dietitian/utils/style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        title: Text(
          'Notifications',
          style: poppinsSemiBold.copyWith(fontSize: 17, color: Colors.black87),
        ),
        backgroundColor: ColorResources.buttonYellow,
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
    );
  }
}
