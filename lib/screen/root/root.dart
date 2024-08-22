import 'package:flutter/material.dart';
import 'package:gym_managment/components/strings.dart';
import 'package:gym_managment/main.dart';
import 'package:gym_managment/utils/snackbar.dart';

class RootScreen extends StatefulWidget {
  const RootScreen({super.key});

  @override
  State<RootScreen> createState() => _RootScreenState();
}

class _RootScreenState extends State<RootScreen> {
  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              AppStrings.appbarTitle,
              style: textTheme.bodyLarge,
            ),
            Row(
              children: [
                IconButton(
                  onPressed: () {
                    snackbarCustom(
                        context,
                        isDarkMode.value == false
                            ? AppStrings.goDarkMode
                            : AppStrings.goLightMode,
                        textTheme,
                        ColorState.green);
                    isDarkMode.value = !isDarkMode.value;
                    isDarkModeState.setBool('darkmode', isDarkMode.value);
                  },
                  icon: Icon(isDarkMode.value != false
                      ? Icons.dark_mode_outlined
                      : Icons.dark_mode_rounded),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
