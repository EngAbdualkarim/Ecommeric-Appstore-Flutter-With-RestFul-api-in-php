import 'package:flutter/material.dart';
class CustomTextBodyAuth extends StatelessWidget {
  const CustomTextBodyAuth({Key? key, required this.text}) : super(key: key);

  final String text;
  @override
  Widget build(BuildContext context) {
    return Container(
    margin:const EdgeInsets.symmetric(horizontal: 25),
child: Text(
text,
textAlign: TextAlign.center,
style: Theme.of(context).textTheme.bodyText2,
),
);
  }
}
