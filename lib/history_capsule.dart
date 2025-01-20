import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:developer';
import 'dart:convert';
import 'unlocked_capsule.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({super.key});

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
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
            for (final capsule in snapshot.data!) {
              capsuleDisplayList.add(Column(
                  children: [
                    Text("Title: ${capsule["title"]}, Message: ${capsule["message"]}, Date: ${capsule["date"]}, Address: ${capsule["address"]}"),
                    ElevatedButton(
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => UnlockedCapsuleScreen(capsule: capsule)));
                        },
                        child: const Text("View")
                    ),
                  ]
              ));
            }

            return Column(
                children: <Widget>[
                  Row(
                    children: [
                      ElevatedButton(
                          onPressed:  () {},
                          child: const Text('Unlocked')
                      ),
                      ElevatedButton(
                          onPressed:  () {},
                          child: const Text('You Buried')
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
    final capsulesString = prefs.getString('unlocked_capsules') ?? "[]";
    final capsules = jsonDecode(capsulesString) as List<dynamic>;
    return capsules;
  }
}
