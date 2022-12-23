import 'package:flutter/material.dart';

class CustomTabView extends StatefulWidget {
  final int itemCount;
  final IndexedWidgetBuilder pageBuilder;
  final ValueChanged<int> onPositionChange;
  final ValueChanged<double> onScroll;
  final int initPosition;
  final TabController controller;

  const CustomTabView({
    Key? key,
    required this.itemCount,
    required this.pageBuilder,
    required this.onPositionChange,
    required this.onScroll,
    required this.initPosition,
    required this.controller,
  }) : super(key: key);

  @override
  State<CustomTabView> createState() => _CustomTabViewState();
}

class _CustomTabViewState extends State<CustomTabView> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return TabBarView(
      controller: widget.controller,
      physics: const NeverScrollableScrollPhysics(),
      children: List.generate(
        widget.itemCount,
        (index) => widget.pageBuilder(context, index),
      ),
    );
  }
}
