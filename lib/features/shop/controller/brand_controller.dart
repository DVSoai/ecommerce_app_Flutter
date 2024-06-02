
import 'package:ecommerce_app/data/models/dummy_data.dart';
import 'package:ecommerce_app/data/repositories/brands/brand_repository.dart';
import 'package:ecommerce_app/data/repositories/products/product_repository.dart';
import 'package:ecommerce_app/features/shop/models/brand_model.dart';
import 'package:ecommerce_app/features/shop/models/product_model.dart';
import 'package:ecommerce_app/utils/popups/loaders.dart';
import 'package:get/get.dart';

class BrandController extends GetxController{
  static BrandController get instance => Get.find();
  final isLoading = false.obs;
  RxList<BrandModel> allBrands = <BrandModel>[].obs;
  RxList<BrandModel> featuredBrands = <BrandModel>[].obs;
  final brandRepository = Get.put(BrandRepository());

  @override
  void onInit() {
    getFeaturedBrands();
    super.onInit();
  }

  Future<void> getFeaturedBrands() async{
    try{
      isLoading.value = true;
      final brands = await brandRepository.getAllBrands();
      allBrands.assignAll(brands);
      featuredBrands.assignAll(allBrands.where((brand) => brand.isFeatured ?? false).take(4));

    }catch(e){
      TLoaders.errorSnackBar(title: 'On Snap!', message: e.toString());
    }finally{
      isLoading.value = false;
    }
  }
  uploadDummyDataBrands() async{
    try{
      await brandRepository.uploadDummyData(TDummyData.brands);
      TLoaders.successSnackBar(title: 'Congratulations',
          message: 'Your Dummy Data has been updated!');
    } catch (e) {
      TLoaders.errorSnackBar(title: 'On Snap!', message: e.toString());
      print('error : $e');

    }
  }
  uploadDummyDataBrandCategory() async{
    try{
      //Fetch Banner
      await brandRepository.uploadDummyDataBrandCategory(TDummyData.brandCategory);
      TLoaders.successSnackBar(title: 'Congratulations',
          message: 'Your Dummy Data has been updated!');
    } catch (e) {
      TLoaders.errorSnackBar(title: 'On Snap!', message: e.toString());
      print('error : $e');

    }
  }

  ///Get Brand for Category
  Future<List<BrandModel>>getBrandsForCategory(String categoryId)async{
    try{
      final brands = await brandRepository.getBrandsForCategory(categoryId);
      return brands;
    }catch (e) {
      TLoaders.errorSnackBar(title: 'On Snap!', message: e.toString());
      return [];
    }
  }
  /// Get Brand Specific Products from your data source
  Future<List<ProductModel>>getBrandProducts(
      {required String brandId, int limit = -1})async{
    try{
      final product = await ProductRepository.instance.getProductsForBrand(brandId: brandId, limit: limit);
      return product;
    }catch (e) {
      TLoaders.errorSnackBar(title: 'On Snap!', message: e.toString());
    return [];
    }
  }

}