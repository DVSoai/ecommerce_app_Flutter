import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_app/common/widgets/appbar/app_bar.dart';
import 'package:ecommerce_app/common/widgets/product/sortable/sortable_products.dart';
import 'package:ecommerce_app/common/widgets/shimmer/vertical_product_shimmer.dart';
import 'package:ecommerce_app/features/shop/controller/product/all_product_controller.dart';
import 'package:ecommerce_app/utils/constants/sizes.dart';
import 'package:ecommerce_app/utils/helpers/cloud_helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../models/product_model.dart';

class AllProducts extends StatelessWidget {
  const AllProducts({super.key, required this.title, this.query, this.futureMethod});
  final String title;
  final Query? query;
  final Future<List<ProductModel>>? futureMethod;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AllProductController());
    return  Scaffold(
      appBar: TAppBar(
        title: Text(title),
        showBackArrow: true,
      ),
      body:  SingleChildScrollView(
        padding: const EdgeInsets.all(TSizes.defaultSpace),
        child: FutureBuilder(
          future: futureMethod ?? controller.fetchProductsByQuery(query) ,
          builder: (context, snapshot){
            //Check the state of the FutureBuilder snapshot
            const loader = TVerticalProductShimmer();
            final widget = TCloudHelperFunctions.checkMultiRecordState(snapshot: snapshot,loader: loader);

            //Return appropriate widget based on snapshot state
            if(widget !=null) return widget;
            //Product found!
            final products = snapshot.data!;

            return  TSortableProducts(products: products,);
          },
        ),
      ),
    );
  }
}


