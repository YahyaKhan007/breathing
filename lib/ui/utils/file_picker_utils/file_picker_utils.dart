import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../services/getx_controllers_service/file_picker_controller/file_picker_controller.dart';
import '../../../services/services.dart';
import 'package:path/path.dart';

class FilePickerUtils {
  final DatabaseService dbService = DatabaseService();

  final pickerController = Get.find<FilePickerController>();
  Future<void> pickAndUploadFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.audio,
      // allowedExtensions: ['mp3', 'wav', 'm4a'],
    );

    if (result != null) {
      pickerController.isUploading.value = true;
      pickerController.fileName.value = basename(result.files.single.name);

      try {
        final filePath = result.files.single.path!;
        final file = File(filePath);

        // Create a reference to the location you want to upload to in Firebase Storage
        final downloadURL = await dbService.uploadFileToStorage(file: file);

        final res = await dbService.addFileToFirestore(
          file: file.path,
          fileName: 'random',
        );

        if (res) {
          print('File uploaded successfully: $downloadURL');
          SnackBarService().showSnackbar(
              message: "File uploaded successfully!",
              duration: 2,
              title: "Successful",
              color: Colors.green);
        } else {
          SnackBarService().showSnackbar(
              message: "Error uploading file",
              duration: 2,
              title: "Failed",
              color: Colors.green);
        }
      } on FirebaseException catch (e, stackTrace) {
        print('Error uploading file: $stackTrace');
        SnackBarService().showSnackbar(
            message: "Error uploading file: ${e.message}",
            duration: 2,
            title: "Failed",
            color: Colors.green);
      } finally {
        pickerController.isUploading.value = false;
      }
    }
  }
}
