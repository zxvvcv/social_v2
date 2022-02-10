import 'dart:typed_data';

import 'package:app/models/post.dart';
import 'package:app/models/toadmin.dart';
import 'package:app/models/toadmin.dart';
import 'package:app/models/toadmin.dart';
import 'package:app/models/totopuser.dart';
import 'package:app/resources/storage_methodds.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:uuid/uuid.dart';

class FirestoreMethods {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  //upload post
  Future<String> uploadPost(
    String description,
    Uint8List file,
    String uid,
    String username,
    String profImage,
  ) async {
    String res = "some error occurred";
    try {
      String photoUrl =
          await StorageMethods().uploadImageToStorage('posts', file, true);

      String postId = const Uuid().v1();
      Post post = Post(
        description: description,
        uid: uid,
        username: username,
        postId: postId,
        datePublished: DateTime.now(),
        postUrl: photoUrl,
        profImage: profImage,
        likes: [],
        report: [],
      );

      _firestore.collection('posts').doc(postId).set(
            post.toJson(),
          );
      res = "success";
    } catch (err) {
      res = err.toString();
    }
    return res;
  }
  Future<String> uploadPost2(
    String description,
    Uint8List file,
    String uid,
    String username,
    String profImage,
  ) async {
    String res = "some error occurred";
    try {
      String photoUrl =
          await StorageMethods().uploadImageToStorage('posts2', file, true);

      String postId = const Uuid().v1();
      Post post = Post(
        description: description,
        uid: uid,
        username: username,
        postId: postId,
        datePublished: DateTime.now(),
        postUrl: photoUrl,
        profImage: profImage,
        likes: [],
        report: [],
      );

      _firestore.collection('posts2').doc(postId).set(
            post.toJson(),
          );
      res = "success";
    } catch (err) {
      res = err.toString();
    }
    return res;
  }
  Future<String> uploadPost3(
    String description,
    Uint8List file,
    String uid,
    String username,
    String profImage,
  ) async {
    String res = "some error occurred";
    try {
      String photoUrl =
          await StorageMethods().uploadImageToStorage('posts3', file, true);

      String postId = const Uuid().v1();
      Post post = Post(
        description: description,
        uid: uid,
        username: username,
        postId: postId,
        datePublished: DateTime.now(),
        postUrl: photoUrl,
        profImage: profImage,
        likes: [],
        report: [],
      );

      _firestore.collection('posts3').doc(postId).set(
            post.toJson(),
          );
      res = "success";
    } catch (err) {
      res = err.toString();
    }
    return res;
  }

  Future<String> likePost(String postId, String uid, List likes) async {
    String res = "Some error occurred";
    try {
      if (likes.contains(uid)) {
        // if the likes list contains the user uid, we need to remove it
        _firestore.collection('posts').doc(postId).update({
          'likes': FieldValue.arrayRemove([uid])
        });
      } else {
        // else we need to add uid to the likes array
        _firestore.collection('posts').doc(postId).update({
          'likes': FieldValue.arrayUnion([uid]),
        });
      }
      res = 'success';
    } catch (err) {
      res = err.toString();
    }
    return res;
  }
  Future<String> likePost2(String postId, String uid, List likes) async {
    String res = "Some error occurred";
    try {
      if (likes.contains(uid)) {
        // if the likes list contains the user uid, we need to remove it
        _firestore.collection('posts2').doc(postId).update({
          'likes': FieldValue.arrayRemove([uid])
        });
      } else {
        // else we need to add uid to the likes array
        _firestore.collection('posts2').doc(postId).update({
          'likes': FieldValue.arrayUnion([uid]),
        });
      }
      res = 'success';
    } catch (err) {
      res = err.toString();
    }
    return res;
  }
  Future<String> likePost3(String postId, String uid, List likes) async {
    String res = "Some error occurred";
    try {
      if (likes.contains(uid)) {
        // if the likes list contains the user uid, we need to remove it
        _firestore.collection('posts3').doc(postId).update({
          'likes': FieldValue.arrayRemove([uid])
        });
      } else {
        // else we need to add uid to the likes array
        _firestore.collection('posts3').doc(postId).update({
          'likes': FieldValue.arrayUnion([uid]),
        });
      }
      res = 'success';
    } catch (err) {
      res = err.toString();
    }
    return res;
  }

  Future<void> postComment(String postId, String text, String uid,
      String name, String profilePic) async {
    try {
      if(text.isNotEmpty) {
        String commentId = const Uuid().v1();
        await _firestore.collection('posts').doc(postId).collection('comments').doc(commentId).set({
          'profilePic' : profilePic,
          'name' : name,
          'uid' : uid,
          'text' : text,
          'commentId': commentId,
          'datePublished': DateTime.now(),

        });
      } else {
        print('Text id empty');
      }
    } catch (e) {
      print(
        e.toString(),
      );
    }
  }
  Future<void> postComment2(String postId, String text, String uid,
      String name, String profilePic) async {
    try {
      if(text.isNotEmpty) {
        String commentId = const Uuid().v1();
        await _firestore.collection('posts2').doc(postId).collection('comments').doc(commentId).set({
          'profilePic' : profilePic,
          'name' : name,
          'uid' : uid,
          'text' : text,
          'commentId': commentId,
          'datePublished': DateTime.now(),

        });
      } else {
        print('Text id empty');
      }
    } catch (e) {
      print(
        e.toString(),
      );
    }
  }
  Future<void> postComment3(String postId, String text, String uid,
      String name, String profilePic) async {
    try {
      if(text.isNotEmpty) {
        String commentId = const Uuid().v1();
        await _firestore.collection('posts3').doc(postId).collection('comments').doc(commentId).set({
          'profilePic' : profilePic,
          'name' : name,
          'uid' : uid,
          'text' : text,
          'commentId': commentId,
          'datePublished': DateTime.now(),

        });
      } else {
        print('Text id empty');
      }
    } catch (e) {
      print(
        e.toString(),
      );
    }
  }
  // delete
  Future<void> deletePost(String postId) async {
    try {
      await _firestore.collection('posts').doc(postId).delete();
    } catch(err) {
      print(err.toString());
    }
  }
  Future<void> deletePost2(String postId) async {
    try {
      await _firestore.collection('posts2').doc(postId).delete();
    } catch(err) {
      print(err.toString());
    }
  }
  Future<void> deletePost3(String postId) async {
    try {
      await _firestore.collection('posts3').doc(postId).delete();
    } catch(err) {
      print(err.toString());
    }
  }

  Future<void> followUser(
    String uid,
    String followId
  ) async {
    try {
      DocumentSnapshot snap = await _firestore.collection('users').doc(uid).get();
      List following = (snap.data()! as dynamic)['following'];

      if(following.contains(followId)) {
        await _firestore.collection('users').doc(followId).update({
          'followers': FieldValue.arrayRemove([uid])
        });

        await _firestore.collection('users').doc(uid).update({
          'following': FieldValue.arrayRemove([followId])
        });
      } else {
        await _firestore.collection('users').doc(followId).update({
          'followers': FieldValue.arrayUnion([uid])
        });

        await _firestore.collection('users').doc(uid).update({
          'following': FieldValue.arrayUnion([followId])
        });
      }

    } catch(e) {
      print(e.toString());
    }
  }
  Future<String> report(String postId, String uid, List report) async {
    String res = "Some error occurred";
    try {
      if (report.contains(uid)) {
        // if the likes list contains the user uid, we need to remove it
        _firestore.collection('posts').doc(postId).update({
          'report': FieldValue.arrayRemove([uid])
        });
      } else {
        // else we need to add uid to the likes array
        _firestore.collection('posts').doc(postId).update({
          'report': FieldValue.arrayUnion([uid]),
        });
      }
      res = 'success';
    } catch (err) {
      res = err.toString();
    }
    return res;
  }
  Future<String> report2(String postId, String uid, List report) async {
    String res = "Some error occurred";
    try {
      if (report.contains(uid)) {
        // if the likes list contains the user uid, we need to remove it
        _firestore.collection('posts2').doc(postId).update({
          'report': FieldValue.arrayRemove([uid])
        });
      } else {
        // else we need to add uid to the likes array
        _firestore.collection('posts2').doc(postId).update({
          'report': FieldValue.arrayUnion([uid]),
        });
      }
      res = 'success';
    } catch (err) {
      res = err.toString();
    }
    return res;
  }
  Future<String> report3(String postId, String uid, List report) async {
    String res = "Some error occurred";
    try {
      if (report.contains(uid)) {
        // if the likes list contains the user uid, we need to remove it
        _firestore.collection('posts3').doc(postId).update({
          'report': FieldValue.arrayRemove([uid])
        });
      } else {
        // else we need to add uid to the likes array
        _firestore.collection('posts3').doc(postId).update({
          'report': FieldValue.arrayUnion([uid]),
        });
      }
      res = 'success';
    } catch (err) {
      res = err.toString();
    }
    return res;
  }
  Future<String> reporttoadmin(
    String description,
    
    String uid,
    String email,
    String profImage,
  ) async {
    String res = "some error occurred";
    try {
      

      String reportid = const Uuid().v1();
      reportToadmin reportaddmin = reportToadmin(
        description: description,
        uid: uid,
        email: email,
        reportid: reportid,
        datePublished: DateTime.now(),
        profImage: profImage,
     
      );

      _firestore.collection('reporttodamin').doc(reportid).set(
            reportaddmin.toJson(),
          );
      res = "success";
    } catch (err) {
      res = err.toString();
    }
    return res;
  }
  Future<String> reporttotopuser(
    String description,
    
    String uid,
    String email,
    String profImage,
  ) async {
    String res = "some error occurred";
    try {
      

      String reportid = const Uuid().v1();
      reportTotopuser reporttopuser = reportTotopuser(
        description: description,
        uid: uid,
        email: email,
        reportid: reportid,
        datePublished: DateTime.now(),
        profImage: profImage,
     
      );

      _firestore.collection('reporttotopuser').doc(reportid).set(
            reporttopuser.toJson(),
          );
      res = "success";
    } catch (err) {
      res = err.toString();
    }
    return res;
  }


}
