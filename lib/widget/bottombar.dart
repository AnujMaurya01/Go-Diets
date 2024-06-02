import 'package:flutter/material.dart';

import '../utils/all_images.dart';

class CustomNavigationBar extends StatefulWidget {
  final int selectedIndex;
  final Function(int) onIndexChanged;

  CustomNavigationBar(
      {required this.selectedIndex, required this.onIndexChanged});

  @override
  _CustomNavigationBarState createState() => _CustomNavigationBarState();
}

class _CustomNavigationBarState extends State<CustomNavigationBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 46,
      margin: EdgeInsets.only(left: 10, right: 15),
      decoration: BoxDecoration(
        color: Colors.grey.shade50,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          if (widget.selectedIndex == 0) ...[
            buildNavItem(
              0,
              Images.home2,
            ),
          ] else ...[
            buildNavItem(0, Images.home2),
          ],
          if (widget.selectedIndex == 1) ...[
            buildNavItem(1, Images.calender),
          ] else ...[
            buildNavItem(1, Images.calender),
          ],
          if (widget.selectedIndex == 2) ...[
            buildNavItem(2, Images.messGW),
          ] else ...[
            buildNavItem(2, Images.messGW),
          ],
          if (widget.selectedIndex == 3) ...[
            buildNavItem(3, Images.profile),
          ] else ...[
            buildNavItem(3, Images.profile),
          ]
        ],
      ),
    );
  }

  Widget buildNavItem(int index, String iconAsset) {
    return Material(
      child: GestureDetector(
        // splashColor: Colors.grey.withOpacity(0.3),
        // highlightColor: Colors.grey,
        onTap: () {
          if (widget.selectedIndex != index) {
            widget.onIndexChanged(index);
          }
        },
        child: Container(
          padding: EdgeInsets.fromLTRB(12, 10, 12, 0),
          child: Column(
            children: [
              Image.asset(iconAsset, width: 25),
              SizedBox(height: 7),
            ],
          ),
        ),
      ),
    );
  }
}
