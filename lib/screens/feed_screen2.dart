import 'package:app/screens/add_post_screen.dart';
import 'package:app/screens/add_post_screen2.dart';
import 'package:app/utils/colors.dart';
import 'package:app/widgets/post_card.dart';
import 'package:app/widgets/post_card2.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class FeedScreen2 extends StatefulWidget {
  const FeedScreen2({Key? key}) : super(key: key);

  @override
  State<FeedScreen2> createState() => _FeedScreen2State();
}

class _FeedScreen2State extends State<FeedScreen2> {
  void navigateToaddpost() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const AddPostScreen2(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: mobileBackgroundColor,
        centerTitle: false,
        title: Text('หอพัก'),
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
        stream: FirebaseFirestore.instance.collection('posts2').orderBy('datePublished',descending: true,).snapshots(),
        builder: (context,
            AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          return ListView.builder(
            itemCount: snapshot.data!.docs.length,
            itemBuilder: (context, index) => PostCard2(
                snap: snapshot.data!.docs[index].data(),
              ),
          );
        },
      ),
    );
  }
}
