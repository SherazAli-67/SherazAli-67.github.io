import 'package:flutter/material.dart';
import 'package:portfolio/src/features/home_page.dart';
import 'package:portfolio/src/provider/scroll_provider.dart';
import 'package:portfolio/src/provider/theme_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_)=> ThemeProvider(),),
      ChangeNotifierProvider(create: (_)=> ScrollProvider(),),

    ], child: const MyApp(),));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Sheraz Ali',
      theme: Provider.of<ThemeProvider>(context).themeData,
      home: const HomePage(),
    );
  }
}
