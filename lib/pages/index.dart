import 'package:flutter/material.dart';
import 'package:kasabike/pages/login.dart';

class IndexPage extends StatefulWidget {
  @override
  IndexPageState createState() => IndexPageState();
}

class IndexPageState extends State<IndexPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: TextButton(
          child: Text('Hello index'),
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => Login()));
          },
        ),
      ),
    );
  }
}
