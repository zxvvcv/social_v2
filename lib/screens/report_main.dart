import 'package:app/screens/feed_screen.dart';
import 'package:app/screens/feed_screen2.dart';
import 'package:app/screens/feed_screen3.dart';
import 'package:app/screens/report_to_admin.dart';
import 'package:app/screens/report_to_top_user.dart';
import 'package:app/utils/colors.dart';
import 'package:flutter/material.dart';

class reportmain extends StatefulWidget {
  reportmain({Key? key}) : super(key: key);
  


  @override
  State<reportmain> createState() => _reportmainState();
  

}

class _reportmainState extends State<reportmain> {

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
                      new Image.network(
                        'https://images.unsplash.com/photo-1507679799987-c73779587ccf?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1171&q=80',
                        fit: BoxFit.cover,
                        height: 140,
                        width: double.infinity,
                        alignment: Alignment.center,
                      ),
                      Text('ข้อเสนอถึงผู้บริหาร',style: TextStyle(color: Colors.white),),
                    ],
                  ),
                ),
              ),
                InkWell(
                onTap: () {
                           navigateToadmin();
                        },
                child: Container(
                  padding: const EdgeInsets.all(0),
                  color: mobileBackgroundColor,
                  child: Column(
                    children: <Widget>[
                      new Image.network(
                        'https://images.unsplash.com/photo-1457305237443-44c3d5a30b89?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1174&q=80',
                        fit: BoxFit.cover,
                        height: 140,
                        width: double.infinity,
                        alignment: Alignment.center,
                      ),
                      Text('ข้อเสนอถึงผู้ดูแลระบบ',style: TextStyle(color: Colors.white),),
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