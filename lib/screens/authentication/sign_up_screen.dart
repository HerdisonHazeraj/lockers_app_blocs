import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:lockers_app_blocs/blocs/user/sign_up_bloc/sign_up_bloc.dart';
import 'package:lockers_app_blocs/components/ceff_elevated_button.dart';
import 'package:lockers_app_blocs/components/ceff_text_field.dart';
import 'package:lockers_app_blocs/config.dart';
import 'package:user_repository/user_repository.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  bool obscurePassword = true;
  IconData iconPassword = Icons.visibility;
  final nameController = TextEditingController();
  bool signUpRequired = false;

  bool containsUpperCase = false;
  bool containsLowerCase = false;
  bool containsNumber = false;
  bool containsSpecialChar = false;
  bool contains8Length = false;

  @override
  Widget build(BuildContext context) {
    return BlocListener<SignUpBloc, SignUpState>(
      listener: (context, state) {
        if (state is SignUpSuccess) {
          setState(() {
            signUpRequired = false;
          });
        } else if (state is SignUpProcess) {
          setState(() {
            signUpRequired = true;
          });
        } else if (state is SignUpFailure) {
          return;
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
                  "Inscription",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w500,
                    height: 1.3,
                  ),
                ),
                Text(
                  "Veuillez entrer vos informations personnelles,",
                  style: TextStyle(
                    color: Theme.of(context).textSelectionTheme.selectionColor,
                  ),
                ),
                const Gap(10),
                CEFFTextField(
                  "Email",
                  const Icon(Icons.email),
                  controller: emailController,
                  obscureText: false,
                  keyboardType: TextInputType.emailAddress,
                  border: const OutlineInputBorder(),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please fill in this field';
                    } else if (!emailRegExp.hasMatch(value)) {
                      return 'Please enter a valid email';
                    }
                    return null;
                  },
                ),
                const Gap(10),
                CEFFTextField(
                  'Password',
                  const Icon(Icons.lock),
                  controller: passwordController,
                  obscureText: obscurePassword,
                  keyboardType: TextInputType.visiblePassword,
                  border: const OutlineInputBorder(),
                  onChanged: (value) {
                    if (value!.contains(RegExp(r'[A-Z]'))) {
                      setState(() {
                        containsUpperCase = true;
                      });
                    } else {
                      setState(() {
                        containsUpperCase = false;
                      });
                    }
                    if (value.contains(RegExp(r'[a-z]'))) {
                      setState(() {
                        containsLowerCase = true;
                      });
                    } else {
                      setState(() {
                        containsLowerCase = false;
                      });
                    }
                    if (value.contains(RegExp(r'[0-9]'))) {
                      setState(() {
                        containsNumber = true;
                      });
                    } else {
                      setState(() {
                        containsNumber = false;
                      });
                    }
                    if (value.contains(specialCharRegExp)) {
                      setState(() {
                        containsSpecialChar = true;
                      });
                    } else {
                      setState(() {
                        containsSpecialChar = false;
                      });
                    }
                    if (value.length >= 8) {
                      setState(() {
                        contains8Length = true;
                      });
                    } else {
                      setState(() {
                        contains8Length = false;
                      });
                    }
                    return null;
                  },
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please fill in this field';
                    } else if (!passwordRegExp.hasMatch(value)) {
                      return 'Please enter a valid password';
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
                          iconPassword = Icons.visibility_off_outlined;
                        }
                      });
                    },
                    icon: Icon(iconPassword),
                  ),
                ),
                const Gap(10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "⚈  1 uppercase",
                          style: TextStyle(
                            color: containsUpperCase
                                ? Colors.green
                                : Theme.of(context).colorScheme.onBackground,
                          ),
                        ),
                        Text(
                          "⚈  1 lowercase",
                          style: TextStyle(
                            color: containsLowerCase
                                ? Colors.green
                                : Theme.of(context).colorScheme.onBackground,
                          ),
                        ),
                        Text(
                          "⚈  1 number",
                          style: TextStyle(
                            color: containsNumber
                                ? Colors.green
                                : Theme.of(context).colorScheme.onBackground,
                          ),
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "⚈  1 special character",
                          style: TextStyle(
                            color: containsSpecialChar
                                ? Colors.green
                                : Theme.of(context).colorScheme.onBackground,
                          ),
                        ),
                        Text(
                          "⚈  8 minimum characters",
                          style: TextStyle(
                            color: contains8Length
                                ? Colors.green
                                : Theme.of(context).colorScheme.onBackground,
                          ),
                        )
                      ],
                    ),
                  ],
                ),
                const Gap(10),
                CEFFTextField(
                  'Name',
                  const Icon(Icons.person),
                  controller: nameController,
                  obscureText: false,
                  keyboardType: TextInputType.name,
                  border: const OutlineInputBorder(),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please fill in this field';
                    } else if (value.length > 30) {
                      return 'Name too long';
                    }
                    return null;
                  },
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                !signUpRequired
                    ? CEFFElevatedButton(
                        "S'inscrire",
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            MyUser myUser = MyUser.empty;
                            myUser = myUser.copyWith(
                              email: emailController.text,
                              name: nameController.text,
                            );

                            setState(() {
                              context.read<SignUpBloc>().add(
                                    SignUpRequired(
                                        myUser, passwordController.text),
                                  );
                            });
                          }
                        },
                      )
                    : const CircularProgressIndicator(),
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
