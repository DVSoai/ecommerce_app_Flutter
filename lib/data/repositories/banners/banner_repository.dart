
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_app/data/service/firebase_storage_service.dart';
import 'package:ecommerce_app/features/shop/models/banner_model.dart';
import 'package:ecommerce_app/utils/exceptions/firebase_exceptions.dart';
import 'package:ecommerce_app/utils/exceptions/format_exceptions.dart';
import 'package:ecommerce_app/utils/exceptions/platform_exceptions.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class BannerRepository extends GetxController{
  static BannerRepository get instance => Get.find();

  ///Variables
  final _db = FirebaseFirestore.instance;
  /// Get all order related to current User
  Future<List<BannerModel>> fetchBanners( ) async {
    try{
      final result = await _db.collection('Banners').where('active', isEqualTo: true).get();
      return result.docs.map((documentSnapshot) => BannerModel.fromSnapshot(documentSnapshot)).toList();

    }on FirebaseException catch(e){
      throw TFirebaseException(e.code).message;
    }on FormatException catch(_){
      throw const TFormatException();
    }on PlatformException catch(e){
      throw TPlatformException(e.code).message;
    } catch(e){
      throw "Something went wrong. Please try again : $e";
    }
  }

  ///Get Sub Categories
  ///Upload Categories to the Cloud Firebase
  ///Nhận danh mục phụ
  ///Tải danh mục lên Cloud Firebase
  Future<void> uploadDummyData(List<BannerModel> banners)async{
    try{
      //Upload all the Categories along with their Images
      // Tải lên tất cả các Danh mục cùng với Hình ảnh của chúng
      final storage = Get.put(TFirebaseStorageService());
      for(var banner in banners){
        //Get ImageData link from the local assets
        //Nhận liên kết ImageData từ nội dung cục bộ
        final file = await storage.getImageDataFromAssets(banner.imageUrl);
        //Upload Image and Get its URL
        // Tải hình ảnh lên và lấy URL của nó
        final url = await storage.uploadImageData('Banners', file, '${banner.targetScreen}.jpg');
        //Assign URL to Category, image attribute
        //Gán URL cho Danh mục, thuộc tính hình ảnh
        banner.imageUrl = url;
        //Store Category in Firestore
        await _db.collection('Banners').doc().set(banner.toJson());
      }

    }on FirebaseException catch(e){
      throw TFirebaseException(e.code).message;
    }on FormatException catch(_){
      throw const TFormatException();
    }on PlatformException catch(e){
      throw TPlatformException(e.code).message;
    } catch(e){
      throw "Something went wrong. Please try again : $e";
    }
  }
}