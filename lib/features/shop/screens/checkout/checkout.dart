import 'package:ecommerce_app/common/widgets/appbar/app_bar.dart';
import 'package:ecommerce_app/common/widgets/custom_shapes/container/rounded_container.dart';
import 'package:ecommerce_app/common/widgets/product/cart/coupon_widget.dart';
import 'package:ecommerce_app/features/shop/controller/product/cart_controller.dart';
import 'package:ecommerce_app/features/shop/controller/product/order_controller.dart';
import 'package:ecommerce_app/features/shop/screens/cart/widgets/cart_items.dart';
import 'package:ecommerce_app/features/shop/screens/checkout/widgets/billing_address_section.dart';
import 'package:ecommerce_app/features/shop/screens/checkout/widgets/billing_amount_section.dart';
import 'package:ecommerce_app/features/shop/screens/checkout/widgets/billing_payment_section.dart';
import 'package:ecommerce_app/utils/constants/colors.dart';
import 'package:ecommerce_app/utils/constants/sizes.dart';
import 'package:ecommerce_app/utils/helpers/helper_functions.dart';
import 'package:ecommerce_app/utils/helpers/pricing_calculator.dart';
import 'package:ecommerce_app/utils/popups/loaders.dart';
import 'package:flutter/material.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    final cartController = CartController.instance;
    final subTotal = cartController.totalCartPrice.value;
    final orderController = OrderController.instance;
    final totalAmount = TPricingCalculator.calculateTotalPrice(subTotal, 'US');
    return Scaffold(
        appBar: TAppBar(
            showBackArrow: true,
            title: Text(
              'Order Review',
              style: Theme.of(context).textTheme.headlineSmall,
            )),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(TSizes.defaultSpace),
            child: Column(
              children: [
                ///Items in cart
                const TCartItems(
                  showAddRemoveButtons: false,
                ),
                const SizedBox(
                  height: TSizes.spaceBtwSections,
                ),

                /// Coupon TextField
                const TCouponCode(),
                const SizedBox(
                  height: TSizes.spaceBtwSections,
                ),

                ///Billing Section
                TRoundedContainer(
                  showBorder: true,
                  padding: const EdgeInsets.all(TSizes.md),
                  backgroundColor: dark ? TColors.black : TColors.white,
                  child: const Column(
                    children: [
                      ///Pricing
                      TBillingAmountSection(),
                      SizedBox(
                        height: TSizes.spaceBtwItems,
                      ),

                      ///Divider
                      Divider(),
                      SizedBox(
                        height: TSizes.spaceBtwItems,
                      ),

                      ///Payment Method
                      TBillingPaymentSection(),
                      SizedBox(
                        height: TSizes.spaceBtwItems,
                      ),

                      ///Address
                      TBillingAddressSection(),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),

        ///Checkout Button
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: ElevatedButton(
            onPressed: subTotal > 0 ?
            () => orderController.processOrder(totalAmount)
            : () => TLoaders.warningSnackBar(title: 'Empty Cart',message: 'Add items in the cart in order to proceed.'),
            child:  Text('Checkout \$$totalAmount'),
          ),
        ));
  }
}
