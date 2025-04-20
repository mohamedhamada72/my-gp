/*
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';

class ClinicMapScreen extends StatefulWidget {
  @override
  _ClinicMapScreenState createState() => _ClinicMapScreenState();
}

class _ClinicMapScreenState extends State<ClinicMapScreen> {
  late GoogleMapController mapController;
  LatLng? currentLocation;
  Set<Marker> markers = {};

  @override
  void initState() {
    super.initState();
    _getCurrentLocation(); // الحصول على الموقع الحالي عند فتح الشاشة
  }

  // دالة للحصول على الموقع الحالي للمستخدم
  Future<void> _getCurrentLocation() async {
    try {
      // التحقق من تفعيل خدمة الموقع
      bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
      if (!serviceEnabled) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Location service is not enabled. Please enable it.")),
        );
        return;
      }

      // التحقق من الأذونات
      LocationPermission permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("Access to the site has been denied.")),
          );
          return;
        }
      }

      // الحصول على الموقع الحالي
      Position position = await Geolocator.getCurrentPosition();
      setState(() {
        currentLocation = LatLng(position.latitude, position.longitude);
        _addMarkers(); // إضافة علامات للعيادات القريبة
      });
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("An error occurred while trying to access the site: $e")),
      );
    }
  }

  // دالة لإضافة علامات للعيادات القريبة
  void _addMarkers() {
    if (currentLocation != null) {
      // قائمة العيادات (يمكن استبدالها ببيانات حقيقية من API)
      List<LatLng> clinics = [
        LatLng(currentLocation!.latitude + 0.01, currentLocation!.longitude + 0.01),
        LatLng(currentLocation!.latitude - 0.01, currentLocation!.longitude - 0.01),
      ];

      for (var clinic in clinics) {
        markers.add(
          Marker(
            markerId: MarkerId(clinic.toString()),
            position: clinic,
            infoWindow: InfoWindow(title: "Dermatology Clinic "),
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(" To contact the nearest doctor"),
        backgroundColor: Colors.blueGrey,
      ),
      body: currentLocation == null
          ? Center(child: CircularProgressIndicator()) // عرض دائرة تحميل إذا لم يتم تحديد الموقع بعد
          : GoogleMap(
              onMapCreated: (controller) {
                setState(() {
                  mapController = controller;
                });
              },
              initialCameraPosition: CameraPosition(
                target: currentLocation!, // تحديد موقع البداية على الخريطة
                zoom: 14, // مستوى التكبير
              ),
              markers: markers, // إضافة العلامات إلى الخريطة
              myLocationEnabled: true, // عرض موقع المستخدم
              myLocationButtonEnabled: true, // زر تحديد الموقع
            ),
    );
  }
}
*/
/*
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:provider/provider.dart';
import 'package:scholar_chat/pages/DermatologyClinicsApi.dart';
import 'package:scholar_chat/pages/maps_provider.dart';






class DermatologyClinicMapScreen extends StatefulWidget {
  @override
  _DermatologyClinicMapScreenState createState() => _DermatologyClinicMapScreenState();
}

class _DermatologyClinicMapScreenState extends State<DermatologyClinicMapScreen> {
  late GoogleMapController mapController;
  late MapProvider mapProv;//ايرور
  Set<Marker> markers = {};

  @override
  void initState() {
    super.initState();
    _initializeMap();
  }

  void _initializeMap() async {
    mapProv = Provider.of<MapProvider>(context, listen: false);//ايرور
    await _getCurrentLocation();
    await _fetchNearbyClinics();
  }

  Future<void> _getCurrentLocation() async {
    try {
      bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
      if (!serviceEnabled) {
        _showSnackBar("Location service is not enabled. Please enable it.");
        return;
      }
      LocationPermission permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {
          _showSnackBar("Access to the site has been denied.");
          return;
        }
      }
      Position position = await Geolocator.getCurrentPosition();
      setState(() {
       mapProv.updateUserLocationByTap(LatLng(position.latitude, position.longitude));

      });
    } catch (e) {
      _showSnackBar("An error occurred while accessing the site: $e");
    }
  }

  Future<void> _fetchNearbyClinics() async {
    if (mapProv.locationData == null) return;
    var clinicsApi = ClinicesApi();
    var clinics = await clinicsApi.getClinics(
      mapProv.locationData!.longitude!,
      mapProv.locationData!.latitude!,
    );

    if (clinics.isNotEmpty) {
      setState(() {
        markers.addAll(clinics.map((clinic) => Marker(
              markerId: MarkerId(clinic.name ?? "clinic"),
              position: LatLng(clinic.latitude ?? 0, clinic.longitude ?? 0),
              infoWindow: InfoWindow(title: clinic.name ?? "Clinic"),
            )));
      });
    }
  }

  void _showSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Dermatology Clinics Map"),
        backgroundColor: Colors.blueGrey,
      ),
      body: mapProv.locationData == null
          ? Center(child: CircularProgressIndicator())
          : GoogleMap(
              onMapCreated: (controller) => mapController = controller,
              initialCameraPosition: CameraPosition(
                target: LatLng(
                  mapProv.locationData!.latitude!,
                  mapProv.locationData!.longitude!,
                ),
                zoom: 14,
              ),
              markers: markers,
              myLocationEnabled: true,
              myLocationButtonEnabled: true,
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: _fetchNearbyClinics,
        child: Icon(Icons.refresh),
        backgroundColor: Colors.blue,
      ),
    );
  }
}
*/
/*
import 'dart:async';

import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scholar_chat/pages/DermatologyClinicsApi.dart';
import 'package:scholar_chat/pages/clinicesModel.dart';
import 'package:scholar_chat/pages/color_manager.dart';
import 'package:scholar_chat/pages/maps_provider.dart';





class DermatologyClinicMapScreen extends StatefulWidget {
  
  static const String RountName = 'Dermatology Clinic Map Screen';
  late final List<Clinics> Clinices;
  ClinicesModel? clinicsData;

  @override
  State<DermatologyClinicMapScreen> createState() =>
      _DermatologyClinicMapScreenState();
}

class _DermatologyClinicMapScreenState
    extends State<DermatologyClinicMapScreen> {
  late MapProvider mapProv;
  late int index;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final Completer<GoogleMapController> controller =//
        Completer<GoogleMapController>();
    mapProv = Provider.of<MapProvider>(context);
    mapProv.initializeMap();
    index = mapProv.index;
  }

  @override
  void dispose() {
    mapProv.dispose();
    super.dispose();
  }

  @override
  //AIzaSyDpER28SEqR5_CLW56Jvj2WyvWweOUQdz4 mapKey
  Widget build(BuildContext context) {//exception
    mapProv.getUserLocation();
    return Scaffold(
      appBar: AppBar(
        title: Text('Dermatology Clinics Map'),
        actions: <Widget>[
          IconButton(
            onPressed: () {
              mapProv.backCarrant();
              setState(() {});
            },
            icon: const Icon(
              Icons.my_location_sharp,
              color: ColorManager.colorGrayBlue,
            ),
          ),
        ],
        backgroundColor: ColorManager.scondeColor,
      ),
      body: mapProv.myLocation == null
          ? Center(child: CircularProgressIndicator())
          : GoogleMap(
              mapType: MapType.satellite,
              markers: Set<Marker>.of(
                  [...mapProv.markers, ...mapProv.markersClinics]).toSet(),
              onTap: (argument) {
                setState(() {
                  mapProv.markers.clear();
                  index++;
                  mapProv.markers.add(Marker(
                      markerId: MarkerId("marker$index"), position: argument));
                  setState(() {});
                });
              },
              initialCameraPosition: mapProv.myLocation!,
              onMapCreated: (GoogleMapController controller) {
                mapProv.controller.complete(controller);
              },
            ),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: ColorManager.primaryColor,
        onPressed: () {
          getNearbyDermatologyClinicsApi(mapProv.locationData!.longitude!,
              mapProv.locationData!.latitude!);
        },
        label: const Text(
          'Dermatology Clinics',
          style: TextStyle(fontSize: 20, color: ColorManager.colorWhit),
        ),
        icon: const Icon(
          Icons.medical_services,
          color: ColorManager.colorWhit,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  Future<void> getNearbyDermatologyClinicsApi(
      double? longitude, double? latitude) async {
    var clinicsApi = ClinicesApi();
    var clinics = await clinicsApi.getClinics(longitude!, latitude!);
    if (clinics.isNotEmpty) {
      print(
          "locationData ${mapProv.locationData!.longitude!} ${mapProv.locationData!.latitude}");
      for (var clinic in clinics) {
        var clinicLatLng = LatLng(clinic.latitude ?? 0, clinic.longitude ?? 0);
        print("distanceIs ${clinic.name} ${clinic.distance}");
        mapProv.markersClinics.add(
          Marker(
            icon: BitmapDescriptor.defaultMarkerWithHue(
                mapProv.getMarkerHue(ColorManager.primaryColor)),
            markerId: MarkerId(clinic.name ?? "clinic"),
            position: clinicLatLng,
            infoWindow: InfoWindow(
              title: clinic.name!,
              onTap: () {
                showModalBottomSheet(
                  context: context,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                    side: const BorderSide(color: Colors.black12, width: 3),
                  ),
                  builder: (BuildContext context) {
                    return FractionallySizedBox(
                      heightFactor: 0.6.h,
                      child: SingleChildScrollView(
                        child: Padding(
                          padding: EdgeInsets.all(ScreenUtil().setWidth(10)),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Icon(
                                    Icons.person_rounded,
                                    size: 35,
                                    color: ColorManager.primaryColor,
                                  ),
                                  Flexible(
                                    child: Text(
                                      clinic.name ?? "clinic",
                                      overflow: TextOverflow.fade,
                                      style: TextStyle(
                                        fontSize: 30,
                                        color: ColorManager.colorGrayBlue,
                                      ),
                                    ),
                                  ),
                                ],
                              ), // Name
                              SizedBox(height: 15.0),

                              Row(
                                children: [
                                  RatingBar.builder(
                                    initialRating:
                                        (clinic.rate ?? 4.5).toDouble(),
                                    direction: Axis.horizontal,
                                    allowHalfRating: true,
                                    itemPadding:
                                        EdgeInsets.symmetric(horizontal: 4.0),
                                    itemBuilder: (context, _) => Icon(
                                      Icons.star,
                                      color: ColorManager.primaryColor,
                                    ),
                                    ignoreGestures: true,
                                    // Disable user input
                                    onRatingUpdate: (double value) {},
                                  ),
                                  Text(
                                    clinic.rate.toString(),
                                  )
                                ],
                              ), // Rate
                              SizedBox(height: 10.0),

                              Row(
                                children: [
                                  const Icon(
                                    Icons.phone,
                                    size: 25,
                                    color: ColorManager.primaryColor,
                                  ),
                                  SizedBox(width: 10),
                                  InkWell(
                                    onTap: () {
                                      mapProv.makePhoneCall(
                                          clinic.phone ?? "01210060085");
                                    },
                                    child: Text(
                                      clinic.phone ?? "01210060085",
                                      style: const TextStyle(
                                        decoration: TextDecoration.underline,
                                        decorationColor:
                                            ColorManager.colorGrayBlue,
                                        //color: ColorManager.primaryColor,
                                        fontSize: 25,
                                        fontWeight: FontWeight.w800,
                                      ),
                                    ),
                                  ),
                                ],
                              ), // Phone
                              SizedBox(height: 10.0),

                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  const Icon(
                                    Icons.location_searching_sharp,
                                    size: 30,
                                    color: ColorManager.primaryColor,
                                  ),
                                  Flexible(
                                    child: Text(
                                      clinic.addressClinic ?? "Cairo ",
                                      overflow: TextOverflow.fade,
                                      style: TextStyle(
                                        fontSize: 30,
                                        color: ColorManager.colorGrayBlue,
                                      ),
                                    ),
                                  ),
                                ],
                              ), //add
                              SizedBox(height: 10.0),
/*
                              Row(
                                children: [
                                  const Icon(
                                    Icons.social_distance_sharp,
                                    size: 25,
                                    color: ColorManager.primaryColor,
                                  ),
                                  Flexible(
                                    child: Text(
                                      ' ${(clinic.distance ?? 5) } km',
                                      style: TextStyle(
                                        fontSize: 30,
                                        color: ColorManager.colorGrayBlue,
                                      ),
                                    ),
                                  ),
                                ],
                              ), //distance
 */
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        );
      }
      setState(() {
        mapProv.markersClinics = Set<Marker>.from(mapProv.markersClinics);
        //markersClinicsprint(mapProv.markersClinics.length);
        //print("clinics lesgth ${clinics.distance}");
      });
    } else {
      // Handle empty clinic list
    }
  }
}
*/
/*
//شغال بس في اكسيبشن كتير 
import 'dart:async';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scholar_chat/pages/DermatologyClinicsApi.dart';
import 'package:scholar_chat/pages/clinicesModel.dart';
import 'package:scholar_chat/pages/color_manager.dart';
import 'package:scholar_chat/pages/maps_provider.dart';

class DermatologyClinicMapScreen extends StatefulWidget {
  static const String RountName = 'Dermatology Clinic Map Screen';
  
  // ✅ جعل المتغيرات `final` وتمريرها عبر `constructor`
  final List<Clinics> Clinices;
  final ClinicesModel? clinicsData;

  DermatologyClinicMapScreen({Key? key, required this.Clinices, this.clinicsData}) : super(key: key);

  @override
  State<DermatologyClinicMapScreen> createState() => _DermatologyClinicMapScreenState();
}

class _DermatologyClinicMapScreenState extends State<DermatologyClinicMapScreen> {
  late MapProvider mapProv;
  late int index;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    mapProv = Provider.of<MapProvider>(context, listen: false); // ✅ تحديد `listen: false` لتحسين الأداء
    mapProv.initializeMap();
    index = mapProv.index;
  }

  @override
  void dispose() {
    mapProv.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    mapProv.getUserLocation();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Dermatology Clinics Map'),
        actions: <Widget>[
          IconButton(
            onPressed: () {
              mapProv.backCarrant();
              setState(() {});
            },
            icon: const Icon(
              Icons.my_location_sharp,
              color: ColorManager.colorGrayBlue,
            ),
          ),
        ],
        backgroundColor: ColorManager.scondeColor,
      ),
      body: mapProv.myLocation == null
          ? const Center(child: CircularProgressIndicator())
          : GoogleMap(
              mapType: MapType.satellite,
              markers: {...mapProv.markers, ...mapProv.markersClinics},
              onTap: (LatLng argument) {
                setState(() {
                  mapProv.markers.clear();
                  index++;
                  mapProv.markers.add(Marker(
                    markerId: MarkerId("marker$index"),
                    position: argument,
                  ));
                });
              },
              initialCameraPosition: mapProv.myLocation!,
              onMapCreated: (GoogleMapController controller) {
                mapProv.controller.complete(controller);
              },
            ),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: ColorManager.primaryColor,
        onPressed: () {// لما بدخل اكتر من مرة علي زر الخريطة بيرمي اكسيبشن
          getNearbyDermatologyClinicsApi(
              mapProv.locationData!.longitude!, mapProv.locationData!.latitude!);
        },
        label: const Text(
          'Dermatology Clinics',
          style: TextStyle(fontSize: 20, color: ColorManager.colorWhit),
        ),
        icon: const Icon(
          Icons.medical_services,
          color: ColorManager.colorWhit,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  Future<void> getNearbyDermatologyClinicsApi(double longitude, double latitude) async {
    var clinicsApi = ClinicesApi();
    var clinics = await clinicsApi.getClinics(longitude, latitude);
    if (clinics.isNotEmpty) {
      for (var clinic in clinics) {
        var clinicLatLng = LatLng(clinic.latitude ?? 0, clinic.longitude ?? 0);
        mapProv.markersClinics.add(
          Marker(
            icon: BitmapDescriptor.defaultMarkerWithHue(
                mapProv.getMarkerHue(ColorManager.primaryColor)),
            markerId: MarkerId(clinic.name ?? "clinic"),
            position: clinicLatLng,
            infoWindow: InfoWindow(
              title: clinic.name!,
              onTap: () {
                showClinicDetails(clinic);
              },
            ),
          ),
        );
      }
      setState(() {
        mapProv.markersClinics = Set<Marker>.from(mapProv.markersClinics);
      });
    }
  }

  void showClinicDetails(Clinics clinic) {
    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30),
        side: const BorderSide(color: Colors.black12, width: 3),
      ),
      builder: (BuildContext context) {
        return FractionallySizedBox(
          heightFactor: 0.6.h,
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(ScreenUtil().setWidth(10)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Icon(Icons.person_rounded, size: 35, color: ColorManager.primaryColor),
                      Flexible(
                        child: Text(
                          clinic.name ?? "clinic",
                          overflow: TextOverflow.fade,
                          style: TextStyle(fontSize: 30, color: ColorManager.colorGrayBlue),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 15.0),
                  Row(
                    children: [
                      RatingBar.builder(
                        initialRating: (clinic.rate ?? 4.5).toDouble(),
                        direction: Axis.horizontal,
                        allowHalfRating: true,
                        itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
                        itemBuilder: (context, _) => const Icon(
                          Icons.star,
                          color: ColorManager.primaryColor,
                        ),
                        ignoreGestures: true,
                        onRatingUpdate: (double value) {},
                      ),
                      Text(clinic.rate.toString()),
                    ],
                  ),
                  SizedBox(height: 10.0),
                  Row(
                    children: [
                      const Icon(Icons.phone, size: 25, color: ColorManager.primaryColor),
                      SizedBox(width: 10),
                      InkWell(
                        onTap: () {
                          mapProv.makePhoneCall(clinic.phone ?? "01210060085");
                        },
                        child: Text(
                          clinic.phone ?? "01210060085",
                          style: const TextStyle(
                            decoration: TextDecoration.underline,
                            fontSize: 25,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10.0),
                  Row(
                    children: [
                      const Icon(Icons.location_searching_sharp, size: 30, color: ColorManager.primaryColor),
                      Flexible(
                        child: Text(
                          clinic.addressClinic ?? "Cairo",
                          overflow: TextOverflow.fade,
                          style: TextStyle(fontSize: 30, color: ColorManager.colorGrayBlue),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
*/
/*
//ده شغال بس الز كبير هصغره في الكود اللي تحت 
import 'dart:async';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scholar_chat/pages/DermatologyClinicsApi.dart';
import 'package:scholar_chat/pages/clinicesModel.dart';
import 'package:scholar_chat/pages/color_manager.dart';
import 'package:scholar_chat/pages/maps_provider.dart';

class DermatologyClinicMapScreen extends StatefulWidget {
  static const String RountName = 'Dermatology Clinic Map Screen';
  
  final List<Clinics> Clinices;
  final ClinicesModel? clinicsData;

  DermatologyClinicMapScreen({Key? key, required this.Clinices, this.clinicsData}) : super(key: key);

  @override
  State<DermatologyClinicMapScreen> createState() => _DermatologyClinicMapScreenState();
}

class _DermatologyClinicMapScreenState extends State<DermatologyClinicMapScreen> {
  late MapProvider mapProv;
  late int index;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    mapProv = Provider.of<MapProvider>(context, listen: false);
    mapProv.initializeMap();
    index = mapProv.index;
  }

  @override
  void dispose() {
    mapProv.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    mapProv.getUserLocation();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Dermatology Clinics Map'),
        actions: <Widget>[
          IconButton(
            onPressed: () {
              mapProv.backCarrant();
              setState(() {});
            },
            icon: const Icon(
              Icons.my_location_sharp,
              color: ColorManager.colorGrayBlue,
            ),
          ),
        ],
        backgroundColor: ColorManager.scondeColor,
      ),
      body: mapProv.myLocation == null
          ? const Center(child: CircularProgressIndicator())
          : GoogleMap(
              mapType: MapType.satellite,
              markers: {...mapProv.markers, ...mapProv.markersClinics},
              onTap: (LatLng argument) {
                setState(() {
                  mapProv.markers.clear();
                  index++;
                  mapProv.markers.add(Marker(
                    markerId: MarkerId("marker$index"),
                    position: argument,
                  ));
                });
              },
              initialCameraPosition: mapProv.myLocation!,
              onMapCreated: (GoogleMapController controller) {
                if (!mapProv.controller.isCompleted) {
                  mapProv.controller.complete(controller);
                }
              },
            ),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: ColorManager.primaryColor,
        onPressed: () {
          try {
            if (mapProv.locationData != null) {
              getNearbyDermatologyClinicsApi(
                  mapProv.locationData!.longitude!, mapProv.locationData!.latitude!);
            } else {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Location data is not available')),
              );
            }
          } catch (e) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('An error occurred: $e')),
            );
          }
        },
        label: const Text(
          'Dermatology Clinics',
          style: TextStyle(fontSize: 20, color: ColorManager.colorWhit),
        ),
        icon: const Icon(
          Icons.medical_services,
          color: ColorManager.colorWhit,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  Future<void> getNearbyDermatologyClinicsApi(double longitude, double latitude) async {
    var clinicsApi = ClinicesApi();
    var clinics = await clinicsApi.getClinics(longitude, latitude);
    
    if (clinics.isNotEmpty) {
      mapProv.markersClinics.clear(); // تنظيف العلامات القديمة
      for (var clinic in clinics) {
        var clinicLatLng = LatLng(clinic.latitude ?? 0, clinic.longitude ?? 0);
        mapProv.markersClinics.add(
          Marker(
            icon: BitmapDescriptor.defaultMarkerWithHue(
                mapProv.getMarkerHue(ColorManager.primaryColor)),
            markerId: MarkerId(clinic.name ?? "clinic"),
            position: clinicLatLng,
            infoWindow: InfoWindow(
              title: clinic.name!,
              onTap: () {
                showClinicDetails(clinic);
              },
            ),
          ),
        );
      }
      setState(() {
        mapProv.markersClinics = Set<Marker>.from(mapProv.markersClinics);
      });
    }
  }

  void showClinicDetails(Clinics clinic) {
    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30),
        side: const BorderSide(color: Colors.black12, width: 3),
      ),
      builder: (BuildContext context) {
        return FractionallySizedBox(
          heightFactor: 0.6.h,
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(ScreenUtil().setWidth(10)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Icon(Icons.person_rounded, size: 35, color: ColorManager.primaryColor),
                      Flexible(
                        child: Text(
                          clinic.name ?? "clinic",
                          overflow: TextOverflow.fade,
                          style: TextStyle(fontSize: 30, color: ColorManager.colorGrayBlue),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 15.0),
                  Row(
                    children: [
                      RatingBar.builder(
                        initialRating: (clinic.rate ?? 4.5).toDouble(),
                        direction: Axis.horizontal,
                        allowHalfRating: true,
                        itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
                        itemBuilder: (context, _) => const Icon(
                          Icons.star,
                          color: ColorManager.primaryColor,
                        ),
                        ignoreGestures: true,
                        onRatingUpdate: (double value) {},
                      ),
                      Text(clinic.rate.toString()),
                    ],
                  ),
                  SizedBox(height: 10.0),
                  Row(
                    children: [
                      const Icon(Icons.phone, size: 25, color: ColorManager.primaryColor),
                      SizedBox(width: 10),
                      InkWell(
                        onTap: () {
                          mapProv.makePhoneCall(clinic.phone ?? "01210060085");
                        },
                        child: Text(
                          clinic.phone ?? "01210060085",
                          style: const TextStyle(
                            decoration: TextDecoration.underline,
                            fontSize: 25,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10.0),
                  Row(
                    children: [
                      const Icon(Icons.location_searching_sharp, size: 30, color: ColorManager.primaryColor),
                      Flexible(
                        child: Text(
                          clinic.addressClinic ?? "Cairo",
                          overflow: TextOverflow.fade,
                          style: TextStyle(fontSize: 30, color: ColorManager.colorGrayBlue),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
*/

//  الكود ده تمام بس لما بدخل علي الخريطة اكتر من مرة برمي اكسيبشن ومش راضي يزهر بيانات العيادات
import 'dart:async';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scholar_chat/pages/DermatologyClinicsApi.dart';
import 'package:scholar_chat/pages/clinicesModel.dart';
import 'package:scholar_chat/pages/color_manager.dart';
import 'package:scholar_chat/pages/maps_provider.dart';

class DermatologyClinicMapScreen extends StatefulWidget {
  static const String RountName = 'Dermatology Clinic Map Screen';
  
  final List<Clinics> Clinices;
  final ClinicesModel? clinicsData;

  DermatologyClinicMapScreen({Key? key, required this.Clinices, this.clinicsData, }) : super(key: key);

  @override
  State<DermatologyClinicMapScreen> createState() => _DermatologyClinicMapScreenState();
}

class _DermatologyClinicMapScreenState extends State<DermatologyClinicMapScreen> {
  late MapProvider mapProv;
  late int index;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    mapProv = Provider.of<MapProvider>(context, listen: false);
    mapProv.initializeMap();
    index = mapProv.index;
  }

  @override
  void dispose() {
    mapProv.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    mapProv.getUserLocation();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Dermatology Clinics Map'),
        actions: <Widget>[
          IconButton(
            onPressed: () {
              mapProv.backCarrant();
              setState(() {});
            },
            icon: const Icon(
              Icons.my_location_sharp,
              color: ColorManager.colorGrayBlue,
            ),
          ),
        ],
        backgroundColor: ColorManager.scondeColor,
      ),
      body: mapProv.myLocation == null
          ? const Center(child: CircularProgressIndicator())
          : GoogleMap(
              mapType: MapType.satellite,
              markers: {...mapProv.markers, ...mapProv.markersClinics},
              onTap: (LatLng argument) {
                setState(() {
                  mapProv.markers.clear();
                  index++;
                  mapProv.markers.add(Marker(
                    markerId: MarkerId("marker$index"),
                    position: argument,
                  ));
                });
              },
              initialCameraPosition: mapProv.myLocation!,
              onMapCreated: (GoogleMapController controller) {
                if (!mapProv.controller.isCompleted) {
                  mapProv.controller.complete(controller);
                }
              },
            ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: ColorManager.primaryColor,
        onPressed: () {
          try {
            if (mapProv.locationData != null) {
              getNearbyDermatologyClinicsApi(
                  mapProv.locationData!.longitude!, mapProv.locationData!.latitude!);
            } else {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Location data is not available')),
              );
            }
          } catch (e) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('An error occurred: $e')),
            );
          }
        },
        child: const Icon(
          Icons.medical_services,
          color: ColorManager.colorWhit,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat, // تغيير الموقع إلى الزاوية اليسرى السفلية
    );
  }

  Future<void> getNearbyDermatologyClinicsApi(double longitude, double latitude) async {
    var clinicsApi = ClinicesApi();
    var clinics = await clinicsApi.getClinics(longitude, latitude);
    
    if (clinics.isNotEmpty) {
      mapProv.markersClinics.clear(); // تنظيف العلامات القديمة
      for (var clinic in clinics) {
        var clinicLatLng = LatLng(clinic.latitude ?? 0, clinic.longitude ?? 0);
        mapProv.markersClinics.add(
          Marker(
            icon: BitmapDescriptor.defaultMarkerWithHue(
                mapProv.getMarkerHue(ColorManager.primaryColor)),
            markerId: MarkerId(clinic.name ?? "clinic"),
            position: clinicLatLng,
            infoWindow: InfoWindow(
              title: clinic.name!,
              onTap: () {
                showClinicDetails(clinic);
              },
            ),
          ),
        );
      }
      setState(() {
        mapProv.markersClinics = Set<Marker>.from(mapProv.markersClinics);
      });
    }
  }

  void showClinicDetails(Clinics clinic) {
    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30),
        side: const BorderSide(color: Colors.black12, width: 3),
      ),
      builder: (BuildContext context) {
        return FractionallySizedBox(
          heightFactor: 0.6.h,// لما بدوس علي عرض بيانات العيادة بيحصل ايرور
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(ScreenUtil().setWidth(10)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Icon(Icons.person_rounded, size: 35, color: ColorManager.primaryColor),
                      Flexible(
                        child: Text(
                          clinic.name ?? "clinic",
                          overflow: TextOverflow.fade,
                          style: TextStyle(fontSize: 30, color: ColorManager.colorGrayBlue),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 15.0),
                  Row(
                    children: [
                      RatingBar.builder(
                        initialRating: (clinic.rate ?? 4.5).toDouble(),
                        direction: Axis.horizontal,
                        allowHalfRating: true,
                        itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
                        itemBuilder: (context, _) => const Icon(
                          Icons.star,
                          color: ColorManager.primaryColor,
                        ),
                        ignoreGestures: true,
                        onRatingUpdate: (double value) {},
                      ),
                      Text(clinic.rate.toString()),
                    ],
                  ),
                  SizedBox(height: 10.0),
                  Row(
                    children: [
                      const Icon(Icons.phone, size: 25, color: ColorManager.primaryColor),
                      SizedBox(width: 10),
                      InkWell(
                        onTap: () {
                          mapProv.makePhoneCall(clinic.phone ?? "01210060085");
                        },
                        child: Text(
                          clinic.phone ?? "01210060085",
                          style: const TextStyle(
                            decoration: TextDecoration.underline,
                            fontSize: 25,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10.0),
                  Row(
                    children: [
                      const Icon(Icons.location_searching_sharp, size: 30, color: ColorManager.primaryColor),
                      Flexible(
                        child: Text(
                          clinic.addressClinic ?? "Cairo",
                          overflow: TextOverflow.fade,
                          style: TextStyle(fontSize: 30, color: ColorManager.colorGrayBlue),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
