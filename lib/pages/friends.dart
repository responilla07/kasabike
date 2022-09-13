import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Friends extends StatefulWidget {
  // const Friends({super.key});

  @override
  State<Friends> createState() => _FriendsState();
}

class _FriendsState extends State<Friends> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Container(
          child: Center(
            child: Padding(
              padding: EdgeInsets.all(8),
              child: TextField(
                decoration: InputDecoration(
                    hintText: "Search for friends",
                    border: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    fillColor: Colors.white,
                    filled: true),
              ),
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            children: [_FriendsCard()],
          ),
        ),
      ),
    );
  }
}

//Friends card template
class _FriendsCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            Container(
                width: 150.0,
                height: 150.0,
                decoration: new BoxDecoration(
                    shape: BoxShape.circle,
                    image: new DecorationImage(
                        fit: BoxFit.cover,
                        //todo: replace image asset with network image
                        image: Image.asset('images/man.jpg').image))),
            SizedBox(
              height: 16,
            ),
            Text(
              "Jane Doe",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 8,
            ),
            Text("Calamba")
          ],
        ),
      ),
    );
  }
}
