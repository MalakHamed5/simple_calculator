import 'package:flutter/material.dart';

Size appS(BuildContext context) {
  return MediaQuery.of(context).size;
}

double appH(BuildContext context) {
  return appS(context).height;
}
double appW(BuildContext context) {
  return appS(context).width;
}
//--- SizedBox ---//
SizedBox sizeH(double height) {
  return SizedBox(height: height);
}

SizedBox sizeW(double width) {
  return SizedBox(width: width);
}
