import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:tire_website/service_locator.dart';
import 'package:tire_website/web_app.dart';
import 'package:url_strategy/url_strategy.dart';

Future<void> main() async {
  setPathUrlStrategy();

  WidgetsFlutterBinding.ensureInitialized();
  // await FirebaseFirestore.instance.enablePersistence();
  await Firebase.initializeApp();

  ServiceLocator.setup();

  runApp(WebApp());
}
