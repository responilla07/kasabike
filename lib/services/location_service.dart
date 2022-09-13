import 'dart:developer';

import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';

import 'package:flutter/material.dart';
import "package:http/http.dart" as http;
import "dart:convert";
import 'dart:async';

class LocationService {
  static final String _key = 'AIzaSyB-vS5sDXQd73WsZueivavyGIgTERv6c5w';
  static final String _mapAPI = 'https://maps.googleapis.com/maps/api';

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

  // static getPlacesId(
  //   String query,
  // ) async {
  //   final input = 'input=$query';
  //   final inputType = 'inputtype=textquery';
  //   final key = 'key=$_key';

  //   final q = '$input&$inputType&$key';
  //   final String url = "$_mapAPI/place/findplacefromtext/json?$q";

  //   var res = await http.get(Uri.parse(url));
  //   var data = jsonDecode(res.body);

  //   log('url: $url');
  //   log('getPlacesId: $data');
  // }

  static Future<Map<String, dynamic>> getDirections({
    String destinationStart,
    String desitnationEnd,
  }) async {
    // var params = {
    //   "origin": "$destinationStart",
    //   "destination": "$desitnationEnd",
    //   "mode": 'transit',
    //   "avoidHighways": 'true',
    //   "avoidFerries": 'true',
    //   "avoidTolls": 'true',
    //   "key": _key
    // };

    // Uri uri = Uri.https(
    //   "maps.googleapis.com",
    //   "maps/api/directions/json",
    //   params,
    // );

    // var res = await http.get(uri);
    // var data = jsonDecode(res.body);
    
    // TODO testing
    var data = jsonDecode(jsonEncode({
      "geocoded_waypoints": [
        {
          "geocoder_status": "OK",
          "place_id": "ChIJexNqBaljvTMR3wbUTfVmiMs",
          "types": ["premise"]
        },
        {
          "geocoder_status": "OK",
          "place_id": "ChIJ5UClTM9jvTMR4xTZ4qGjDrI",
          "types": ["establishment", "point_of_interest", "shopping_mall"]
        }
      ],
      "routes": [
        {
          "bounds": {
            "northeast": {"lat": 14.218302, "lng": 121.1546619},
            "southwest": {"lat": 14.2041909, "lng": 121.1279578}
          },
          "copyrights": "Map data ©2022",
          "legs": [
            {
              "distance": {"text": "4.3 km", "value": 4293},
              "duration": {"text": "53 mins", "value": 3180},
              "end_address":
                  "6533+PHR, Real Rd, Real, Calamba, 4027 Laguna, Philippines",
              "end_location": {"lat": 14.2041909, "lng": 121.1540562},
              "start_address": "646H+3FP, Calamba, 4027 Laguna, Philippines",
              "start_location": {"lat": 14.2100145, "lng": 121.1283785},
              "steps": [
                {
                  "distance": {"text": "4.3 km", "value": 4293},
                  "duration": {"text": "53 mins", "value": 3180},
                  "end_location": {"lat": 14.2041909, "lng": 121.1540562},
                  "html_instructions":
                      "Walk to 6533+PHR, Real Rd, Real, Calamba, 4027 Laguna, Philippines",
                  "polyline": {
                    "points":
                        "qkvuAk{hbVYJQDA?[FE@C@MBI@MBKBM@A@M@S@O@w@BgABGHIFI@M@AWEkB?K@kA?i@@S@a@BiBB}A@KDsC?mBAa@?YAIGO?IEyAEe@[mDE]Ma@Om@O[KWMQg@y@w@mAq@kAIOSYs@gAgAiBk@}@_@k@S[W_@[a@a@a@u@o@q@k@qAiAiBeB}AwAoC_CwAuAgA}@`@uAj@{AFYt@qB|BoG~@iChA_DvCiIl@cBXu@?CZ}@^aATm@Vu@x@{BRk@HSFML[R_@NYRY^_@n@m@tBqBxE}D~AuAdB{AZSVQRKRILCVG`@I~@KpDWbDWxBYLCtACvAG~@GjAGZ?J?\\?h@Jb@JXH`@LJJNLh@d@HF"
                  },
                  "start_location": {"lat": 14.2100145, "lng": 121.1283785},
                  "steps": [
                    {
                      "distance": {"text": "0.2 km", "value": 186},
                      "duration": {"text": "2 mins", "value": 130},
                      "end_location": {"lat": 14.2116503, "lng": 121.1280704},
                      "html_instructions":
                          "Head \u003cb\u003enorthwest\u003c/b\u003e toward \u003cb\u003eDoctora St\u003c/b\u003e",
                      "polyline": {
                        "points":
                            "qkvuAk{hbVYJQDA?[FE@C@MBI@MBKBM@A@M@S@O@w@BgAB"
                      },
                      "start_location": {"lat": 14.2100145, "lng": 121.1283785},
                      "travel_mode": "WALKING"
                    },
                    {
                      "distance": {"text": "28 m", "value": 28},
                      "duration": {"text": "1 min", "value": 20},
                      "end_location": {"lat": 14.2118636, "lng": 121.1279578},
                      "html_instructions":
                          "Slight \u003cb\u003eleft\u003c/b\u003e onto \u003cb\u003eDoctora St\u003c/b\u003e",
                      "maneuver": "turn-slight-left",
                      "polyline": {"points": "yuvuAmyhbVGHIFI@M@"},
                      "start_location": {"lat": 14.2116503, "lng": 121.1280704},
                      "travel_mode": "WALKING"
                    },
                    {
                      "distance": {"text": "1.7 km", "value": 1711},
                      "duration": {"text": "21 mins", "value": 1251},
                      "end_location": {"lat": 14.218302, "lng": 121.1412728},
                      "html_instructions":
                          "Turn \u003cb\u003eright\u003c/b\u003e onto \u003cb\u003eMayapa Rd\u003c/b\u003e/\u003cwbr/\u003e\u003cb\u003eMayapa-Canlubang Cadre Rd\u003c/b\u003e\u003cdiv style=\"font-size:0.9em\"\u003eContinue to follow Mayapa-Canlubang Cadre Rd\u003c/div\u003e",
                      "maneuver": "turn-right",
                      "polyline": {
                        "points":
                            "cwvuAwxhbVAWEkB?K@kA?i@@S@a@BiBB}A@KDsC?mBAa@?YAIGO?IEyAEe@[mDE]Ma@Om@O[KWMQg@y@w@mAq@kAIOSYs@gAgAiBk@}@_@k@S[W_@[a@a@a@u@o@q@k@qAiAiBeB}AwAoC_CwAuAgA}@"
                      },
                      "start_location": {"lat": 14.2118636, "lng": 121.1279578},
                      "travel_mode": "WALKING"
                    },
                    {
                      "distance": {"text": "2.2 km", "value": 2228},
                      "duration": {"text": "28 mins", "value": 1655},
                      "end_location": {"lat": 14.2052754, "lng": 121.154661},
                      "html_instructions":
                          "Turn \u003cb\u003eright\u003c/b\u003e after BDO (on the right)\u003cdiv style=\"font-size:0.9em\"\u003ePass by Calamba Doctor's College (on the right in 130&nbsp;m)\u003c/div\u003e",
                      "maneuver": "turn-right",
                      "polyline": {
                        "points":
                            "k_xuA}kkbV`@uAj@{AFYt@qB|BoG~@iChA_DvCiIl@cBXu@?CZ}@^aATm@Vu@x@{BRk@HSFML[R_@NYRY^_@n@m@tBqBxE}D~AuAdB{AZSVQRKRILCVG`@I~@KpDWbDWxBYLCtACvAG~@GjAGZ?J?\\?"
                      },
                      "start_location": {"lat": 14.218302, "lng": 121.1412728},
                      "travel_mode": "WALKING"
                    },
                    {
                      "distance": {"text": "0.1 km", "value": 140},
                      "duration": {"text": "2 mins", "value": 124},
                      "end_location": {"lat": 14.2041909, "lng": 121.1540562},
                      "html_instructions":
                          "Slight \u003cb\u003eright\u003c/b\u003e onto \u003cb\u003eReal Rd\u003c/b\u003e\u003cdiv style=\"font-size:0.9em\"\u003eDestination will be on the left\u003c/div\u003e",
                      "maneuver": "turn-slight-right",
                      "polyline": {"points": "_nuuAs_nbVh@Jb@JXH`@LJJNLh@d@HF"},
                      "start_location": {"lat": 14.2052754, "lng": 121.154661},
                      "travel_mode": "WALKING"
                    }
                  ],
                  "travel_mode": "WALKING"
                }
              ],
              "traffic_speed_entry": [],
              "via_waypoint": []
            }
          ],
          "overview_polyline": {
            "points":
                "qkvuAk{hbViAXa@Hi@JiBHgABGHSHM@AWEwBDkDNgJCsDGYK_Ca@kE]oA[s@u@kAiByC]i@gE{Gk@{@}@cAcHkGmFwE_DsClAqDFYt@qB|DyK`FiNbB{EfCaHr@iBb@y@r@y@dD_DxHsG`CoBj@]zA_@pFc@bDWxBYLCtACvCOfBGh@?lAVz@VnAfA"
          },
          "summary": "Mayapa-Canlubang Cadre Rd and Manila S Rd/AH26",
          "warnings": [
            "Walking directions are in beta. Use caution – This route may be missing sidewalks or pedestrian paths."
          ],
          "waypoint_order": []
        }
      ],
      "status": "OK"
    }));


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
