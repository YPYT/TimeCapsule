import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:developer';
import 'dart:convert';

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
              List<Text> capsuleDisplayList = List.empty(growable: true);
              for (final capsule in snapshot.data!) {
                capsuleDisplayList.add(Text(
                    "Message: ${capsule["message"]}, Date: ${capsule["date"]}, Address: ${capsule["address"]}"
                ));
              }

              return Column(
                children: capsuleDisplayList,
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