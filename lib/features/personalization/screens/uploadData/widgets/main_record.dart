import 'package:ecommerce_app/common/widgets/texts/section_heading.dart';
import 'package:ecommerce_app/features/personalization/screens/uploadData/widgets/upload_data_menu.dart';
import 'package:ecommerce_app/features/shop/controller/banner_controller.dart';
import 'package:ecommerce_app/features/shop/controller/brand_controller.dart';
import 'package:ecommerce_app/features/shop/controller/category_controller.dart';
import 'package:ecommerce_app/features/shop/controller/product/product_controller.dart';
import 'package:ecommerce_app/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class TMainRecord extends StatelessWidget {
  const TMainRecord({super.key});

  @override
  Widget build(BuildContext context) {
    final categoryController = Get.put(CategoryController());
    final bannerController = Get.put(BannerController());
    final productController = Get.put(ProductController());
    final brandController = Get.put(BrandController());
    return Padding(
      padding: const EdgeInsets.all(TSizes.defaultSpace),
      child: Column(
        children: [
          const TSectionHeading(
            title: "Main Record",
            showActionButton: false,
          ),
          const SizedBox(
            height: TSizes.spaceBtwItems,
          ),
          TUploadDataMenu(
            icon: Iconsax.category,
            title: 'Upload Categories',
            trailing: Obx(() {
              return categoryController.isLoading.value
                  ? const CircularProgressIndicator()
                  : IconButton(
                onPressed: () =>
                    categoryController.uploadDummyDataCategories(),
                icon: const Icon(
                  Iconsax.arrow_up_14,
                  color: Colors.blue,
                ),
              );
            }),
          ),
          TUploadDataMenu(
            icon: Iconsax.shop,
            title: 'Upload Brands',
            trailing: IconButton(
                onPressed: () => brandController.uploadDummyDataBrands(),
                icon: const Icon(Iconsax.arrow_up_14, color: Colors.blue)),
          ),
          TUploadDataMenu(
            icon: Iconsax.shopping_cart,
            title: 'Upload Products',
            trailing: IconButton(
                onPressed: () =>productController.uploadDummyDataProducts(),
                icon: const Icon(Iconsax.arrow_up_14, color: Colors.blue)),
          ),
          TUploadDataMenu(
            icon: Iconsax.image,
            title: 'Upload Banners',
            trailing: IconButton(
                onPressed: () =>bannerController.uploadDummyDataBanners(),
                icon: const Icon(
                  Iconsax.arrow_up_14,
                  color: Colors.blue,
                )),
          ),
        ],
      ),
    );
  }
}
