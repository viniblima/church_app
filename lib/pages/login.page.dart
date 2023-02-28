import 'dart:async';

import 'package:church_app/controllers/config.controller.dart';
import 'package:church_app/widgets/simple_text_field.widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';

import '../controllers/login.controller.dart';
import '../providers/user.provider.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController emailController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  Color backgroundButton = Config.colors[ColorVariables.primary]!;

  final LoginControllerX loginControllerX = Get.find<LoginControllerX>();
  Color backgroundIcon = Config.colors[ColorVariables.white]!;

  bool obscureTextPassword = true;

  final RoundedLoadingButtonController _btnController1 =
      RoundedLoadingButtonController();

  void login() async {
    if (loginControllerX.loginLoading.value ||
        !_formKey.currentState!.validate()) {
      _btnController1.reset();
      return;
    }

    UserProvider userProvider = UserProvider();

    userProvider
        .login(email: emailController.text, password: passwordController.text)
        .then((Response response) {
      if (response.statusCode == 200) {
        _btnController1.success();
        Timer(const Duration(seconds: 2), () {
          //Get.offAllNamed('/navigation_hero/?hero_tag=login',);
          Get.offAndToNamed(
            '/navigation_hero/?hero_tag=login',
          );
        });
      } else {
        _btnController1.error();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          color: Config.colors[ColorVariables.white],
          height: MediaQuery.of(context).size.height - 80,
          width: MediaQuery.of(context).size.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              const Text(
                'Login',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 32,
                ),
              ),
              Text(
                'please_sign_in_to_continue'.tr,
                style: TextStyle(
                  color: Config.colors[ColorVariables.highlightGray],
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              const SizedBox(
                height: 60,
              ),
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    SimpleTextField(
                      textController: emailController,
                      textInputType: TextInputType.emailAddress,
                      label: 'email'.toUpperCase(),
                      onChanged: (String value) => setState(() {
                        _btnController1.reset();
                      }),
                      preffixIcon: Icon(
                        Icons.email,
                        color: Config.colors[ColorVariables.primary]!,
                      ),
                      validator: (String? value) {
                        if (value == null ||
                            !RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                .hasMatch(value)) {
                          return 'invalid_email'.tr;
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 32,
                    ),
                    SimpleTextField(
                      textController: passwordController,
                      textInputType: TextInputType.emailAddress,
                      label: 'password'.tr.toUpperCase(),
                      obscureText: obscureTextPassword,
                      onChanged: (String value) => setState(() {
                        _btnController1.reset();
                      }),
                      preffixIcon: Icon(
                        Icons.lock_outline,
                        color: Config.colors[ColorVariables.primary]!,
                      ),
                      validator: (String? value) {
                        if (value == null || value.length < 4) {
                          return 'password_too_short'.tr;
                        }
                        return null;
                      },
                      suffixIcon: TextButton(
                        onPressed: () {},
                        child: Text(
                          '${'forgot'.tr}?'.tr.toUpperCase(),
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Config.colors[ColorVariables.primary]!,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 32,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          width: 170,
                          alignment: Alignment.centerRight,
                          child: RoundedLoadingButton(
                            color: backgroundButton,
                            successIcon: Icons.check_circle_outline,
                            successColor: Config.colors[ColorVariables.primary],
                            failedIcon: Icons.close_sharp,
                            controller: _btnController1,
                            valueColor: backgroundIcon,
                            onPressed: () =>
                                !loginControllerX.signUpLoading.value
                                    ? login()
                                    : () {},
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Text(
                                  'sign_in'.tr,
                                  style: TextStyle(
                                    color: Config.colors[ColorVariables.white],
                                    fontSize: 14,
                                  ),
                                ),
                                Hero(
                                  tag: 'login_button',
                                  child: Container(
                                    color:
                                        Config.colors[ColorVariables.primary],
                                    height: 0,
                                    width: 0,
                                  ),
                                ),
                                Center(
                                  child: Icon(
                                    Icons.arrow_forward_ios_rounded,
                                    color: Config.colors[ColorVariables.white],
                                    size: 16,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        height: 80,
        color: Config.colors[ColorVariables.white],
        width: MediaQuery.of(context).size.width,
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text('${'dont_have_an_account'.tr}?'),
              const SizedBox(
                width: 4,
              ),
              TextButton(
                onPressed: () {
                  Get.toNamed('/sign_up');
                },
                child: Text(
                  'sign_up'.tr,
                  style: TextStyle(
                    color: Config.colors[ColorVariables.secondary],
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
