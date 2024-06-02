import 'package:ecommerce_app/common/widgets/layouts/grid_layout.dart';
import 'package:ecommerce_app/common/widgets/shimmer/shimmer_effect.dart';
import 'package:flutter/material.dart';

class TBrandShimmer extends StatelessWidget {
  final int itemCount;

  const TBrandShimmer({super.key,  this.itemCount =4});

  @override
  Widget build(BuildContext context) {
    return TGridLayout(
        itemCount: itemCount,
        mainAxisExtent: 80,
        itemBuilder: (_,__) => const TShimmerEffect(width: 300, height: 80)
    );
  }
}