
import 'package:app/screens/add_post_screen.dart';
import 'package:app/screens/chat_detail.dart';
import 'package:app/utils/colors.dart';
import 'package:app/widgets/list_cart_screen.dart';
import 'package:app/widgets/post_card.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class chatlist_screen extends StatefulWidget {
  final snap ;
  final String uid;
  
  const chatlist_screen({Key? key, required this.snap,required this.uid}) : super(key: key);

  @override
  State<chatlist_screen> createState() => _chatlist_screenState();
}

class _chatlist_screenState extends State<chatlist_screen> {
  void navigateToaddpost() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const AddPostScreen(),
      ),
    );
  }
   
var allusers = FirebaseFirestore.instance .collection('users').where('uid',isNotEqualTo: FirebaseAuth.instance.currentUser!.uid).snapshots();
var userData = {};
void initState() {
    super.initState();
    getData();
  }
  getData() async {
    setState(() {
     
    });
    try {
      var userSnap = await FirebaseFirestore.instance
          .collection('users')
          .doc(widget.uid)
          .get();

      
      var postSnap = await FirebaseFirestore.instance
          .collection('posts')
          .where('uid', isEqualTo: FirebaseAuth.instance.currentUser!.uid)
          .get();

      
      userData = userSnap.data()!;
    
    } catch (e) {
    
    }
    
  }
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: mobileBackgroundColor,
        centerTitle: false,
        title: Text('พูดคุย'),
        actions: [
        
        ],
      ),
      body: StreamBuilder(
        stream: allusers,
            
        builder: (context,
            AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              
              child: CircularProgressIndicator(),
            );
          }

          return ListView.builder(
            itemCount: snapshot.data!.docs.length,
            itemBuilder: (context, index) => list_cart_screen(
              
                snap: snapshot.data!.docs[index].data(),
                
              ),
          );
        },
      ),
    );
  }
}
