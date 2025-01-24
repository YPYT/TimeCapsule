import 'package:flutter/material.dart';
import 'create_screen_3.dart';
import 'package:map_location_picker/map_location_picker.dart';

class CreateScreenTwo extends StatefulWidget {
  final Map<String, dynamic> capsule;
  const CreateScreenTwo({super.key, required this.capsule});

  @override
  State<CreateScreenTwo> createState() => _CreateScreenTwoState();
}

class _CreateScreenTwoState extends State<CreateScreenTwo> {

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
          children: [
            Row(
              spacing: 2,
              mainAxisSize: MainAxisSize.min,
              children: [
                ElevatedButton(
                  onPressed:  () {},
                  style: ElevatedButton.styleFrom(
                    shape: CircleBorder(),
                    padding: EdgeInsets.all(15),
                    iconSize: 30,
                    backgroundColor: Color(0xFFF7D38E),
                  ),
                  child: Icon(Icons.window, color: Colors.white),
                ),
                Icon(Icons.arrow_right_alt, size: 30, color: Color(0xFF797979)),
                ElevatedButton(
                  onPressed:  () {},
                  style: ElevatedButton.styleFrom(
                    shape: CircleBorder(),
                    padding: EdgeInsets.all(15),
                    iconSize: 30,
                    backgroundColor: Color(0xFFBFA36F),
                  ),
                  child: Icon(Icons.location_on, color: Colors.white),
                ),
                Icon(Icons.arrow_right_alt, size: 30, color: Color(0xFF797979)),
                ElevatedButton(
                  onPressed:  () {},
                  style: ElevatedButton.styleFrom(
                    shape: CircleBorder(),
                    padding: EdgeInsets.all(15),
                    iconSize: 30,
                    backgroundColor: Color(0xFFF7D38E),
                  ),
                  child: Icon(Icons.outgoing_mail, color: Colors.white),
                ),
                Icon(Icons.arrow_right_alt, size: 30, color: Color(0xFF797979)),
                ElevatedButton(
                  onPressed:  () {},
                  style: ElevatedButton.styleFrom(
                    shape: CircleBorder(),
                    padding: EdgeInsets.all(15),
                    iconSize: 30,
                    backgroundColor: Color(0xFFF7D38E),
                  ),
                  child: Icon(Icons.mobile_friendly, color: Colors.white),
                ),
              ],
            ),
            SizedBox(height: 20),
            Container(
              height: 570,
              width: double.infinity,
              margin: const EdgeInsets.only(left: 20, right: 20, top: 0, bottom: 0),
              padding: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                border: Border.all(color: Color(0xFFD9D9D9), width: 1.5),
                borderRadius: BorderRadius.circular(10),
              ),
              child: MapLocationPicker(
                apiKey: "AIzaSyBra6IL9KgvYrPwBLj4NCKu1Ly6OcTR1Oo",
                liteModeEnabled: true,
                currentLatLng: const LatLng(-33.857055, 151.214881),
                location: Location(lat: -33.857055, lng: 151.214881),
                radius: 100000,
                region: "au",
                onNext: (GeocodingResult? result) {
                  if (result != null) {
                    //widget.capsule["address"] = StreetAddress.fromGeocodingResult(result).addressLine!;
                    widget.capsule["address"] = result.formattedAddress!;
                    Navigator.push(context, MaterialPageRoute(builder: (context) => CreateScreenThree(capsule: widget.capsule)));
                  }
                },
              ),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFFD9D9D9),
              ),
              child: Text("Back"),
            ),
          ],
        )
    );
  }
}