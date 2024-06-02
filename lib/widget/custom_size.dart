import 'package:flutter/material.dart';
import 'package:dietitian/utils/dimensions.dart';

class SizeBoxCustom extends StatelessWidget {
  const SizeBoxCustom({super.key});

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      height: Dimensions.spacingSize10,
    );
  }
}
