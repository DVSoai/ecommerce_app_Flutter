import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_app/data/service/firebase_storage_service.dart';
import 'package:ecommerce_app/features/shop/models/category_model.dart';
import 'package:ecommerce_app/utils/exceptions/firebase_exceptions.dart';
import 'package:ecommerce_app/utils/exceptions/format_exceptions.dart';
import 'package:ecommerce_app/utils/exceptions/platform_exceptions.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class CategoryRepository extends GetxController{

  static CategoryRepository get instance => Get.find();

  ///Variables
  final _db = FirebaseFirestore.instance;
  /// Get all Categories
  Future<List<CategoryModel>> getAllCategories( ) async {
    try{
        final snapshot = await _db.collection('Categories').get();
        final list = snapshot.docs.map((document) => CategoryModel.fromSnapshot(document)).toList();
        return list;

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
  Future<List<CategoryModel>> getSubCategories(String categoryId)async{
    try{
      final snapshot = await _db.collection("Categories").where('ParentId',isEqualTo: categoryId).get();
      final result = snapshot.docs.map((e) => CategoryModel.fromSnapshot(e)).toList();
      return result;
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
  ///Upload Categories to the Cloud Firebase
  ///Nhận danh mục phụ
  ///Tải danh mục lên Cloud Firebase
  Future<void> uploadDummyData(List<CategoryModel> categories)async{
    try{
        //Upload all the Categories along with their Images
      // Tải lên tất cả các Danh mục cùng với Hình ảnh của chúng
      final storage = Get.put(TFirebaseStorageService());
      for(var category in categories){
        //Get ImageData link from the local assets
        //Nhận liên kết ImageData từ nội dung cục bộ
        final file = await storage.getImageDataFromAssets(category.image);
        //Upload Image and Get its URL
        // Tải hình ảnh lên và lấy URL của nó

        final url = await storage.uploadImageData('Categories', file, category.name);
        //Assign URL to Category, image attribute
        //Gán URL cho Danh mục, thuộc tính hình ảnh
        category.image = url;
        //Store Category in Firestore
        await _db.collection('Categories').doc(category.id).set(category.toJson());
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