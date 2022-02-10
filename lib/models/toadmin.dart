
import 'package:cloud_firestore/cloud_firestore.dart';

class reportToadmin {
  final String description;
  final String uid;
  final String email;
  final String reportid;
  final datePublished;
  final String profImage;

  const reportToadmin({
    required this.description,
    required this.uid,
    required this.email,
    required this.reportid,
    required this.datePublished,
    required this.profImage,
 

    
    
  });

  Map<String, dynamic> toJson() => {
    "description": description,
    "uid" : uid,
    "email" : email,
    "reportid": reportid,
    "datePublished" : datePublished,
    "profImage" : profImage,


  };

  static reportToadmin fromSnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;

    return reportToadmin(
      email:  snapshot['email'],
      uid: snapshot['uid'],
      description: snapshot['description'],
      reportid: snapshot['reportid'],
      datePublished: snapshot ['datePublished'],
      profImage: snapshot ['profImage'],

    );
  }

}
 



