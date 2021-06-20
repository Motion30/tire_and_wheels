import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tire_website/bloc_list.dart';
import 'package:tire_website/business_logic/auth/model/route.dart';
import 'package:tire_website/ui/authentication/pages/wrapper.dart';
import 'package:tire_website/ui/cart/cart_page.dart';
import 'package:tire_website/ui/chat/chat_page.dart';
import 'package:tire_website/ui/error.dart';
import 'package:tire_website/ui/home/pages/home_page.dart';
import 'package:tire_website/ui/order/orders_page.dart';
import 'package:tire_website/ui/order_summary/order_sent_page.dart';
import 'package:tire_website/ui/order_summary/order_summary_page.dart';
import 'package:tire_website/ui/product/pages/product_page.dart';
import 'package:tire_website/ui/settings/settings_page.dart';
import 'package:velocity_x/velocity_x.dart';

class WebApp extends StatefulWidget {
  @override
  _WebAppState createState() => _WebAppState();
}

class _WebAppState extends State<WebApp> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: blocList(context),
      child: MaterialApp.router(
        title: 'Wheels And Tyres',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          backgroundColor: Colors.white,
          scaffoldBackgroundColor: Colors.white,
          primaryColor: const Color.fromRGBO(2, 8, 144, 1),
          accentColor: const Color.fromRGBO(255, 129, 38, 1),
        ),
        routeInformationParser: VxInformationParser(),
        routerDelegate: _routerDelegate,
      ),
    );
  }

  final VxNavigator _routerDelegate = VxNavigator(
    notFoundPage: (Uri uri, dynamic params) => MaterialPage<Widget>(
      key: const ValueKey<String>('not-found-page'),
      child: Builder(
        builder: (BuildContext context) => Scaffold(
          body: Center(
            child: Text('Page ${uri.path} not found'),
          ),
        ),
      ),
    ),
    routes: <String, Page<dynamic> Function(Uri, dynamic)>{
      // RouteClass.home: (Uri uri, dynamic params) =>
      // const MaterialPage<Widget>(child: ErrorPage()),
      RouteClass.home: (Uri uri, dynamic params) =>
          MaterialPage<Widget>(child: HomePage()),
      RouteClass.authPage: (Uri uri, dynamic params) =>
          const MaterialPage<Widget>(
              child: ToggleBetweenLoginAndSignUpWidget()),
      RouteClass.productTyresPage: (Uri uri, dynamic params) =>
          const MaterialPage<Widget>(child: ProductPage(type: 'Tyres')),
      RouteClass.productRimPage: (Uri uri, dynamic params) =>
          const MaterialPage<Widget>(child: ProductPage(type: 'Rims')),
      RouteClass.productTubePage: (Uri uri, dynamic params) =>
          const MaterialPage<Widget>(child: ProductPage(type: 'Tubes')),
      RouteClass.cartPage: (Uri uri, dynamic params) {
        return const MaterialPage<Widget>(child: CartPage());
      },
      RouteClass.settingsPage: (Uri uri, dynamic params) =>
          const MaterialPage<Widget>(child: SettingsPage()),
      RouteClass.ordersPage: (Uri uri, dynamic params) =>
          const MaterialPage<Widget>(child: OrdersPage()),
      RouteClass.orderSummary: (Uri uri, dynamic params) =>
          const MaterialPage<Widget>(child: OrderSummaryPage()),
      RouteClass.orderComplete: (Uri uri, dynamic params) =>
          const MaterialPage<Widget>(child: OrderCompletePage()),
      RouteClass.chat: (Uri uri, dynamic params) =>
          const MaterialPage<Widget>(child: ChatPage()),
    },
  );
}
