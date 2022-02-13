import 'package:app/models/user.dart';
import 'package:app/providers/user_provider.dart';
import 'package:app/resources/firestore_methods.dart';
import 'package:app/utils/colors.dart';
import 'package:app/widgets/report_view_topuser_card.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class report_view_topuser_screen extends StatefulWidget {

  const report_view_topuser_screen({Key? key}) : super(key: key);

  @override
  State<report_view_topuser_screen> createState() => _report_view_topuser_screenState();
}

class _report_view_topuser_screenState extends State<report_view_topuser_screen> {
  final TextEditingController _commentController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _commentController.dispose();
  }

  @override
  Widget build(BuildContext context) {
     final User user = Provider.of<UserProvider>(context).getUser;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: mobileBackgroundColor,
        title: const Text('คำร้องถึงท่าน'),
        centerTitle: false,
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection('reporttotopuser')
            .where('reportid')
            .orderBy('datePublished',descending: true,)
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return ListView.builder(
            itemCount: (snapshot.data! as dynamic).docs.length,
            itemBuilder: (context, index) => report_view_topuser_card(
              snap: (snapshot.data!as dynamic).docs[index].data()
            ),
          );
        },
      ),
      bottomNavigationBar: SafeArea(
        child: Container(
          height: kToolbarHeight,
          margin: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          padding: const EdgeInsets.only(left: 16, right: 8),
          
        ),
      ),
    );
  }
}
