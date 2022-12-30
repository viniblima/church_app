import 'package:flutter/material.dart';

import 'cart_button.widget.dart';

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
      actions: const [
        Center(
          child: SizedBox(
            width: 40,
            height: 40,
            child: CartButton(),
          ),
        ),
        const SizedBox(
          width: 10,
        ),
      ],
      leading: IconButton(
        icon: const Icon(Icons.person),
        onPressed: () {},
      ),
      title: Text(title),
      centerTitle: true,
      elevation: 0.0,
    );
  }
}
