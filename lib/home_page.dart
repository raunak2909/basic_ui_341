import 'dart:math';

import 'package:flutter/material.dart';

class HomePage extends StatefulWidget{

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController wtController = TextEditingController();

  TextEditingController htInController = TextEditingController();

  TextEditingController htFtController = TextEditingController();

  String bmi = "";
  Color bgColor = Colors.white;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        title: Text('BMI'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 11.0),
        child: Column(
          children: [
            Text("Calculate BMI", style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),),
            SizedBox(
              height: 21,
            ),
            Row(
              children: [
                Icon(
                    Icons.line_weight
                ),
                SizedBox(
                  width: 21,
                ),
                Expanded(
                  child: TextField(
                    controller: wtController,
                    decoration: InputDecoration(
                        label: Text('Weight(in KGs)'),
                        hintText: "Enter your weight here..",
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(21)
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(21)
                        )
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 11,
            ),
            TextField(
              controller: htFtController,
              decoration: InputDecoration(
                  label: Text('Height(in feets)'),
                  hintText: "Enter your height in feet here..",
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(21)
                  ),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(21)
                  )
              ),
            ),
            SizedBox(
              height: 11,
            ),
            TextField(
              controller: htInController,
              decoration: InputDecoration(
                  label: Text('Height(in inches)'),
                  hintText: "Enter your height in inches here..",
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(21)
                  ),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(21)
                  )
              ),
            ),
            SizedBox(
              height: 21,
            ),
            ElevatedButton(onPressed: (){

              ///////BMI////////
              num wt = double.parse(wtController.text.toString());
              num htFeet = int.parse(htFtController.text.toString());
              num htInch = int.parse(htInController.text.toString());

              num totalInches = (htFeet*12) + htInch;
              num totalCm = totalInches * 2.54;
              num totalM = totalCm/100;

              num bmiValue = wt/(pow(totalM, 2.0));

              bmi = "Your BMI is ${bmiValue.toStringAsFixed(2)}";

              print(bmi);


              if(bmiValue>25){
                bgColor = Colors.red.shade200;
              } else if(bmiValue<18){
                bgColor = Colors.orange.shade200;
              } else {
                bgColor = Colors.green.shade200;
              }

              setState(() {

              });


            }, child: Text('Calculate')),
            SizedBox(
              height: 11,
            ),
            Text(bmi)
          ],
        ),
      ),
    );
  }
}