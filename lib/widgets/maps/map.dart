import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

import '../../formatter/speed_time_distance.dart';
import '../../services/location_service.dart';
import '../dialog_widgets.dart';
import 'markers.dart';

class MapJourney extends StatefulWidget {
  final bool hasListener;
  final double lat;
  final double lng;
  final Function callback;
  const MapJourney({
    this.hasListener = false,
    this.lat,
    this.lng,
    this.callback,
  });
  @override
  State<MapJourney> createState() => _MapJourneyState();
}

class _MapJourneyState extends State<MapJourney> {
  final defaultZoom = 17.4746;
  // LatLng _position = LatLng(14.2096749, 121.1281971);
  LatLng _position = LatLng(14.1259379, 120.9909834);
  LatLng _journeyLocation;
  Completer<GoogleMapController> _controller = Completer();
  Set<Marker> _appMarkers = {};

  Set<Polyline> _polylines = Set<Polyline>();

  bool _isSingleView = true;
  bool _journeyStarted = false;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await AppMarkers.loadMarkerPinImages();
      if (widget.lat != null) _journeyLocation = LatLng(widget.lat, widget.lng);
      await _getCurrentLocation();
    });
    super.initState();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      if (widget.callback != null) {
        widget.callback(false);
      }
    });
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
          zoom: defaultZoom,
        ),
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
        markers: _appMarkers,
        polylines: Set<Polyline>.of(_polylines),
      ),
      floatingActionButton: _floatingButton(),
    );
  }

  // var _time = 0.0;
  // var _distance = "0";
  // var _speed = 0.0;

  Widget _floatingButton() {
    // if (_currentLocation != null) {
    //   _speed = FormulaSTD.speed(speed: _currentLocation.speed);
    // }
    // _compute();

    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          GestureDetector(
            onTap: () async {
              _showReportLocation();
            },
            child: Icon(
              Icons.report,
              size: 60,
              color: Colors.blue[400],
            ),
          ),
          SizedBox(height: 16),
          GestureDetector(
            onTap: () async {
              if (_journeyStarted && _data != null && _isSingleView) {
                _isSingleView = false;
                _setMarkers(_data);
              } else {
                _isSingleView = true;
                setState(() {});
                await AppMarkers.reAnimateCamera(
                  controller: _controller,
                  lat: _currentLocation.latitude,
                  lng: _currentLocation.longitude,
                );
              }
              setState(() {});
            },
            child: Icon(
              Icons.assistant_navigation,
              size: 50,
              color: Colors.blue[400],
            ),
          ),
        ],
      ),
    );
  }

  // _compute() async {
  //   if (_data != null) {
  //     _time = FormulaSTD.time(
  //       distance: _data['distance']['value'].toDouble(),
  //       speed: _speed <= 0.0 ? 20.8 : _speed,
  //     );

  //     _distance = FormulaSTD.distance(
  //       def: _data['distance']['value'],
  //       origin: LatLng(
  //         _currentLocation.latitude,
  //         _currentLocation.longitude,
  //       ),
  //       destination: LatLng(
  //         _data['location_end']['lat'],
  //         _data['location_end']['lng'],
  //       ),
  //     );

  //     if (_currentLocation == null) {
  //       _speed = FormulaSTD.speed1(
  //         distance: _data['distance']['value'].toDouble(),
  //         time: _time,
  //       );
  //     }
  //     // if (_isSingleView) {
  //     //   _setMarkers();
  //     // }
  //   }
  // }

  Map<String, dynamic> _data;
  _setDirections({
    @required LatLng myLocation,
    @required LatLng myDestination,
  }) async {
    _data = await LocationService.getDirections(
      destinationStart: '${myLocation.latitude},${myLocation.longitude}',
      desitnationEnd: '${myDestination.latitude},${myDestination.longitude}',
    );
    if (_data != null) {
      _polylines = await LocationService.setPolylines(
        points: _data['polyline_decoded'],
      );
      await _setMarkers(_data);
      setState(() {});
    }
  }

  _setMarkers(_data) async {
    await AppMarkers.stores(
      stores: {
        'bahay': {
          'iconType': 'store',
          'name': 'me',
          'lat': _currentLocation.latitude,
          'lng': _currentLocation.longitude,
        },
        'sm': {
          'iconType': 'hospital',
          'name': 'asdsa',
          'lat': _data['location_end']['lat'],
          'lng': _data['location_end']['lng'],
        },
      },
      animateToLocation: (double lat, double lng) async {
        _isSingleView = true;
        setState(() {});
        await AppMarkers.reAnimateCamera(
          controller: _controller,
          lat: lat,
          lng: lng,
        );
      },
    ).then((value) {
      _appMarkers = value;
      setState(() {});
    });

    await AppMarkers.reAnimateCamera(
      lat: _data['location_start']['lat'],
      lng: _data['location_start']['lng'],
      boundsNE: _data['bounds_ne'],
      boundsSW: _data['bounds_sw'],
      controller: _controller,
      singleOnly: false,
    );
  }

  LocationData _currentLocation;
  Location _location;
  StreamSubscription<LocationData> _locationSubscription;
  Future<LocationData> _getCurrentLocation() async {
    _locationSubscription?.cancel();
    _location = Location();

    _change() async {
      await AppMarkers.reAnimateCamera(
        controller: _controller,
        lat: _currentLocation.latitude,
        lng: _currentLocation.longitude,
      );
      await AppMarkers.stores(
        stores: {
          'bahay': {
            'iconType': 'store',
            'name': 'me',
            'lat': _currentLocation.latitude,
            'lng': _currentLocation.longitude,
          }
        },
        animateToLocation: (double lat, double lng) async {
          await AppMarkers.reAnimateCamera(
            controller: _controller,
            lat: lat,
            lng: lng,
          );
        },
      ).then((value) {
        _appMarkers = value;
        setState(() {});
      });
    }

    await _location.changeSettings(
      accuracy: LocationAccuracy.high,
      interval: 5,
      distanceFilter: 5,
    );

    await _location.getLocation().then(
      (_location) async {
        _currentLocation = _location;
        _change();

        if (_journeyLocation != null) {
          await _setDirections(
            myLocation: LatLng(
              _currentLocation.latitude,
              _currentLocation.longitude,
            ),
            myDestination: LatLng(
              _journeyLocation.latitude,
              _journeyLocation.longitude,
            ),
          );
        } else {
          _showSelectCreateJourney();
        }
        if (_data != null) _journeyStarted = true;
        setState(() {});
      },
    );

    _locationSubscription = _location.onLocationChanged.listen(
      (newLoc) async {
        _currentLocation = newLoc;
        if (_isSingleView) {
          _change();
        } else {
          try {
            await _setMarkers(_data);
            setState(() {});
          } catch (e) {}
        }
      },
    );

    return _currentLocation;
  }

  _showSelectCreateJourney() {
    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) => WillPopScope(
        onWillPop: () async {
          Navigator.pop(context);
          Navigator.pop(context);
          return true;
        },
        child: ShowSearchCreateJourney(
          callback: (var data) async {
            _journeyLocation = LatLng(data['lat'], data['lng']);
            setState(() {});
            await _setDirections(
              myLocation: LatLng(
                _currentLocation.latitude,
                _currentLocation.longitude,
              ),
              myDestination: LatLng(
                _journeyLocation.latitude,
                _journeyLocation.longitude,
              ),
            );
            if (_data != null) _journeyStarted = true;
            setState(() {});
          },
        ),
      ),
    );
  }

  _showReportLocation() {
    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) => WillPopScope(
        onWillPop: () async {
          return true;
        },
        child: ShowReportLocation(
          callback: (var data) async {},
        ),
      ),
    );
  }
}
