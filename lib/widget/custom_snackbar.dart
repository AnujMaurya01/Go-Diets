import 'package:flutter/material.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:get/get.dart';
import 'package:dietitian/utils/apis/api_checker.dart';
import 'package:dietitian/utils/dimensions.dart';
import 'package:dietitian/utils/style.dart';

void showCustomSnackBar(String message,
    {bool isError = true,
    bool isIcon = false,
    bool isVpn = false,
    Duration? duration}) {
  if (isVpn) {
    SmartDialog.show(
      onDismiss: () async {
        if (await ApiChecker.isVpnActive()) {
          showCustomSnackBar('', isVpn: true, duration: Duration(minutes: 7));
        }
      },
      alignment: Alignment.topCenter,
      builder: (_) {
        return Container(
          width: Get.width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Theme.of(Get.context!).errorColor,
          ),
          child: SafeArea(
              child: Padding(
            padding: EdgeInsets.symmetric(
              vertical: Dimensions.PADDING_SIZE_SMALL,
              horizontal: Dimensions.PADDING_SIZE_LARGE,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'please_disable_the_vpn'.tr,
                  style: poppinsRegular.copyWith(color: Colors.white),
                ),
                IconButton(
                  icon: Icon(Icons.clear, size: 25),
                  color: Colors.white,
                  onPressed: () {
                    SmartDialog.dismiss();
                  },
                ),
              ],
            ),
          )),
        );
      },
    );
  } else {
    // ignore: unnecessary_null_comparison
    if (message != null && message.isNotEmpty) {
      Get
        ..closeCurrentSnackbar()
        ..showSnackbar(GetSnackBar(
          snackPosition: SnackPosition.TOP,
          borderRadius: 5.0,
          margin: EdgeInsets.all(16),
          message: message,
          duration: Duration(seconds: 4),
          isDismissible: true,
          backgroundColor: isError ? Colors.red : Colors.green,
          icon: isIcon
              ? IconButton(
                  icon: Icon(
                    Icons.clear,
                    size: 16,
                  ),
                  color: Colors.white,
                  onPressed: () {
                    Get.back();
                  })
              : null,
        ));
    }
  }
}

void showCustomSnackBarSuccess(String message,
    {bool isError = true,
    bool isIcon = false,
    bool isVpn = false,
    Duration? duration}) {
  if (isVpn) {
    SmartDialog.show(
      onDismiss: () async {
        if (await ApiChecker.isVpnActive()) {
          showCustomSnackBar('', isVpn: true, duration: Duration(minutes: 7));
        }
      },
      alignment: Alignment.topCenter,
      builder: (_) {
        return Container(
          width: Get.width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Theme.of(Get.context!).errorColor,
          ),
          child: SafeArea(
              child: Padding(
            padding: EdgeInsets.symmetric(
              vertical: Dimensions.PADDING_SIZE_SMALL,
              horizontal: Dimensions.PADDING_SIZE_LARGE,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'please_disable_the_vpn'.tr,
                  style: poppinsRegular.copyWith(color: Colors.white),
                ),
                IconButton(
                  icon: Icon(Icons.clear, size: 25),
                  color: Colors.white,
                  onPressed: () {
                    SmartDialog.dismiss();
                  },
                ),
              ],
            ),
          )),
        );
      },
    );
  } else {
    // ignore: unnecessary_null_comparison
    if (message != null && message.isNotEmpty) {
      Get
        ..closeCurrentSnackbar()
        ..showSnackbar(GetSnackBar(
          snackPosition: SnackPosition.TOP,
          borderRadius: 5.0,
          margin: EdgeInsets.all(16),
          message: message,
          duration: Duration(seconds: 4),
          isDismissible: true,
          backgroundColor: Colors.green,
          icon: isIcon
              ? IconButton(
                  icon: Icon(
                    Icons.clear,
                    size: 16,
                  ),
                  color: Colors.white,
                  onPressed: () {
                    Get.back();
                  })
              : null,
        ));
    }
  }
}
