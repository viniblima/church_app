import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';

import '../controllers/config.controller.dart';
import '../controllers/login.controller.dart';
import '../providers/user.provider.dart';
import 'simple_text_field.widget.dart';

class ModalLogin extends StatefulWidget {
  const ModalLogin({Key? key}) : super(key: key);

  @override
  State<ModalLogin> createState() => _ModalLoginState();
}

class _ModalLoginState extends State<ModalLogin> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController emailController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  final RoundedLoadingButtonController _btnController1 =
      RoundedLoadingButtonController();

  // final LoginControllerX loginControllerX = Get.find<LoginControllerX>();

  bool obscureTextPassword = true;

  Color backgroundIcon = Config.colors[ColorVariables.white]!;

  Color backgroundButton = Config.colors[ColorVariables.primary]!;

  final UserProvider userProvider = UserProvider();

  bool loginLoading = false;

  void login() async {
    if (loginLoading || !_formKey.currentState!.validate()) {
      _btnController1.reset();
      return;
    }

    setState(() {
      loginLoading = true;
    });

    Response response = await userProvider.login(
      email: emailController.text,
      password: passwordController.text,
    );
    setState(() {
      loginLoading = false;
    });
    if (response.statusCode == 200) {
      _btnController1.success();

      Timer(const Duration(seconds: 2), () {
        LoginControllerX loginControllerX = Get.find<LoginControllerX>();

        loginControllerX.updateLogged(value: true);
        Get.back(result: {
          "logged": true,
        });
      });
    } else {
      _btnController1.error();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 600,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
        color: Config.colors[ColorVariables.white],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
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
                        onPressed: () => !loginLoading ? login() : () {},
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
                                color: Config.colors[ColorVariables.primary],
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
    );
  }
}
