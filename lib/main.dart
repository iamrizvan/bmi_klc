import 'package:bmi_klc/constants.dart';
import 'package:flutter/material.dart';
import './widget/greetings.dart';
import './screens/result_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
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
  String result;
  bool isMale = true;
  double rating = 168;
  String pHeight = "169";
  int pAge = 20;
  int pWeight = 55;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          GreetingText(),
          Flexible(
            flex: 4,
            child: Padding(
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
                        border: Border.all(
                            color: isMale ? Colors.cyan : Colors.white)),
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          toggleGender();
                        });
                      },
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
                  ),
                  Container(
                    padding: EdgeInsets.all(10),
                    height: 120,
                    width: MediaQuery.of(context).size.width / 2 - 10,
                    decoration: BoxDecoration(
                        color: kPrimaryColor.withOpacity(0.23),
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                            color: !isMale ? Colors.cyan : Colors.white)),
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          toggleGender();
                        });
                      },
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
                    ),
                  )
                ],
              ),
            ),
          ),
          Flexible(
            flex: 4,
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Container(
                padding: EdgeInsets.all(20),
                height: 120,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: kPrimaryColor.withOpacity(0.23),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  children: <Widget>[
                    Slider(
                      value: rating,
                      onChanged: (newRating) {
                        setState(() {
                          rating = newRating;
                          pHeight = newRating.toInt().toString();
                        });
                      },
                      min: 70,
                      max: 280,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    RichText(
                      text: TextSpan(children: [
                        TextSpan(
                            text: "$pHeight",
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 40,
                            )),
                        TextSpan(
                            text: "cm",
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                            ))
                      ]),
                    )
                  ],
                ),
              ),
            ),
          ),
          Flexible(
            flex: 4,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    height: 120,
                    width: MediaQuery.of(context).size.width / 2 - 10,
                    decoration: BoxDecoration(
                      color: kPrimaryColor.withOpacity(0.23),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Column(
                      children: <Widget>[
                        Flexible(
                          fit: FlexFit.tight,
                          flex: 4,
                          child: Center(
                            child: RichText(
                              text: TextSpan(children: [
                                TextSpan(
                                    text: "$pAge",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 40)),
                                TextSpan(
                                    text: "Yr",
                                    style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                    ))
                              ]),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 30, right: 30, bottom: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    pAge = pAge + 1;
                                  });
                                },
                                child: Icon(
                                  Icons.exposure_plus_1,
                                  color: Colors.white,
                                  size: 30,
                                ),
                              ),
                              GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      pAge = pAge - 1;
                                    });
                                  },
                                  child: Icon(
                                    Icons.exposure_neg_1,
                                    color: Colors.white,
                                    size: 30,
                                  ))
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    height: 120,
                    width: MediaQuery.of(context).size.width / 2 - 10,
                    decoration: BoxDecoration(
                      color: kPrimaryColor.withOpacity(0.23),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Column(
                      children: <Widget>[
                        Flexible(
                          fit: FlexFit.tight,
                          flex: 4,
                          child: Center(
                            child: RichText(
                              text: TextSpan(children: [
                                TextSpan(
                                    text: "$pWeight",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 40)),
                                TextSpan(
                                    text: "Kg",
                                    style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                    ))
                              ]),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 30, right: 30, bottom: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    pWeight = pWeight + 1;
                                  });
                                },
                                child: Icon(
                                  Icons.exposure_plus_1,
                                  color: Colors.white,
                                  size: 30,
                                ),
                              ),
                              GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      pWeight = pWeight - 1;
                                    });
                                  },
                                  child: Icon(
                                    Icons.exposure_neg_1,
                                    color: Colors.white,
                                    size: 30,
                                  ))
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Flexible(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.only(left: 8, right: 8, top: 8),
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    calculateBMI();
                  });
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
                        "Calculate",
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                    )),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void toggleGender() {
    isMale = !isMale;
  }

  void calculateBMI() {
    double height = double.parse(pHeight) / 100;
    double bmi = pWeight / (height * height);
    setState(() {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (BuildContext context) => ResultPage(bmi)));
    });
  }
}
