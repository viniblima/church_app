import 'package:flutter/material.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            child: Text('Drawer Header'),
          ),
          ListTile(
            title: const Text('Home'),
            //tileColor: Get.currentRoute == '/home' ? Colors.grey[300] : null,
            //titleColor: Colors.grey[300],
            onTap: () {},
          ),
          ListTile(
            title: const Text('Home'),
            //tileColor: Get.currentRoute == '/home' ? Colors.grey[300] : null,
            //titleColor: Colors.grey[300],
            onTap: () {},
          ),
          ListTile(
            title: const Text('Home'),
            //tileColor: Get.currentRoute == '/home' ? Colors.grey[300] : null,
            //titleColor: Colors.grey[300],
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
