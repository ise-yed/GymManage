import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gym_managment/components/strings.dart';
import 'package:gym_managment/main.dart';
import 'package:gym_managment/utils/snackbar.dart';

class RootScreen extends StatefulWidget {
  const RootScreen({super.key});

  @override
  State<RootScreen> createState() => _RootScreenState();
}

class _RootScreenState extends State<RootScreen> {
  int userState = 0;
  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;
    var color = Theme.of(context).colorScheme;
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
      bottomNavigationBar: Container(
        height: 72,
        child: Column(
          children: [
      
            AnimatedAlign(curve: Curves.bounceOut,
              alignment:
                  userState == 0 ? Alignment.centerLeft : Alignment.centerRight,
              duration: Duration(milliseconds: 100),
              child: Container(
                height: 2,
                width: MediaQuery.of(context).size.width / 2,
                color:  color.primary,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                    child: InkWell(
                  onTap: () {
                    setState(() {
                      userState = 0;
                    });
                  },
                  child: SizedBox(
                    height: 70,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.local_activity_rounded,
                          color: userState != 0
                              ? Colors.grey.shade400
                              : color.primary,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          AppStrings.activeUser,
                          style: textTheme.bodyMedium!.copyWith(
                            fontWeight: FontWeight.w700,
                            color: userState != 0
                                ? Colors.grey.shade400
                                : color.primary,
                          ),
                        )
                      ],
                    ),
                  ),
                )),
                Expanded(
                    child: InkWell(
                  onTap: () {
                    setState(() {
                      userState = 1;
                    });
                  },
                  child: SizedBox(
                    height: 70,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.local_activity_outlined,
                          color: userState != 1
                              ? Colors.grey.shade400
                              : color.primary,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          AppStrings.NotactiveUser,
                          style: textTheme.bodyMedium!.copyWith(
                            fontWeight: FontWeight.w700,
                            color: userState != 1
                                ? Colors.grey.shade400
                                : color.primary,
                          ),
                        )
                      ],
                    ),
                  ),
                ))
              ],
            )
          ],
        ),
      ),
    );
  }
}
