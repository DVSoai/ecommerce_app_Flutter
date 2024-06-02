import 'package:ecommerce_app/features/authentication/controller/login/login_controller.dart';
import 'package:ecommerce_app/utils/constants/colors.dart';
import 'package:ecommerce_app/utils/constants/image_strings.dart';
import 'package:ecommerce_app/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TSocialButton extends StatelessWidget {
  const TSocialButton({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginController());
    return
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              decoration: BoxDecoration(
                  border: Border.all(color: TColors.grey),
                  borderRadius: BorderRadius.circular(100),
              ),
              child: IconButton(
                onPressed: ()=> controller.googleSignIn(),
                icon: const Image(
                  height: TSizes.iconMd,
                    width: TSizes.iconMd,
                    image: AssetImage(TImages.google)
                ),
              ),
            ),
            const SizedBox(width: TSizes.spaceBtwItems,),
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: TColors.grey),
                borderRadius: BorderRadius.circular(100),
              ),
              child: IconButton(
                onPressed: () {},
                icon: const Image(
                    height: TSizes.iconMd,
                    width: TSizes.iconMd,
                    image: AssetImage(TImages.facebook)
                ),
              ),
            ),
          ],
        );
  }
  
}