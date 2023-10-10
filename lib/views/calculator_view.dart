import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CalculatorView extends StatefulWidget {
  @override
  State<CalculatorView> createState() => _CalculatorViewState();
}

class _CalculatorViewState extends State<CalculatorView> {
  int? x;
  int? y;
  num z = 0;

  final displayOneController = TextEditingController();
  final displayTwoController = TextEditingController();

  @override
  void initState() {
    super.initState();
    displayOneController.text = x == null ? "" : x.toString();
    displayTwoController.text = y == null ? "" : y.toString();
  }

  @override
  void dispose() {
    displayOneController.dispose();
    displayTwoController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(32.0),
      child: Column(
        children: [
          //Calculator Display
          CalculatorDisplay(
              key: const Key("displayOne"),
              hint: "Enter First Number",
              controller: displayOneController),
          SizedBox(
            height: 30.0,
          ),
          CalculatorDisplay(
              key: const Key("displayTwo"),
              hint: "Enter Second Number",
              controller: displayTwoController),
          SizedBox(
            height: 30.0,
          ),
          Text(
            key: const Key("Result"),
            z.toString(),
            style: TextStyle(
              fontSize: 60.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              FloatingActionButton(
                onPressed: () {
                  setState(() {
                    z = num.tryParse(displayOneController.text)! +
                        num.tryParse(displayTwoController.text)!;
                  });
                },
                child: Icon(CupertinoIcons.add),
              ),
              FloatingActionButton(
                onPressed: () {
                  setState(() {
                    z = num.tryParse(displayOneController.text)! -
                        num.tryParse(displayTwoController.text)!;
                  });
                },
                child: Icon(CupertinoIcons.minus),
              ),
              FloatingActionButton(
                onPressed: () {
                  setState(() {
                    z = num.tryParse(displayOneController.text)! *
                        num.tryParse(displayTwoController.text)!;
                  });
                },
                child: Icon(CupertinoIcons.multiply),
              ),
              FloatingActionButton(
                onPressed: () {
                  setState(() {
                    z = num.tryParse(displayOneController.text)! /
                        num.tryParse(displayTwoController.text)!;
                  });
                },
                child: Icon(CupertinoIcons.divide),
              ),
            ],
          ),
          SizedBox(
            height: 10.0,
          ),
          FloatingActionButton.extended(
            onPressed: () {
              setState(() {
                x = y = z = 0;
                displayOneController.clear();
                displayTwoController.clear();
              });
            },
            label: Text("Clear"),
          ),
          //Expand
          //Calculator Buttons
        ],
      ),
    );
  }
}

class CalculatorDisplay extends StatelessWidget {
  final String? hint;
  final TextEditingController controller;

  const CalculatorDisplay(
      {super.key, this.hint = "Enter a Number", required this.controller});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      keyboardType: TextInputType.number,
      autofocus: true,
      decoration: InputDecoration(
          border: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.black,
              width: 3.0,
            ),
            borderRadius: BorderRadius.circular(10.0),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.black,
              width: 3.0,
            ),
            borderRadius: BorderRadius.circular(10.0),
          ),
          hintText: hint,
          hintStyle: TextStyle(
            color: Colors.black,
          )),
    );
  }
}
