import 'package:flutter/material.dart';
import 'unlocked_capsule.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import 'names.dart';

class ReadyToUnlockRow extends StatefulWidget {
  final dynamic capsule;
  final int index;

  const ReadyToUnlockRow({super.key, required this.capsule, required this.index});

  @override
  State<ReadyToUnlockRow> createState() => _ReadyToUnlockRowState();
}

class _ReadyToUnlockRowState extends State<ReadyToUnlockRow> {
  @override
  Widget build(BuildContext context) {
    DateTime buriedDate = DateTime.parse(widget.capsule["buried_date"]);

    return Container(
      height: 130,
      width: double.infinity,
      alignment: Alignment.center,
      margin: const EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 0),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black, width: 1.5),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        spacing: 40,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Image(
              image: AssetImage("assets/${widget.capsule["capsule_image"]}"),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 5,
            children: [
              Text(getName(widget.capsule["sender"]), style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold
              )),
              Text("Buried: ${buriedDate.day}/${buriedDate.month}/${buriedDate.year}"),
              SizedBox(
                width: 120,
                height: 30,
                child: ElevatedButton.icon(
                  onPressed: () {_onUnlockPressed(context, widget.index);},
                  label: const Text("Unlock"),
                  icon: const Icon(Icons.key),
                  //style: ElevatedButton.styleFrom(
                  //  maximumSize: Size(120, 20)
                  //),
                ),
              ),
            ]
          ),
        ],
      ),
    );
  }

  Future<void> _onUnlockPressed(context, index) async {
    final prefs = await SharedPreferences.getInstance();

    // Get capsules list
    final capsulesString = prefs.getString('capsules') ?? "[]";
    final capsules = jsonDecode(capsulesString) as List<dynamic>;

    // Set as unlocked
    var capsule = capsules[index];
    capsule["unlocked"] = 1;
    capsule["unlocked_date"] = DateTime.now().toString();

    // Write back to storage
    final finalCapsulesString = jsonEncode(capsules);
    await prefs.setString('capsules', finalCapsulesString);

    Navigator.push(context, MaterialPageRoute(builder: (context) => UnlockedCapsuleScreen(capsule: capsule)));
  }
}