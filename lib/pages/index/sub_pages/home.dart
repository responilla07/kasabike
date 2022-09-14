import 'package:flutter/material.dart';

import '../../../data/global.dart';
import '../../../widgets/maps/map.dart';
import 'home/map_preview.dart';
import 'home/select_search_new_journey.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool _isRedirected = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Expanded(
            child: _isRedirected ? Container() : MapPreview(),
          ),
          SelectSearchJourney(
            callback: (bool redirected, var data) {
              if (data != null) {
                navigatorPush(
                  context: context,
                  name: 'MapJourney',
                  widget: MapJourney(
                    lat: data['lat'],
                    lng: data['lng'],
                    callback: (callbackData) {
                      setState(() => _isRedirected = callbackData);
                    },
                  ),
                );
              } else {
                setState(() => _isRedirected = redirected);
              }
            },
          ),
          SizedBox(height: 12),
        ],
      ),
    );
  }
}
