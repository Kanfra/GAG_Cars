import 'package:flutter/material.dart';

import '../../../GlobalVariables/sizeGlobalVariables.dart';

class BodyContainer extends StatelessWidget {
  final Size screenSize;
  final List<Widget> columnList;
  final double? paddingWidth;
  final double? paddingHeight;
  final double? screenHeight;
  final bool isScroll;
  final Color? bodyContainerBackgroundColor;
  final bool isForSliverToBoxAdapter;
  final MainAxisAlignment? mainAxisAlignment;
  const BodyContainer({
    required this.columnList,
    this.mainAxisAlignment,
    this.paddingWidth,
    this.paddingHeight,
    this.screenHeight,
    required this.isScroll,
    this.bodyContainerBackgroundColor,
    required this.screenSize,
    required this.isForSliverToBoxAdapter,
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return isForSliverToBoxAdapter ? Padding(
      padding: EdgeInsets.symmetric(
        horizontal: paddingWidth ?? SizeGlobalVariables.double_size_fifteen,
        vertical: paddingHeight ?? SizeGlobalVariables.zero,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: columnList,
      ),
    ) : Container(
      width: screenSize.width,
      height: screenHeight,
      decoration: BoxDecoration(
        color: bodyContainerBackgroundColor ?? Theme.of(context).scaffoldBackgroundColor,
      ),
      padding: EdgeInsets.symmetric(
        horizontal: paddingWidth ?? SizeGlobalVariables.double_size_fifteen,
        vertical: paddingHeight ?? SizeGlobalVariables.zero,
      ),
      child: isScroll ? SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: mainAxisAlignment ?? MainAxisAlignment.start,
          children: columnList,
        ),
      ) : Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: mainAxisAlignment ?? MainAxisAlignment.start,
        children: columnList,
      ),
    );
  }
}
