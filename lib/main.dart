import 'package:flutter/material.dart';
import 'package:newsapplication/Utils/colors.dart';

import 'Pages/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Tech News ',
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: AppColors.primary
      ),
      home: const Home(),
    );
  }
}
