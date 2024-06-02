
import 'package:ecommerce_app/common/widgets/success_screen/success_screen.dart';
import 'package:ecommerce_app/data/repositories/authentication/authentication_repository.dart';
import 'package:ecommerce_app/data/repositories/order/order_repository.dart';
import 'package:ecommerce_app/features/personalization/controllers/address_controller.dart';
import 'package:ecommerce_app/features/shop/controller/product/cart_controller.dart';
import 'package:ecommerce_app/features/shop/controller/product/checkout_controller.dart';
import 'package:ecommerce_app/navigation_menu.dart';
import 'package:ecommerce_app/utils/constants/enums.dart';
import 'package:ecommerce_app/utils/constants/image_strings.dart';
import 'package:ecommerce_app/utils/popups/full_screen_loader.dart';
import 'package:ecommerce_app/utils/popups/loaders.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../models/order_model.dart';

class OrderController extends GetxController{
  static OrderController get instance => Get.find();

  final cartController = CartController.instance;
  final addressController = AddressController.instance;
  final checkoutController = CheckoutController.instance;
  final orderRepository = Get.put(OrderRepository());

  /// Fetch user's order history
  Future<List<OrderModel>> fetchUserOrders()async{
    try{
      final userOrder = await orderRepository.fetchUserOrders();
      return userOrder;
    }catch(e){
      TLoaders.warningSnackBar(title: 'On Snap!', message: e.toString());
      return [];
    }
  }

  ///Add method for order processing
  void processOrder(double totalAmount) async{
    try{
      //Start loader
      TFullScreenLoader.openLoadingDialog('Processing your order', TImages.pencilAnimation);

      //Get user authentication id
      final userId = AuthenticationRepository.instance.authUser.uid;
      if(userId.isEmpty) return;

      //Add Details
      final order = OrderModel(
        //Generate a unique ID for the order
        id: UniqueKey().toString(),
        userId: userId,
        status: OrderStatus.pending,
        totalAmount: totalAmount,
        orderDate: DateTime.now(),
        paymentMethod: checkoutController.selectedPaymentMethod.value.name,
        address: addressController.selectedAddress.value,

        //Set date as needed
        deliveryDate: DateTime.now(),
        items: cartController.cartItems.toList(),
      );

      //Save the order to Firestore
      await orderRepository.saveOrder(order, userId);
      //update the cart Status
      cartController.clearCart();

      //Show Success screen
      Get.off(() => SuccessScreen(
        image: TImages.orderCompletedAnimation,
        title: 'Payment Success!',
        subTitle: 'Your item will be shipped soon!',
        onPress: () => Get.offAll(()=> const NavigationMenu()),
      ));
    }catch(e){
      TLoaders.errorSnackBar(title: 'Oh Snap', message: e.toString());
    }
  }

}