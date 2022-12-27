import 'package:church_app/controllers/config.controller.dart';
import 'package:flutter/material.dart';

class RateBadge extends StatelessWidget {
  final double rate;
  const RateBadge({required this.rate, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40,
      padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
      decoration: BoxDecoration(
        color: Config.colors[ColorVariables.secondary],
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Icon(
            Icons.star_rate_rounded,
            size: 14,
            color: Config.colors[ColorVariables.white],
          ),
          Text(
            rate.toString(),
            style: TextStyle(
              fontSize: 10,
              color: Config.colors[ColorVariables.white],
            ),
          ),
        ],
      ),
    );
  }
}
