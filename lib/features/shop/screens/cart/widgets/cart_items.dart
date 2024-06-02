import 'package:ecommerce_app/common/widgets/product/cart/add_remove_button.dart';
import 'package:ecommerce_app/common/widgets/product/cart/cart_item.dart';
import 'package:ecommerce_app/common/widgets/texts/product_price_text.dart';
import 'package:ecommerce_app/features/shop/controller/product/cart_controller.dart';
import 'package:ecommerce_app/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TCartItems extends StatelessWidget {
  const TCartItems({super.key,this.showAddRemoveButtons = true});
  final bool showAddRemoveButtons;

  @override
  Widget build(BuildContext context) {
    final cartController = CartController.instance;
    return Obx(
      ()=> ListView.separated(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount:cartController.cartItems.length,
        separatorBuilder: (_, __) =>
        const SizedBox(
          height: TSizes.spaceBtwSections,
        ),
        itemBuilder: (_, index) =>
             Obx((){
               final item = cartController.cartItems[index];
               return Column(
                 children: [
                   /// Cart Item
                    TCartItem(cartItem: item,),
                   if(showAddRemoveButtons)  const SizedBox(height: TSizes.spaceBtwItems,),
                   /// Add Remove Button Row  with total Price
                   if(showAddRemoveButtons)
                       Row(
                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                       children: [
                         Row(
                           children: [
                             const SizedBox(width: 70,),
                             ///ADD Remove Buttons
                             TProductQuantityWithAddRemoveButton(
                               quantity: item.quantity,
                               add: () => cartController.addOneToCart(item),
                               remove: () => cartController.removeOneFromCart(item),
                             ),
                           ],
                         ),
                         TProductPriceText(price: (item.price * item.quantity).toStringAsFixed(1))
                       ],
                     )
                 ],
               );
             }),
      ),
    );
  }
}


