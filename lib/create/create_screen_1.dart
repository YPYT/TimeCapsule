import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'create_screen_2.dart';
import 'preview.dart';
import 'message_input.dart';
import 'dart:io';
import 'dart:developer';
import 'select_capsule.dart';

class CreateScreenOne extends StatefulWidget {
  const CreateScreenOne({super.key});

  @override
  State<CreateScreenOne> createState() => _CreateScreenOneState();
}

class _CreateScreenOneState extends State<CreateScreenOne> {
  Map<String, dynamic> capsule = {
    "title": "",
    "message": "",
    "capsule_image": "rabbit.png",
    "tmp_media": [],
    "recipient": 0,
    "sender": 0,
  };

  @override
  Widget build(BuildContext context) {
    List<Image> mediaChildren = [];
    for (XFile mediaFile in capsule["tmp_media"]) {
      String mediaPath = mediaFile.path;
      log(mediaPath);
      if (mediaPath.endsWith(".jpg")) {
        mediaChildren.add(Image(
          image: FileImage(File(mediaPath)),
          width: 80,
          height: 80,
        ));
      }
    }

    return Center(
        child: Column(
          children: [
            Row(
              spacing: 2,
              mainAxisSize: MainAxisSize.min,
              children: [
                ElevatedButton(
                  onPressed:  () {},
                  style: ElevatedButton.styleFrom(
                    shape: CircleBorder(),
                    padding: EdgeInsets.all(15),
                    iconSize: 30,
                    backgroundColor: Color(0xFFBFA36F),
                  ),
                  child: Icon(Icons.window, color: Colors.white),
                ),
                Icon(Icons.arrow_right_alt, size: 30, color: Color(0xFF797979)),
                ElevatedButton(
                  onPressed:  () {},
                  style: ElevatedButton.styleFrom(
                    shape: CircleBorder(),
                    padding: EdgeInsets.all(15),
                    iconSize: 30,
                    backgroundColor: Color(0xFFF7D38E),
                  ),
                  child: Icon(Icons.location_on, color: Colors.white),
                ),
                Icon(Icons.arrow_right_alt, size: 30, color: Color(0xFF797979)),
                ElevatedButton(
                  onPressed:  () {},
                  style: ElevatedButton.styleFrom(
                    shape: CircleBorder(),
                    padding: EdgeInsets.all(15),
                    iconSize: 30,
                    backgroundColor: Color(0xFFF7D38E),
                  ),
                  child: Icon(Icons.outgoing_mail, color: Colors.white),
                ),
                Icon(Icons.arrow_right_alt, size: 30, color: Color(0xFF797979)),
                ElevatedButton(
                  onPressed:  () {},
                  style: ElevatedButton.styleFrom(
                    shape: CircleBorder(),
                    padding: EdgeInsets.all(15),
                    iconSize: 30,
                    backgroundColor: Color(0xFFF7D38E),
                  ),
                  child: Icon(Icons.mobile_friendly, color: Colors.white),
                ),
              ],
            ),
            SizedBox(height: 15),
            GestureDetector(
              onTap: () {
                _onPickImagePressed();
              },
              child: Container(
                height: 150,
                width: double.infinity,
                alignment: Alignment.center,
                margin: const EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 0),
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    gradient: LinearGradient(
                        colors: [
                          Color(0xFFFFAD49),
                          Color(0xffffc890),
                        ]
                    )
                ),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Icon(Icons.image),
                      Text("Select photo/video")
                    ],
                  ),
                ),
              ),
            ),
            Container(
              height: 150,
              margin: const EdgeInsets.only(left: 15, right: 15),
              width: double.infinity,
              decoration: BoxDecoration(color: Colors.white),
              child: Row(
                children: mediaChildren,
              ),
            ),
            Row(
              spacing: 22,
              mainAxisSize: MainAxisSize.min,
              children: [
                GestureDetector(
                  onTap: () {
                    _goToSelectCapsuleScreen();
                  },
                  child: Container(
                    height: 150,
                    width: 170,
                    alignment: Alignment.center,
                    margin: const EdgeInsets.only(left: 20, right: 0, top: 20, bottom: 0),
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Color(0xFFFFAD49),
                    ),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Icon(Icons.redeem),
                          Text("Select your capsule")
                        ],
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    _goToMessageScreen();
                  },
                  child: Container(
                    height: 150,
                    width: 170,
                    alignment: Alignment.center,
                    margin: const EdgeInsets.only(left: 0, right: 20, top: 20, bottom: 0),
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Color(0xffffc890),
                    ),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Icon(Icons.mail),
                          Text("Write message"),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(width: 100),
                Column(
                  children: [
                    IconButton(
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => PreviewScreen(capsule: capsule)));
                        },
                        icon: const Icon(Icons.find_in_page, size: 50)
                    ),
                    Text("Preview")
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 20),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => CreateScreenTwo(capsule: capsule)));
                    },
                    child: Text("Next"),
                  ),
                )
              ],
            ),

          ],
        )
    );
  }

  Future<void> _goToMessageScreen() async {
    final result = await Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => MessageInputScreen(
            title: capsule["title"], message: capsule["message"]))
    );
    capsule["title"] = result[0];
    capsule["message"] = result[1];
  }

  Future<void> _goToSelectCapsuleScreen() async {
    final result = await Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => SelectCapsuleScreen())
    );
    capsule["capsule_image"] = result;
  }

  Future<void> _onPickImagePressed() async {
    final ImagePicker picker = ImagePicker();
    final List<XFile> medias = await picker.pickMultipleMedia();
    for (XFile file in medias) {
      setState(() {
        capsule["tmp_media"].add(file);
      });
    }
  }
}