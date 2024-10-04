import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/common/widgets/loader.dart';
import '../../../../core/helper/constants.dart';
import '../../../../core/helper/helper_functions.dart';
import '../../../../core/helper/spacing.dart';
import '../../../../core/helper/styles.dart';
import '../bloc/auth_bloc.dart';
import '../widgets/auth_field.dart';
import '../widgets/auth_gradient_button.dart';
import '../widgets/auth_rich_text.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(Constants.defaultPadding),
        child: BlocConsumer(
          listener: (context, state) {
            if (state is AuthFailure) {
              AppHelperFunctions.showSnackBar(context, state.msg);
            }
          },
          builder: (context, state) => (state is AuthLoading)
              ? const Loader()
              : Form(
                  key: formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '${Constants.signIn}.',
                        style: AppStyles.font50WhiteBold,
                      ),
                      verticalSpace(Constants.spaceBtwSections),
                      AuthField(
                        hintText: 'Email',
                        controller: emailController,
                      ),
                      verticalSpace(Constants.spaceBtwItems),
                      AuthField(
                        hintText: 'Password',
                        controller: passwordController,
                        isObscureText: true,
                      ),
                      verticalSpace(Constants.lg),
                      AuthGradientButton(buttonText: Constants.signIn, onPressed: _signInOnPress),
                      verticalSpace(Constants.lg),
                      AuthRichText(
                        textLeft: Constants.doNotHaveAnAccount,
                        textRight: Constants.signUp,
                        onTap: () {
                          Navigator.pop(context);
                        },
                      ),
                    ],
                  ),
                ),
        ),
      ),
    );
  }

  void _signInOnPress() {
    if (formKey.currentState!.validate()) {
      context.read<AuthBloc>().add(
            AuthLogin(
              email: emailController.text.trim(),
              password: passwordController.text.trim(),
            ),
          );
    }
  }
}
