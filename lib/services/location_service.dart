import 'dart:developer';

import 'package:geocoder2/geocoder2.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:flutter/material.dart';
// import 'package:geocoder/geocoder.dart';
// import 'package:geocoder/services/base.dart';

import "package:http/http.dart" as http;
import "dart:convert";
import 'dart:async';

class LocationService {
  static final String _key = 'AIzaSyB-vS5sDXQd73WsZueivavyGIgTERv6c5w';
  static final String _mapAPI = 'https://maps.googleapis.com/maps/api';

  // static Geocoding _geocoding = Geocoder.google(_key);

  static Future<List<dynamic>> getLocations({
    @required String search,
    String type = '',
  }) async {
    final input = 'input=$search';
    final types = 'types=$type';
    final language = 'language=';
    final components = 'components=country:ph';
    String sessionToken = 'sessiontoken=1';
    final key = 'key=$_key';

    final q = '$input&$types&$language&$components&$sessionToken&$key';
    String url = '$_mapAPI/place/autocomplete/json?$q';

    var res = await http.get(Uri.parse(url));
    var data = jsonDecode(res.body)['predictions'] as List;

    return data
        .map(
          (e) => {
            'description': e['description'],
            'place_id': e['place_id'],
          },
        )
        .toList();
  }

  static Future<Map<String, dynamic>> getDirections({
    String destinationStart,
    String desitnationEnd,
  }) async {
    var params = {
      "origin": "$destinationStart",
      "destination": "$desitnationEnd",
      // "mode": 'transit',
      "avoidHighways": 'true',
      "avoidFerries": 'true',
      "avoidTolls": 'true',
      "key": _key
    };

    Uri uri = Uri.https(
      "maps.googleapis.com",
      "maps/api/directions/json",
      params,
    );

    var res = await http.get(uri);
    var data = jsonDecode(res.body);

    log(jsonEncode(data));

    if (data['routes'].length > 0) {
      return {
        "bounds_ne": data['routes'][0]['bounds']['northeast'],
        "bounds_sw": data['routes'][0]['bounds']['southwest'],
        "distance": data['routes'][0]['legs'][0]['distance'],
        "duration": data['routes'][0]['legs'][0]['duration'],
        "location_start": data['routes'][0]['legs'][0]['start_location'],
        "location_end": data['routes'][0]['legs'][0]['end_location'],
        "polyline": data['routes'][0]['overview_polyline']['points'],
        "polyline_decoded": PolylinePoints().decodePolyline(
          data['routes'][0]['overview_polyline']['points'],
        ),
      };
    } else {
      return null;
    }
  }

  static Set<Polyline> setPolylines({
    @required List<PointLatLng> points,
  }) {
    Set<Polyline> polylines = Set<Polyline>();
    PolylineId id = PolylineId('poly');

    polylines.add(Polyline(
      polylineId: id,
      color: Colors.blue,
      points: points
          .map((point) => LatLng(point.latitude, point.longitude))
          .toList(),
      width: 3,
    ));

    return polylines;
  }

  static Future<dynamic> getPlaceDetails(String placeId) async {
    var component = 'components=country:ph';
    var placeID = 'place_id=$placeId';
    
    var url = '$_mapAPI/place/details/json?$placeID&key=$_key&$component';
    var response = await http.get(Uri.parse(url));

    var latlng = jsonDecode(response.body)['result']['geometry']['location'];

    return latlng;
  }

  // static Future<Map<PolylineId, Polyline>> createPolylines({
  //   @required double startLatitude,
  //   @required double startLongitude,
  //   @required double destinationLatitude,
  //   @required double destinationLongitude,
  // }) async {
  //   PolylinePoints polylinePoints = PolylinePoints();
  //   List<LatLng> polylineCoordinates = [];

  //   // Generating the list of coordinates to be used for
  //   PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
  //     _key, // Google Maps API Key
  //     PointLatLng(startLatitude, startLongitude),
  //     PointLatLng(destinationLatitude, destinationLongitude),
  //     travelMode: TravelMode.transit,
  //   );

  //   log(result.points.toString());

  //   // Adding the coordinates to the list
  //   if (result.points.isNotEmpty) {
  //     result.points.forEach((PointLatLng point) {
  //       polylineCoordinates.add(LatLng(point.latitude, point.longitude));
  //     });
  //   }

  //   PolylineId id = PolylineId('poly');
  //   Polyline polyline = Polyline(
  //     polylineId: id,
  //     color: Colors.blue,
  //     points: polylineCoordinates,
  //     width: 3,
  //   );

  //   Map<PolylineId, Polyline> polylines = {};
  //   polylines[id] = polyline;

  //   // log(jsonEncode(polyline));

  //   return polylines;
  // }
}
