import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:simple_calculator/features/calculate/presentation/cubit/calculate_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/const/calculator_colors.dart';
import '../../../../core/utils/tools.dart';

class CalculatorPage extends StatefulWidget {
  const CalculatorPage({super.key});

  @override
  State<CalculatorPage> createState() => _CalculatorPageState();
}

class _CalculatorPageState extends State<CalculatorPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            height: appH(context) * .38,
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
                  sizeH(appH(context) / 24),

                  // Number diplay
                  BlocBuilder<CalculateCubit, CalculateState>(
                    builder: (context, state) {
                      log(state.expression);
                      return Text(
                        state.expression,
                        style: TextStyle(
                          color: CColors.textPrimary,
                          fontSize: 55,
                          fontWeight: FontWeight.w400,
                        ),
                      );
                    },
                  ),
                  BlocBuilder<CalculateCubit, CalculateState>(
                    builder: (context, state) {
                      return Text(
                        state.result,

                        style: TextStyle(
                          color: CColors.textSecondary,
                          fontSize: 30,
                          fontWeight: FontWeight.w500,
                        ),
                      );
                    },
                  ),
                  Spacer(),
                  Divider(
                    thickness: 5,
                    indent: appW(context) / 2.4,
                    endIndent: appW(context) / 2.4,
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
                    Circle(txt: "⌫", color: CColors.buttonOperator),
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

class Circle extends StatelessWidget {
  final String txt;
  final Color color;

  const Circle({super.key, required this.color, required this.txt});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<CalculateCubit>();
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 3),
      width: appW(context) * .23,
      child: CircleAvatar(
        radius: 42,
        backgroundColor: color,
        child: TextButton(
          onPressed: () {
            switch (txt) {
              case "AC":
                cubit.clear();
                break;
              case "=":
                cubit.calculated();
                break;
              case "÷":
                cubit.addValue("/");
                break;
              case "×":
                cubit.addValue("*");
                break;
              case "%":
                cubit.persentage("%");
                break;
              case ".":
                cubit.addValue(".");
                break;
              case "⌫":
                cubit.deleteLast();
                break;
              case "()":
                cubit.addParenthesis();
                break;
              default:
                cubit.addValue(txt);
            }
          },
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
