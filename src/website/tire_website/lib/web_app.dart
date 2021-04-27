import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tire_website/bloc_list.dart';
import 'package:tire_website/ui/product/pages/product_page.dart';

class WebApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: blocList(context),
      child: MaterialApp(
        title: 'Wheels And Tyres',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          backgroundColor: Colors.white,
          scaffoldBackgroundColor: Colors.white,
          primaryColor: const Color.fromRGBO(2, 8, 144, 1),
          accentColor: const Color.fromRGBO(255, 129, 38, 1),
        ),
        home: const ProductPage(),
        // home: const ToggleBetweenLoginAndSignUpWidget(),
      ),
    );
  }
}
