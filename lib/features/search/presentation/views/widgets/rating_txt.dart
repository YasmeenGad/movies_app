import 'package:flutter/material.dart';

class RatingTxt extends StatelessWidget {
  const RatingTxt({required this.rateTxt});
  final String rateTxt;
  @override
  Widget build(BuildContext context) {
    return Text(rateTxt,
        style: TextStyle(
            fontFamily: 'open sans',
            decoration: TextDecoration.none,
            color: Colors.white,
            fontSize: 10,
            fontWeight: FontWeight.w500,
            letterSpacing: 1.02));
  }
}
