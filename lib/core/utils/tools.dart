import 'package:flutter/material.dart';

import '../config/router/c_router.dart';

//context
final ctx = CRouter.router.configuration.navigatorKey.currentState!.context;
//MediaQuery
final appH = appS.height;
final appW = appS.width;
final appS = MediaQuery.sizeOf(ctx);

//--- SizedBox ---//
SizedBox sizeH(double height) {
  return SizedBox(height: height);
}

SizedBox sizeW(double width) {
  return SizedBox(width: width);
}
