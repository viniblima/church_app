import 'package:church_app/controllers/categories.controller.dart';
import 'package:church_app/models/category.model.dart';
import 'package:church_app/providers/categories.provider.dart';
import 'package:church_app/providers/products.provider.dart';
import 'package:church_app/widgets/select_button.widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class CategoriesSlider extends StatefulWidget {
  const CategoriesSlider({Key? key}) : super(key: key);

  @override
  State<CategoriesSlider> createState() => _CategoriesSliderState();
}

class _CategoriesSliderState extends State<CategoriesSlider> {
  final CategoryProvider _categoryProvider = CategoryProvider();
  final ProductProvider _productProvider = ProductProvider();

  final CategoriesControllerX _categoriesControllerX =
      Get.find<CategoriesControllerX>();

  @override
  void initState() {
    //_categoryProvider.getCategories();
    super.initState();
  }

  void onPress({required int index}) {
    Category c = _categoriesControllerX.categories[index];
    c.selected = !c.selected;
    _categoriesControllerX.updateCategory(index: index, c: c);
    _productProvider.getProducts();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(16.0),
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
            width: MediaQuery.of(context).size.width,
            child: FutureBuilder(
              future: _categoryProvider.getCategories(),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  return ListView(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      children: [
                        const SizedBox(
                          width: 8,
                        ),
                        ...List.generate(
                          _categoriesControllerX.categories.length,
                          (int index) {
                            Category category =
                                _categoriesControllerX.categories[index];

                            return SelectButton(
                              category: category,
                              onPress: () => onPress(index: index),
                            );
                          },
                        ),
                      ]);
                } else {
                  return Center(
                    child: Text('loading'.tr),
                  );
                }
              },
            ))
      ],
    );
  }
}
