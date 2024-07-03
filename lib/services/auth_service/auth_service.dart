import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../models/models.dart';
import '../services.dart';

class AuthService {
  FirebaseAuth auth = FirebaseAuth.instance;
  DatabaseService dbService = DatabaseService();
  SnackBarService snackBarService = SnackBarService();

  Future<UserModel?> alreadyLoggedInUser() async {
    User? currentUser = auth.currentUser;
    if (currentUser != null) {
      var user = await DatabaseService.getUserbyUid(uid: currentUser.uid);
      return user;
    } else {
      return null;
    }
  }

  // ^ Signup User
  Future<({bool isSuccess, UserModel? userModel})> signupUserWithEmailPassword({
    required String userEmail,
    required String userPassword,
  }) async {
    if (userEmail.isEmpty || userPassword.isEmpty) {
      snackBarService.showSnackbar(
          message: 'Please Enter Correct Credentials',
          duration: 2,
          title: "Wrong Credentials");
      return (isSuccess: false, userModel: null);
    } else {
      try {
        var userCredential = await auth.createUserWithEmailAndPassword(
            email: userEmail, password: userPassword);

        User? user = userCredential.user;

        if (user != null) {
          UserModel newUserMode = UserModel(
            uid: userCredential.user!.uid,
            name: 'Random User',
            email: userEmail,
            language: 'English',
          );

          var result =
              await dbService.addUserToFireStore(userData: newUserMode);

          if (result == true) {
            snackBarService.showSnackbar(
                color: Colors.green,
                message: "Account created successfully",
                duration: 3,
                title: 'Successful');
            return (isSuccess: true, userModel: newUserMode);
          }
        }

        return (isSuccess: false, userModel: null);
      } on FirebaseException catch (e) {
        if (e.code == 'email-already-in-use') {
          final result = loginUser(email: userEmail, password: userPassword);
          return result;
        } else {
          snackBarService.showSnackbar(
              message: e.message.toString(),
              duration: 2,
              title: 'Signup Failed',
              color: Colors.red);
          return (isSuccess: false, userModel: null);
        }
      } catch (e, stackTrace) {
        log('stackTrace : ${stackTrace.toString()}');
        return (isSuccess: false, userModel: null);
      }
    }
  }

  Future<({bool isSuccess, UserModel? userModel})> loginUser({
    required String email,
    required String password,
  }) async {
    if (email.isEmpty || password.isEmpty) {
      snackBarService.showSnackbar(
        message: "Please Enter Correct Credentials",
        duration: 2,
        title: "Wrong Credentials",
        color: Colors.red,
      );
      return (isSuccess: false, userModel: null);
    } else {
      try {
        UserCredential userCredential = await auth.signInWithEmailAndPassword(
            email: email, password: password);

        String uid = userCredential.user!.uid;

        User? currentUser = FirebaseAuth.instance.currentUser;

        if (currentUser != null) {
          UserModel? currentUser = await DatabaseService.getUserbyUid(uid: uid);
          snackBarService.showSnackbar(
            message: "Welcome Back ${currentUser!.name}",
            duration: 2,
            title: "Login Successfull",
            color: Colors.green,
          );

          return (isSuccess: true, userModel: currentUser);
        } else {
          snackBarService.showSnackbar(
            message: "Please Enter Correct Credentials",
            duration: 2,
            title: "Wrong Credentials",
            color: Colors.red,
          );

          return (isSuccess: false, userModel: null);
        }
      } catch (e, stackTrace) {
        snackBarService.showSnackbar(
          message: e.toString(),
          duration: 2,
          title: "Wrong Credentials",
          color: Colors.red,
        );
        log('error : ${e.toString()}');
        log('stackTrace : ${stackTrace.toString()}');
        return (isSuccess: false, userModel: null);
      }
    }
  }

  Future<void> signOutFromGoogle() async {
    // await _googleSignIn.signOut();
    await auth.signOut();
  }
}
