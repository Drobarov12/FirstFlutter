import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapView extends StatefulWidget {
  final double latitude;
  final double longitude;
  final String locationName;

  MapView(
      {required this.latitude,
      required this.longitude,
      required this.locationName});

  @override
  State<StatefulWidget> createState() => _MapState();
}

class _MapState extends State<MapView> {
  late GoogleMapController mapController;

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  @override
  Widget build(BuildContext context) {
    LatLng _center = LatLng(widget.latitude, widget.longitude);
    String location = widget.locationName;
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Maps Sample App'),
          leading: IconButton(
            icon: Icon(Icons.arrow_back), // Use any icon you prefer
            onPressed: () {
              // Navigate back to the previous page
              Navigator.of(context).pop();
            },
          ),
          backgroundColor: Colors.green[700],
        ),
        body: GoogleMap(
          onMapCreated: _onMapCreated,
          initialCameraPosition: CameraPosition(
            target: _center,
            zoom: 11.0,
          ),
          markers: {
            Marker(
              markerId: MarkerId(location),
              position: _center,
            ), // Marker
          }, // markers
        ),
      ),
    );
  }
}
