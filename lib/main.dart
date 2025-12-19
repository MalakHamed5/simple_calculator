import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simple_calculator/features/calculate/presentation/cubit/calculate_cubit.dart';
import 'package:simple_calculator/features/calculate/presentation/pages/calculate_page.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      systemNavigationBarColor: Colors.transparent,
      systemNavigationBarIconBrightness: Brightness.dark,
    ),
  );

  runApp(Calculator());
}

class Calculator extends StatelessWidget {
  const Calculator({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CalculateCubit(),
      child: MaterialApp(debugShowCheckedModeBanner: false, home: const CalculatorPage()),
    );
  }
}
