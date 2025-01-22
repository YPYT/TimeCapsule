import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:developer';
import 'dart:convert';
import 'buried_row.dart';
import 'unlocked_row.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Navigator(
      initialRoute: "/",
      onGenerateRoute: (RouteSettings settings) {
        WidgetBuilder builder;
        switch (settings.name) {
          case "/":
            builder = (BuildContext context) => const HistoryScreenContent();
          default:
            throw Exception('Invalid route: ${settings.name}');
        }
        return MaterialPageRoute<void>(builder: builder, settings: settings);
      },
    );
  }
}

class HistoryScreenContent extends StatefulWidget {
  const HistoryScreenContent({super.key});

  @override
  State<HistoryScreenContent> createState() => _HistoryScreenContentState();
}

class _HistoryScreenContentState extends State<HistoryScreenContent> {
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
                    spacing: 40,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      ElevatedButton(
                        onPressed:  () {
                          setState(() {
                            _tabIndex = 0;
                          });
                        },
                        style: ElevatedButton.styleFrom(
                          fixedSize: Size(160, 30),
                          //shape:
                        ),
                        child: const Text('Unlocked'),
                      ),
                      ElevatedButton(
                        onPressed:  () {
                          setState(() {
                            _tabIndex = 1;
                          });
                        },
                        style: ElevatedButton.styleFrom(
                          fixedSize: Size(160, 30),
                          //shape:
                        ),
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