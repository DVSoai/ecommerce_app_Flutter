import 'package:ecommerce_app/common/widgets/appbar/app_bar.dart';
import 'package:ecommerce_app/common/widgets/images/t_round_image.dart';
import 'package:ecommerce_app/common/widgets/product/product_cards/product_card_horizontal.dart';
import 'package:ecommerce_app/common/widgets/shimmer/horizontal_product_shimmer.dart';
import 'package:ecommerce_app/common/widgets/texts/section_heading.dart';
import 'package:ecommerce_app/features/shop/controller/category_controller.dart';
import 'package:ecommerce_app/features/shop/models/category_model.dart';
import 'package:ecommerce_app/features/shop/screens/all_products/all_products.dart';
import 'package:ecommerce_app/utils/constants/image_strings.dart';
import 'package:ecommerce_app/utils/constants/sizes.dart';
import 'package:ecommerce_app/utils/helpers/cloud_helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SubCategoriesScreen extends StatelessWidget {
  const SubCategoriesScreen({super.key, required this.category});

  final CategoryModel category;

  @override
  Widget build(BuildContext context) {
    final controller = CategoryController.instance;
    return Scaffold(
      appBar: TAppBar(
        title: Text(category.name),
        showBackArrow: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              /// Banner
              const TRoundedImage(
                imageUrl: TImages.promoBanner1,
                applyImageRadius: true,
                width: double.infinity,
              ),
              const SizedBox(
                height: TSizes.spaceBtwSections,
              ),

              ///Sub-Categories
              FutureBuilder(
                  future: controller.getSubCategories(category.id),
                  builder: (context, snapshot) {
                    ///Handle loader, No record, or error message
                    const loader = THorizontalProductShimmer();
                    final widget = TCloudHelperFunctions.checkMultiRecordState(
                        snapshot: snapshot, loader: loader);
                    if (widget != null) return widget;

                    ///Record found
                    final subCategories = snapshot.data!;
                    return ListView.builder(
                      shrinkWrap: true,
                      itemCount: subCategories.length,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (_, index) {
                        final subCategory = subCategories[index];
                        return FutureBuilder(
                          future: controller.getCategoryProducts(categoryId: subCategory.id),
                          builder: (context, snapshot) {

                            ///Handle loader, No record, or error message
                            final widget = TCloudHelperFunctions.checkMultiRecordState(
                                snapshot: snapshot, loader: loader);
                            if (widget != null) return widget;
                            ///Record found
                            final products = snapshot.data!;
                            return Column(
                              children: [
                                ///Heading
                                TSectionHeading(
                                  title: subCategory.name,
                                  onPressed: () => Get.to(() => AllProducts(
                                        title: subCategory.name,
                                        futureMethod: controller.getCategoryProducts(categoryId: subCategory.id,limit: -1),
                                      )),
                                ),
                                const SizedBox(
                                  height: TSizes.spaceBtwItems / 2,
                                ),
                                SizedBox(
                                  height: 120,
                                  child: ListView.separated(
                                    itemCount: products.length,
                                    separatorBuilder: (context, index) =>
                                        const SizedBox(
                                      width: TSizes.spaceBtwItems,
                                    ),
                                    scrollDirection: Axis.horizontal,
                                    itemBuilder: (context, index) =>
                                         TProductCardHorizontal(product: products[index]),
                                  ),
                                ),

                                const SizedBox(height: TSizes.spaceBtwSections,)
                              ],
                            );
                          }
                        );
                      },
                    );
                  })
            ],
          ),
        ),
      ),
    );
  }
}
