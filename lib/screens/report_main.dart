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
                Material(
                  color: Colors.teal[200],
                  child: InkWell(
                    onTap: () {
                      navigateTotopuser();
                    },
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      child: const Text("ส่งคำร้องถึงผู้บริหาร"),
                      
                    ),
                  ),
                ),
                Material(
                  color: Colors.teal[200],
                  child: InkWell(
                    onTap: () {
                      navigateToadmin();
                    },
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      child: const Text('ส่งข้อเสนอแนะถึงผู้ดแลระบบ'),
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