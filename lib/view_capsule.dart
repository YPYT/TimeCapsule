import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:developer';
import 'dart:convert';
import 'list_row.dart';
import 'ready_to_unlock_row.dart';

class ViewScreen extends StatelessWidget {
  const ViewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Navigator(
      initialRoute: "/",
      onGenerateRoute: (RouteSettings settings) {
        WidgetBuilder builder;
        switch (settings.name) {
          case "/":
            builder = (BuildContext context) => const ViewScreenContent();
          default:
            throw Exception('Invalid route: ${settings.name}');
        }
        return MaterialPageRoute<void>(builder: builder, settings: settings);
      },
    );
  }
}

class ViewScreenContent extends StatefulWidget {
  const ViewScreenContent({super.key});

  @override
  State<ViewScreenContent> createState() => _ViewScreenContentState();
}

class _ViewScreenContentState extends State<ViewScreenContent> {
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
              // Only show capsules for me
              if (capsule["recipient"] == 0) {
                DateTime unlockDate = DateTime.parse(capsule["date"]);
                if (_tabIndex == 0 && capsule["unlocked"] == 0 && unlockDate.isBefore(DateTime.now())) {
                  capsuleDisplayList.add(
                      ReadyToUnlockRow(capsule: capsule, index: index));
                } else
                if (_tabIndex == 1 && capsule["unlocked"] == 0 && unlockDate.isAfter(DateTime.now())) {
                  capsuleDisplayList.add(
                      ListRow(capsule: capsule, index: index));
                }
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
                      child: const Text('Ready to Unlock')
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