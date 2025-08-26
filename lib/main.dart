import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/src/constants/string_constant.dart';
import 'package:portfolio/src/features/home_page.dart';
import 'package:portfolio/src/provider/scroll_provider.dart';
import 'package:portfolio/src/provider/theme_provider.dart';
import 'package:portfolio/src/provider/portfolio_data_provider.dart';
import 'package:provider/provider.dart';

import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_)=> ThemeProvider(),),
      ChangeNotifierProvider(create: (_)=> ScrollProvider(),),
      ChangeNotifierProvider(create: (_)=> PortfolioDataProvider(),),
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
