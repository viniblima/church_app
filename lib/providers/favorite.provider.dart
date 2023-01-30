import 'package:church_app/providers/http_global.provider.dart';
import 'package:get/get.dart';

import '../controllers/favorite.controller.dart';
import '../models/custom_list.model.dart';

class FavoriteProvider extends GetConnect {
  final HttpProvider _httpProvider = HttpProvider();

  final FavoriteControllerX _favoriteControllerX =
      Get.find<FavoriteControllerX>();

  Future<bool> addCustomList({required String title}) async {
    Response response = await _httpProvider.post('', {});

    if (response.statusCode == 201) {
      _favoriteControllerX.addList(
        newList: CustomList(
          id: response.body['id'],
          name: title,
          products: [],
        ),
      );
    } else {}

    return response.statusCode == 201;
  }
}
