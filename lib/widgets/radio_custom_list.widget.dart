import 'package:church_app/controllers/config.controller.dart';
import 'package:church_app/models/custom_list.model.dart';
import 'package:flutter/material.dart';

class RadioCustomList extends StatelessWidget {
  final int index;
  final int? groupValue;
  final Function(int?)? onChange;
  final CustomList list;

  const RadioCustomList({
    required this.index,
    required this.groupValue,
    required this.onChange,
    required this.list,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Config.colors[ColorVariables.white],
      child: RadioListTile(
        value: index,
        title: Row(
          children: <Widget>[
            Row(
              children: <Widget>[
                Text(
                  list.name,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ],
        ),
        groupValue: groupValue,
        onChanged: onChange,
      ),
    );
  }
}
