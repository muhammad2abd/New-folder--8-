import 'package:flutter/material.dart';

const kButtonCornerRadius = 10.0;
const kCardBorderRadius = 35.0;

class UIParameters{
  static BorderRadius get cardBorderRadius => BorderRadius.circular(kCardBorderRadius);

  static double getHeight(BuildContext context){
    return MediaQuery.of(context).size.height;
  }

    static double getWidth(BuildContext context){
    return MediaQuery.of(context).size.width;
  }
}