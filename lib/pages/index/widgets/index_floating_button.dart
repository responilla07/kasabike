import 'package:flutter/material.dart';

class FloatingButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        //
      },
      tooltip: 'Journey',
      child: Container(
        padding: EdgeInsets.all(14.0),
        child: Icon(
          Icons.directions_bike_sharp,
          color: Colors.grey
        ),
      ),
      elevation: 2.0,
      backgroundColor: Colors.white,
    );
  }
}
