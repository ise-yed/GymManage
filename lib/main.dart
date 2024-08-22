import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:gym_managment/components/themes.dart';
import 'package:gym_managment/data/models/user.dart';
import 'package:gym_managment/screen/root/root.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

ValueNotifier<bool> isDarkMode = ValueNotifier(false);
String boxValue = 'gym-data';
late SharedPreferences isDarkModeState;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  await Hive.initFlutter();
  Hive.registerAdapter(UserModelAdapter());
  var box = await Hive.openBox<UserModel>(boxValue);
  isDarkModeState = await SharedPreferences.getInstance();
  isDarkMode.value = isDarkModeState.getBool('darkmode') ?? false;
  runApp(
    EasyLocalization(
      supportedLocales: [const Locale('en', 'US'), const Locale('fa', 'IR')],
      path: 'assets/translations', // مسیر فایل‌های ترجمه
      startLocale: const Locale('fa', 'IR'),
      saveLocale: true,
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: isDarkMode,
      builder: (context, value, child) {
        return MaterialApp(
          theme: lightTheme('dana'),
          darkTheme: darkTheme('dana'),
          themeMode: value == false ? ThemeMode.light : ThemeMode.dark,
          localizationsDelegates: context.localizationDelegates,
          supportedLocales: context.supportedLocales,
          locale: context.locale,
          home: const RootScreen(),
        );
      },
    );
  }
}
