
import 'package:ecommerce_app/common/widgets/appbar/app_bar.dart';
import 'package:ecommerce_app/features/personalization/controllers/update_name_controller.dart';
import 'package:ecommerce_app/utils/constants/sizes.dart';
import 'package:ecommerce_app/utils/constants/text_strings.dart';
import 'package:ecommerce_app/utils/validators/validation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class ChangName extends StatelessWidget {
  const ChangName({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UpdateNameController());
   return Scaffold(
     ///Custom Appbar
     appBar: TAppBar(
       showBackArrow: true,
       title: Text('Chang Name',style: Theme.of(context).textTheme.headlineSmall,),
     ),
     body: Padding(
       padding: const EdgeInsets.all(TSizes.defaultSpace),
       child: Column(
         crossAxisAlignment: CrossAxisAlignment.start,
         children: [

           ///Heading
           Text(
             'User real name for easy verification. This name will appear on several pages.',
             style: Theme.of(context).textTheme.labelMedium,
           ),
           const SizedBox(height: TSizes.spaceBtwSections,),

           ///Text field and Button
           Form(
             key: controller.updateUserNameFormKey,
             child: Column(
               children: [
                 TextFormField(
                   controller: controller.firstName,
                   validator: (value) => TValidator.validateEmptyText('First Name', value),
                   expands: false,
                   decoration: const InputDecoration(labelText: TTexts.firstName, prefixIcon: Icon(Iconsax.user)),
                 ),
                 const SizedBox(height: TSizes.spaceBtwInputFields,),
                 TextFormField(
                   controller: controller.lastName,
                   validator: (value) => TValidator.validateEmptyText('Last Name', value),
                   expands: false,
                   decoration: const InputDecoration(labelText: TTexts.lastName, prefixIcon: Icon(Iconsax.user)),
                 )
               ],
             ),
           ),
           const SizedBox(height: TSizes.spaceBtwSections,),

           ///Save Button
           SizedBox(
             width: double.infinity,
             child: ElevatedButton(onPressed: () => controller.updateUserName(), child: const Text('Save'),),
           )
         ],
       ),
     ),
   );
  }

}