import 'package:church_app/widgets/select_button.widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class CategoriesSlider extends StatefulWidget {
  const CategoriesSlider({Key? key}) : super(key: key);

  @override
  State<CategoriesSlider> createState() => _CategoriesSliderState();
}

class _CategoriesSliderState extends State<CategoriesSlider> {
  //TODO: Substituir pela lista de categorias da API
  static List<Map<String, dynamic>> list = [
    {
      "id": "0",
      "name": "Crescimento0",
      "color": 0xFF6BBE76,
    },
    {
      "id": "1",
      "name": "Crescimento1",
      "color": 0xFFFFFF00,
    },
    {
      "id": "2",
      "name": "Crescimento2",
      "color": 0xFFFFF000,
    },
    {
      "id": "3",
      "name": "Crescimento3",
      "color": 0xFFFFF000,
    },
    {
      "id": "4",
      "name": "Crescimento4",
      "color": 0xFFFFF000,
    },
    {
      "id": "5",
      "name": "Crescimento5",
      "color": 0xFFFFF000,
    },
  ];

  List<Map<String, dynamic>> categories = [];

  @override
  void initState() {
    for (Map<String, dynamic> category in list) {
      categories.add(
        {
          "selected": false,
          "id": category['id'],
          "name": category['name'],
          "color": category['color'],
        },
      );
    }
    super.initState();
  }

  void onPress({required int index}) {
    setState(() {
      categories[index]['selected'] = !categories[index]['selected'];
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
            'categories'.tr,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
        ),
        SizedBox(
          height: 40,
          child: ListView(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            children: List.generate(
              categories.length,
              (int index) {
                Map<String, dynamic> category = categories[index];

                return SelectButton(
                  text: category['name'],
                  onPress: () => onPress(index: index),
                  selected: categories[index]['selected'],
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
