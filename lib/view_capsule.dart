import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:developer';
import 'dart:convert';
import 'unlocked_capsule.dart';

class ViewScreen extends StatefulWidget {
  const ViewScreen({super.key});

  @override
  State<ViewScreen> createState() => _ViewScreenState();
}

class _ViewScreenState extends State<ViewScreen> {
  late Future<List<dynamic>> _capsules;

  @override
  void initState() {
    super.initState();
    _capsules = _fetchCapsules();
    log('Capsules: $_capsules');
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: FutureBuilder<List<dynamic>>(
        future: _capsules,
        builder: (BuildContext context, AsyncSnapshot<List<dynamic>> snapshot) {
          if (snapshot.hasData) {
            List<Widget> capsuleDisplayList = List.empty(growable: true);
            var index = 0;
            for (final capsule in snapshot.data!) {
              capsuleDisplayList.add(ViewScreenRow(capsule: capsule, index: index));
              index++;
            }

            return Column(
              children: <Widget>[
                Row(
                  children: [
                    ElevatedButton(
                        onPressed:  () {},
                        child: const Text('Ready to Unlock')
                    ),
                    ElevatedButton(
                        onPressed:  () {},
                        child: const Text('List')
                    ),
                  ],
                ),
              ] + capsuleDisplayList
            );
          } else {
            return Text('Fetching capsules');
          }
        },
      ),
    );
  }

  Future<List<dynamic>> _fetchCapsules() async {
    final prefs = await SharedPreferences.getInstance();

    // Get capsules list
    final capsulesString = prefs.getString('capsules') ?? "[]";
    final capsules = jsonDecode(capsulesString) as List<dynamic>;
    return capsules;
  }
}

class ViewScreenRow extends StatefulWidget {
  final dynamic capsule;
  final int index;
  
  const ViewScreenRow({super.key, required this.capsule, required this.index});

  @override
  State<ViewScreenRow> createState() => _ViewScreenRowState();
}

class _ViewScreenRowState extends State<ViewScreenRow> {
  @override
  Widget build(BuildContext context) {
    return Column(
        children: [
          Text("Message: ${widget.capsule["message"]}, Date: ${widget.capsule["date"]}, Address: ${widget.capsule["address"]}"),
          ElevatedButton(
              onPressed: () {_onUnlockPressed(context, widget.index);},
              child: const Text("Unlock")
          ),
        ]
    );
  }

  Future<void> _onUnlockPressed(context, index) async {
    final prefs = await SharedPreferences.getInstance();

    // Get capsules list
    final capsulesString = prefs.getString('capsules') ?? "[]";
    final capsules = jsonDecode(capsulesString) as List<dynamic>;
    final unlockedCapsulesString = prefs.getString('unlocked_capsules') ?? "[]";
    final unlockedCapsules = jsonDecode(unlockedCapsulesString) as List<dynamic>;

    var capsule = capsules[index];
    unlockedCapsules.add(capsule);
    capsules.removeAt(index);

    // Write back to storage
    final finalCapsulesString = jsonEncode(capsules);
    await prefs.setString('capsules', finalCapsulesString);
    final finalUnlockedCapsulesString = jsonEncode(unlockedCapsules);
    await prefs.setString('unlocked_capsules', finalUnlockedCapsulesString);

    Navigator.push(context, MaterialPageRoute(builder: (context) => UnlockedCapsuleScreen(capsule: capsule)));
  }
}