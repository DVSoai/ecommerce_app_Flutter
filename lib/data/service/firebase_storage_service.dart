import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class TFirebaseStorageService extends GetxController{
  static TFirebaseStorageService get instance => Get.find();

  final _firebaseStorage = FirebaseStorage.instance;

  /// Upload Local Assets from IDE
  /// Returns a Uint8List containing image data.
  /// Tải nội dung cục bộ lên từ IDE
  /// Trả về Uint8List chứa dữ liệu hình ảnh.
  Future<Uint8List> getImageDataFromAssets(String path) async {
    try{
      final byteData = await rootBundle.load(path);
      final imageData = byteData.buffer.asUint8List(byteData.offsetInBytes, byteData.lengthInBytes);
      return imageData;
    }catch(e){
      throw 'Error loading image data : $e';
    }
  }

  /// Upload Image using ImageData on Cloud Firebase Storage
  /// Return the download URL of the uploaded Image

  /// Tải hình ảnh lên bằng ImageData trên Cloud Firebase Storage
  /// Trả về URL tải xuống của Image đã tải lên
  Future<String> uploadImageData(String path, Uint8List image, String name) async {
    try{
      final ref = _firebaseStorage.ref(path).child(name);
      await ref.putData(image);
      final url = await ref.getDownloadURL();
      return url;
    }catch(e){
     if(e is FirebaseException){
       throw 'Firebase Exception : ${e.message}';
     } else if(e is SocketException){
       throw 'Network Error : ${e.message}';
     } else if(e is PlatformException){
       throw 'Platform Exception : ${e.message}';
     } else {
       throw 'Something Went Wrong! Please try again.';
     }
    }
  }

  /// Upload Image on Cloud Firebase Storage
  /// Return the download URL of the uploaded Image
  /// Tải hình ảnh lên Cloud Firebase Storage
  /// Trả về URL tải xuống của Image đã tải lên
  Future<String> uploadImageFile(String path, XFile image) async {
    try{
      final ref = _firebaseStorage.ref(path).child(image.name);
      await ref.putFile(File(image.path));
      final url = await ref.getDownloadURL();
      return url;
    }catch(e){
      if(e is FirebaseException){
        throw 'Firebase Exception : ${e.message}';
      } else if(e is SocketException){
        throw 'Network Error : ${e.message}';
      } else if(e is PlatformException){
        throw 'Platform Exception : ${e.message}';
      } else {
        throw 'Something Went Wrong! Please try again.';
      }
    }
  }

}