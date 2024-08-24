import 'package:flutter/material.dart';

enum ColorState { red, green, orange }

snackbarCustom(BuildContext context, String title, TextTheme textTheme,
    ColorState colorState) {
  late Color backColor;
  switch (colorState) {
    case ColorState.red:
      backColor = Colors.red;
      break;
    case ColorState.green:
      backColor = Colors.green;
      break;

    case ColorState.orange:
      backColor = Colors.orange;
      break;
  }
  return ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      backgroundColor: backColor,
      duration: const Duration(seconds: 1),
      content: Text(
        title,
        style: textTheme.bodyLarge!.copyWith(fontWeight: FontWeight.w700),
      ),
   

      //  SnackBarAction(label: 'hi', onPressed: () {

      // },)
    ),
  );
}
