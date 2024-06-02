import 'package:ecommerce_app/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class TGridLayout extends StatelessWidget {
  const TGridLayout(
      {super.key,
      required this.itemCount,
      this.mainAxisExtent = 288,
      required this.itemBuilder
      });

  final int itemCount;
  final double? mainAxisExtent;
  final Widget? Function(BuildContext, int) itemBuilder;

  @override
  Widget build(BuildContext context) {
    return  GridView.builder(
        itemCount: itemCount,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        padding: EdgeInsets.zero,
        gridDelegate:
         SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: TSizes.gridViewSpacing,
          crossAxisSpacing: TSizes.gridViewSpacing,
          mainAxisExtent: mainAxisExtent,
        ),
        itemBuilder:itemBuilder);
  }
}
