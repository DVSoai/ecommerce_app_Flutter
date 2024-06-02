import 'package:ecommerce_app/common/widgets/custom_shapes/container/rounded_container.dart';
import 'package:ecommerce_app/features/shop/controller/product/checkout_controller.dart';
import 'package:ecommerce_app/features/shop/models/payment_method_model.dart';
import 'package:ecommerce_app/utils/constants/colors.dart';
import 'package:ecommerce_app/utils/constants/sizes.dart';
import 'package:ecommerce_app/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class TPaymentTitle extends StatelessWidget{
  const TPaymentTitle({super.key, required this.paymentMethod});

  final PaymentMethodModel paymentMethod;

  @override
  Widget build(BuildContext context) {
   final controller = CheckoutController.instance;
   final dark = THelperFunctions.isDarkMode(context);
   return ListTile(
     contentPadding: const EdgeInsets.all(0),
     onTap: (){
       controller.selectedPaymentMethod.value = paymentMethod;
       Get.back();
     },
     leading: TRoundedContainer(
       width: 60,
       height: 40,
       backgroundColor: dark ? TColors.light : TColors.white,
       padding: const EdgeInsets.all(TSizes.sm),
       child: Image(image: AssetImage(paymentMethod.image),fit: BoxFit.contain,),
     ),
     title: Text(paymentMethod.name),
     trailing: const Icon(Iconsax.arrow_right_34),
   );
  }

}