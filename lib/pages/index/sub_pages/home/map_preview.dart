import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

import '../../../../widgets/maps/markers.dart';

class MapPreview extends StatefulWidget {
  @override
  _MapPreviewState createState() => _MapPreviewState();
}

class _MapPreviewState extends State<MapPreview> {
  LatLng _position = LatLng(14.1259379, 120.9909834);
  final _defaultZoom = 17.4746;
  Completer<GoogleMapController> _controller = Completer();
  Location _location;

  Set<Marker> _appMarkers = {};

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await AppMarkers.loadMarkerPinImages();
      await _getLocation();
      // await _getCurrentLocation();
    });
    super.initState();
  }

  @override
  void dispose() {
    _locationSubscription?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
        mapToolbarEnabled: false,
        zoomControlsEnabled: false,
        mapType: MapType.normal,
        initialCameraPosition: CameraPosition(
          target: _position,
          zoom: _defaultZoom,
        ),
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
        markers: _appMarkers,
      ),
    );
  }

  _setMarker({
    @required double lat,
    @required double lng,
  }) async {
    await AppMarkers.stores(
      stores: {
        'bahay': {
          'iconType': 'store',
          'name': 'me',
          'lat': lat,
          'lng': lng,
        }
      },
      animateToLocation: (double lat, double lng) async {},
    ).then((value) {
      _appMarkers = value;
      setState(() {});
    });
  }

  StreamSubscription<LocationData> _locationSubscription;
  _getLocation() async {
    _location = Location();
    await _location.hasPermission();
    await _location.requestService();
    await _location.requestPermission();
    await _location.serviceEnabled();

    await _location.changeSettings(
      accuracy: LocationAccuracy.high,
      interval: 5,
      distanceFilter: 5,
    );

    await _location.getLocation().then(
      (_location) async {
        await _setMarker(lat: _location.latitude, lng: _location.longitude);
        // setState(() {});
      },
    );

    _locationSubscription = await _location.onLocationChanged.listen(
      (newLoc) async {
        await _setMarker(lat: newLoc.latitude, lng: newLoc.longitude);
        await AppMarkers.reAnimateCamera(
          controller: _controller,
          lat: newLoc.latitude,
          lng: newLoc.longitude,
        );
        // setState(() {});
      },
    );
  }
}
