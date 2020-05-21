import 'package:flutter/material.dart';

class GreetingText extends StatelessWidget {
  const GreetingText({
    Key key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Flexible(
      flex: 3,
        child: Padding(
        padding: const EdgeInsets.only(top: 40, left: 20, right: 20),
        child: Text("Hi There,\nTry BMI Calculator",
            style: Theme.of(context)
                .textTheme
                .headline
                .copyWith(fontWeight: FontWeight.w400)),
      ),
    );
  }
}