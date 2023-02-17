import 'dart:async';

import 'package:church_app/controllers/login.controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';
import '../controllers/config.controller.dart';
import '../widgets/button.widget.dart';
import '../widgets/simple_text_field.widget.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController nameController = TextEditingController();

  final TextEditingController emailController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  final TextEditingController confirmPasswordController =
      TextEditingController();

  final LoginControllerX loginControllerX = Get.find<LoginControllerX>();

  Color backgroundIcon = Config.colors[ColorVariables.white]!;
  Color backgroundButton = Config.colors[ColorVariables.primary]!;

  final RoundedLoadingButtonController _btnController1 =
      RoundedLoadingButtonController();

  void signUp(RoundedLoadingButtonController controller) async {
    if (loginControllerX.signUpLoading.value ||
        !_formKey.currentState!.validate()) {
      controller.reset();
      return;
    }
    Timer(const Duration(seconds: 3), () {
      setState(() {
        //backgroundIcon = Config.colors[ColorVariables.white]!;
        //backgroundButton = Config.colors[ColorVariables.white]!;
      });
      controller.success();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          color: Config.colors[ColorVariables.white],
          height: MediaQuery.of(context).size.height - 80,
          width: MediaQuery.of(context).size.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
/*             mainAxisAlignment: MainAxisAlignment.center, */
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              const SizedBox(
                height: 40,
              ),
              Text(
                '${'create'.tr} ${'account'.tr}',
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 32,
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Form(
                key: _formKey,
                child: Column(
                  children: <Widget>[
                    SimpleTextField(
                      textController: nameController,
                      textInputType: TextInputType.emailAddress,
                      label: 'full_name'.tr.toUpperCase(),
                      preffixIcon: Icon(
                        Icons.email,
                        color: Config.colors[ColorVariables.primary]!,
                      ),
                      validator: (String? value) {
                        if (value == null || value.length < 4) {
                          return 'invalid_name'.tr;
                        }
                      },
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    SimpleTextField(
                      textController: emailController,
                      textInputType: TextInputType.emailAddress,
                      label: 'email'.toUpperCase(),
                      preffixIcon: Icon(
                        Icons.email,
                        color: Config.colors[ColorVariables.primary]!,
                      ),
                      validator: (String? value) {
                        if (value == null ||
                            RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                .hasMatch(value)) {
                          return 'invalid_email'.tr;
                        }
                      },
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    SimpleTextField(
                      textController: passwordController,
                      textInputType: TextInputType.emailAddress,
                      label: 'password'.tr.toUpperCase(),
                      preffixIcon: Icon(
                        Icons.email,
                        color: Config.colors[ColorVariables.primary]!,
                      ),
                      validator: (String? value) {
                        if (value == null || value.length < 4) {
                          return 'password_too_short'.tr;
                        }
                      },
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    SimpleTextField(
                      textController: confirmPasswordController,
                      textInputType: TextInputType.emailAddress,
                      label: 'confirm_password'.tr.toUpperCase(),
                      preffixIcon: Icon(
                        Icons.email,
                        color: Config.colors[ColorVariables.primary]!,
                      ),
                      validator: (String? value) {
                        if (value == null || value != passwordController.text) {
                          return 'passwords_do_not_match'.tr;
                        }
                      },
                    ),
                    const SizedBox(
                      height: 32,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        Container(
                          width: 170,
                          alignment: Alignment.centerRight,
                          child: RoundedLoadingButton(
                            color: backgroundButton,
                            successIcon: Icons.check_circle_outline,
                            successColor: Config.colors[ColorVariables.primary],
                            failedIcon: Icons.cottage,
                            controller: _btnController1,
                            valueColor: backgroundIcon,
                            onPressed: () =>
                                !loginControllerX.signUpLoading.value
                                    ? signUp(_btnController1)
                                    : () {},
                            child: Hero(
                              tag: 'pay_button',
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Text(
                                    'sign_up'.tr,
                                    style: TextStyle(
                                      color:
                                          Config.colors[ColorVariables.white],
                                      fontSize: 14,
                                    ),
                                  ),
                                  Center(
                                    child: Icon(
                                      Icons.arrow_forward_ios_rounded,
                                      color:
                                          Config.colors[ColorVariables.white],
                                      size: 16,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
