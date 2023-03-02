import 'package:church_app/widgets/custom_lists.widget.dart';
import 'package:flutter/material.dart';

import '../controllers/config.controller.dart';

class FavoritesPage extends StatelessWidget {
  const FavoritesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Config.colors[ColorVariables.white],
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(
          horizontal: 0,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            CustomLists(),
          ],
        ),
      ),
    );
  }
}
