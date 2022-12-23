import 'package:flutter/material.dart';

class AppBarTabs extends StatelessWidget implements PreferredSizeWidget {
  final double height;
  final String title;
  final String? subtitle;
  final bool centerTitle;

  const AppBarTabs({
    Key? key,
    this.height = kToolbarHeight,
    this.centerTitle = true,
    required this.title,
    this.subtitle,
  }) : super(key: key);

  @override
  Size get preferredSize => Size.fromHeight(height);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      actions: [
        Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.only(
              right: 16,
            ),
            child: IconButton(
              icon: const Icon(Icons.notifications),
              onPressed: () {},
            ))
      ],
      leading: IconButton(
        icon: const Icon(Icons.person),
        onPressed: () {},
      ),
      title: Text(title),
      centerTitle: true,
    );
  }
}
