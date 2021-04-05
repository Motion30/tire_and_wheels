import 'package:flutter/material.dart';
import 'package:tire_website/ui/home/pages/home_page.dart';

class WebApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Blue Fiber',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        backgroundColor: Colors.white,
        scaffoldBackgroundColor: Colors.white,
        primaryColor: const Color.fromRGBO(2, 8, 144, 1),
        accentColor: const Color.fromRGBO(255, 129, 38, 1),
      ),
      home: HomePage(),
    );
  }
}
