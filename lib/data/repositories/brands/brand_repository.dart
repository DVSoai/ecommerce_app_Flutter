import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_app/data/service/firebase_storage_service.dart';
import 'package:ecommerce_app/features/shop/models/brand_category_model.dart';
import 'package:ecommerce_app/features/shop/models/brand_model.dart';
import 'package:ecommerce_app/utils/exceptions/firebase_exceptions.dart';
import 'package:ecommerce_app/utils/exceptions/format_exceptions.dart';
import 'package:ecommerce_app/utils/exceptions/platform_exceptions.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class BrandRepository extends GetxController{

  static BrandRepository get instance => Get.find();

  ///Variables
  final _db = FirebaseFirestore.instance;

  /// Get all Categories
  Future<List<BrandModel>> getAllBrands( ) async {
    try{
      final snapshot = await _db.collection('Brands').get();
      final result = snapshot.docs.map((e) => BrandModel.fromSnapshot(e)).toList();
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

  ///Get Sub Categories
  ///Upload Categories to the Cloud Firebase
  ///Nhận danh mục phụ
  ///Tải danh mục lên Cloud Firebase
  Future<void> uploadDummyData(List<BrandModel> brands)async{
    try{
      //Upload all the Categories along with their Images
      // Tải lên tất cả các Danh mục cùng với Hình ảnh của chúng
      final storage = Get.put(TFirebaseStorageService());
      for(var brand in brands){
        //Get ImageData link from the local assets
        //Nhận liên kết ImageData từ nội dung cục bộ
        final file = await storage.getImageDataFromAssets(brand.image);
        //Upload Image and Get its URL
        // Tải hình ảnh lên và lấy URL của nó

        final url = await storage.uploadImageData('brand', file, brand.name);
        //Assign URL to Category, image attribute
        //Gán URL cho Danh mục, thuộc tính hình ảnh
        brand.image = url;
        //Store Category in Firestore
        await _db.collection('Brands').doc(brand.id).set(brand.toJson());
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

  Future<void>uploadDummyDataBrandCategory(List<BrandCategoryModel> brandCategory) async {
    try {
      final CollectionReference productCategoryRef = FirebaseFirestore.instance.collection('brandCategory');
      for (var item in brandCategory) {
        await productCategoryRef.doc().set(item.toJson());
      }
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const TFormatException();
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw "Something went wrong. Please try again : $e";
    }

  }

  ///Get Brand for Category
  Future<List<BrandModel>> getBrandsForCategory(String categoryId ) async {
    try{
      //Query to get  all document where categoryId matches the provided categoryId
      QuerySnapshot brandCategoryQuery = await _db.collection('BrandCategory').where('categoryId',isEqualTo: categoryId).get();

      // Extract brandIds from the documents
      List<String> brandIds = brandCategoryQuery.docs.map((doc) => doc['brandId'] as String ).toList();

      //Query to get all document where the brandId is in the list of brandIds, FieldPath.documentId to query document in Collection
      final brandsQuery = await _db.collection('Brands').where(FieldPath.documentId, whereIn: brandIds).limit(2).get();

      //Extract brand names or other relevant data from the documents
      List<BrandModel> brands = brandsQuery.docs.map((doc) =>BrandModel.fromSnapshot(doc)).toList();
      return brands;

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