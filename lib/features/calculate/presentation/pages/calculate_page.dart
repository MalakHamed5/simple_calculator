import 'package:flutter/material.dart';

import '../../../../core/const/calculator_colors.dart';
import '../../../../core/utils/tools.dart';

class CalculatorPage extends StatelessWidget {
  const CalculatorPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // extendBody: true,
      body: Column(
        children: [
          //result display
          Container(
            decoration: BoxDecoration(
              color: CColors.numberBackground,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(40),
                bottomRight: Radius.circular(40),
              ),
            ),
            height: appH * .38,
            //Reselt
            child: Padding(
              padding: EdgeInsets.only(bottom: 8.0, top: 60, left: 10, right: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  //Bar
                  Expanded(
                    child: Row(
                      children: [
                        TextButton(
                          onPressed: () {},
                          child: Text(
                            "DEG",
                            style: TextStyle(
                              color: CColors.textPrimary,
                              fontSize: 18,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ),
                        Spacer(),
                        Icon(Icons.more_vert),
                      ],
                    ),
                  ),
                  sizeH(appH / 20),

                  //Numbers
                  Text(
                    "5+5",
                    style: TextStyle(
                      color: CColors.textPrimary,
                      fontSize: 55,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  Text(
                    "10",
                    style: TextStyle(
                      color: CColors.textSecondary,
                      fontSize: 30,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Spacer(),
                  Divider(
                    thickness: 5,
                    indent: appW / 2.4,
                    endIndent: appW / 2.4,
                    color: CColors.textSecondary,
                  ),
                ],
              ),
            ),
          ),

          //rest of  calculate
          Container(
            padding: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
            // margin: EdgeInsets.all(12),
            child: Column(
              children: [
                Row(
                  children: [
                    Circle(txt: "AC", color: CColors.buttonEqual),
                    Circle(txt: "()", color: CColors.buttonOperator),
                    Circle(txt: "÷", color: CColors.buttonOperator),
                    SizedBox(
                      width: appW * 0.23,
                      child: CircleAvatar(
                        radius: 50,
                        backgroundColor: CColors.buttonOperator,
                        child: Icon(Icons.backspace, color: CColors.textPrimary),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Circle(txt: "7", color: CColors.buttonNumber),
                    Circle(txt: "8", color: CColors.buttonNumber),
                    Circle(txt: "9", color: CColors.buttonNumber),
                    Circle(txt: "×", color: CColors.buttonOperator),
                  ],
                ),
                Row(
                  children: [
                    Circle(txt: "4", color: CColors.buttonNumber),
                    Circle(txt: "5", color: CColors.buttonNumber),
                    Circle(txt: "6", color: CColors.buttonNumber),
                    Circle(txt: "-", color: CColors.buttonOperator),
                  ],
                ),
                Row(
                  children: [
                    Circle(txt: "1", color: CColors.buttonNumber),
                    Circle(txt: "2", color: CColors.buttonNumber),
                    Circle(txt: "3", color: CColors.buttonNumber),
                    Circle(txt: "+", color: CColors.buttonOperator),
                  ],
                ),
                Row(
                  children: [
                    Circle(txt: "%", color: CColors.buttonNumber),
                    Circle(txt: "0", color: CColors.buttonNumber),
                    Circle(txt: ".", color: CColors.buttonNumber),
                    Circle(txt: "=", color: CColors.buttonOperator),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// circle around every tirm
class Circle extends StatelessWidget {
  const Circle({super.key, required this.txt, required this.color, this.onPressed});

  final String txt;
  final Color color;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 3),
      width: appW * .23,
      child: CircleAvatar(
        radius: 50,
        backgroundColor: color,
        child: TextButton(
          onPressed: onPressed,
          child: Text(
            txt,
            style: TextStyle(
              color: CColors.textPrimary,
              fontSize: 35,
              fontWeight: FontWeight.normal,
            ),
          ),
        ),
      ),
    );
  }
}
