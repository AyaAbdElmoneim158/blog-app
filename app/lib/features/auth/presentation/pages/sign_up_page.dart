import 'package:flutter/material.dart';
import '../../../../config/routing/routes.dart';
import '../../../../core/helper/constants.dart';
import '../../../../core/helper/spacing.dart';
import '../../../../core/helper/styles.dart';
import '../widgets/auth_field.dart';
import '../widgets/auth_gradient_button.dart';
import '../widgets/auth_rich_text.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final nameController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: EdgeInsets.all(Constants.defaultPadding),
        child: Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '${Constants.signUp}.',
                style: AppStyles.font50WhiteBold,
              ),
              verticalSpace(Constants.spaceBtwSections),
              AuthField(
                hintText: Constants.name,
                controller: nameController,
              ),
              verticalSpace(Constants.spaceBtwItems),
              AuthField(
                hintText: Constants.email,
                controller: emailController,
              ),
              verticalSpace(Constants.spaceBtwItems),
              AuthField(
                hintText: Constants.password,
                controller: passwordController,
                isObscureText: true,
              ),
              verticalSpace(Constants.lg),
              AuthGradientButton(
                buttonText: Constants.signUp,
                onPressed: _signUpOnPress,
              ),
              verticalSpace(Constants.lg),
              AuthRichText(
                textLeft: Constants.alreadyHaveAnAccount,
                textRight: Constants.signIn,
                onTap: () {
                  Navigator.pushReplacementNamed(context, AppRoutes.login);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _signUpOnPress() {
    if (formKey.currentState!.validate()) {}
  }
}
