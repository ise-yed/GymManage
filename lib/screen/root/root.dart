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
              style: textTheme.bodyLarge!.copyWith(fontWeight: FontWeight.w700),
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
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
                  icon: Icon(
                    isDarkMode.value != false
                        ? Icons.dark_mode_outlined
                        : Icons.dark_mode_rounded,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
                IconButton(
                  iconSize: 24,
                  onPressed: () {
                    snackbarCustom(
                        context,
                        isDarkMode.value == false
                            ? AppStrings.goEnglishMode
                            : AppStrings.goPersianMode,
                        textTheme,
                        ColorState.green);
                    isDarkMode.value = !isDarkMode.value;
                    isDarkModeState.setBool('darkmode', isDarkMode.value);
                  },
                  icon: Icon(
                    isDarkMode.value != false
                        ? Icons.language_rounded
                        : Icons.language_rounded,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
   
   
   
   
    );
  }
}
