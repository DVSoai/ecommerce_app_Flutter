import 'package:ecommerce_app/features/personalization/controllers/user_controller.dart';
import 'package:ecommerce_app/utils/constants/sizes.dart';
import 'package:ecommerce_app/utils/constants/text_strings.dart';
import 'package:ecommerce_app/utils/validators/validation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class ReAuthLoginForm extends StatelessWidget{
  const ReAuthLoginForm({super.key});

  @override
  Widget build(BuildContext context) {
   final controller = UserController.instance;
   return Scaffold(
     appBar: AppBar(title: const Text('Re-Authenticate '),),
     body: SingleChildScrollView(
       child: Padding(
         padding: const EdgeInsets.all(TSizes.defaultSpace),
         child: Form(
           key: controller.reAuthFormKey,
           child: Column(
             crossAxisAlignment: CrossAxisAlignment.start,
             children: [
               ///Email
               TextFormField(
                 controller: controller.verifyEmail,
                 validator: TValidator.validateEmail,
                 decoration: const InputDecoration(prefixIcon: Icon(Iconsax.direct_right), labelText: TTexts.email),
               ),
               const SizedBox(height: TSizes.spaceBtwInputFields,),

               ///PASSWORD
               Obx(
                     () => TextFormField(
                   controller: controller.verifyPassWord,
                   validator: (value) => TValidator.validateEmptyText('Password',value),
                   obscureText: controller.hidePassword.value,
                   decoration: InputDecoration(
                       prefixIcon: const Icon(Iconsax.password_check),
                       labelText: TTexts.password,
                       suffixIcon: IconButton(
                         onPressed: () => controller.hidePassword.value =
                         !controller.hidePassword.value,
                         icon: Icon(controller.hidePassword.value
                             ? Iconsax.eye_slash
                             : Iconsax.eye),
                       )),
                 ),
               ),
               const SizedBox(height: TSizes.spaceBtwSections,),

               ///Login Button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(onPressed: () => controller.reAuthenticateEmailAndPasswordUser(), child: const Text('Verify'),),
              )
             ],
           ),
         ),
       ),
     )
   );
  }

}