// ignore: unused_import
import 'package:f1app/colors/temas.dart';
import 'package:f1app/colors/themeProvider.dart';
import 'package:f1app/home_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (context) => ThemeProvider(),
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: Provider.of<ThemeProvider>(context).themeData,
      //darkTheme: darkMode,
      home: const HomePage(),
    );
  }
}
