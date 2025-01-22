import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:developer';
import 'dart:convert';
import 'unlocked_capsule.dart';

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
    return Container(
      height: 120,
      width: double.infinity,
      alignment: Alignment.center,
      margin: const EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 0),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black, width: 1.5),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
          children: [
            Text("Title: ${widget.capsule["title"]}, Message: ${widget.capsule["message"]}, Date: ${widget.capsule["date"]}, Address: ${widget.capsule["address"]}"),
            ElevatedButton(
                onPressed: () {_onUnlockPressed(context, widget.index);},
                child: const Text("Unlock")
            ),
          ]
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

class ListRow extends StatefulWidget {
  final dynamic capsule;
  final int index;

  const ListRow({super.key, required this.capsule, required this.index});

  @override
  State<ListRow> createState() => _ListRowState();
}

class _ListRowState extends State<ListRow> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      width: double.infinity,
      alignment: Alignment.center,
      margin: const EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 0),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black, width: 1.5),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          Text("Title: ${widget.capsule["title"]}, Message: ${widget.capsule["message"]}, Date: ${widget.capsule["date"]}, Address: ${widget.capsule["address"]}"),
        ]
      ),
    );
  }
}