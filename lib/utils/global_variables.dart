import 'package:app/screens/Search_screen.dart';
import 'package:app/screens/add_post_screen.dart';
import 'package:app/screens/feed_screen.dart';
import 'package:app/screens/group.dart';
import 'package:app/screens/profile_screen.dart';
import 'package:app/screens/report_main.dart';
import 'package:app/screens/report_to_top_user.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

const webScreenSize = 600;

List<Widget> homeScreenItems = [
   group_screen(),
  const SearchScreen(),
   reportmain(),
  ProfileScreen(
    uid: FirebaseAuth.instance.currentUser!.uid,
  ),
];