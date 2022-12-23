import 'package:church_app/controllers/config.controller.dart';
import 'package:church_app/models/event.model.dart';
import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:intl/intl.dart';

class NextEventsCard extends StatelessWidget {
  final Event event;

  const NextEventsCard({
    required this.event,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: 200,
      decoration: BoxDecoration(
        color: Config.colors[ColorVariables.primary],
        borderRadius: BorderRadius.circular(
          12.0,
        ),
      ),
      padding: const EdgeInsets.all(
        6.0,
      ),
      margin: const EdgeInsets.only(
        right: 16,
        left: 8,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            event.name,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            DateFormat('dd/MM/yyyy - HH:mm').format(event.date),
            style: const TextStyle(
              color: Colors.white,
            ),
          )
        ],
      ),
    );
  }
}
