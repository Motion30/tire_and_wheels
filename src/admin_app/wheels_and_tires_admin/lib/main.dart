import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:wheels_and_tires_admin/auth/repo/authentication_repo.dart';
import 'package:wheels_and_tires_admin/ui/authentication/pages/wrapper.dart';

import 'auth/model/login_user_model.dart';
import 'bloc_list.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: blocList(context),
      child: StreamProvider<LoginUserModel>.value(
        value: AuthenticationRepo().userStream,
        child: MaterialApp(
          title: 'Admin app',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            backgroundColor: Colors.white,
            scaffoldBackgroundColor: Colors.white,
            primaryColor: const Color.fromRGBO(2, 8, 144, 1),
            accentColor: const Color.fromRGBO(255, 129, 38, 1),
          ),
          home: Wrapper(),
        ),
      ),
    );
  }
}
