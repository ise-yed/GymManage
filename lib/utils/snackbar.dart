import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gym_managment/components/strings.dart';

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
      duration: Duration(seconds: 1),
      content: Text(
        title,
        style: textTheme.bodyLarge,
      ),
      action: SnackBarAction(
        label: AppStrings.ok,
        onPressed: () {
          Navigator.pop(context);
        },
      ),

      //  SnackBarAction(label: 'hi', onPressed: () {

      // },)
    ),
  );
}
