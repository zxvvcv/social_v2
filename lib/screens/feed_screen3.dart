import 'package:app/screens/add_post_screen.dart';
import 'package:app/utils/colors.dart';
import 'package:app/widgets/post_card.dart';
import 'package:app/widgets/post_card3.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'add_post_screen3.dart';

class FeedScreen3 extends StatefulWidget {
  const FeedScreen3({Key? key}) : super(key: key);

  @override
  State<FeedScreen3> createState() => _FeedScreen3State();
}

class _FeedScreen3State extends State<FeedScreen3> {
  void navigateToaddpost() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const AddPostScreen3(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: mobileBackgroundColor,
        centerTitle: false,
        title: Text('เกี่ยวกับหอพัก'),
        actions: [
          IconButton(
            onPressed: navigateToaddpost,
            icon: const Icon(
              Icons.add_a_photo,
            ),
          ),
        ],
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection('posts3').snapshots(),
        builder: (context,
            AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          return ListView.builder(
            itemCount: snapshot.data!.docs.length,
            itemBuilder: (context, index) => PostCard3(
                snap: snapshot.data!.docs[index].data(),
              ),
          );
        },
      ),
    );
  }
}
