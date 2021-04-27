import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:tire_website/business_logic/auth/repo/authentication_repo.dart';
import 'package:tire_website/ui/home/pages/home_page.dart';
import 'package:tire_website/ui/shared_widgets/custom_button.dart';
import 'package:tire_website/ui/shared_widgets/custom_dialog.dart';
import 'package:tire_website/ui/shared_widgets/custom_textfield.dart';

import '../../shared_widgets/custom_text.dart';

class SignUpPageMessage extends StatelessWidget {
  const SignUpPageMessage({this.size});

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          width: size.width,
          padding: const EdgeInsets.only(left: 30.0, top: 20.0),
          child: const CustomText(
            text: 'Create An Account',
            size: 25.0,
            fontWeight: FontWeight.bold,
            textAlign: TextAlign.center,
          ),
        ),
        const SizedBox(height: 10.0),
        SizedBox(
          width: size.width,
          child: const CustomText(
            text: 'It’s quick and easy',
            size: 18.0,
            fontWeight: FontWeight.w300,
            textAlign: TextAlign.center,
            // color: Theme.of(context).accentColor,
          ),
        ),
      ],
    );
  }
}

class SignUpPageForm extends StatefulWidget {
  const SignUpPageForm({this.size});

  final Size size;

  @override
  _SignUpPageFormState createState() => _SignUpPageFormState();
}

class _SignUpPageFormState extends State<SignUpPageForm> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController userNameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final ValueNotifier<bool> isLoading = ValueNotifier<bool>(false);

  Future<void> validate() async {
    final FormState formState = formKey.currentState;

    if (formState.validate()) {
      final String email = emailController.text.trim();
      final String password = passwordController.text.trim();
      final int phone = int.parse(phoneController.text.trim());
      final String fullName = fullNameController.text.trim();
      final String userName = userNameController.text.trim();

      isLoading.value = true;
      final AuthenticationRepo auth = AuthenticationRepo();

      try {
        await auth.registerUserWithEmailAndPassword(
          email: email,
          password: password,
          fullName: fullName,
          phoneNumber: phone,
          userName: userName,
        );

        debugPrint('SignUp successfull');
        Navigator.of(context).pushReplacement(
          MaterialPageRoute<Widget>(
            builder: (_) => HomePage(),
          ),
        );
      } catch (e) {
        debugPrint(e.toString());
        CustomWarningDialog.showCustomDialog(
          context: context,
          title: 'Warning',
          message: e.toString(),
        );
      }

      isLoading.value = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.size.width,
      padding: const EdgeInsets.symmetric(horizontal: 60.0, vertical: 5.0),
      decoration: const BoxDecoration(color: Colors.white),
      child: Form(
        key: formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            const CustomText(
              text: 'Full Name',
              size: 18,
              fontWeight: FontWeight.w300,
              textAlign: TextAlign.center,
            ),
            CustomTextField(
              controller: fullNameController,
              title: 'John Smith',
              length: 3,
            ),
            const SizedBox(height: 15.0),
            const CustomText(
              text: 'Email',
              size: 18,
              fontWeight: FontWeight.w300,
              textAlign: TextAlign.center,
            ),
            CustomTextField(
              controller: emailController,
              title: 'example@gmail.com',
            ),
            const SizedBox(height: 15.0),
            const CustomText(
              text: 'Username',
              size: 18,
              fontWeight: FontWeight.w300,
              textAlign: TextAlign.center,
            ),
            CustomTextField(
              controller: userNameController,
              title: 'testUser',
              length: 3,
            ),
            const SizedBox(height: 15.0),
            const CustomText(
              text: 'PhoneNumber',
              size: 18,
              fontWeight: FontWeight.w300,
              textAlign: TextAlign.center,
            ),
            CustomTextField(
              controller: phoneController,
              title: '08011223344',
              keyboardType: TextInputType.number,
              length: 10,
            ),
            const SizedBox(height: 15.0),
            const CustomText(
              text: 'Password',
              size: 18,
              fontWeight: FontWeight.w300,
              textAlign: TextAlign.center,
            ),
            CustomTextField(
              controller: passwordController,
              title: '********',
              length: 6,
            ),
            const SizedBox(height: 15.0),
            ValueListenableBuilder<bool>(
              valueListenable: isLoading,
              builder: (_, bool value, Widget child) {
                if (value == true) {
                  return const Center(child: CircularProgressIndicator());
                } else {
                  return Center(
                    child: CustomButton(
                      width: MediaQuery.of(context).size.width * 0.45,
                      buttonColor: Theme.of(context).primaryColor,
                      title: 'SignUp',
                      fontSize: 18.0,
                      onPress: () => validate(),
                    ),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}

class SignUpPageMoreOptions extends StatelessWidget {
  const SignUpPageMoreOptions({this.size, this.navigate});

  final Size size;
  final Function navigate;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
      width: size.width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const CustomText(
            text: 'Have an account?',
            size: 16,
            fontWeight: FontWeight.w300,
          ),
          InkWell(
            onTap: () => navigate(),
            child: const CustomText(
              text: ' Login',
              size: 16,
              fontWeight: FontWeight.w300,
              // color: Theme.of(context).accentColor,
            ),
          ),
        ],
      ),
    );
  }
}
