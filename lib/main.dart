import 'package:flutter/material.dart';
import 'package:gym_managment/components/themes.dart';
import 'package:gym_managment/data/models/user.dart';
import 'package:gym_managment/screens/root/root.dart';
import 'package:hive_flutter/hive_flutter.dart';

ValueNotifier<bool> isDarkMode = ValueNotifier(false);
String boxValue = 'gym-data';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(UserModelAdapter());
  var box = await Hive.openBox<UserModel>(boxValue);

  runApp(const MyApp());
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
          home: const RootScreen(),
        );
      },
    );
  }
}
