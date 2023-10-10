import 'package:flutter/material.dart';
import 'package:flutter_calculator/views/calculator_view.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepOrange,
      body: SafeArea(
        child: CalculatorView(),
      ),
    );
  }
}