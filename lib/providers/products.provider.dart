import 'dart:async';

import 'package:church_app/controllers/products.controllers.dart';
import 'package:church_app/models/product.model.dart';
import 'package:get/get.dart';
import 'http_global.provider.dart';

class ProductProvider extends GetConnect {
  final HttpProvider _httpProvider = HttpProvider();

  final ProductControllerX _productControllerX = Get.find<ProductControllerX>();

  Future<Product?> getProductById({required String id}) async {
    Response? response = await _httpProvider.httpGet(
      address: "/products/?id=$id",
      protectedAPI: false,
    );

    if (response!.statusCode == 200) {
      return Product.fromMap(response.body);
    }
    return null;
  }

  Future<Response?> getHighlightProducts() async {
    if (_productControllerX.loadingHighlightProducts.value) {
      return null;
    }
    _productControllerX.updateloadingHighlight(value: true);

    Response? response = await _httpProvider.httpGet(
      address: "/products/highlights",
      protectedAPI: false,
    );

    if (response!.statusCode == 200) {
      List<Product> ps = [];
      for (int i = 0; i < (response.body["Highlights"] as List).length; i++) {
        ps.add(Product.fromMap(response.body["Highlights"][i]));
      }

      _productControllerX.updateHighlightProducts(ps: ps);
    }
    Timer(const Duration(seconds: 2), () {
      _productControllerX.updateloadingHighlight(value: false);
    });
    return response;
  }

  Future<Response?> getMoreProducts() async {
    if (_productControllerX.loadingMoreProducts.value ||
        _productControllerX.endListProducts) {
      return null;
    }

    _productControllerX.updateloadingMoreProducts(value: true);

    Response? response = await _httpProvider.httpGet(
      address: "/products/?page=${_productControllerX.page}",
      protectedAPI: false,
    );

    if (response!.statusCode == 200) {
      _productControllerX.endListProducts = response.body["End"];

      List<Product> ps = _productControllerX.products;

      for (int i = 0; i < (response.body["Products"] as List).length; i++) {
        ps.add(
          Product.fromMap(
            response.body["Products"][i],
          ),
        );
      }

      //_productControllerX.updateProducts(ps: ps);
    }

    _productControllerX.updateloadingMoreProducts(value: false);

    return response;
  }

  Future<Response?> getProducts() async {
    if (_productControllerX.loadingListProducts.value) {
      return null;
    }
    _productControllerX.updateloadingListProducts(value: true);

    Response? response = await _httpProvider.httpGet(
      address: "/products/?page=${_productControllerX.page}",
      protectedAPI: false,
    );

    if (response!.statusCode == 200) {
      _productControllerX.endListProducts = response.body["End"];

      List<Product> ps = [];
      for (int i = 0; i < (response.body["Products"] as List).length; i++) {
        ps.add(Product.fromMap(response.body["Products"][i]));
      }

      _productControllerX.updateProducts(ps: ps);
    }
    Timer(const Duration(seconds: 2), () {
      _productControllerX.updateloadingListProducts(value: false);
    });
    return response;
  }

  Future<Response?> likeProduct({required String idProduct}) async {
    Response? response = await _httpProvider.httpPost(
      address: "/like",
      obj: {
        "ID": idProduct,
      },
    );

    return response;
  }
}
