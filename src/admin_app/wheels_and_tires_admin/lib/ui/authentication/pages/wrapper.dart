import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wheels_and_tires_admin/auth/model/login_user_model.dart';
import 'package:wheels_and_tires_admin/ui/authentication/pages/sign_up_page.dart';
import 'package:wheels_and_tires_admin/ui/home/pages/home_page.dart';

import 'login_page.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // this wrapper class is here to monitor the auth changes, it returns home
    // page if the user is already logged in and login page if not instance of
    // login is present(no user is already logged in) or the user logged out.
    // provider is being used to monitor the UserStream in the auth method class

    final LoginUserModel user = Provider.of<LoginUserModel>(context);

    if (user == null) {
      return const ToggleBetweenLoginAndSignUpWidget();
    } else {
      return HomePage();
    }
  }
}

class ToggleBetweenLoginAndSignUpWidget extends StatelessWidget {
  const ToggleBetweenLoginAndSignUpWidget();

  static final ValueNotifier<bool> toggleValue = ValueNotifier<bool>(true);

  static void changePage() {
    toggleValue.value = !toggleValue.value;
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<bool>(
      valueListenable: toggleValue,
      builder: (_, bool value, Widget child) {
        if (value == true) {
          return const LoginPage(changePage);
        } else {
          return const SignUpPage(changePage);
        }
      },
    );
  }
}
