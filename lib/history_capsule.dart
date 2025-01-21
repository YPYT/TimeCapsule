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
  int _tabIndex = 0;

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
              if (_tabIndex == 0 && capsule["recipient"] == 0 && capsule["unlocked"] == 1) {
                capsuleDisplayList.add(
                    UnlockedRow(capsule: capsule, index: index));
              } else if (_tabIndex == 1 && capsule["sender"] == 0) {
                capsuleDisplayList.add(
                    BuriedRow(capsule: capsule, index: index));
              }
              index++;
            }

            return Column(
                children: <Widget>[
                  Row(
                    children: [
                      ElevatedButton(
                          onPressed:  () {
                            setState(() {
                              _tabIndex = 0;
                            });
                          },
                          child: const Text('Unlocked')
                      ),
                      ElevatedButton(
                          onPressed:  () {
                            setState(() {
                              _tabIndex = 1;
                            });
                          },
                          child: const Text('You Buried')
                      ),
                    ],
                  ),
                ] + capsuleDisplayList
            );
            }
           else {
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
    return Column(
        children: [
          Text("Title: ${widget.capsule["title"]}, Message: ${widget.capsule["message"]}, Date: ${widget.capsule["date"]}, Address: ${widget.capsule["address"]}"),
        ]
    );
  }
}

class BuriedRow extends StatefulWidget {
  final dynamic capsule;
  final int index;

  const BuriedRow({super.key, required this.capsule, required this.index});

  @override
  State<BuriedRow> createState() => _BuriedRowState();
}

class _BuriedRowState extends State<BuriedRow> {
  @override
  Widget build(BuildContext context) {
    return Column(
        children: [
          Text("Title: ${widget.capsule["title"]}, Message: ${widget.capsule["message"]}, Date: ${widget.capsule["date"]}, Address: ${widget.capsule["address"]}"),
        ]
    );
  }
}