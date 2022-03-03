import 'package:app/models/user.dart';
import 'package:app/providers/user_provider.dart';
import 'package:app/resources/firestore_methods.dart';
import 'package:app/widgets/like_animation.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class CommentCard2 extends StatefulWidget {
  final snap;
  final postId;
  CommentCard2({Key? key, required this.snap,required this.postId}) : super(key: key);

  @override
  State<CommentCard2> createState() => _CommentCard2State();
}

class _CommentCard2State extends State<CommentCard2> {
  @override
  void _showMaterialDialog2() {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('ข้อความจากระบบ !'),
            content: Text('ขอบคุณสำหรับการรายงานความคิดเห็นที่ไม่เหมาะสมทางทีมงานจะรีบตรวจสอบและดำเนินการให้เร็วที่สุด'),
            actions: <Widget>[
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                     
                  },
                  child: Text('รับทราบ')),
             
            ],
          );
        });
  }
  Widget build(BuildContext context) {
    final User user = Provider.of<UserProvider>(context).getUser;
    void _showMaterialDialog() {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('ข้อความจากระบบ !'),
            content: Text('คุณยืนยันที่จะต้องการรายงานความคิดเห็นนี้หรือไม่'),
            actions: <Widget>[
              TextButton(
                  onPressed: () async{  await FirestoreMethods().reportComment2(
                widget.postId.toString(),
                widget.snap['commentId'].toString(),
                user.uid,
                widget.snap['report'],
              );
               Navigator.pop(context);
                
              setState(() {
                _showMaterialDialog2();
                
              });
                  
                  },
                  child: Text('ยืนยัน')),
                  TextButton(
                  onPressed: () {
                    
                   
                     Navigator.pop(context);
                    
                  },
                  child: Text('ยกเลิก')),
             
            ],
          );
        });
  }


    
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 18,
        horizontal: 16,
      ),
      child: Row(
        children: [
          CircleAvatar(
            backgroundImage: NetworkImage(
              widget.snap['profilePic'],),
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
                          text: widget.snap['name'],
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        TextSpan(
                          text: ' ${widget.snap['text']}',
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 4),
                    child: Text(
                      DateFormat.yMMMd().format(
                        widget.snap['datePublished'].toDate()
                      ),
                      style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Row(
            children: [LikeAnimation(
                isAnimating: widget.snap['likes'].contains(user.uid),
                smallLike: true,
                child: IconButton(
                  onPressed: () async {
                    await FirestoreMethods().likeComment2(widget.postId.toString(),
                widget.snap['commentId'].toString(),
                user.uid,
                widget.snap['likes'],
              );
                  },
                  icon: widget.snap['likes'].contains(user.uid)
                      ? const Icon(
                          Icons.favorite,
                          color: Colors.red,
                        )
                      : const Icon(
                          Icons.favorite_border,
                        ),
                ),
              ),DefaultTextStyle(
                  style: Theme.of(context).textTheme.subtitle2!.copyWith(
                        fontWeight: FontWeight.w800,
                      ),
                  child: Text(
                    '${widget.snap['likes'].length}',
                    style: Theme.of(context).textTheme.bodyText2,
                  ),
                ),
              IconButton(onPressed: () {
                _showMaterialDialog();
              }, icon: const Icon(Icons.report_problem),),
            ],
          ),
        ],
      ),
    );
  }
}
