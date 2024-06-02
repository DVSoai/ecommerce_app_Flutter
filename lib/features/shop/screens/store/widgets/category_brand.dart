import 'package:ecommerce_app/common/widgets/brands/brand_show_case.dart';
import 'package:ecommerce_app/common/widgets/shimmer/boxes_shimmer.dart';
import 'package:ecommerce_app/common/widgets/shimmer/list_title_shimmer.dart';
import 'package:ecommerce_app/features/shop/controller/brand_controller.dart';
import 'package:ecommerce_app/features/shop/models/category_model.dart';
import 'package:ecommerce_app/utils/constants/sizes.dart';
import 'package:ecommerce_app/utils/helpers/cloud_helper_functions.dart';
import 'package:flutter/material.dart';

class CategoryBrands extends StatelessWidget {
  const CategoryBrands({super.key, required this.category});

  final CategoryModel category;

  @override
  Widget build(BuildContext context) {
    final controller = BrandController.instance;
    return FutureBuilder(
        future: controller.getBrandsForCategory(category.id),
        builder: (context, snapshot) {
          ///Handle Loader, No Record, Or Error Message
          const loader = Column(
            children: [
              TListTitleShimmer(),
              SizedBox(
                height: TSizes.spaceBtwItems,
              ),
              TBoxesShimmer(),
              SizedBox(
                height: TSizes.spaceBtwItems,
              )
            ],
          );
          final widget = TCloudHelperFunctions.checkMultiRecordState(
              snapshot: snapshot, loader: loader);
          if (widget != null) return widget;

          /// Record Found!
          final brands = snapshot.data!;
          return ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: brands.length,
            itemBuilder: (_, index) {
              final brand = brands[index];
              return FutureBuilder(
                  future:
                      controller.getBrandProducts(brandId: brand.id, limit: 3),
                  builder: (context, snapshot) {


                    ///Handle Loader No Record OR ERROR Message
                    final widget = TCloudHelperFunctions.checkMultiRecordState(snapshot: snapshot,loader: loader);
                    if(widget != null) return widget;

                    ///Record Found!
                    final products = snapshot.data!;
                    return TBrandShowCase(
                      images: products.map((e) => e.thumbnail).toList(),
                      brand: brand,
                    );
                  });
            },
          );
        });
  }
}
