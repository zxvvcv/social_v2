import 'package:app/resources/auth_methods.dart';
import 'package:app/screens/feed_screen.dart';
import 'package:app/screens/feed_screen2.dart';
import 'package:app/screens/feed_screen3.dart';
import 'package:app/screens/report_to_admin.dart';
import 'package:app/screens/report_to_top_user.dart';
import 'package:app/screens/report_view_topuser.dart';
import 'package:app/utils/colors.dart';
import 'package:app/utils/utils.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class reportmain extends StatefulWidget {
    final String uid;
  
  
  
  
   reportmain({Key? key, required this.uid}) : super(key: key);
  
  


  @override
  State<reportmain> createState() => _reportmainState();
  
  

}

class _reportmainState extends State<reportmain> {
var userData = {};
  
  @override
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

      

      
      userData = userSnap.data()!;
    
    } catch (e) {
      showSnackBar(e.toString(), context);
    }
    
  }
  

  

  
  
 void _showMaterialDialog() {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('ข้อความจากระบบ !'),
            content: Text('การใช้งานนี้สามารถเข้าใช้ได้เฉพาะผู้บริหารเท่านั้น'),
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
  
  void check()  {
  String res = "Some error occurred";
  if(userData['status']=='prouser'){
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) =>   report_view_topuser_screen(),
      ),
    );
  }else{
   _showMaterialDialog();
   
  }
  
  }


  void navigateTofeed() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const FeedScreen(),
      ),
    );
  }
  void navigateToadmin() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) =>  reporttoadmin(),
      ),
    );
  }
  void navigateTotopuser() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) =>  reporttotopuser_screen(),
      ),
    );
  }
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(  
      appBar: AppBar(  
        title: Text('เลือกหัวข้อที่ต้องการ'),  
        backgroundColor: mobileBackgroundColor,  
      ),  
      body: Container(
          child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: <Widget>[
            GridView.count(
              primary: true,
              padding: const EdgeInsets.all(20),
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              crossAxisCount: 2,
              shrinkWrap: true,
              children: <Widget>[
                InkWell(
                onTap: () {
                           navigateToadmin();
                        },
                child: Container(
                  padding: const EdgeInsets.all(0),
                  color: mobileBackgroundColor,
                  child: Column(
                    children: <Widget>[
                      new Icon(Icons.home_repair_service_outlined,color: Colors.white,size: 140,
                      ),
                      Text('ข้อเสนอถึงผู้ดูแลระบบ',style: TextStyle(color: Colors.white),),
                    ],
                  ),
                ),
              ),
                InkWell(
                onTap: () {
                           navigateTotopuser();
                        },
                child: Container(
                  padding: const EdgeInsets.all(0),
                  color: mobileBackgroundColor,
                  child: Column(
                    children: <Widget>[
                     new Icon(Icons.send_rounded,color: Colors.white,size: 140,
                      ),
                      Text('ข้อเสนอถึงผู้บริหาร',style: TextStyle(color: Colors.white),),
                    ],
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                       check();
                        },
                child: Container(
                  padding: const EdgeInsets.all(0),
                  color: mobileBackgroundColor,
                  child: Column(
                    children: <Widget>[
                      new Icon(Icons.mark_email_read,color: Colors.white,size: 140,
                      ),
                      Text('ดูข้อเสนอถึงผู้บริหาร',style: TextStyle(color: Colors.white),),
                    ],
                  ),
                ),
              ),
              
                
              ],
            ),
          ],
        ),
      )),  
    );
  }
}