import 'dart:typed_data';

import 'package:app/models/user.dart';
import 'package:app/providers/user_provider.dart';
import 'package:app/resources/firestore_methods.dart';
import 'package:app/screens/report_main.dart';
import 'package:app/utils/colors.dart';
import 'package:app/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class reporttotopuser_screen extends StatefulWidget {
  const reporttotopuser_screen({Key? key}) : super(key: key);

  @override
  _reporttotopuser_screenState createState() => _reporttotopuser_screenState();
  
}

class _reporttotopuser_screenState extends State<reporttotopuser_screen> {
  void navigateToreportmain() {
    Navigator.pop(context);
  }

  bool isLoading = false;
  final TextEditingController _descriptionController = TextEditingController();

  

  void postImage(String uid, String email, String profImage) async {
    setState(() {
      isLoading = true;
    });
   
    try {
      // upload to storage and db
      String res = await FirestoreMethods().reporttotopuser(
        _descriptionController.text,
        uid,
        email,
        profImage,
      );
      if (res == "success") {
        setState(() {
          isLoading = false;
        });
        showSnackBar(
          'ส่งคำร้องสำเร็จ !',
          context,
        );
        navigateToreportmain();
       
      } else {
        showSnackBar(res, context);
      }
    } catch (err) {
      setState(() {
        isLoading = false;
      });
      showSnackBar(
        err.toString(),
        context,
      );
    }
  }
  

  

  @override
  void dispose() {
    super.dispose();
    _descriptionController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final UserProvider userProvider = Provider.of<UserProvider>(context);

    return 
   
         
         Scaffold(
            appBar: AppBar(
              backgroundColor: mobileBackgroundColor,
              leading: IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: navigateToreportmain,
              ),
              title: const Text(
                'คำร้องถึงผู้บริหาร',
              ),
              centerTitle: false,
              actions: <Widget>[
                TextButton(
                  onPressed: () => postImage(
                    userProvider.getUser.uid,
                    userProvider.getUser.email,
                    userProvider.getUser.photoUrl,
                  ),
                  child: const Text(
                    "ส่ง",
                    style: TextStyle(
                        color: Colors.blueAccent,
                        fontWeight: FontWeight.bold,
                        fontSize: 16.0),
                  ),
                )
              ],
            ),
            // POST FORM
            body: Column(
              children: <Widget>[
                isLoading
                    ? const LinearProgressIndicator()
                    : const Padding(padding: EdgeInsets.only(top: 0.0)),
                const Divider(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    CircleAvatar(
                      backgroundImage: NetworkImage(
                        userProvider.getUser.photoUrl,
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.3,
                      child: TextField(
                        controller: _descriptionController,
                        decoration: const InputDecoration(
                            hintText: "เขียนข้อความของคุณถึงผู้บริหาร...",
                            border: InputBorder.none),
                        maxLines: 8,
                      ),
                    ),
                    SizedBox(
                      height: 45.0,
                      width: 45.0,
                      child: AspectRatio(
                        aspectRatio: 487 / 451,
                        child: Container(
                          decoration: BoxDecoration(
                              
                           
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const Divider(),
              ],
            ),
          );
  }
}
