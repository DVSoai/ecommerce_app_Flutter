import 'package:ecommerce_app/common/widgets/texts/section_heading.dart';
import 'package:ecommerce_app/features/personalization/controllers/address_controller.dart';
import 'package:ecommerce_app/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class TBillingAddressSection extends StatelessWidget {
  const TBillingAddressSection({super.key});

  @override
  Widget build(BuildContext context) {
    final addressController = AddressController.instance;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TSectionHeading(
          title: 'Shipping Address',
          buttonTitle: 'Change',
          onPressed: () => addressController.selectNewAddressPopup(context),
        ),
        addressController.selectedAddress.value.id.isNotEmpty
       ? Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Marshal',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            const SizedBox(height: TSizes.spaceBtwItems/2,),
            Row(
              children: [
                const Icon(
                  Icons.phone,
                  color: Colors.grey,
                  size: 16,
                ),
                const SizedBox(
                  width: TSizes.spaceBtwItems,
                ),
                Text(
                  '+84 9876543210',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ],
            ),
            const SizedBox(
              height: TSizes.spaceBtwItems / 2,
            ),
            Row(
              children: [
                const Icon(
                  Icons.location_history,
                  color: Colors.grey,
                  size: 16,
                ),
                const SizedBox(
                  width: TSizes.spaceBtwItems,
                ),
                Expanded(
                  child: Text(
                    "Tốt Động, Chương Mỹ, Hà Nội",
                    style: Theme.of(context).textTheme.bodyMedium,
                    softWrap: true,
                  ),
                )
              ],
            )
          ],
        ) : Text('Select Address', style: Theme.of(context).textTheme.bodyMedium,),
      ],
    );
  }
}
