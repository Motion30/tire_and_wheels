import 'package:flutter/material.dart';
import 'package:tire_website/ui/authentication/widgets/login_widget.dart';
import 'package:tire_website/ui/shared_widgets/header_widget.dart';

class LoginPage extends StatelessWidget {
  const LoginPage(this.callBack);

  final Function callBack;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        body: body(context),
      ),
    );
  }

  Widget body(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          const HeaderWidget(fontSize: 20, showCart: false),
          const SizedBox(height: 20),
          LoginPageMessage(size: size),
          LoginPageForm(size: size),
          LoginPageMoreOptions(size: size, navigate: () => callBack()),
        ],
      ),
    );
  }
}
