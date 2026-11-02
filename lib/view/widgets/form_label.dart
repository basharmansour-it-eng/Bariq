import 'package:bariq/core/constant/const.dart';
import 'package:flutter/material.dart';


/// عنوان حقل أو مجموعة خيارات في النماذج.
class FormLabel extends StatelessWidget {
  final String text;

  const FormLabel(this.text, {super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontFamily: cairo,
        fontWeight: FontWeight.w700,
        color: darkNavy,
      ),
    );
  }
}