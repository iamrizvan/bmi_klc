import 'package:bmi_klc/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BMI Calculator',
      theme: ThemeData(
        fontFamily: "Poppins",
        scaffoldBackgroundColor: kWhiteColor,
        primaryColor: kPrimaryColor,
        textTheme: TextTheme(
          headline: TextStyle(fontWeight: FontWeight.bold),
          button: TextStyle(fontWeight: FontWeight.bold),
          title: TextStyle(fontWeight: FontWeight.bold),
        ),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  double pheight;
  HomeScreen({this.pheight});

  @override
  State<StatefulWidget> createState() {
    return HomePage();
  }
}

class HomePage extends State {
  double rating = 168;
  String pHeight = "169";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 50, left: 20, right: 20),
            child: Text("Hi There,\nTry BMI Calculator",
                style: Theme.of(context)
                    .textTheme
                    .headline
                    .copyWith(fontWeight: FontWeight.w400)),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  padding: EdgeInsets.all(10),
                  height: 120,
                  width: MediaQuery.of(context).size.width / 2 - 10,
                  decoration: BoxDecoration(
                    color: kPrimaryColor.withOpacity(0.23),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Column(
                    children: <Widget>[
                      Spacer(),
                      Container(
                        height: 70,
                        width: 70,
                        child: Image.asset(
                          "assets/images/male.png",
                          color: Colors.white,
                        ),
                      ),
                      Text("Male")
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(10),
                  height: 120,
                  width: MediaQuery.of(context).size.width / 2 - 10,
                  decoration: BoxDecoration(
                    color: kPrimaryColor.withOpacity(0.23),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Column(
                    children: <Widget>[
                      Spacer(),
                      Container(
                        height: 70,
                        width: 70,
                        child: Image.asset(
                          "assets/images/female.png",
                          color: Colors.white,
                        ),
                      ),
                      Text("Female")
                    ],
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Container(
              padding: EdgeInsets.all(20),
              height: 120,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: kPrimaryColor.withOpacity(0.23),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                children: <Widget>[
                  Spacer(),
                  Slider(
                    value: rating,
                    onChanged: (newRating) {
                      setState(() {
                        rating = newRating;
                        pHeight = newRating.toInt().toString();
                      });
                    },
                    min: 80,
                    max: 250,
                  ),
                  Spacer(),
                  Text("Your height is $pHeight cm")
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  padding: EdgeInsets.all(20),
                  height: 120,
                  width: MediaQuery.of(context).size.width / 2 - 10,
                  decoration: BoxDecoration(
                    color: kPrimaryColor.withOpacity(0.23),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Column(
                    children: <Widget>[Spacer(), Text("Age")],
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(20),
                  height: 120,
                  width: MediaQuery.of(context).size.width / 2 - 10,
                  decoration: BoxDecoration(
                    color: kPrimaryColor.withOpacity(0.23),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Column(
                    children: <Widget>[
                      Spacer(),
                      SvgPicture.asset("assets/images/female.png"),
                      Spacer(),
                      Text("Weight")
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
