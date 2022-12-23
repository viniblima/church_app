import 'package:church_app/widgets/next_events_card.widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../models/event.model.dart';

class NextEvents extends StatelessWidget {
  const NextEvents({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(12.0),
          child: Text(
            'events'.tr,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
        ),
        SizedBox(
          height: 100,
          child: ListView(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            children: <Widget>[
              NextEventsCard(
                event: Event(
                  name: 'Teste 1',
                  date: DateTime.now(),
                ),
              ),
              NextEventsCard(
                event: Event(
                  name: 'Teste 2',
                  date: DateTime.now(),
                ),
              ),
              NextEventsCard(
                event: Event(
                  name: 'Teste 3',
                  date: DateTime.now(),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
