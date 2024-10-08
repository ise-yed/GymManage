import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:gym_managment/components/themes.dart';
import 'package:gym_managment/data/models/user.dart';
import 'package:gym_managment/screens/root/root.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

ValueNotifier<bool> isDarkMode = ValueNotifier(false);
String boxValue = 'gym-datas';
late SharedPreferences isDarkModeState;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  await Hive.initFlutter();
  Hive.registerAdapter(UserModelAdapter());
  await Hive.openBox<UserModel>(boxValue);
  isDarkModeState = await SharedPreferences.getInstance();
  isDarkMode.value = isDarkModeState.getBool('darkmode') ?? false;
  runApp( 
    EasyLocalization(
      supportedLocales: const [Locale('en', 'US'), Locale('fa', 'IR')],
      path: 'assets/translations', 
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
    var size = MediaQuery.of(context).size;
    return ValueListenableBuilder(
      valueListenable: isDarkMode,
      builder: (context, value, child) {
        return MaterialApp(debugShowCheckedModeBanner: false,
          theme: lightTheme('dana', size),
          darkTheme: darkTheme('dana', size),
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
