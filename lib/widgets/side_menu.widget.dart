import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          DrawerHeader(
            child: Text('Drawer Header'),
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
          ),
          ListTile(
            title: Text('Home'),
            //tileColor: Get.currentRoute == '/home' ? Colors.grey[300] : null,
            //titleColor: Colors.grey[300],
            onTap: () {},
          ),
          ListTile(
            title: Text('Home'),
            //tileColor: Get.currentRoute == '/home' ? Colors.grey[300] : null,
            //titleColor: Colors.grey[300],
            onTap: () {},
          ),
          ListTile(
            title: Text('Home'),
            //tileColor: Get.currentRoute == '/home' ? Colors.grey[300] : null,
            //titleColor: Colors.grey[300],
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
