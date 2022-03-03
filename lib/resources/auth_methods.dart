
import 'dart:typed_data';

import 'package:app/models/user.dart' as model;
import 'package:app/resources/storage_methodds.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class AuthMethods {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<model.User> getUserDetails() async{
    User currentUser = _auth.currentUser!;

    DocumentSnapshot snap = await _firestore.collection('users').doc(currentUser.uid).get();

    return model.User.fromSnap(snap);
  }


  Future<String> signUpUser({
    required String email,
    required String password,
    required String username,
    required String bio,
    required Uint8List file,
    required String status,
  }) async {
    String res = "Some error occurred";
    try {
      if (email.isNotEmpty ||
          password.isNotEmpty ||
          username.isNotEmpty ||
          bio.isNotEmpty) {
        UserCredential cred = await _auth.createUserWithEmailAndPassword(
            email: email, password: password);

        print(cred.user!.uid);

        String photoUrl = await StorageMethods()
            .uploadImageToStorage('profilePics', file, false);
            
        
        model.User user = model.User(
          username: username,
          uid: cred.user!.uid,
          email: email,
          bio: bio,
          status: status,
          photoUrl: photoUrl,
          following: [],
          followers: [],
        );
            
        await _firestore.collection('users').doc(cred.user!.uid).set(user.toJson(),);

        // await _firestore.collection('users').add({
        //   'username' : username,
        //   'uid' : cred.user!.uid,
        //   'email' : email,
        //   'bio' : bio,
        //   'followers' : [],
        //   'following' : [],
        // });

        res = "success";
      }
    } catch (err) {
      res = err.toString();
    }
    return res;
  }

  Future<String> loginUser({
    required String email,
    required String password

  }) async {
    String res = "Some error occurred";

    try {
      if(email.isNotEmpty || password.isNotEmpty) {
        await _auth.signInWithEmailAndPassword(email: email, password: password);
        res = "success";

      } else {
        res = "please enter all the fields";
      }

    } catch(err) {
      res = err.toString();

    }
    return res;
  }
  Future<void> signOut() async {
    await _auth.signOut();
  }
   Future<String> loginAdmin({
    required String email,
    required String password,
    required String status,

  }) async {
    String res = "Some error occurred";

    try {
      if(email.isNotEmpty || password.isNotEmpty || status=='admin') {
        await _auth.signInWithEmailAndPassword(email: email, password: password);
        res = "success";

      } else {
        res = "please enter all the fields";
      }

    } catch(err) {
      res = err.toString();

    }
    return res;
  }
  
   
  
}
