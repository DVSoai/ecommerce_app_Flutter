

import 'package:ecommerce_app/data/models/dummy_data.dart';
import 'package:ecommerce_app/data/repositories/products/product_repository.dart';
import 'package:ecommerce_app/features/shop/models/product_model.dart';
import 'package:ecommerce_app/utils/constants/enums.dart';
import 'package:ecommerce_app/utils/popups/loaders.dart';
import 'package:get/get.dart';

class ProductController extends GetxController{
  static ProductController get instance => Get.find();

  final isLoading = false.obs;
  final productRepository = Get.put(ProductRepository());
  RxList<ProductModel> featuredProducts = <ProductModel>[].obs;

  @override
  void onInit() {
    fetchFeaturedProducts();
    super.onInit();
  }

  void fetchFeaturedProducts()async {
    try{
      isLoading.value = true;

      //Fetch Products
      final products = await productRepository.getFeaturedProducts();

      //Assign Products
      featuredProducts.assignAll(products);


    }catch(e){
      TLoaders.errorSnackBar(title: 'On Snap!', message: e.toString());
    }finally{
      isLoading.value = false;
    }
  }

  Future<List<ProductModel>>fetchAllFeaturedProducts()async {
    try{
      //Fetch Products
      final products = await productRepository.getAllFeaturedProducts();
      return products;

    }catch(e){
      TLoaders.errorSnackBar(title: 'On Snap!', message: e.toString());
      return [];
    }
  }

  String getProductPrice(ProductModel product){
    //Get the product price or price range for variations
    double smallestPrice = double.infinity;
    double largesPrice = 0.0;

    //If no variations exist return the simple price or sale price
    if(product.productType == ProductType.single.toString()){
      return(product.salePrice >0 ? product.salePrice : product.price).toString();
    }else {
      //Calculate the smallest and largest prices among variations
      for(var variation in product.productVariations!){
        //Determine the price to consider (sale price if available, otherwise regular price)
        double priceToConsider = variation.salePrice > 0.0 ? variation.salePrice : variation.price;

        //Update smallest and largest prices
        if(priceToConsider < smallestPrice){
          smallestPrice = priceToConsider;
        }
        if(priceToConsider > largesPrice){
          largesPrice = priceToConsider;
        }
      }
      //If smallest and largest prices are the same return a single price
      if(smallestPrice.isEqual(largesPrice)){
        return largesPrice.toString();
      }else{
        //Otherwise, return a price range
        return'$smallestPrice - \$$largesPrice';
      }
    }

  }

  /// -- Calculate Discount Percentage
  String? calculateSalePercentage(double originalPrice, double? salePrice){
    if(salePrice == null || salePrice <0){
      return null;
    }
    if(originalPrice <=0) return null;

    double percentage = ((originalPrice - salePrice) /originalPrice) * 100;
    return percentage.toStringAsFixed(0);
  }

  String getProductStockStatus(int stock){
    return stock >0 ? 'In Stock': 'Out of Stock';
  }

  uploadDummyDataProducts() async{
    try{
      //Fetch Banner

      await productRepository.uploadDummyData(TDummyData.products);
      TLoaders.successSnackBar(title: 'Congratulations',
          message: 'Your Dummy Data has been updated!');
    } catch (e) {
      TLoaders.errorSnackBar(title: 'On Snap!', message: e.toString());
      print('error : $e');

    }
  }

  uploadDummyDataProductCategory()async {
    try{
      //Fetch Banner
      await productRepository.uploadDummyDataProductCategory(TDummyData.productCategory);
      TLoaders.successSnackBar(title: 'Congratulations',
          message: 'Your Dummy Data has been updated!');
    } catch (e) {
      TLoaders.errorSnackBar(title: 'On Snap!', message: e.toString());
      print('error : $e');

    }
  }
}