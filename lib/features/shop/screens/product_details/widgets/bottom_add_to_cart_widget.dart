import 'package:ecommerce_app/common/widgets/icons/t_circular_icon.dart';
import 'package:ecommerce_app/features/shop/controller/product/cart_controller.dart';
import 'package:ecommerce_app/features/shop/models/product_model.dart';
import 'package:ecommerce_app/utils/constants/colors.dart';
import 'package:ecommerce_app/utils/constants/sizes.dart';
import 'package:ecommerce_app/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class TBottomAddToCart extends StatelessWidget {
  const TBottomAddToCart({super.key, required this.product});

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final controller = CartController.instance;
    controller.updateAlreadyAddedProductCount(product);
    final dark = THelperFunctions.isDarkMode(context);
    return Container(
      padding: const EdgeInsets.symmetric(
          horizontal: TSizes.defaultSpace/2, vertical: TSizes.defaultSpace/2),
      decoration: BoxDecoration(
          color: dark ? TColors.darkerGrey : TColors.light,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(TSizes.cardRadiusLg),
            topRight: Radius.circular(TSizes.cardRadiusLg),
          )),
      child: Obx(
        ()=> Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
                children: [
                   TCircularIcon(
                    icon: Iconsax.minus,
                    backgroundColor: Colors.lightBlueAccent,
                    color: TColors.white,
                    height: 40,
                    width: 40,
                     onPressed: () => controller.productQuantityInCart.value <1 ? null : controller.productQuantityInCart.value -=1,
                  ),
                  const SizedBox(
                    width: TSizes.spaceBtwItems,
                  ),
                  Text(
                    controller.productQuantityInCart.value.toString(),
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                  const SizedBox(
                    width: TSizes.spaceBtwItems,
                  ),
                   TCircularIcon(
                    icon: Iconsax.add,
                    backgroundColor: TColors.primary,
                    color: TColors.white,
                    height: 40,
                    width: 40,
                     onPressed: () => controller.productQuantityInCart.value += 1,
                  ),
                ],
              ),
            ElevatedButton(onPressed: controller.productQuantityInCart.value <1 ? null : () => controller.addToCart(product),
              style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.all(TSizes.md),
              backgroundColor: TColors.primary,
              side: const BorderSide(color: TColors.primary),
            ),
              child: const Text('Add to Cart'),
            )
          ],
        ),
      ),
    );
  }
}
