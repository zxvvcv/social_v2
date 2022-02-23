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
        title: Text('เลือกกระดานสนทนา'),  
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
                      new  Icon(Icons.fastfood,color: Colors.white,size: 140,
                      ),
                      Text('อาหาร',style: TextStyle(color: Colors.white),),
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
                      new Icon(Icons.home_work,color: Colors.white,size: 140,
                        
                       
                      ),
                      Text('หอพัก',style: TextStyle(color: Colors.white),),
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
                     new Icon(Icons.menu_book_rounded,color: Colors.white,size: 140,
                      ),
                      Text('การเรียน',style: TextStyle(color: Colors.white),),
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