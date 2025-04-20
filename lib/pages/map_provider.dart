
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:url_launcher/url_launcher.dart';

class MapProvider extends ChangeNotifier {
  final Location location = Location();
  PermissionStatus permissionStatus = PermissionStatus.denied;
  LocationData? locationData;
  bool isServiceEnabled = false;
  StreamSubscription<LocationData>? _locationSubscription;

  final Set<Marker> markers = {};
  final Set<Marker> clinicMarkers = {};
  final Completer<GoogleMapController> controller = Completer();
  CameraPosition? myPosition;

  Future<void> initializeMap() async {
    await _checkPermissions();
    await _checkService();
    await _getUserLocation();
  }

  Future<void> _checkPermissions() async {
    permissionStatus = await location.hasPermission();
    if (permissionStatus == PermissionStatus.denied) {
      permissionStatus = await location.requestPermission();
    }
  }

  Future<void> _checkService() async {
    isServiceEnabled = await location.serviceEnabled();
    if (!isServiceEnabled) {
      isServiceEnabled = await location.requestService();
    }
  }

  Future<void> _getUserLocation() async {
    locationData = await location.getLocation();

    _locationSubscription?.cancel();
    _locationSubscription = location.onLocationChanged.listen((loc) {
      locationData = loc;
      myPosition = CameraPosition(
        target: LatLng(loc.latitude!, loc.longitude!),
        zoom: 17,
      );

      markers.clear();
      markers.add(
        Marker(
          markerId: const MarkerId('user_location'),
          position: LatLng(loc.latitude!, loc.longitude!),
        ),
      );

      notifyListeners();
    });
  }

  void addClinicsMarkers(List<Marker> newMarkers) {
    clinicMarkers.clear();
    clinicMarkers.addAll(newMarkers);
    notifyListeners();
  }

  Future<void> moveToCurrentLocation() async {
    if (locationData != null) {
      final controllerInstance = await controller.future;
      controllerInstance.animateCamera(
        CameraUpdate.newLatLngZoom(
          LatLng(locationData!.latitude!, locationData!.longitude!),
          17,
        ),
      );
    }
  }

  double getMarkerHue(Color color) {
    final hsvColor = HSVColor.fromColor(color);
    return hsvColor.hue;
  }

  Future<void> makePhoneCall(String phoneNumber) async {
    final Uri launchUri = Uri(scheme: 'tel', path: phoneNumber);
    await launchUrl(launchUri);
  }

  @override
  void dispose() {
    _locationSubscription?.cancel();
    super.dispose();
  }
}
