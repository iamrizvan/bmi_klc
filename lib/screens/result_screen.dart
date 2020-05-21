import 'package:flutter/material.dart';
import '../constants.dart';

class ResultPage extends StatelessWidget {
  final double bmi;
  ResultPage(this.bmi);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.only(top: 60),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Flexible(
            flex: 3,
            child: Padding(
              padding: const EdgeInsets.only(top: 40, left: 20, right: 20),
              child: Text("Your Result,",
                  style: Theme.of(context)
                      .textTheme
                      .headline
                      .copyWith(fontWeight: FontWeight.w400)),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Flexible(
            flex: 8,
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Container(
                padding: EdgeInsets.all(20),
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: kPrimaryColor.withOpacity(0.23),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(
                      height: 20,
                    ),
                    RichText(
                      text: TextSpan(children: [
                        TextSpan(
                            text: getWeightType().toUpperCase(),
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.green,
                              fontSize: 20,
                            ))
                      ]),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    RichText(
                      text: TextSpan(children: [
                        TextSpan(
                            text: bmi.toStringAsFixed(1),
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 60,
                            ))
                      ]),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    RichText(
                      text: TextSpan(children: [
                        TextSpan(
                            text: getBMIReport().toUpperCase(),
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              color: Colors.white,
                            ))
                      ]),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Flexible(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.only(left: 8, right: 8, top: 8),
              child: GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Container(
                    padding: EdgeInsets.all(10),
                    height: 40,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      color: kPrimaryColor.withOpacity(0.23),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Center(
                      child: Text(
                        "Re-Calculate",
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                    )),
              ),
            ),
          ),
        ],
      ),
    ));
  }

  String getWeightType() {
    if (bmi < 18.5) {
      return "underweight".toUpperCase();
    } else if (18.5 < bmi && bmi < 24.9) {
      return "normal weight".toUpperCase();
    } else if (25.0 < bmi && bmi < 29.9) {
      return "overweight".toUpperCase();
    } else if (30.0 < bmi && bmi < 34.9) {
      return "class I obesity".toUpperCase();
    } else if (35.0 < bmi && bmi < 39.9) {
      return "class II obesity".toUpperCase();
    } else if (40.0 < bmi) {
      return "class III obesity".toUpperCase();
    } else {
      return "Super obesity".toUpperCase();
    }
  }

  String getBMIReport() {
    if (bmi < 18.5) {
      return "You need put on some weight".toUpperCase();
    } else if (18.5 < bmi && bmi < 24.9) {
      return "You are in perfect shape".toUpperCase();
    } else if (25.0 < bmi && bmi < 29.9) {
      return "You need to loose some weight to get in shape.".toUpperCase();
    } else if (30.0 < bmi && bmi < 34.9) {
      return "You need to have proper diet with exercise".toUpperCase();
    } else if (35.0 < bmi && bmi < 39.9) {
      return "You need eat healthy, do some walking.".toUpperCase();
    } else if (40.0 < bmi) {
      return "You are at extreme, but it's OK".toUpperCase();
    } else {
      return "No need to worry about anything.".toUpperCase();
    }
  }
}
