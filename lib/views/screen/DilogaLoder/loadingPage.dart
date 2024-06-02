import 'package:dietitian/utils/style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class CustomLoadinga extends StatefulWidget {
  const CustomLoadinga({Key? key, this.type = 0}) : super(key: key);

  final int type;

  @override
  _CustomLoadingState createState() => _CustomLoadingState();
}

class _CustomLoadingState extends State<CustomLoadinga>
    with TickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    _controller = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    );
    _controller.forward();
    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _controller.reset();
        _controller.forward();
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      // icon
      Visibility(visible: widget.type == 1, child: _buildLoadingTwo()),
    ]);
  }

  Widget _buildLoadingTwo() {
    return Container(
      height: 150,
      width: Get.width * 0.7,
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: 10),
          Stack(alignment: Alignment.center, children: [
            RotationTransition(
              alignment: Alignment.center,
              turns: _controller,
              child: Image.asset('assets/loader.png',
                  height: 70, width: 70),
            ),
          ]),
           SizedBox(height: 10),
          FittedBox(
              child: Text('Please Wait...',
                  style: poppinsSemiBold.copyWith(fontSize: 14, color: Colors.white70))),
          SizedBox(height: 10),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}