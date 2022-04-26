// ignore_for_file: prefer_const_constructors

import 'dart:async';
import 'package:hangout/pub.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapScreen extends StatefulWidget {
  const MapScreen(this.pub, {Key? key}) : super(key: key);
  final Pub pub;

  @override
  State<MapScreen> createState() => MapScreenState();
}

class MapScreenState extends State<MapScreen> {
  Completer<GoogleMapController> _controller = Completer();
  TextEditingController _searchController = TextEditingController();
  late CameraPosition _kmall;
  late List<double> gl, ml;
  @override
  Widget build(BuildContext context) {
    // ignore: unnecessary_new
    Marker _kMallMarker = Marker(
      markerId: MarkerId('_kGooglePlex'),
      infoWindow: InfoWindow(title: 'Google Plex'),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
      position: LatLng(widget.pub.lat, widget.pub.long),
    );

    Polyline _kPolyline = Polyline(
      polylineId: PolylineId('_kPolyline'),
      points: [
        LatLng(13.764965717044777, 100.53827589806123),
        LatLng(widget.pub.lat, widget.pub.long),
      ],
      width: 5,
    );
    Marker _kGooglePlexMarker = Marker(
      markerId: MarkerId('_kGooglePlex'),
      infoWindow: InfoWindow(title: 'Google Plex'),
      icon: BitmapDescriptor.defaultMarker,
      position: LatLng(13.764965717044777, 100.53827589806123),
    );

    CameraPosition _kGooglePlex = CameraPosition(
      target: LatLng(13.764965717044777, 100.53827589806123),
      zoom: 14.4746,
    );

    _kmall = CameraPosition(
        bearing: 192.8334901395799,
        target: LatLng(widget.pub.lat, widget.pub.long),
        tilt: 59.440717697143555,
        zoom: 19.151926040649414);

    gl = [13.764965717044777, 100.53827589806123];
    ml = [widget.pub.lat, widget.pub.long];

    return Scaffold(
      appBar: AppBar(
        title: Text('Google Maps'),
        backgroundColor: Colors.orange,
      ),
      body: Column(
        children: [
          Expanded(
            child: GoogleMap(
              mapType: MapType.normal,
              markers: {
                _kGooglePlexMarker,
                _kMallMarker,
              },
              polylines: {
                _kPolyline,
              },
              initialCameraPosition: _kGooglePlex,
              onMapCreated: (GoogleMapController controller) {
                _controller.complete(controller);
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _goToPub,
        label: Text('Let Hangout!'),
        backgroundColor: Colors.orange,
        icon: Icon(Icons.directions_car),
      ),
    );
  }

  Future<void> _goToPub() async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(_kmall));
  }
}
