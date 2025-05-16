

import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:metropol_mawanda_peter/features/auth/data/auth_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';
part 'auth_controller.g.dart';


@Riverpod(keepAlive: true)
class AuthController extends _$AuthController {
  @override
  FutureOr<void> build() {
    // TODO: implement build
    throw UnimplementedError();
  }


  Future<void> createUserWithEmailAndPassword(String email, String password) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() =>
        ref.read(authRepositoryProvider)
        .createUserWithEmailAndPassword(email, password)
    );

  }

  Future<void> signInWithEmailAndPassword(String email, String password) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() =>
        ref.read(authRepositoryProvider)
            .signInWithEmailAndPassword(email, password)
    );

  }

  Future<void> signOut() async {
    final SharedPreferencesAsync asyncPrefs = SharedPreferencesAsync();

    state = const AsyncLoading();
    state = await AsyncValue.guard(() =>
        ref.read(authRepositoryProvider)
        .signOut()
    );
    await asyncPrefs.remove('fcm');
  }


  Future<void> deleteFcmTokenAndSignOut(
      String userId, String currentToken,) async {
    try {
      // Remove the FCM token from the user's document
      await FirebaseFirestore.instance.collection('users').doc(userId).update({
        'fcms': FieldValue.arrayRemove([currentToken]),
      });

      // Print a success message
      print('Token removed successfully or did not exist.');

      // After the deletion, sign out the user
      signOut();
    } catch (e) {
      if (e is FirebaseException && e.code == 'not-found') {
        // Handle case where the document does not exist
        print('Document not found. No token to remove.');
        signOut();
      } else {
        // Handle other errors
        print('Failed to remove token: $e');

      }
    }
  }

}


Future<void> checkAndAddUserFcmToken(String userId, String newToken) async {
  try {

    // Get the current list of FCM tokens
    DocumentSnapshot docSnapshot = await FirebaseFirestore.instance.collection('users').doc(userId).get();
    List<dynamic> currentTokens = docSnapshot.get('fcms') ?? [];

    // Check if the token already exists
    if (currentTokens.contains(newToken)) {
      print('Token already exists. Not adding.');
    } else {
      // Add the token to Firestore
      await FirebaseFirestore.instance.collection('users').doc(userId).update({
        'fcms': FieldValue.arrayUnion([newToken]),
      });
      print('Token added successfully.');
    }
  } catch (e) {
    if (e is StateError) {
      // Handle case where the 'fcmTokens' field doesn't exist in the document
      await FirebaseFirestore.instance.collection('users').doc(userId).set({
        'fcms': [newToken],
      }, SetOptions(merge: true));
      print('Field was missing. Token added successfully.');
    } else {
      print('Failed to check and add token: $e');
    }
  }
}



