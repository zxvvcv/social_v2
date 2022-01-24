
import 'package:cloud_firestore/cloud_firestore.dart';

class Post {
  final String description;
  final String uid;
  final String username;
  final String postId;
  final datePublished;
  final String postUrl;
  final String profImage;
  final likes;
  final report;

  const Post({
    required this.description,
    required this.uid,
    required this.username,
    required this.postId,
    required this.datePublished,
    required this.postUrl,
    required this.profImage,
    required this.likes,
    required this.report

    
    
  });

  Map<String, dynamic> toJson() => {
    "description": description,
    "uid" : uid,
    "username" : username,
    "postId": postId,
    "datePublished" : datePublished,
    "profImage" : profImage,
    "likes" : likes,
    "report" : report,
    "postUrl" : postUrl,

  };

  static Post fromSnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;

    return Post(
      username:  snapshot['username'],
      uid: snapshot['uid'],
      description: snapshot['description'],
      postId: snapshot['postId'],
      datePublished: snapshot ['datePublished'],
      profImage: snapshot ['profImage'],
      likes: snapshot ['likes'],
      report: snapshot['report'],
      postUrl: snapshot ['postUrl'],

    );
  }

}
 
// สร้าง post 


