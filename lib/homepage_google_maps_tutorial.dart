import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class AppGoogleMaps extends StatefulWidget {
  const AppGoogleMaps({Key key}) : super(key: key);

  @override
  _AppGoogleMapsState createState() => _AppGoogleMapsState();
}

class _AppGoogleMapsState extends State<AppGoogleMaps> {
  /*late*/ GoogleMapController mapController;

  final LatLng _cameraCenter = const LatLng(45.521563, -122.677433);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Google Maps Sample'),
          backgroundColor: Colors.green[400],
        ),
        body: GoogleMap(
          onMapCreated: _onMapCreated,
          initialCameraPosition: CameraPosition(
            target: _cameraCenter,
            zoom: 11,
          ),
        ),
      ),
    );
  }

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }
}
