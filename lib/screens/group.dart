import 'package:app/screens/feed_screen.dart';
import 'package:app/screens/feed_screen2.dart';
import 'package:app/screens/feed_screen3.dart';
import 'package:app/utils/colors.dart';
import 'package:flutter/material.dart';

class group_screen extends StatefulWidget {
  group_screen({Key? key}) : super(key: key);
  


  @override
  State<group_screen> createState() => _group_screenState();
  

}

class _group_screenState extends State<group_screen> {

  void navigateTofeed() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const FeedScreen(),
      ),
    );
  }
  void navigateTofeed2() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const FeedScreen2(),
      ),
    );
  }
  void navigateTofeed3() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const FeedScreen3(),
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
                           navigateTofeed();
                        },
                child: Container(
                  padding: const EdgeInsets.all(0),
                  color: mobileBackgroundColor,
                  child: Column(
                    children: <Widget>[
                      new Image.network(
                        'https://images.unsplash.com/photo-1504674900247-0877df9cc836?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80',
                        fit: BoxFit.cover,
                        height: 140,
                        width: double.infinity,
                        alignment: Alignment.center,
                      ),
                      Text('เกี่ยวกับอาหาร',style: TextStyle(color: Colors.white),),
                    ],
                  ),
                ),
              ),
                InkWell(
                onTap: () {
                           navigateTofeed2();
                        },
                child: Container(
                  padding: const EdgeInsets.all(0),
                  color: mobileBackgroundColor,
                  child: Column(
                    children: <Widget>[
                      new Image.network(
                        'https://images.unsplash.com/photo-1512918728675-ed5a9ecdebfd?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80',
                        fit: BoxFit.cover,
                        height: 140,
                        width: double.infinity,
                        alignment: Alignment.center,
                      ),
                      Text('เกี่ยวกับหอพัก',style: TextStyle(color: Colors.white),),
                    ],
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                           navigateTofeed3();
                        },
                child: Container(
                  padding: const EdgeInsets.all(0),
                  color: mobileBackgroundColor,
                  child: Column(
                    children: <Widget>[
                      new Image.network(
                        'https://images.unsplash.com/photo-1434030216411-0b793f4b4173?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80',
                        fit: BoxFit.cover,
                        height: 140,
                        width: double.infinity,
                        alignment: Alignment.center,
                      ),
                      Text('เกี่ยวกับการเรียน',style: TextStyle(color: Colors.white),),
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