import 'package:ecommerce_app/data/models/dummy_data.dart';
import 'package:ecommerce_app/data/repositories/categories/category_repository.dart';
import 'package:ecommerce_app/data/repositories/products/product_repository.dart';
import 'package:ecommerce_app/features/shop/models/category_model.dart';
import 'package:ecommerce_app/features/shop/models/product_model.dart';
import 'package:ecommerce_app/utils/popups/loaders.dart';
import 'package:get/get.dart';

class CategoryController extends GetxController{
  static CategoryController get instance => Get.find();

  final isLoading = false.obs;
  final _categoryRepository = Get.put(CategoryRepository());
  RxList<CategoryModel> allCategories = <CategoryModel>[].obs;
  RxList<CategoryModel> featuredCategories = <CategoryModel>[].obs;

  @override
  void onInit() {
    fetchCategories();
    super.onInit();
  }

  Future<void>fetchCategories() async {
    try{

      //Show loader while loading categories
      isLoading.value = true;

      //Fetch categories from data source (Firestore API,etc.)
      // Tìm nạp danh mục từ nguồn dữ liệu (API Firestore, v.v.)
      final categories = await _categoryRepository.getAllCategories();

      //Update the categories list
      //Cập nhật danh sách danh mục
      allCategories.assignAll(categories);

      //Filter featured categories
      // Lọc các danh mục nổi bật
      featuredCategories.assignAll(allCategories.where((category) => category.isFeatured && category.parentId.isEmpty).take(8).toList());
    }catch(e){
      TLoaders.errorSnackBar(title: 'On Snap!', message: e.toString());
    }finally{
      isLoading.value = false;
    }

  }

  ///Load selected category data
  Future<List<CategoryModel>> getSubCategories(String categoryId) async{
    try{
      final subCategories = await _categoryRepository.getSubCategories(categoryId);
      return subCategories;
    }catch(e){
      TLoaders.errorSnackBar(title: 'On Snap!',message: e.toString());
      return [];
    }
  }

  ///Get Category or Sub-Category Products.
  Future<List<ProductModel>>getCategoryProducts({required String categoryId, int limit = 4})async{
    //Fetch limited(4) products against each subCategory
    final products = await ProductRepository.instance.getProductsForCategory(categoryId: categoryId, limit: limit);

    return products;
  }





  uploadDummyDataCategories() async{
    try{
      await _categoryRepository.uploadDummyData(TDummyData.categories);
      TLoaders.successSnackBar(title: 'Congratulations',
          message: 'Your Dummy Data has been updated!');
    } catch (e) {
      TLoaders.errorSnackBar(title: 'On Snap!', message: e.toString());
      print('error : $e');

    }
  }
}