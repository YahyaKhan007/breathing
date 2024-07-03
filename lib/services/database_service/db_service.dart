import 'dart:developer';
import 'dart:io';

import 'package:breathing_app/main.dart';
import 'package:breathing_app/services/getx_controllers_service/file_picker_controller/file_picker_controller.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';

import '../../models/models.dart';
import '../services.dart';

class DatabaseService {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  FirebaseStorage storage = FirebaseStorage.instance;
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  SnackBarService snackBarService = SnackBarService();

  Future<bool> addUserToFireStore({required UserModel userData}) async {
    try {
      await firestore
          .collection('users')
          .doc(userData.uid)
          .set(userData.toMap());

      return true;
    } catch (e, stackTrace) {
      log('stackTrace : ${stackTrace.toString()}');

      return false;
    }
  }

  Future<List<Music>> getAllMusic() async {
    var querySnapshot = await firestore.collection('musics').get();
    List<Music> musicList = [];

    if (querySnapshot.docs.isNotEmpty) {
      for (var doc in querySnapshot.docs) {
        musicList.add(Music.fromFirestore(doc));
      }
    }

    return musicList;
  }

// ^ getting user by uid
  static Future<UserModel?> getUserbyUid({required String uid}) async {
    UserModel? userModel;

    DocumentSnapshot docSnap =
        await FirebaseFirestore.instance.collection("users").doc(uid).get();

    if (docSnap.data() != null) {
      userModel = UserModel.fromMap(docSnap.data() as Map<String, dynamic>);

      log(userModel.name.toString());
    }

    return userModel;
  }

  Future<bool> addFileToFirestore(
      {required String fileName, String? image, required String file}) async {
    try {
      Music music = Music(
          id: uuid.v4(),
          name: "random",
          picture:
              "https://static.vecteezy.com/system/resources/thumbnails/037/044/052/small_2x/ai-generated-studio-shot-of-black-headphones-over-music-note-explosion-background-with-empty-space-for-text-photo.jpg",
          file: file);

      await firestore.collection('musics').doc(music.id).set(music.toMap());

      return true;
    } catch (e, stackTrace) {
      log("stackTrace : ${stackTrace.toString()}");
      return false;
    }
  }

  Future<String> uploadFileToStorage({required File file}) async {
    final pickerController = Get.find<FilePickerController>();
    final storageRef = FirebaseStorage.instance
        .ref()
        .child('music/${pickerController.fileName.value}');

    // Upload the file
    await storageRef.putFile(file);

    // Get the download URL
    final downloadURL = await storageRef.getDownloadURL();
    return downloadURL;
  }
}
