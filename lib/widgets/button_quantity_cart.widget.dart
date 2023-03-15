import 'package:church_app/controllers/cart.controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ButtonQuantityCart extends StatefulWidget {
  final int index;
  final bool full;

  const ButtonQuantityCart({
    required this.index,
    this.full = false,
    Key? key,
  }) : super(key: key);

  @override
  State<ButtonQuantityCart> createState() => _ButtonQuantityCartState();
}

class _ButtonQuantityCartState extends State<ButtonQuantityCart> {
  final CartControllerX _cartControllerX = Get.find<CartControllerX>();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // width: MediaQuery.of(context).size.width,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          SizedBox(
            width: widget.full ? MediaQuery.of(context).size.width / 4 : 40,
            child: TextButton(
              onPressed: () {
                if ((_cartControllerX.mapProducts[widget.index]["quantity"]
                        as int) ==
                    1) {
                  _cartControllerX.removeItem(index: widget.index);
                } else {
                  int quantity = _cartControllerX.mapProducts[widget.index]
                      ["quantity"] as int;
                  _cartControllerX.updateItemCart(
                    index: widget.index,
                    quantity: quantity -= 1,
                  );
                  setState(() {});
                }
              },
              child: const Center(
                child: Icon(Icons.remove),
              ),
            ),
          ),
          Obx(
            () => SizedBox(
              width: widget.full ? MediaQuery.of(context).size.width / 4 : 30,
              child: Center(
                child: Text(
                  _cartControllerX.mapProducts[widget.index]["quantity"]
                      .toString(),
                ),
              ),
            ),
          ),
          SizedBox(
            width: widget.full ? MediaQuery.of(context).size.width / 4 : 40,
            child: TextButton(
              onPressed: () {
                int quantity = _cartControllerX.mapProducts[widget.index]
                    ["quantity"] as int;
                _cartControllerX.updateItemCart(
                  index: widget.index,
                  quantity: quantity += 1,
                );
                setState(() {});
              },
              child: const Center(
                child: Icon(Icons.add),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
