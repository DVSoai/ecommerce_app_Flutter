import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_app/data/repositories/authentication/authentication_repository.dart';
import 'package:ecommerce_app/features/personalization/models/userModel.dart';
import 'package:ecommerce_app/utils/exceptions/firebase_exceptions.dart';
import 'package:ecommerce_app/utils/exceptions/format_exceptions.dart';
import 'package:ecommerce_app/utils/exceptions/platform_exceptions.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class UserRepository extends GetxController{
  static UserRepository get instance => Get.find();
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  ///Function to save user data to Firestore
  Future<void> saveUserRecord(UserModel user) async {
    try{
      await _db.collection('Users').doc(user.id).set(user.toJson());

    }on FirebaseException catch(e){
      throw TFirebaseException(e.code).message;
    }on FormatException catch(_){
      throw const TFormatException();
    }on PlatformException catch(e){
      throw TPlatformException(e.code).message;
    } catch(e){
      throw "Something went wrong. Please try again";
    }
  }

  ///Function to fetch user details based on user ID
  Future<UserModel> fetchUserDetails() async {
    try{
     final documentSnapshot =  await _db.collection('Users').doc(AuthenticationRepository.instance.authUser.uid).get();
     if(documentSnapshot.exists){
       return UserModel.fromSnapshot(documentSnapshot);
     }else{
       return UserModel.empty();
     }

    }on FirebaseException catch(e){
      throw TFirebaseException(e.code).message;
    }on FormatException catch(_){
      throw const TFormatException();
    }on PlatformException catch(e){
      throw TPlatformException(e.code).message;
    } catch(e){
      throw "Something went wrong. Please try again";
    }
  }

  ///Function to update user data in Firestore
  Future<void> updateUserDetails(UserModel updateUser) async {
    try{
      await _db.collection('Users').doc(updateUser.id).update(updateUser.toJson());

    }on FirebaseException catch(e){
      throw TFirebaseException(e.code).message;
    }on FormatException catch(_){
      throw const TFormatException();
    }on PlatformException catch(e){
      throw TPlatformException(e.code).message;
    } catch(e){
      throw "Something went wrong. Please try again";
    }
  }

  ///Update any field in specific Users Collection
  Future<void> updateSingleField(Map<String, dynamic> json) async {
    try{
      await _db.collection('Users').doc(AuthenticationRepository.instance.authUser.uid).update(json);

    }on FirebaseException catch(e){
      throw TFirebaseException(e.code).message;
    }on FormatException catch(_){
      throw const TFormatException();
    }on PlatformException catch(e){
      throw TPlatformException(e.code).message;
    } catch(e){
      throw "Something went wrong. Please try again";
    }
  }

  ///Function to remove user data from Firestore
  Future<void> removeUserRecord(String userId) async {
    try{
      await _db.collection('Users').doc(userId).delete();

    }on FirebaseException catch(e){
      throw TFirebaseException(e.code).message;
    }on FormatException catch(_){
      throw const TFormatException();
    }on PlatformException catch(e){
      throw TPlatformException(e.code).message;
    } catch(e){
      throw "Something went wrong. Please try again";
    }
  }

  ///Upload any Image
  Future<String> uploadImage(String path, XFile image)async{
    try{
        final ref = FirebaseStorage.instance.ref(path).child(image.name);
        await ref.putFile(File(image.path));
        final url = await ref.getDownloadURL();
        return url;

    }on FirebaseException catch(e){
      throw TFirebaseException(e.code).message;
    }on FormatException catch(_){
      throw const TFormatException();
    }on PlatformException catch(e){
      throw TPlatformException(e.code).message;
    } catch(e){
      throw "Something went wrong. Please try again: $e";
    }
  }
  // Future<String> uploadImage(String path, XFile image) async {
  //   try {
  //     // Cắt ảnh thành hình vuông
  //     final croppedImage = await ImageCropper().cropImage(
  //       sourcePath: image.path,
  //       aspectRatioPresets: [
  //         CropAspectRatioPreset.square,
  //         CropAspectRatioPreset.ratio3x2,
  //         CropAspectRatioPreset.original,
  //         CropAspectRatioPreset.ratio4x3,
  //         CropAspectRatioPreset.ratio16x9
  //       ],
  //       uiSettings:[
  //         AndroidUiSettings(
  //           toolbarTitle: 'Crop Image',
  //           toolbarColor: Colors.deepOrange,
  //           toolbarWidgetColor: Colors.white,
  //           initAspectRatio: CropAspectRatioPreset.square,
  //           lockAspectRatio: true,
  //         ),
  //         IOSUiSettings(
  //           minimumAspectRatio: 1.0,
  //         ),
  //       ],
  //     );
  //
  //     if (croppedImage != null) {
  //       final ref = FirebaseStorage.instance.ref(path).child(image.name);
  //       await ref.putFile(File(croppedImage.path));
  //       final url = await ref.getDownloadURL();
  //       return url;
  //     } else {
  //       throw 'Image cropping was canceled.';
  //     }
  //   } on FirebaseException catch (e) {
  //     throw TFirebaseException(e.code).message;
  //   } on FormatException catch (_) {
  //     throw const TFormatException();
  //   } on PlatformException catch (e) {
  //     throw TPlatformException(e.code).message;
  //   } catch (e) {
  //     // Trả về thông điệp lỗi cụ thể khi xảy ra lỗi không mong muốn
  //     print('$e');
  //     throw 'Error occurred: $e';
  //   }
  // }




}