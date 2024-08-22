import 'package:flutter/material.dart';
import 'package:gym_managment/components/themes.dart';
import 'package:gym_managment/data/models/user.dart';
import 'package:gym_managment/screens/root/root.dart';
import 'package:hive_flutter/hive_flutter.dart';

String boxValue = 'gym-data';
void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(UserModelAdapter());
  var box = await Hive.openBox<UserModel>(boxValue);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: lightTheme(),
      darkTheme: darkTheme(),
      home: const RootScreen(),
    );
  }
}
