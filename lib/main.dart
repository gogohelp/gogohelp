import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'src/stations.dart' as gostations;

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final Map<String, Marker> _markers = {};
  Future<void> _onMapCreated(GoogleMapController controller) async {
    final stations = await gostations.getStations();
    setState(() {
      _markers.clear();
      for (final station in stations) {
        final marker = Marker(
          markerId: MarkerId(json.decode(station.LocName)['List'][1]['Value']),
          position: LatLng(station.Latitude, station.Longitude),
          infoWindow: InfoWindow(
            title: json.decode(station.LocName)['List'][1]['Value'],
            snippet: json.decode(station.Address)['List'][1]['Value'],
          ),
        );
        _markers[json.decode(station.LocName)['List'][1]['Value']] = marker;
      }
    });
  }

  @override
  Widget build(BuildContext context) => MaterialApp(
        home: Scaffold(
          appBar: AppBar(
            title: const Text('GoStations'),
            backgroundColor: Colors.green[700],
          ),
          body: GoogleMap(
            onMapCreated: _onMapCreated,
            initialCameraPosition: CameraPosition(
              target: const LatLng(25.0339206, 121.5636985),
              zoom: 16,
            ),
            markers: _markers.values.toSet(),
          ),
        ),
      );
}
