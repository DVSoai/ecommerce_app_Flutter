
import 'package:ecommerce_app/data/models/dummy_data.dart';
import 'package:ecommerce_app/data/repositories/banners/banner_repository.dart';
import 'package:ecommerce_app/features/shop/models/banner_model.dart';
import 'package:ecommerce_app/utils/popups/loaders.dart';
import 'package:get/get.dart';

class BannerController extends GetxController {
  final carousalCurrentIndex = 0.obs;
  final isLoading = false.obs;
  RxList<BannerModel> banners = <BannerModel>[].obs;
  void updatePageIndicator(index) {
    carousalCurrentIndex.value = index;
  }

  @override
  void onInit() {
    fetchBanners();
    super.onInit();
  }

  Future<void>fetchBanners() async {
    try{

      //Show loader while loading categories
      isLoading.value = true;

      //Fetch Banner
      final bannerRepo = Get.put(BannerRepository());
      final banners = await bannerRepo.fetchBanners();

      //Assign Banners
      this.banners.assignAll(banners);

    }catch(e){
      TLoaders.errorSnackBar(title: 'On Snap!', message: e.toString());
    }finally{
      isLoading.value = false;
    }

  }
  uploadDummyDataBanners() async{
    try{
      //Fetch Banner
      final bannerRepo = Get.put(BannerRepository());
      await bannerRepo.uploadDummyData(TDummyData.banners);
      TLoaders.successSnackBar(title: 'Congratulations',
          message: 'Your Dummy Data has been updated!');
    } catch (e) {
      TLoaders.errorSnackBar(title: 'On Snap!', message: e.toString());
      print('error : $e');

    }
  }
}