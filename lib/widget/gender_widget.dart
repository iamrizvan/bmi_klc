import 'package:flutter/material.dart';
import '../constants.dart';

class GenderWidget extends StatefulWidget {
  bool isMale;
  GenderWidget({this.isMale});
   @override
  State<StatefulWidget> createState() {
    return GenderPage();
  }
} 

class GenderPage extends State{
  bool isMale;
  GenderPage({this.isMale});
  @override
  Widget build(BuildContext context) {
    return Flexible(
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
                border: Border.all(color: isMale ? Colors.cyan:Colors.white)
              ),
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
                border: Border.all(color: !isMale ? Colors.cyan:Colors.white)
              ),
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
    );
  }

  
   void toggleGender()
  { 
       isMale = !isMale;
  }

}