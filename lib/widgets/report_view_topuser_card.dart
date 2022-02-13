import 'package:app/models/user.dart';
import 'package:app/providers/user_provider.dart';
import 'package:app/resources/firestore_methods.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class report_view_topuser_card extends StatefulWidget {
  final snap;
  report_view_topuser_card({Key? key, required this.snap}) : super(key: key);

  @override
  State<report_view_topuser_card> createState() => _report_view_topuser_cardState();
}

class _report_view_topuser_cardState extends State<report_view_topuser_card> {
  @override
  Widget build(BuildContext context) {
    final User user = Provider.of<UserProvider>(context).getUser;

    
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 30,
        horizontal: 16,
      ),
      child: Row(
        children: [
          CircleAvatar(
            backgroundImage: NetworkImage(
              widget.snap['profImage'],),
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
                          text: 'email : ${widget.snap['email']}',
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Text(
                      'ข้อความ : ${widget.snap['description']}',
                      style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w400),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Text(
                      'วันที่ : ${DateFormat.yMMMd().format(widget.snap['datePublished'].toDate())}',
                      style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w400),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Row(
            children: [
              IconButton(onPressed: () async {
                FirestoreMethods().deletereporttopview(widget.snap['reportid']);
                                         ;


                  }, icon: const Icon(Icons.delete_forever_outlined,size: 30),),
          
            ],
          ),
        ],
      ),
    );
  }
}

