import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:gym_managment/components/strings.dart';
import 'package:gym_managment/screens/home/home.dart';

import 'appbar.dart';

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
      body: HomeScreen(
        userState: userState == 0 ? 0 : 1,
      ),
      appBar: AppBar(
        title: Appbar(textTheme: textTheme,userState: userState,),
      ),
      bottomNavigationBar: SizedBox(
        height: 67,
        child: Column(
          children: [
            AnimatedAlign(
              curve: Curves.linearToEaseOut,
              alignment: userState == 0
                  ? (context.locale == const Locale('en', 'US')
                      ? Alignment.centerLeft
                      : Alignment.centerRight)
                  : (context.locale == const Locale('en', 'US')
                      ? Alignment.centerRight
                      : Alignment.centerLeft),
              duration: const Duration(milliseconds: 500),
              child: Container(
                height: 2,
                width: MediaQuery.of(context).size.width / 2,
                color: color.primary,
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
                    height: 65,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.local_activity_rounded,
                          color: userState != 0
                              ? Colors.grey.shade400
                              : color.primary,
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Text(
                          AppStrings.activeUser.tr(),
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
                    height: 65,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.local_activity_outlined,
                          color: userState != 1
                              ? Colors.grey.shade400
                              : color.primary,
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Text(
                          AppStrings.notactiveUser.tr(),
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
