import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../data/global.dart';


class FormulaSTD {
  static double speed({
    @required double speed,
  }) {
    var data = (speed * 3600 / 1000).toStringAsFixed(2);
    return double.parse(data);
  }

  static double speed1({
    @required double distance,
    @required double time,
  }) {
    var data = distance / time;
    return data;
  }

  static String distance({
    @required LatLng origin,
    @required LatLng destination,
    @required int def,
  }) {
    var data = Maths.calculateDistance(
      origin.latitude,
      origin.longitude,
      destination.latitude,
      destination.longitude,
    );

    log(data.toString());
    data = (def.toDouble() *data ) / 1000;


    if (data > 1.0) {
      return data.toStringAsFixed(1) + ' km';
    } else if ((data / 1000) > 1.0) {
      return (data / 1000).toStringAsFixed(0) + ' m';
    } else {
      return '0 m';
    }
  }

  static double time({
    @required double distance,
    @required double speed,
  }) {
    var meters = distance / speed;
    var data = meters * 3600;

    return data; // millisecond
  }
}
