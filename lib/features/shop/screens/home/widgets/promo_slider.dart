import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecommerce_app/common/widgets/custom_shapes/container/circular_container.dart';
import 'package:ecommerce_app/common/widgets/images/t_round_image.dart';
import 'package:ecommerce_app/common/widgets/shimmer/shimmer_effect.dart';
import 'package:ecommerce_app/features/shop/controller/banner_controller.dart';
import 'package:ecommerce_app/utils/constants/colors.dart';
import 'package:ecommerce_app/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TPromoSlider extends StatelessWidget {
  const TPromoSlider({
    super.key,
    // required this.banners,
  });

  // final List<String>banners;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(BannerController());
    return Obx(() {

      if(controller.isLoading.value) return const TShimmerEffect(width: double.infinity, height: 190);

     if(controller.banners.isEmpty){
       return const Center(child: Text('No data Found!'),);
     }else {
       return Column(
         children: [
           CarouselSlider(
               options: CarouselOptions(
                   viewportFraction: 1,
                   onPageChanged: (index, _) =>
                       controller.updatePageIndicator(index)),
               items: controller.banners
                   .map(
                     (banner) =>
                     TRoundedImage(
                       imageUrl: banner.imageUrl,
                       isNetworkImage: true,
                       onPressed: () => Get.toNamed(banner.targetScreen),
                     ),
               ).toList()
           ),
           const SizedBox(
             height: TSizes.spaceBtwItems,
           ),
           Center(
             child: Obx(() =>
                 Row(
                   mainAxisSize: MainAxisSize.min,
                   children: [
                     for (int i = 0; i < controller.banners.length; i++)
                       TCircularContainer(
                         width: 20,
                         height: 4,
                         margin: const EdgeInsets.only(right: 10),
                         backgroundColor:
                         controller.carousalCurrentIndex.value == i
                             ? TColors.primary
                             : TColors.grey,
                       )
                   ],
                 )),
           )
         ],
       );
     }
    }
    );
  }
}
