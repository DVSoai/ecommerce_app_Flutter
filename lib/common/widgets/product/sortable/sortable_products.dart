import 'package:ecommerce_app/common/widgets/layouts/grid_layout.dart';
import 'package:ecommerce_app/common/widgets/product/product_cards/product_card_vertical.dart';
import 'package:ecommerce_app/features/shop/controller/product/all_product_controller.dart';
import 'package:ecommerce_app/features/shop/models/product_model.dart';
import 'package:ecommerce_app/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class TSortableProducts extends StatelessWidget {
  const TSortableProducts({
    super.key,
    required this.products,
  });

  final List<ProductModel> products;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AllProductController());
    controller.assignProducts(products);
    return Column(
      children: [
        ///Dropdown
        DropdownButtonFormField(
          decoration: const InputDecoration(prefixIcon: Icon(Iconsax.sort)),
          value: controller.selectedSortOption.value,
          onChanged: (value) {
            controller.sortProducts(value!);
          },
          items: [
            'Name',
            'Higher Price',
            'Lower Price',
            'Sale',
            'Newest',
            'Popularity'
          ]
              .map((option) =>
                  DropdownMenuItem(value: option, child: Text(option)))
              .toList(),
        ),
        const SizedBox(
          height: TSizes.spaceBtwSections,
        ),

        ///Products
        // TGridLayout(itemCount: 4, itemBuilder: (_,index) => const TProductCardVertical())
        // Obx(() {
        //   if (controller.isLoading.value) {
        //     return const TVerticalProductShimmer();
        //   }
        //   if (controller.featuredProducts.isEmpty) {
        //     return Center(
        //       child: Text(
        //         'No Data Found!',
        //         style: Theme.of(context).textTheme.bodyMedium,
        //       ),
        //     );
        //   }
        //   return TGridLayout(
        //       itemCount: controller.featuredProducts.length,
        //       itemBuilder: (_, index) =>
        //           TProductCardVertical(product: controller.featuredProducts[index],));
        // })

        Obx(() => TGridLayout(
            itemCount: controller.products.length,
            itemBuilder: (_, index) =>
                TProductCardVertical(product: controller.products[index])))
      ],
    );
  }
}
