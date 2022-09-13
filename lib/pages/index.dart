import 'package:flutter/material.dart';
import 'package:kasabike/pages/friends.dart';
import 'package:kasabike/pages/login.dart';

class IndexPage extends StatefulWidget {
  @override
  IndexPageState createState() => IndexPageState();
}

class IndexPageState extends State<IndexPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        TextButton(
          child: Text('Login page'),
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => Login()));
          },
        ),
        TextButton(
          child: Text('Friends page'),
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => Friends()));
          },
        ),
      ]),
    );
  }
}
