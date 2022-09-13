import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:social_media_logins/social_media_logins.dart';

import '../../../widgets/custom_button.dart';
import '../../../widgets/maps/map.dart';
import 'home/select_search_new_journey.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Expanded(
            flex: 2,
            child: MapJourney(),
            // child: Container(
            //   color: Colors.green,
            //   child: Align(
            //     alignment: Alignment.topCenter, // and bottomLeft
            //     child: SafeArea(
            //       child: Center(
            //         child: Text('GMap'),
            //       ),
            //     ),
            //   ),
            // ),
          ),
          Expanded(
            child: SelectSearchJourney(),
          ),
        ],
      ),
    );
  }
}
