
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
    return Container(
      width: size.width,
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
      child: const CustomText(
        text: 'Sign Up Now',
        size: 35.0,
        fontWeight: FontWeight.bold,
      ),
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
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
      decoration: const BoxDecoration(color: Colors.white),
      child: Form(
        key: formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            CustomTextField(
              controller: fullNameController,
              title: 'Full Name',
              length: 3,
            ),
            const SizedBox(height: 15.0),
            CustomTextField(
              controller: userNameController,
              title: 'User Name',
              length: 3,
            ),
            const SizedBox(height: 15.0),
            CustomTextField(
              controller: emailController,
              title: 'Email Address',
            ),
            const SizedBox(height: 15.0),
            CustomTextField(
              controller: phoneController,
              title: 'Phone Number',
              keyboardType: TextInputType.number,
              length: 10,
            ),
            const SizedBox(height: 15.0),
            CustomTextField(
              controller: passwordController,
              title: 'Password',
              length: 6,
            ),
            const SizedBox(height: 15.0),
            ValueListenableBuilder<bool>(
              valueListenable: isLoading,
              builder: (_, bool value, Widget child) {
                if (value == true) {
                  return const Center(child: CircularProgressIndicator());
                } else {
                  return CustomButton(
                    title: 'SignUp',
                    onPress: () => validate(),
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
            text: 'Already A Member?',
            size: 16,
            fontWeight: FontWeight.w300,
          ),
          InkWell(
            onTap: () => navigate(),
            child: const CustomText(
              text: ' Login',
              size: 16,
              fontWeight: FontWeight.w300,
              color: Colors.blue,
            ),
          ),
        ],
      ),
    );
  }
}
