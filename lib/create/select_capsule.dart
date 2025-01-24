import 'package:flutter/material.dart';

class SelectCapsuleScreen extends StatefulWidget {
  const SelectCapsuleScreen({super.key});

  @override
  State<SelectCapsuleScreen> createState() => _SelectCapsuleScreenState();
}

class _SelectCapsuleScreenState extends State<SelectCapsuleScreen> {
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
                    backgroundColor: Color(0xFFBFA36F),
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
                    backgroundColor: Color(0xFFF7D38E),
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
            SizedBox(height: 25),
            Text("Select one capsule"),
            Container(
              height: 570,
              width: double.infinity,
              margin: const EdgeInsets.only(left: 20, right: 20, top: 5),
              padding: const EdgeInsets.all(50),
              decoration: BoxDecoration(
                border: Border.all(color: Color(0xFFD9D9D9), width: 1.5),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {Navigator.pop(context, "rabbit.png");},
                        child: Image(image: AssetImage("assets/rabbit_big.png"), width: 120)
                      ),
                      GestureDetector(
                          onTap: () {Navigator.pop(context, "apple.png");},
                          child: Image(image: AssetImage("assets/apple_big.png"), width: 120)
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                          onTap: () {Navigator.pop(context, "family.png");},
                          child: Image(image: AssetImage("assets/family_big.png"), width: 120)
                      ),
                      GestureDetector(
                          onTap: () {Navigator.pop(context, "heartsmiley.png");},
                          child: Image(image: AssetImage("assets/heartsmiley_big.png"), width: 120)
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                          onTap: () {Navigator.pop(context, "hourglass.png");},
                          child: Image(image: AssetImage("assets/hourglass_big.png"), width: 120)
                      ),
                      GestureDetector(
                          onTap: () {Navigator.pop(context, "smiley.png");},
                          child: Image(image: AssetImage("assets/smiley_big.png"), width: 120)
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        )
    );
  }
}