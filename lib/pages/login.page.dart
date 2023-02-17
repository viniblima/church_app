import 'package:church_app/controllers/config.controller.dart';
import 'package:church_app/widgets/simple_text_field.widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widgets/button.widget.dart';

class LoginPage extends StatelessWidget {
  LoginPage({Key? key}) : super(key: key);

  final _formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

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
                      preffixIcon: Icon(
                        Icons.email,
                        color: Config.colors[ColorVariables.primary]!,
                      ),
                    ),
                    const SizedBox(
                      height: 32,
                    ),
                    SimpleTextField(
                      textController: passwordController,
                      textInputType: TextInputType.emailAddress,
                      label: 'password'.tr.toUpperCase(),
                      preffixIcon: Icon(
                        Icons.lock_outline,
                        color: Config.colors[ColorVariables.primary]!,
                      ),
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
                        Button(
                          onPress: () {},
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 18,
                              vertical: 6,
                            ),
                            child: Row(
                              children: <Widget>[
                                Text(
                                  'LOGIN',
                                  style: TextStyle(
                                    fontSize: 14,
                                    //fontWeight: FontWeight.bold,
                                    color: Config.colors[ColorVariables.white],
                                  ),
                                ),
                                const SizedBox(
                                  width: 8,
                                ),
                                Icon(
                                  Icons.arrow_forward_ios_rounded,
                                  color: Config.colors[ColorVariables.white],
                                  size: 16,
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
              SizedBox(
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
