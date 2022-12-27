import 'package:church_app/controllers/config.controller.dart';
import 'package:church_app/widgets/about_product.widget.dart';
import 'package:church_app/widgets/add_to_cart_button.widget.dart';
import 'package:church_app/widgets/cart_button.widget.dart';
import 'package:church_app/widgets/like_button.widget.dart';
import 'package:church_app/widgets/size_slider.widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../models/product.model.dart';
import '../widgets/custom_back_button.widget.dart';

class DetailProductPage extends StatefulWidget {
  const DetailProductPage({Key? key}) : super(key: key);

  @override
  State<DetailProductPage> createState() => _DetailProductPageState();
}

class _DetailProductPageState extends State<DetailProductPage> {
  late Product product;

  @override
  void initState() {
    product = Get.arguments['product'];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 300,
            toolbarHeight: 60,
            pinned: true,
            floating: true,
            leading: const Center(
              child: SizedBox(
                width: 40,
                height: 40,
                child: CustomBackButton(),
              ),
            ),
            actions: [
              Center(
                child: SizedBox(
                  width: 40,
                  height: 40,
                  child: LikeButton(
                    onPressLike: () {},
                    liked: true,
                  ),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              const Center(
                child: SizedBox(
                  width: 40,
                  height: 40,
                  child: CartButton(),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
            ],
            flexibleSpace: FlexibleSpaceBar(
              titlePadding: const EdgeInsets.symmetric(horizontal: 60),
              title: InvisibleExpandedHeader(
                child: Container(
                  height: 60,
                  alignment: Alignment.centerLeft,
                  child: Text(
                    product.name,
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                    ),
                  ),
                ),
              ),
              background: Hero(
                tag: 'tag${product.id}',
                child: FadeInImage(
                  height: 140,
                  width: 140,
                  fit: BoxFit.cover,
                  imageErrorBuilder: (BuildContext context, Object exception,
                      StackTrace? stackTrace) {
                    return Image.asset('assets/images/placeholder.jpg');
                  },
                  image: const NetworkImage(
                    'https://upload.wikimedia.org/wikipedia/commons/thumb/4/45/A_small_cup_of_coffee.JPG/1280px-A_small_cup_of_coffee.JPG',
                  ),
                  placeholder: const AssetImage(
                    'assets/images/placeholder.jpg',
                  ),
                ),
              ),
            ),
            //collapsedHeight: 20,
          ),
          SliverFillRemaining(
            hasScrollBody: true,
            fillOverscroll: true,
            child: Container(
              color: Config.colors[ColorVariables.backgroundGray],
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: ListView(
                physics: const NeverScrollableScrollPhysics(),
                children: <Widget>[
                  Container(
                    margin: const EdgeInsets.only(top: 8),
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Config.colors[ColorVariables.highlightGray],
                      borderRadius: BorderRadius.circular(
                        32.0,
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Container(
                          decoration: BoxDecoration(
                            color: Config.colors[ColorVariables.highlightGray],
                          ),
                          child: const Text('Coffee'),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            color: Config.colors[ColorVariables.highlightGray],
                          ),
                          child: const Text('Chocolate'),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            color: Config.colors[ColorVariables.highlightGray],
                          ),
                          child: const Text('Medium roasted'),
                        ),
                      ],
                    ),
                  ),
                  const SizeSelector(),
                  const AboutProduct(),
                  AddToCartButton(
                    product: product,
                    onPress: () {},
                  )
                ],
              ),
            ),
          )
          // SliverList(
          //   delegate: SliverChildBuilderDelegate(
          //     (BuildContext context, int index) {
          //       return Container(
          //         color: Colors.orange,
          //         margin: EdgeInsets.only(
          //           bottom: 16,
          //         ),
          //         height: 100,
          //         child: Center(child: Text('item $index')),
          //       );
          //     },
          //   ),
          // ),
        ],
      ),
    );
  }
}

class InvisibleExpandedHeader extends StatefulWidget {
  final Widget child;
  const InvisibleExpandedHeader({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  State<InvisibleExpandedHeader> createState() =>
      _InvisibleExpandedHeaderState();
}

class _InvisibleExpandedHeaderState extends State<InvisibleExpandedHeader> {
  ScrollPosition? _position;
  bool? _visible;

  @override
  void dispose() {
    _removeListener();
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _removeListener();
    _addListener();
  }

  void _addListener() {
    _position = Scrollable.of(context)?.position;
    _position?.addListener(_positionListener);
    _positionListener();
  }

  void _removeListener() {
    _position?.removeListener(_positionListener);
  }

  void _positionListener() {
    final FlexibleSpaceBarSettings? settings =
        context.dependOnInheritedWidgetOfExactType<FlexibleSpaceBarSettings>();
    bool visible =
        settings == null || settings.currentExtent <= settings.minExtent;
    if (_visible != visible) {
      setState(() {
        _visible = visible;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: _visible ?? false,
      child: widget.child,
    );
  }
}
