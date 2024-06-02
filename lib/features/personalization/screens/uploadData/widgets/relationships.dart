
import 'package:ecommerce_app/features/personalization/screens/uploadData/widgets/upload_data_menu.dart';
import 'package:ecommerce_app/features/shop/controller/brand_controller.dart';
import 'package:ecommerce_app/features/shop/controller/product/product_controller.dart';
import 'package:ecommerce_app/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class TRelationships extends StatelessWidget {
  const TRelationships({super.key});

  @override
  Widget build(BuildContext context) {
    final productController = Get.put(ProductController());
    final brandController = Get.put(BrandController());
    return  Padding(
      padding: const EdgeInsets.all(TSizes.defaultSpace),
      child: Column(
        children: [
          ListTile(
           title: Text( 'Relationships',style: Theme.of(context).textTheme.headlineSmall,),
            subtitle: Text('Make sure you have already uploaded all the content above.',style: Theme.of(context).textTheme.bodyMedium,),
         ),
          const SizedBox(
            height: TSizes.spaceBtwItems,
          ),
          TUploadDataMenu(
            icon: Iconsax.category,
            title: 'Upload Brands & Categories Relational Data',
            trailing: IconButton(onPressed: ()=> brandController.uploadDummyDataBrandCategory() , icon: const Icon(Iconsax.arrow_up_14,color: Colors.blue)),
          ),
          TUploadDataMenu(
            icon: Iconsax.shopping_cart,
            title: 'Upload Product Categories Relational Data',
            trailing: IconButton(onPressed: ()=> productController.uploadDummyDataProductCategory() , icon: const Icon(Iconsax.arrow_up_14,color: Colors.blue)),
          ),

        ],
      ),
    );
  }
}
