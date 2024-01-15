import 'package:flutter/material.dart';

class CustomTextFormFieldAuth extends StatelessWidget {
  const CustomTextFormFieldAuth(
      {Key? key,
      required this.hintText,
      required this.labelText,
      required this.iconData,
      required this.myController,
      required this.valid,required this.isNumber,this.obscuretext,this.onTapIcon})
      : super(key: key);

  final String hintText;
  final String labelText;
  final IconData iconData;
  final TextEditingController? myController;
  final String? Function(String?)? valid;
  final bool isNumber;
  final bool? obscuretext;
  final void Function()? onTapIcon;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      child: TextFormField(
        keyboardType:isNumber?TextInputType.numberWithOptions(decimal: true):TextInputType.text ,
        validator: valid,
        controller: myController,
        obscureText: obscuretext==null||obscuretext==false?false:true,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: const TextStyle(fontSize: 13),
          contentPadding: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
          label: Container(
              margin: const EdgeInsets.symmetric(horizontal: 9),
              child: Text(
                labelText,
              )),
          suffixIcon: InkWell(
            onTap: (){
onTapIcon;
            },
              child: Icon(iconData)),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
      ),
    );
  }
}
