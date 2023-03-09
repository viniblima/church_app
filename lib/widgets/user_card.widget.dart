import 'package:church_app/controllers/config.controller.dart';
import 'package:church_app/controllers/user.controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'modal_login.widget.dart';

class UserCard extends StatefulWidget {
  const UserCard({Key? key}) : super(key: key);

  @override
  State<UserCard> createState() => _UserCardState();
}

class _UserCardState extends State<UserCard> {
  final UserControllerX _userControllerX = Get.find<UserControllerX>();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.all(16),
      color: Config.colors[ColorVariables.secondary],
      child: Card(
        elevation: 10,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: TextButton(
          style: ButtonStyle(
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
                side: BorderSide(
                  color: Config.colors[ColorVariables.borderGray]!,
                ),
              ),
            ),
            overlayColor: MaterialStateProperty.resolveWith<Color>(
              (states) => Config.colors[ColorVariables.secondary]!,
            ),
          ),
          onPressed: () async {
            if (_userControllerX.token == null) {
              await Get.bottomSheet(
                const ModalLogin(),
                isDismissible: true,
              );
              setState(() {});
            } else {
              Get.toNamed("/my_data");
            }
          },
          child: Row(
            // mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Container(
                height: 80,
                width: 80,
                padding: EdgeInsets.all(12),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(
                    40.0,
                  ),
                  child: FadeInImage(
                    fit: BoxFit.cover,
                    imageErrorBuilder: (BuildContext context, Object exception,
                        StackTrace? stackTrace) {
                      return Image.asset('assets/images/placeholder.jpg');
                    },
                    image: const NetworkImage(
                      'https://upload.wikimedia.org/wikipedia/commons/thumb/4/45/A_small_cup_of_coffee.JPG/1280px-A_small_cup_of_coffee.JPG',
                    ),
                    placeholder: const AssetImage(
                      'assets/images/placeholder.jpg',
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 8,
              ),
              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    "${'hello'.tr}, ${_userControllerX.user != null ? _userControllerX.user!.name : 'user'.tr}",
                    style: TextStyle(
                      color: Config.colors[ColorVariables.black],
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Row(
                    children: <Widget>[
                      Text(
                        _userControllerX.user != null
                            ? 'edit_my_data'.tr
                            : 'click_here_to_login'.tr,
                        style: TextStyle(
                          color: Config.colors[ColorVariables.black],
                          fontSize: 14,
                        ),
                      ),
                      Icon(
                        Icons.arrow_forward_ios_rounded,
                        size: 14,
                        color: Config.colors[ColorVariables.black],
                      )
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
