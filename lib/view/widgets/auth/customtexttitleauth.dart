
import 'package:flutter/material.dart';

class CustomTextTitleAuth extends StatelessWidget {
  const CustomTextTitleAuth({Key? key, required this.text}) : super(key: key);
final String text;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: TextAlign.center,
      style: Theme.of(context).textTheme.headline2,
    );
  }
}
