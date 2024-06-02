import 'package:flutter/material.dart';

class ReusableBg extends StatelessWidget {
  // ignore: non_constant_identifier_names
  ReusableBg({this.colour, required this.cardChild}); //remove required
  final Color? colour;
  final Widget cardChild;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45,
      child: cardChild,
      margin: EdgeInsets.only(left: 10, right: 10),
      decoration: BoxDecoration(
        color: colour,
        borderRadius: BorderRadius.circular(25.0),
      ),
    );
  }
}

class ReusableBg1 extends StatelessWidget {
  // ignore: non_constant_identifier_names
  ReusableBg1({this.colour, required this.cardChild}); //remove required
  final Color? colour;
  final Widget cardChild;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      child: cardChild,
      margin: EdgeInsets.only(left: 10, right: 10),
      decoration: BoxDecoration(
        color: colour,
        borderRadius: BorderRadius.circular(25.0),
      ),
    );
  }
}

class ReusableBg2 extends StatelessWidget {
  // ignore: non_constant_identifier_names
  ReusableBg2({this.colour, required this.cardChild}); //remove required
  final Color? colour;
  final Widget cardChild;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 140,
      child: cardChild,
      margin: EdgeInsets.only(left: 10, right: 10),
      decoration: BoxDecoration(
        color: colour,
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(20.0),
      ),
    );
  }
}
