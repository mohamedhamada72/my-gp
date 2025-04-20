/*
//كود كله اكسيبشن 
import 'dart:async';


import 'package:flutter/material.dart';

import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:scholar_chat/pages/clinicesModel.dart';
import 'package:url_launcher/url_launcher.dart';





class MapProvider extends ChangeNotifier {
  Location location = Location();//ايرور
  PermissionStatus status = PermissionStatus.denied;//ايرور
  LocationData? locationData;
  StreamSubscription<LocationData>? subscription;//ايرور
  bool isServiceEnabled = false;
  List<Marker> markers = [];
  Set<Marker> markersClinics = {};
  CameraPosition? myLocation;
  final Completer<GoogleMapController> controller =
      Completer<GoogleMapController>();
  Completer<GoogleMapController> controllerCompleter = Completer();
  int index = 0;
  ClinicesModel? clinicsData;

  //List<Clinics>? clinics;

  backCarrant() {
    markers.clear();
    if (locationData != null) {
      markers.add(Marker(
        markerId: MarkerId("MyLocation"),
        position: LatLng(locationData!.latitude!, locationData!.longitude!),
      ));

      CameraPosition newCameraPosition = CameraPosition(
        target: LatLng(locationData!.latitude!, locationData!.longitude!),
        zoom: 17,
      );
      controller.future.then((controller) {
        controller
            .animateCamera(CameraUpdate.newCameraPosition(newCameraPosition));
      });
    }
  }

  Future<void> initializeMap() async {
    await getUserLocation();
  }

  Future<bool> checkPermission() async {
    status = await location.hasPermission();
    if (status == PermissionStatus.denied) {
      status = await location.requestPermission();
    }
    return (status == PermissionStatus.granted ||
        status == PermissionStatus.grantedLimited);
  }

  Future<bool> checkService() async {
    isServiceEnabled = await location.serviceEnabled();
    if (!isServiceEnabled) {
      isServiceEnabled = await location.requestService();
    }
    return isServiceEnabled;
  }

  Future<void> getUserLocation() async {
    bool permission = await checkPermission();
    if (!permission) return;
    bool service = await checkService();
    if (!service) return;

    locationData = await location.getLocation();
    location.changeSettings(
      interval: 30000,
      distanceFilter: 2,
      accuracy: LocationAccuracy.high,//ايرور
    );
    subscription = location.onLocationChanged.listen((event) {
      locationData = event;
      markers.add(Marker(
        icon: BitmapDescriptor.defaultMarker,
        markerId: MarkerId("MyLocation"),
        position: LatLng(event.latitude!, event.longitude!),
        // updateUserLocationByTap(),
      ));
      myLocation = CameraPosition(
        target: LatLng(event.latitude!, event.longitude!),
        zoom: 17,
      );
      notifyListeners();
      print("lat: ${locationData?.latitude}, Long: ${locationData?.longitude}");
    });
  }

  void updateUserLocationByTap(LatLng position) {
    myLocation = CameraPosition(
      target: position,
      zoom: 17,
    );
    notifyListeners();
  }

  double getMarkerHue(Color color) {
    final hsvColor = HSVColor.fromColor(color);
    return hsvColor.hue;
  }

  Future<void> makePhoneCall(String phoneNumber) async {
    final Uri launchUri = Uri(
      scheme: 'tel',
      path: phoneNumber,
    );
    await launchUrl(launchUri);
  }

  @override
  void dispose() {
    super.dispose();
    subscription?.cancel();
  }
}
*/
/* 
//كود شغال تمام بس في اخطاء بسيطة
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:scholar_chat/pages/clinicesModel.dart';
import 'package:url_launcher/url_launcher.dart';

class MapProvider extends ChangeNotifier {
  Location location = Location();
  PermissionStatus status = PermissionStatus.denied;
  LocationData? locationData;
  StreamSubscription<LocationData>? subscription;
  bool isServiceEnabled = false;
  List<Marker> markers = [];
  Set<Marker> markersClinics = {};
  CameraPosition? myLocation;
  final Completer<GoogleMapController> controller = Completer<GoogleMapController>();
  Completer<GoogleMapController> controllerCompleter = Completer();
  int index = 0;
  ClinicesModel? clinicsData;

  // العودة إلى الموقع الحالي
  void backCarrant() {
    markers.clear();
    if (locationData != null) {
      markers.add(Marker(
        markerId: const MarkerId("MyLocation"),
        position: LatLng(locationData!.latitude!, locationData!.longitude!),
      ));

      CameraPosition newCameraPosition = CameraPosition(
        target: LatLng(locationData!.latitude!, locationData!.longitude!),
        zoom: 17,
      );
      controller.future.then((controller) {
        controller.animateCamera(CameraUpdate.newCameraPosition(newCameraPosition));
      });
    }
  }

  // تهيئة الخريطة
  Future<void> initializeMap() async {
    try {
      await getUserLocation();
    } catch (e) {
      print("Error initializing map: $e");
      // يمكنك إظهار رسالة خطأ للمستخدم هنا
    }
  }

  // التحقق من الأذونات
  Future<bool> checkPermission() async {
    try {
      status = await location.hasPermission();
      if (status == PermissionStatus.denied) {
        status = await location.requestPermission();
      }
      return (status == PermissionStatus.granted || status == PermissionStatus.grantedLimited);
    } catch (e) {
      print("Error checking permission: $e");
      return false;
    }
  }

  // التحقق من تفعيل خدمة الموقع
  Future<bool> checkService() async {
    try {
      isServiceEnabled = await location.serviceEnabled();
      if (!isServiceEnabled) {
        isServiceEnabled = await location.requestService();
      }
      return isServiceEnabled;
    } catch (e) {
      print("Error checking service: $e");
      return false;
    }
  }

  // الحصول على موقع المستخدم
  Future<void> getUserLocation() async {
    try {
      bool permission = await checkPermission();
      if (!permission) {
        print("Location permission denied");
        return;
      }

      bool service = await checkService();
      if (!service) {
        print("Location service not enabled");
        return;
      }

      locationData = await location.getLocation();
      location.changeSettings(
        interval: 30000,
        distanceFilter: 2,
        accuracy: LocationAccuracy.high,
      );

      subscription = location.onLocationChanged.listen((event) {//اكسيبشن
        locationData = event;
        markers.add(Marker(
          icon: BitmapDescriptor.defaultMarker,
          markerId: const MarkerId("MyLocation"),
          position: LatLng(event.latitude!, event.longitude!),
        ));
        myLocation = CameraPosition(
          target: LatLng(event.latitude!, event.longitude!),
          zoom: 17,
        );
        notifyListeners();
        print("lat: ${locationData?.latitude}, Long: ${locationData?.longitude}");
      }, onError: (e) {
        print("Error in location stream: $e");
      });
    } catch (e) {
      print("Error getting user location: $e");
    }
  }

  // تحديث موقع المستخدم عند النقر على الخريطة
  void updateUserLocationByTap(LatLng position) {
    try {
      myLocation = CameraPosition(
        target: position,
        zoom: 17,
      );
      notifyListeners();
    } catch (e) {
      print("Error updating location by tap: $e");
    }
  }

  // الحصول على لون العلامة
  double getMarkerHue(Color color) {
    try {
      final hsvColor = HSVColor.fromColor(color);
      return hsvColor.hue;
    } catch (e) {
      print("Error getting marker hue: $e");
      return 0.0;
    }
  }

  // إجراء مكالمة هاتفية
  Future<void> makePhoneCall(String phoneNumber) async {
    try {
      final Uri launchUri = Uri(
        scheme: 'tel',
        path: phoneNumber,
      );
      await launchUrl(launchUri);
    } catch (e) {
      print("Error making phone call: $e");
      // يمكنك إظهار رسالة خطأ للمستخدم هنا
    }
  }

  @override
  void dispose() {
    super.dispose();
    subscription?.cancel();
  }
}
*/
/*
//ده كود شغال 
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:scholar_chat/pages/clinicesModel.dart';
import 'package:url_launcher/url_launcher.dart';

class MapProvider extends ChangeNotifier {
  Location location = Location();
  PermissionStatus status = PermissionStatus.denied;
  LocationData? locationData;
  StreamSubscription<LocationData>? subscription;
  bool isServiceEnabled = false;
  List<Marker> markers = [];
  Set<Marker> markersClinics = {};
  CameraPosition? myLocation;
  final Completer<GoogleMapController> controller = Completer<GoogleMapController>();
  Completer<GoogleMapController> controllerCompleter = Completer();
  int index = 0;
  ClinicesModel? clinicsData;

  // العودة إلى الموقع الحالي
  void backCarrant() {
    markers.clear();
    if (locationData != null) {
      markers.add(Marker(
        markerId: const MarkerId("MyLocation"),
        position: LatLng(locationData!.latitude!, locationData!.longitude!),
      ));

      CameraPosition newCameraPosition = CameraPosition(
        target: LatLng(locationData!.latitude!, locationData!.longitude!),
        zoom: 17,
      );
      controller.future.then((controller) {
        controller.animateCamera(CameraUpdate.newCameraPosition(newCameraPosition));
      });
    }
  }

  // تهيئة الخريطة
  Future<void> initializeMap() async {
    try {
      await getUserLocation();
    } catch (e) {
      print("Error initializing map: $e");
    }
  }

  // التحقق من الأذونات
  Future<bool> checkPermission() async {
    try {
      status = await location.hasPermission();
      if (status == PermissionStatus.denied) {
        status = await location.requestPermission();
      }
      return (status == PermissionStatus.granted || status == PermissionStatus.grantedLimited);
    } catch (e) {
      print("Error checking permission: $e");
      return false;
    }
  }

  // التحقق من تفعيل خدمة الموقع
  Future<bool> checkService() async {
    try {
      isServiceEnabled = await location.serviceEnabled();
      if (!isServiceEnabled) {
        isServiceEnabled = await location.requestService();
      }
      return isServiceEnabled;
    } catch (e) {
      print("Error checking service: $e");
      return false;
    }
  }

  // الحصول على موقع المستخدم
  Future<void> getUserLocation() async {
    try {
      bool permission = await checkPermission();
      if (!permission) {
        print("Location permission denied");
        return;
      }

      bool service = await checkService();
      if (!service) {
        print("Location service not enabled");
        return;
      }

      locationData = await location.getLocation();
      location.changeSettings(
        interval: 30000,
        distanceFilter: 2,
        accuracy: LocationAccuracy.high,
      );

      // التأكد من إلغاء الاشتراك السابق قبل إنشاء اشتراك جديد
      subscription?.cancel();

      subscription = location.onLocationChanged.listen((event) {
        locationData = event;

        // تنظيف العلامات القديمة
        markers.clear();

        markers.add(Marker(
          icon: BitmapDescriptor.defaultMarker,
          markerId: const MarkerId("MyLocation"),
          position: LatLng(event.latitude!, event.longitude!),
        ));

        myLocation = CameraPosition(
          target: LatLng(event.latitude!, event.longitude!),
          zoom: 17,
        );

        notifyListeners();
        print("lat: \${locationData?.latitude}, Long: \${locationData?.longitude}");
      }, onError: (e) {
        print("Error in location stream: $e");
      });
    } catch (e) {
      print("Error getting user location: $e");
    }
  }

  // تحديث موقع المستخدم عند النقر على الخريطة
  void updateUserLocationByTap(LatLng position) {
    try {
      myLocation = CameraPosition(
        target: position,
        zoom: 17,
      );
      notifyListeners();
    } catch (e) {
      print("Error updating location by tap: $e");
    }
  }

  // الحصول على لون العلامة
  double getMarkerHue(Color color) {
    try {
      final hsvColor = HSVColor.fromColor(color);
      return hsvColor.hue;
    } catch (e) {
      print("Error getting marker hue: $e");
      return 0.0;
    }
  }

  // إجراء مكالمة هاتفية
  Future<void> makePhoneCall(String phoneNumber) async {
    try {
      final Uri launchUri = Uri(
        scheme: 'tel',
        path: phoneNumber,
      );
      await launchUrl(launchUri);
    } catch (e) {
      print("Error making phone call: $e");
    }
  }

  @override
  void dispose() {
    subscription?.cancel();
    super.dispose();
  }
}
*/

/*
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:scholar_chat/pages/clinicesModel.dart';
import 'package:url_launcher/url_launcher.dart';

class MapProvider extends ChangeNotifier {
  Location location = Location();
  PermissionStatus status = PermissionStatus.denied;
  LocationData? locationData;
  StreamSubscription<LocationData>? subscription;
  bool isServiceEnabled = false;
  List<Marker> markers = [];
  Set<Marker> markersClinics = {};
  CameraPosition? myLocation;
  Completer<GoogleMapController> controller = Completer<GoogleMapController>();
  int index = 0;
  ClinicesModel? clinicsData;
  bool disposed = false; // ✅ متغير لتتبع حالة التخلص من `MapProvider`

  // تنظيف البيانات القديمة
  void reset() {
    markers.clear();
    markersClinics.clear();
    myLocation = null;
    locationData = null;
    index = 0;

    Future.delayed(Duration(milliseconds: 100), () {
      if (!disposed) {
        notifyListeners();
      }
    });
  }

  // العودة إلى الموقع الحالي
  void backCarrant() {
    markers.clear();
    if (locationData != null) {
      markers.add(Marker(
        markerId: const MarkerId("MyLocation"),
        position: LatLng(locationData!.latitude!, locationData!.longitude!),
      ));

      CameraPosition newCameraPosition = CameraPosition(
        target: LatLng(locationData!.latitude!, locationData!.longitude!),
        zoom: 17,
      );
      controller.future.then((controller) {
        controller.animateCamera(CameraUpdate.newCameraPosition(newCameraPosition));
      });
    }
  }

  // تهيئة الخريطة
  Future<void> initializeMap() async {
    try {
      if (disposed) return; // ✅ تجنب استدعاء الوظيفة بعد `dispose()`
      await getUserLocation();
    } catch (e) {
      print("Error initializing map: $e");
    }
  }

  // التحقق من الأذونات
  Future<bool> checkPermission() async {
    try {
      status = await location.hasPermission();
      if (status == PermissionStatus.denied) {
        status = await location.requestPermission();
      }
      return (status == PermissionStatus.granted || status == PermissionStatus.grantedLimited);
    } catch (e) {
      print("Error checking permission: $e");
      return false;
    }
  }

  // التحقق من تفعيل خدمة الموقع
  Future<bool> checkService() async {
    try {
      isServiceEnabled = await location.serviceEnabled();
      if (!isServiceEnabled) {
        isServiceEnabled = await location.requestService();
      }
      return isServiceEnabled;
    } catch (e) {
      print("Error checking service: $e");
      return false;
    }
  }

  // الحصول على موقع المستخدم
  Future<void> getUserLocation() async {
    try {
      if (disposed) return; // ✅ التحقق من عدم التخلص من `MapProvider`

      bool permission = await checkPermission();
      if (!permission) {
        print("Location permission denied");
        return;
      }

      bool service = await checkService();
      if (!service) {
        print("Location service not enabled");
        return;
      }

      locationData = await location.getLocation();
      location.changeSettings(
        interval: 30000,
        distanceFilter: 2,
        accuracy: LocationAccuracy.high,
      );

      subscription?.cancel(); // ✅ التأكد من عدم وجود اشتراك سابق
      subscription = location.onLocationChanged.listen((event) {
        if (disposed) return; // ✅ تجنب الاستثناء بعد `dispose()`

        locationData = event;
        markers.clear();

        markers.add(Marker(
          icon: BitmapDescriptor.defaultMarker,
          markerId: const MarkerId("MyLocation"),
          position: LatLng(event.latitude!, event.longitude!),
        ));

        myLocation = CameraPosition(
          target: LatLng(event.latitude!, event.longitude!),
          zoom: 17,
        );

        if (!disposed) {
          notifyListeners();
        }
        print("lat: ${locationData?.latitude}, Long: ${locationData?.longitude}");
      }, onError: (e) {
        print("Error in location stream: $e");
      });
    } catch (e) {
      print("Error getting user location: $e");
    }
  }

  // تحديث موقع المستخدم عند النقر على الخريطة
  void updateUserLocationByTap(LatLng position) {
    try {
      if (disposed) return;

      myLocation = CameraPosition(
        target: position,
        zoom: 17,
      );

      if (!disposed) {
        notifyListeners();
      }
    } catch (e) {
      print("Error updating location by tap: $e");
    }
  }

  // الحصول على لون العلامة
  double getMarkerHue(Color color) {
    try {
      final hsvColor = HSVColor.fromColor(color);
      return hsvColor.hue;
    } catch (e) {
      print("Error getting marker hue: $e");
      return 0.0;
    }
  }

  // إجراء مكالمة هاتفية
  Future<void> makePhoneCall(String phoneNumber) async {
    try {
      final Uri launchUri = Uri(
        scheme: 'tel',
        path: phoneNumber,
      );
      await launchUrl(launchUri);
    } catch (e) {
      print("Error making phone call: $e");
    }
  }

  @override
  void dispose() {
    disposed = true; // ✅ تحديث الحالة عند التخلص من `MapProvider`
    subscription?.cancel();
    super.dispose();
  }
}

*/


import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:scholar_chat/pages/clinicesModel.dart';
import 'package:url_launcher/url_launcher.dart';

class MapProvider extends ChangeNotifier {
  Location location = Location();
  PermissionStatus status = PermissionStatus.denied;
  LocationData? locationData;
  StreamSubscription<LocationData>? subscription;
  bool isServiceEnabled = false;
  List<Marker> markers = [];
  Set<Marker> markersClinics = {};
  CameraPosition? myLocation;
  final Completer<GoogleMapController> controller = Completer<GoogleMapController>();
  int index = 0;
  ClinicesModel? clinicsData;

  // دالة reset لتنظيف البيانات القديمة
  void reset() {
    markers.clear();
    markersClinics.clear();
    myLocation = null;
    locationData = null;
    index = 0;
    notifyListeners();
  }

  // العودة إلى الموقع الحالي
  void backCarrant() {
    markers.clear();
    if (locationData != null) {
      markers.add(Marker(
        markerId: const MarkerId("MyLocation"),
        position: LatLng(locationData!.latitude!, locationData!.longitude!),
      ));

      CameraPosition newCameraPosition = CameraPosition(
        target: LatLng(locationData!.latitude!, locationData!.longitude!),
        zoom: 17,
      );
      controller.future.then((controller) {
        controller.animateCamera(CameraUpdate.newCameraPosition(newCameraPosition));
      });
    }
  }

  // تهيئة الخريطة
  Future<void> initializeMap() async {
    try {
      await getUserLocation();
    } catch (e) {
      print("Error initializing map: $e");
    }
  }

  // التحقق من الأذونات
  Future<bool> checkPermission() async {
    try {
      status = await location.hasPermission();
      if (status == PermissionStatus.denied) {
        status = await location.requestPermission();
      }
      return (status == PermissionStatus.granted || status == PermissionStatus.grantedLimited);
    } catch (e) {
      print("Error checking permission: $e");
      return false;
    }
  }

  // التحقق من تفعيل خدمة الموقع
  Future<bool> checkService() async {
    try {
      isServiceEnabled = await location.serviceEnabled();
      if (!isServiceEnabled) {
        isServiceEnabled = await location.requestService();
      }
      return isServiceEnabled;
    } catch (e) {
      print("Error checking service: $e");
      return false;
    }
  }

  // الحصول على موقع المستخدم
  Future<void> getUserLocation() async {
    try {
      bool permission = await checkPermission();
      if (!permission) {
        print("Location permission denied");
        return;
      }

      bool service = await checkService();
      if (!service) {
        print("Location service not enabled");
        return;
      }

      locationData = await location.getLocation();
      location.changeSettings(
        interval: 30000,
        distanceFilter: 2,
        accuracy: LocationAccuracy.high,
      );

      // التأكد من إلغاء الاشتراك السابق قبل إنشاء اشتراك جديد
      subscription?.cancel();

      subscription = location.onLocationChanged.listen((event) {
        locationData = event;

        // تنظيف العلامات القديمة
        markers.clear();

        markers.add(Marker(
          icon: BitmapDescriptor.defaultMarker,
          markerId: const MarkerId("MyLocation"),
          position: LatLng(event.latitude!, event.longitude!),
        ));

        myLocation = CameraPosition(
          target: LatLng(event.latitude!, event.longitude!),
          zoom: 17,
        );

        notifyListeners();
        print("lat: ${locationData?.latitude}, Long: ${locationData?.longitude}");
      }, onError: (e) {
        print("Error in location stream: $e");
      });
    } catch (e) {
      print("Error getting user location: $e");
    }
  }

  // تحديث موقع المستخدم عند النقر على الخريطة
  void updateUserLocationByTap(LatLng position) {
    try {
      myLocation = CameraPosition(
        target: position,
        zoom: 17,
      );
      notifyListeners();
    } catch (e) {
      print("Error updating location by tap: $e");
    }
  }

  // الحصول على لون العلامة
  double getMarkerHue(Color color) {
    try {
      final hsvColor = HSVColor.fromColor(color);
      return hsvColor.hue;
    } catch (e) {
      print("Error getting marker hue: $e");
      return 0.0;
    }
  }

  // إجراء مكالمة هاتفية
  Future<void> makePhoneCall(String phoneNumber) async {
    try {
      final Uri launchUri = Uri(
        scheme: 'tel',
        path: phoneNumber,
      );
      await launchUrl(launchUri);
    } catch (e) {
      print("Error making phone call: $e");
    }
  }

  @override
  void dispose() {
    subscription?.cancel(); // إلغاء الاشتراك
    super.dispose();
  }
}


