import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_developer_test_task/bloc/app_bloc.dart';
import 'package:flutter_developer_test_task/bloc/app_event.dart';
import 'package:flutter_developer_test_task/core/app_colors.dart';
import 'package:flutter_developer_test_task/core/app_font.dart';
import 'package:flutter_developer_test_task/core/image_assets.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class LoginView extends HookWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final obscured = useState(true);

    final emailController = useTextEditingController(
      text: 'polina_sh@gmail.com',
    );

    final passwordController = useTextEditingController(text: 'weatherApp');

    return Material(
      child: SafeArea(
          child: Row(
            children: [
              Expanded(
                child: Center(
                  child: Column(
                    children: [
                      Flexible(
                        flex: 130,
                        child: Container(
                          width: double.infinity,
                          child: FittedBox(
                            fit: BoxFit.contain,
                            child: Padding(
                              padding: EdgeInsets.only(
                                  left: 24, right: 24, top: 11, bottom: 16),
                              child: Column(
                                children: [
                                  SizedBox(height: 33),
                                  Container(
                                      height: 36,
                                      width: 327,
                                      child: Text('Login', style: AppFonts.headingH1Min),
                                      alignment: Alignment.centerLeft),
                                  SizedBox(height: 12),
                                  Container(
                                      height: 22,
                                      width: 327,
                                      child: Text(
                                          'Please enter your login information to continue',
                                          style: AppFonts.mainTextB2MediumGrey),
                                      alignment: Alignment.centerLeft)
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      Flexible(
                        flex: 96,
                        child: Container(
                          width: double.infinity,
                          child: FittedBox(
                            fit: BoxFit.contain,
                            child: Padding(
                              padding: EdgeInsets.only(
                                  left: 24, right: 24, top: 8, bottom: 24),
                              child: Container(
                                height: 64,
                                width: 327,
                                child: TextFormField(
                                  controller: emailController,
                                  style: AppFonts.mainTextB1Black,
                                  cursorColor: AppColors.primaryRed,
                                  cursorHeight: 17,
                                  decoration: InputDecoration(
                                    focusedBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                            color: AppColors.buttonColor, width: 2)),
                                    labelText: 'Email',
                                    labelStyle: AppFonts.mainTextB1Grey,
                                    floatingLabelStyle: AppFonts.mainTextB1Grey,
                                    border: UnderlineInputBorder(
                                        borderSide:
                                            BorderSide(color: AppColors.textColorGrey)),
                                  ),
                                  keyboardType: TextInputType.emailAddress,
                                  keyboardAppearance: Brightness.dark,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Flexible(
                        flex: 96,
                        child: Container(
                          width: double.infinity,
                          child: FittedBox(
                            fit: BoxFit.contain,
                            child: Padding(
                              padding: EdgeInsets.only(
                                  left: 24, right: 24, top: 8, bottom: 8),
                              child: Container(
                                height: 80,
                                width: 327,
                                child: TextFormField(
                                  maxLength: 30,
                                  controller: passwordController,
                                  style: AppFonts.mainTextB1Black,
                                  cursorColor: AppColors.primaryRed,
                                  cursorHeight: 17,
                                  decoration: InputDecoration(
                                    suffixIcon: Container(
                                      height: 60,
                                      width: 24,
                                      alignment: Alignment.bottomCenter,
                                      child: IconButton(
                                        icon: Container(child: obscured.value
                                            ? ImageAssets.eye_off
                                            : ImageAssets.eye, width: 24, height: 24, alignment: Alignment.bottomCenter,),
                                        onPressed: () {
                                          obscured.value = !obscured.value;
                                        },
                                      ),
                                    ),
                                    labelText: 'Password',
                                    focusedBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                            color: AppColors.buttonColor, width: 2)),
                                    labelStyle: AppFonts.mainTextB1Grey,
                                    floatingLabelStyle: AppFonts.mainTextB1Grey,
                                    border: UnderlineInputBorder(
                                        borderSide:
                                            BorderSide(color: AppColors.textColorGrey)),
                                  ),
                                  obscureText: obscured.value,
                                  keyboardAppearance: Brightness.dark,
                                  obscuringCharacter: '◉',
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Flexible(
                        flex: 104,
                        child: Container(
                          width: double.infinity,
                          child: FittedBox(
                            fit: BoxFit.contain,
                            child: Padding(
                              padding: EdgeInsets.all(24),
                              child: Container(
                                height: 56,
                                width: 327,
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: AppColors.buttonColor,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(Radius.circular(24.0)),
                                    ),
                                  ),
                                  onPressed: () {
                                      final email = emailController.text;
                                      final password = passwordController.text;
                                      context.read<AppBloc>().add(
                                        AppEventLogIn(
                                          email: email,
                                          password: password,
                                        ),
                                      );
                                    },
                                  child: Text('Log in', style: AppFonts.mainTextB2Medium),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Flexible(
                        flex: 56,
                        child: TextButton(
                          onPressed: () {
                            context.read<AppBloc>().add(
                                  const AppEventGoToRegistration(),
                                );
                          },
                          child: const Text(
                            'Not registered yet? Register here!',
                            style: AppFonts.buttonText,
                          ),
                        ),
                      ),
                      Flexible(flex: 332, child: Container()),
                    ],
                  ),
                ),
              ),
            ],
          ),
      ),
    );
  }
}
