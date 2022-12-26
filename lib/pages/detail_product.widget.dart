import 'package:church_app/widgets/like_button.widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class DetailProductPage extends StatefulWidget {
  const DetailProductPage({Key? key}) : super(key: key);

  @override
  State<DetailProductPage> createState() => _DetailProductPageState();
}

class _DetailProductPageState extends State<DetailProductPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 300,
            pinned: true,
            floating: true,
            actions: [
              SizedBox(
                width: 55,
                child: LikeButton(
                  onPressLike: () {},
                  liked: true,
                ),
              ),
              SizedBox(
                width: 10,
              )
            ],
            flexibleSpace: FlexibleSpaceBar(
              title: InvisibleExpandedHeader(
                child: Text(
                  'Global Iq Test for all students in the world',
                  style: TextStyle(color: Colors.black),
                ),
              ),
              background: Hero(
                tag: 'tag0',
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
            child: Container(
              decoration: BoxDecoration(
                color: Colors.purple,
                borderRadius: BorderRadius.circular(
                  8.0,
                ),
              ),
              child: Center(
                child: Text("data"),
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
  _InvisibleExpandedHeaderState createState() {
    return _InvisibleExpandedHeaderState();
  }
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
    print(_visible);
    return Visibility(
      visible: _visible ?? false,
      child: widget.child,
    );
  }
}
