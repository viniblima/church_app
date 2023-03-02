import 'package:church_app/models/product.model.dart';
import 'package:church_app/providers/http_global.provider.dart';
import 'package:get/get.dart';

import '../controllers/favorite.controller.dart';
import '../models/custom_list.model.dart';

class FavoriteProvider extends GetConnect {
  final HttpProvider _httpProvider = HttpProvider();

  final FavoriteControllerX _favoriteControllerX =
      Get.find<FavoriteControllerX>();

  Future<Response?> addProductToList({
    required String idList,
    required List<Map<String, String>> listProducts,
  }) async {
    if (_favoriteControllerX.loadingAddProductToList.value) {
      return null;
    }

    //_favoriteControllerX.updateLoadingAddProductList(value: true);

    Response response = await _httpProvider.httpPost(
      address: "/my_lists/add_product",
      obj: {
        "CustomUserListID": idList,
        "Products": listProducts,
      },
    );

    print(response.body);

    if (response.statusCode == 200) {
      List<CustomList> list = _favoriteControllerX.customLists;

      int index = list.indexWhere((CustomList l) => l.id == idList);

      List<Product> ls = [];
      for (int i = 0; i < (response.body["Products"] as List).length; i++) {
        Map<String, dynamic> json = response.body["Products"][i];

        ls.add(
          Product.fromMap(json),
        );
      }
      list[index].products = ls;

      // _favoriteControllerX.updateCustomLists(
      //   list: list,
      // );
    }

    _favoriteControllerX.updateLoadingAddProductList(value: false);
    return response;
  }

  Future<Response?> getMyLists() async {
    if (_favoriteControllerX.loadingCustomLists.value) {
      return null;
    }

    _favoriteControllerX.updateLoadingCustomList(value: true);

    Response response = await _httpProvider.httpGet(
      address: "/my_lists",
    );
    print(response.statusCode);
    if (response.statusCode == 200) {
      List<CustomList> list = [];

      for (int i = 0; i < (response.body as List).length; i++) {
        Map<String, dynamic> json = response.body[i];
        List<Map<String, dynamic>> ps =
            List<Map<String, dynamic>>.from(json["Products"]);

        list.add(
          CustomList.fromMap(
            {
              "ID": json["CustomUserList"]["ID"],
              "Name": json["CustomUserList"]["Name"],
              "Products": ps,
            },
          ),
        );
      }

      _favoriteControllerX.updateCustomLists(list: list);
    }

    _favoriteControllerX.updateLoadingCustomList(value: false);
    return response;
  }

  Future<bool> addCustomList({
    required String title,
    required List<Map<String, String>> list,
  }) async {
    Response response = await _httpProvider.httpPost(
      address: "/my_lists",
      obj: {
        "Name": title,
        "Products": list,
      },
    );

    print(response.body);

    if (response.statusCode == 201) {
      _favoriteControllerX.addList(
        newList: CustomList.fromMap({
          "ID": response.body["CustomUserList"]['ID'],
          "Name": title,
          "Products": List<Map<String, dynamic>>.from(
            response.body["Products"],
          ),
        }),
      );
    }

    return response.statusCode == 201;
  }
}
