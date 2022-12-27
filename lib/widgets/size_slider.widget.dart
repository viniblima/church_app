import 'package:church_app/widgets/select_button.widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class SizeSelector extends StatefulWidget {
  const SizeSelector({Key? key}) : super(key: key);

  @override
  State<SizeSelector> createState() => _SizeSelectorState();
}

class _SizeSelectorState extends State<SizeSelector> {
  //TODO: Substituir pela lista de categorias da API
  static List<Map<String, dynamic>> list = [
    {
      "id": "0",
      "name": "PP",
      "color": 0xFF6BBE76,
    },
    {
      "id": "1",
      "name": "P",
      "color": 0xFFFFFF00,
    },
    {
      "id": "2",
      "name": "G",
      "color": 0xFFFFF000,
    },
    {
      "id": "3",
      "name": "GG",
      "color": 0xFFFFF000,
    },
    {
      "id": "4",
      "name": "XG",
      "color": 0xFFFFF000,
    },
  ];

  List<Map<String, dynamic>> sizes = [];

  @override
  void initState() {
    for (Map<String, dynamic> size in list) {
      sizes.add(
        {
          "selected": false,
          "id": size['id'],
          "name": size['name'],
          "color": size['color'],
        },
      );
    }
    super.initState();
  }

  void onPress({required int index}) {
    for (int x = 0; x < sizes.length; x++) {
      sizes[x]['selected'] = false;
    }
    setState(() {
      sizes[index]['selected'] = !sizes[index]['selected'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(12.0),
          child: Text(
            'size'.tr,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
        ),
        GridView.count(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          childAspectRatio: (24 / 8),
          mainAxisSpacing: 8,
          crossAxisCount: 3,
          children: List.generate(
            list.length,
            (int index) {
              Map<String, dynamic> size = sizes[index];

              return SizedBox(
                height: 20,
                width: 20,
                child: SelectButton(
                  text: size['name'],
                  bold: false,
                  onPress: () => onPress(index: index),
                  selected: sizes[index]['selected'],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
