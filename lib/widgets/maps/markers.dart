import 'dart:async';
import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class AppMarkers {
  static Map<String, Uint8List> _markerIcon = {};
  static Future<Marker> _marker({
    @required String id,
    @required String name,
    @required String iconType,
    @required LatLng latLng,
    @required Function animateToLocation,
  }) async {
    return Marker(
      markerId: MarkerId(id),
      icon: BitmapDescriptor.fromBytes(_markerIcon[iconType]),
      position: latLng,
      infoWindow: InfoWindow(
        title: name,
        // onTap: () {
        //   log('asdsadas');

        // },
      ),
      onTap: () => animateToLocation(latLng.latitude, latLng.longitude),
    );
  }

  static Future<Uint8List> _getBytesFromAsset(String path, int width) async {
    ByteData data = await rootBundle.load(path);
    ui.Codec codec = await ui.instantiateImageCodec(data.buffer.asUint8List(),
        targetWidth: width);
    ui.FrameInfo fi = await codec.getNextFrame();
    return (await fi.image.toByteData(format: ui.ImageByteFormat.png))
        .buffer
        .asUint8List();
  }

  static void loadMarkerPinImages() async {
    //
    final Uint8List pnxMarkerIcon =
        await _getBytesFromAsset('image/map/my_location.png', 100);
    _markerIcon.putIfAbsent('store', () => pnxMarkerIcon);
    //
    final Uint8List fmMarkerIcon =
        await _getBytesFromAsset('image/map/my_location.png', 100);
    _markerIcon.putIfAbsent('hospital', () => fmMarkerIcon);
    //
    final Uint8List superLPGIcon =
        await _getBytesFromAsset('image/map/my_location.png', 100);
    _markerIcon.putIfAbsent('vulcanizing', () => superLPGIcon);
    //
    final Uint8List externalMerchantIcon =
        await _getBytesFromAsset('image/map/my_location.png', 100);
    _markerIcon.putIfAbsent('barangay', () => externalMerchantIcon);
  }

  static Future<Set<Marker>> stores({
    @required Map<String, dynamic> stores,
    @required Function animateToLocation,
  }) async {
    Set<Marker> markers = {};

    //
    stores.forEach((key, store) async {
      await _marker(
        id: key,
        name: store['name'],
        iconType: store['iconType'],
        latLng: LatLng(store['lat'], store['lng']),
        animateToLocation: (double lat, double lng) =>
            animateToLocation(lat, lng),
      ).then((value) => markers.add(value));
    });

    return markers;
  }

  static void reAnimateCamera({
    @required double lat,
    @required double lng,
    Map<String, dynamic> boundsNE,
    Map<String, dynamic> boundsSW,
    @required Completer<GoogleMapController> controller,
    bool singleOnly = true,
  }) async {
    Completer<GoogleMapController> ctrlr = controller;
    GoogleMapController mapController = await ctrlr.future;

    mapController.animateCamera(CameraUpdate.newCameraPosition(
      CameraPosition(
        target: LatLng(lat, lng),
        zoom: singleOnly ? 33 : 25,
      ),
    ));

    if (!singleOnly) {
      mapController.animateCamera(
        CameraUpdate.newLatLngBounds(
          LatLngBounds(
            northeast: LatLng(boundsNE['lat'], boundsNE['lng']),
            southwest: LatLng(boundsSW['lat'], boundsSW['lng']),
          ),
          25,
        ),
      );
    }
  }
}
