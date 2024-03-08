
import 'package:flutter/material.dart';

import 'tittle_widget.dart';

class HeaderFromBlogGridPage extends SliverPersistentHeaderDelegate {
  const HeaderFromBlogGridPage({required this.title});
  final String title;

  @override
  Widget build(
    final BuildContext context,
    final double shrinkOffset,
    final bool overlapsContent,
  ) =>
      TittleWidget(text: title);

  @override
  double get maxExtent => 70.0;

  @override
  double get minExtent => 50.0;

  @override
  bool shouldRebuild(covariant final oldDelegate) => false;
}
