import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:gym_managment/components/strings.dart';
import 'package:gym_managment/main.dart';
import 'package:gym_managment/utils/snackbar.dart';

class appbar extends StatelessWidget {
  const appbar({
    super.key,
    required this.textTheme,
  });

  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          AppStrings.appbarTitle.tr(),
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
                    ? Icons.dark_mode_rounded
                    : Icons.dark_mode_outlined,
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
            IconButton(
              iconSize: 24,
              onPressed: () {
                snackbarCustom(
                    context,
                    isDarkMode.value == false
                        ? AppStrings.goPersianMode.tr()
                        : AppStrings.goEnglishMode.tr(),
                    textTheme,
                    ColorState.green);
                isDarkMode.value = !isDarkMode.value;
                isDarkModeState.setBool('darkmode', isDarkMode.value);
    
                context.setLocale(context.locale == Locale('fa', 'IR')
                    ? Locale('en', 'US')
                    : Locale('fa', 'IR'));
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
    );
  }
}
