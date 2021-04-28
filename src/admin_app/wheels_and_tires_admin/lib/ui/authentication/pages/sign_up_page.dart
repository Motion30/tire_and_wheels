import 'package:flutter/material.dart';
import 'package:wheels_and_tires_admin/ui/authentication/widgets/sign_up_widget.dart';
import 'package:wheels_and_tires_admin/ui/shared_widgets/header_widget.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage(this.callBack);

  final Function callBack;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
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
          const SizedBox(height: 40),
          SignUpPageMessage(size: size),
          SignUpPageForm(size: size),
          SignUpPageMoreOptions(size: size, navigate: () => callBack()),
        ],
      ),
    );
  }
}
