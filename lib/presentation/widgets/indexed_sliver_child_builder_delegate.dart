import 'package:flutter/material.dart';
import 'package:scroll_to_index/scroll_to_index.dart';

class IndexedSliverChildBuilderDelegate extends StatelessWidget {
  const IndexedSliverChildBuilderDelegate({
    super.key,
    required this.children,
    required this.controller,
    this.showIndex = false,
  });
  
  final AutoScrollController controller;
  final List<Widget> children;
  final bool showIndex;

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) => AutoScrollTag(
          key: ValueKey(index),
          controller: controller,
          index: index,
          child: Builder(
            builder: (context) {
              if (showIndex) {
                return Stack(
                  children: [
                    children[index],
                    Text('index: $index'),
                  ],
                );
              }
              return children[index];
            },
          ),
        ),
        childCount: children.length,
      ),
    );
  }
}
