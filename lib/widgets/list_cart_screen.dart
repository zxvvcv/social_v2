import 'package:app/models/user.dart';
import 'package:app/providers/user_provider.dart';
import 'package:app/resources/firestore_methods.dart';
import 'package:app/screens/chat_detail.dart';
import 'package:app/widgets/like_animation.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class list_cart_screen extends StatefulWidget {
 

  final snap;

  list_cart_screen({Key? key, required this.snap}) : super(key: key);

  @override
  State<list_cart_screen> createState() => _list_cart_screenState();
}

class _list_cart_screenState extends State<list_cart_screen> {
  CollectionReference chats = FirebaseFirestore.instance.collection('chats');
  var chatDocId;
 void callChatDetailScreen(BuildContext context, String username, String uid,String photoUrl) {
    Navigator.push(
        context,
        CupertinoPageRoute(
            builder: (context) =>
                ChatDetail(friendUid: uid, friendName: username,friendpic:photoUrl ,)));
  }
  @override
  
  Widget build(BuildContext context) {
    final User user = Provider.of<UserProvider>(context).getUser;
 
    return StreamBuilder<QuerySnapshot>(
      stream: chats
          .doc(chatDocId)
          .collection('messages')
          .orderBy('createdOn', descending: true)
          .snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return Center(
            child: Text("Something went wrong"),
          );
        }

        

        if (snapshot.hasData) {
          var data;
              return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 18,
        horizontal: 16,
      ),
      child: Row(
        children: [
        
            CircleAvatar(
            backgroundImage: NetworkImage(
              widget.snap['photoUrl'],),
            radius: 18,
          ),
      
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(
                left: 16,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: widget.snap['username'],
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                     
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 4),
                    child: Text(
                     widget.snap['bio'],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Row(
            children: [
               
              
                
               
              IconButton(onPressed: () => callChatDetailScreen(
                              context, widget.snap['username'], widget.snap['uid'], widget.snap['photoUrl'],), icon: const Icon(Icons.message_rounded),),
            ],
          ),
        ],
      ),
    );
        } else {
          return Container();
        }
      },
    );
  }
  }


