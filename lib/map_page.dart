import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapPage extends StatefulWidget {
  const MapPage({super.key});

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  LatLng? currentPosition;
  String message = "";
  bool isLoading = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initialMap();
  }

  void initialMap() async {
    isLoading = true;
    setState(() {});
    var serviceGPSActive = await Geolocator.isLocationServiceEnabled();
    if (!serviceGPSActive) {
      isLoading = false;
      message = "Your GPS inactive";
      setState(() {});
      Get.snackbar('Service not active', "Your GPS inactive");
    }
    var permissionStatus = await Geolocator.checkPermission();
    if (permissionStatus == LocationPermission.denied) {
      permissionStatus = await Geolocator.requestPermission();
      if (permissionStatus == LocationPermission.denied) {
        isLoading = false;
        message = "Please, active your permission location";
        setState(() {});
        Get.snackbar(
          'Permission Denied',
          "Please, active your permission location",
        );
      }
    }
    if (permissionStatus == LocationPermission.deniedForever) {
      isLoading = false;
      message = "Please, active your permission location";
      setState(() {});
      Get.snackbar(
        'Permission Denied',
        "Please, active your permission location",
      );
    }
    isLoading = false;
    message = "";
    var position = await Geolocator.getCurrentPosition();
  
    currentPosition = LatLng(position.latitude, position.longitude);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Maps")),
      body:
          isLoading
              ? Center(child: CircularProgressIndicator())
              : message != ""
              ? Center(child: Text(message))
              : GoogleMap(
                initialCameraPosition: CameraPosition(
                  target: currentPosition!,
                  //LatLng(-6.256549825202696, 106.61836639601938),
                  zoom: 16,
                ),
                polylines: {
                  Polyline(
                    polylineId: PolylineId('line-1'),
                    points: [
                      LatLng(-6.256549825202696, 106.61836639601938),
                      LatLng(-6.256288019009243, 106.62033849526695),
                      LatLng(-6.254500070746083, 106.62138557077418),
                      LatLng(-6.253127177742351, 106.62085882110257),
                    ],
                  ),
                },
                markers: {
                  Marker(
                    markerId: MarkerId('location-1'),
                    icon: BitmapDescriptor.defaultMarkerWithHue(
                      BitmapDescriptor.hueOrange,
                    ),
                    infoWindow: InfoWindow(title: 'Location 1'),
                    position: currentPosition! //LatLng(-6.256549825202696, 106.61836639601938),
                  ),
                  Marker(
                    markerId: MarkerId('location-2'),
                    icon: BitmapDescriptor.defaultMarkerWithHue(
                      BitmapDescriptor.hueGreen,
                    ),
                    infoWindow: InfoWindow(title: 'Location 2'),
                    position: LatLng(-6.256288019009243, 106.62033849526695),
                  ),
                  Marker(
                    markerId: MarkerId('location-3'),
                    icon: BitmapDescriptor.defaultMarkerWithHue(
                      BitmapDescriptor.hueRed,
                    ),
                    infoWindow: InfoWindow(title: 'Location 3'),
                    position: LatLng(-6.254500070746083, 106.62138557077418),
                  ),
                  Marker(
                    markerId: MarkerId('location-3'),
                    icon: BitmapDescriptor.defaultMarkerWithHue(
                      BitmapDescriptor.hueRed,
                    ),
                    infoWindow: InfoWindow(title: 'Location 3'),
                    position: LatLng(-6.254500070746083, 106.62138557077418),
                  ),
                  Marker(
                    markerId: MarkerId('location-4'),
                    icon: BitmapDescriptor.defaultMarkerWithHue(
                      BitmapDescriptor.hueMagenta,
                    ),
                    infoWindow: InfoWindow(title: 'Location 4'),
                    position: LatLng(-6.253127177742351, 106.62085882110257),
                  ),
                },
              ),
    );
  }
}
