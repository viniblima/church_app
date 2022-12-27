import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:readmore/readmore.dart';

class AboutProduct extends StatelessWidget {
  const AboutProduct({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: Text(
            'about'.tr,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
        ),
        Container(
          padding: const EdgeInsets.all(12.0),
          child: ReadMoreText(
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum dolor dolor, pharetra sollicitudin sapien ac, pellentesque aliquet purus. Donec tellus lectus, efficitur a nisi vel, dignissim feugiat leo. Etiam nunc ligula, gravida mattis velit id, tristique fringilla orci. Quisque sit amet felis non magna malesuada rutrum. Cras a diam sapien. Donec rhoncus, eros sagittis luctus vestibulum, dui nibh accumsan enim, vitae pharetra elit lacus in massa. Phasellus maximus felis nec metus lobortis tempus. Mauris pretium euismod justo, sit amet euismod nulla fringilla a.',
            trimLines: 2,
            preDataTextStyle: const TextStyle(fontWeight: FontWeight.w500),
            style: const TextStyle(color: Colors.black),
            colorClickableText: Colors.pink,
            trimMode: TrimMode.Line,
            trimCollapsedText: 'show_more'.tr,
            trimExpandedText: 'show_less'.tr,
          ),
        ),
      ],
    );
  }
}
