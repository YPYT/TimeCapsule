import 'package:flutter/material.dart';
import 'unlocked_capsule.dart';
import 'names.dart';

class UnlockedRow extends StatefulWidget {
  final dynamic capsule;
  final int index;

  const UnlockedRow({super.key, required this.capsule, required this.index});

  @override
  State<UnlockedRow> createState() => _UnlockedRowState();
}

class _UnlockedRowState extends State<UnlockedRow> {
  @override
  Widget build(BuildContext context) {
    DateTime buriedDate = DateTime.parse(widget.capsule["buried_date"]);
    DateTime unlockedDate = DateTime.parse(widget.capsule["unlocked_date"]);

    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => UnlockedCapsuleScreen(capsule: widget.capsule)));
      },
      child: Container(
        height: 130,
        width: double.infinity,
        alignment: Alignment.center,
        margin: const EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 0),
        padding: const EdgeInsets.only(top: 20, left: 20),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black, width: 1.5),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image(
                  image: AssetImage("assets/${widget.capsule["capsule_image"]}"),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 3),
                  child: Text(getName(widget.capsule["sender"]), style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  )),
                ),
              ],
            ),
            SizedBox(width: 50),
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Title:", style: TextStyle(
                    fontWeight: FontWeight.bold,
                  )),
                  Text("Unlocked:", style: TextStyle(
                    fontWeight: FontWeight.bold,
                  )),
                  Text("Buried:", style: TextStyle(
                    fontWeight: FontWeight.bold,
                  )),
                ]
              ),
            ),
            SizedBox(width: 5),
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("${widget.capsule["title"]}"),
                    Text("${unlockedDate.day}/${unlockedDate.month}/${unlockedDate.year}"),
                    Text("${buriedDate.day}/${buriedDate.month}/${buriedDate.year}"),
                  ]
              ),
            ),
          ],
        ),
      ),
    );
  }
}