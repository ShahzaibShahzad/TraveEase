import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class MapWidget extends StatefulWidget {
  const MapWidget({
    required this.position,
    required this.latitude,
    required this.longitude,
    this.scrollable = false,
    Key? key})
      : super(key: key);

  final CameraPosition position;
  final bool scrollable;
  final double latitude, longitude;

  @override
  State<MapWidget> createState() => _MapWidgetState();
}

class _MapWidgetState extends State<MapWidget> {
  Marker? centerMarker;

  late GoogleMapController mapController;

  @override
  initState() {
    super.initState();
    customMarker();
  }

  @override
  Widget build(BuildContext context) {
    return GoogleMap(
      onMapCreated: (controller) {
        setState(() {
          mapController = controller;
        });
      },
      initialCameraPosition: widget.position,
      scrollGesturesEnabled: widget.scrollable,
      zoomGesturesEnabled: true,
      zoomControlsEnabled: true,
      onTap: (lat) async {
        final Uri url = Uri.parse("https://www.google.com/maps/@${widget.latitude},${widget.longitude},15z");

        if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
          throw Exception('Could not launch $url');
        }
      },
      markers: {
        if (centerMarker != null) centerMarker!,
      },
      onCameraMove: _getCenter,
    );
  }

  void _getCenter(CameraPosition pos) async {
    setState(() {
      centerMarker = Marker(
        markerId: const MarkerId("center"),
        infoWindow: const InfoWindow(title: "Map "),
        position: pos.target,
        icon: mapMarker,
      );
    });
  }

  late BitmapDescriptor mapMarker;
  void customMarker() async {
    mapMarker = await BitmapDescriptor.fromAssetImage(
        const ImageConfiguration(), 'assets/icons/mapPin.png');
  }


  @override
  void dispose() {
    mapController.dispose();
    super.dispose();
  }
}
