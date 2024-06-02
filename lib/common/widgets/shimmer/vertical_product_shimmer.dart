import 'package:ecommerce_app/common/widgets/layouts/grid_layout.dart';
import 'package:ecommerce_app/common/widgets/shimmer/shimmer_effect.dart';
import 'package:ecommerce_app/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
class TVerticalProductShimmer extends StatelessWidget {
  const TVerticalProductShimmer({super.key,  this.itemCount =4});
  final int itemCount;

  @override
  Widget build(BuildContext context) {
  return TGridLayout(
      itemCount: itemCount,
      itemBuilder: (_,__) => const SizedBox(
        width: 180,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ///Image
            TShimmerEffect(width: 180, height: 180),
            SizedBox(height: TSizes.spaceBtwItems,),

            ///Text
            TShimmerEffect(width: 160, height: 15),
            SizedBox(height: TSizes.spaceBtwItems /2,),
            TShimmerEffect(width: 110, height: 15),
          ],
        ),
      )
  );
  }
}