import 'package:flutter/material.dart';
import 'unlocked_capsule.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

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
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black, width: 1.5),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        spacing: 40,
        children: [
          Image(
            image: AssetImage("assets/rabbit.png"),
          ),
          Column(
              children: [
                Text("Myself"),
                Text("Buried: ${buriedDate.day}/${buriedDate.month}/${buriedDate.year}"),
                ElevatedButton.icon(
                  onPressed: () {_onUnlockPressed(context, widget.index);},
                  label: const Text("Unlock"),
                  icon: const Icon(Icons.key),
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

    // Write back to storage
    final finalCapsulesString = jsonEncode(capsules);
    await prefs.setString('capsules', finalCapsulesString);

    Navigator.push(context, MaterialPageRoute(builder: (context) => UnlockedCapsuleScreen(capsule: capsule)));
  }
}