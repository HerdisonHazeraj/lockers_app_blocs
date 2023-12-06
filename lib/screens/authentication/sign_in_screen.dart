import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:lockers_app_blocs/blocs/user/sign_in_bloc/sign_in_bloc.dart';
import 'package:lockers_app_blocs/components/ceff_elevated_button.dart';
import 'package:lockers_app_blocs/components/ceff_text_field.dart';
import 'package:lockers_app_blocs/config.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  String? _errorMsg;
  bool obscurePassword = true;
  IconData iconPassword = Icons.visibility;

  bool signInRequired = false;

  @override
  Widget build(BuildContext context) {
    return BlocListener<SignInBloc, SignInState>(
      listener: (context, state) {
        if (state is SignInSuccess) {
          setState(() {
            signInRequired = false;
          });
        } else if (state is SignInProcess) {
          setState(() {
            signInRequired = true;
          });
        } else if (state is SignInFailure) {
          setState(() {
            signInRequired = false;
            _errorMsg = state.message; //'Email ou mot de passe invalide';
          });
        }
      },
      child: Form(
        key: _formKey,
        child: Center(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width * 0.05,
              vertical: 10,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Gap(20),
                const Text(
                  "Connexion",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w500,
                    height: 1.3,
                  ),
                ),
                Text(
                  "Veuillez entrer vos identifiants,",
                  style: TextStyle(
                    color: Theme.of(context).textSelectionTheme.selectionColor,
                  ),
                ),
                const Gap(10),
                CEFFTextField(
                  "Email",
                  const Icon(Icons.email_rounded),
                  controller: emailController,
                  keyboardType: TextInputType.emailAddress,
                  border: const OutlineInputBorder(),
                  errorMsg: _errorMsg,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Please enter your email";
                    } else if (!emailRegExp.hasMatch(value)) {
                      return "Please enter a valid email";
                    }
                    return null;
                  },
                ),
                const Gap(10),
                CEFFTextField(
                  "Mot de passe",
                  const Icon(Icons.lock_rounded),
                  controller: passwordController,
                  obscureText: obscurePassword,
                  keyboardType: TextInputType.visiblePassword,
                  errorMsg: _errorMsg,
                  border: const OutlineInputBorder(),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Please enter your password";
                    } else if (!passwordRegExp.hasMatch(value)) {
                      return "Please enter a valid password";
                    }
                    return null;
                  },
                  suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        obscurePassword = !obscurePassword;
                        if (obscurePassword) {
                          iconPassword = Icons.visibility;
                        } else {
                          iconPassword = Icons.visibility_off;
                        }
                      });
                    },
                    icon: Icon(iconPassword),
                  ),
                ),
                const Gap(20),
                !signInRequired
                    ? CEFFElevatedButton(
                        "Connexion",
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            context.read<SignInBloc>().add(
                                  SignInRequired(
                                    emailController.text,
                                    passwordController.text,
                                  ),
                                );
                          }
                        },
                      )
                    : const CircularProgressIndicator(),
                const Gap(10),
                Center(
                  child: TextButton(
                    onPressed: () {},
                    child: const Text(
                      "Continuer avec un numéro",
                      style: TextStyle(decoration: TextDecoration.underline),
                    ),
                  ),
                ),
                const Spacer(),
                Align(
                  alignment: Alignment.bottomRight,
                  child: Image.asset(
                    "assets/images/logo_ceff_sans_fond.png",
                    height: MediaQuery.of(context).size.height * 0.06,
                  ),
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
