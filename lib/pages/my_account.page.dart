import 'package:church_app/controllers/user.controller.dart';
import 'package:church_app/widgets/log_off_button.widget.dart';
import 'package:church_app/widgets/user_card.widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/config.controller.dart';
import '../widgets/modal_login.widget.dart';

class MyAccountPage extends StatefulWidget {
  const MyAccountPage({Key? key}) : super(key: key);

  @override
  State<MyAccountPage> createState() => _MyAccountPageState();
}

class _MyAccountPageState extends State<MyAccountPage> {
  List<Map<String, String>> options = <Map<String, String>>[
    {
      "name": "notifications".tr,
      "route": "/notifications",
    },
    {
      "name": "my_shopping".tr,
      "route": "/my_shopping",
    }
  ];

  void validateRouting({required String route}) async {
    UserControllerX userControllerX = Get.find<UserControllerX>();
    if (userControllerX.user == null) {
      Map<String, bool>? result = await Get.bottomSheet(
        const ModalLogin(),
        isDismissible: true,
      );
      setState(() {});
      if (result == null || result["logged"] == false) {
        return null;
      } else {
        Get.toNamed(route);
      }
    } else {
      Get.toNamed(route);
    }
  }

  @override
  Widget build(BuildContext context) {
    UserControllerX userControllerX = Get.find<UserControllerX>();
    return Scaffold(
      body: Container(
        color: Config.colors[ColorVariables.secondary],
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            UserCard(),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        elevation: 0,
        child: Container(
          height: MediaQuery.of(context).size.height * 0.6,
          color: Config.colors[ColorVariables.secondary],
          width: MediaQuery.of(context).size.width,
          child: Container(
            decoration: BoxDecoration(
              //color: Config.colors[ColorVariables.primary],
              color: Config.colors[ColorVariables.white],
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(60),
                topRight: Radius.circular(60),
              ),
              // boxShadow: <BoxShadow>[
              //   BoxShadow(
              //     color: Config.colors[ColorVariables.borderGray]!,
              //     spreadRadius: 1,
              //     blurRadius: 10,
              //     offset: const Offset(0, 0),
              //   )
              // ],
            ),
            height: MediaQuery.of(context).size.height / 2,
            width: MediaQuery.of(context).size.width,
            // padding: EdgeInsets.symmetric(
            //   horizontal: MediaQuery.of(context).size.width / 6,
            // ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Column(
                  children: <Widget>[
                    SizedBox(
                      height: 48,
                    ),
                    ...List.generate(
                      options.length,
                      (int index) {
                        Map<String, String> o = options[index];

                        return Container(
                          decoration: BoxDecoration(
                            border: Border(
                              bottom: BorderSide(
                                width: 0.5,
                                color:
                                    Config.colors[ColorVariables.borderGray]!,
                              ),
                            ),
                          ),
                          child: RawMaterialButton(
                            onPressed: () {
                              validateRouting(route: o["route"]!);
                            },
                            child: Column(
                              children: [
                                ListTile(
                                  title: Text(o["name"]!),
                                  //subtitle: Text("add_to_one_of_your_lists'.tr),
                                  contentPadding: EdgeInsets.all(16),
                                  trailing: Icon(
                                    Icons.arrow_forward_ios,
                                    color:
                                        Config.colors[ColorVariables.secondary],
                                  ),
                                ),
                                //Divider()
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                ),
                userControllerX.user != null ? LogOffButton() : Container(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
