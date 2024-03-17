import 'dart:convert';

import 'package:flutter/widgets.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../utils/AppColors.dart';
import 'package:http/http.dart' as http;

class OrderTrackingController extends GetxController {
  GoogleMapController? gMapcontroller;
  BitmapDescriptor? driverLocationIcon;
  BitmapDescriptor? userLocationIcon;
  final Map<String, Marker> markers = {};
  Map<PolylineId, Polyline> polyLines = {};
  PolylinePoints polylinePoints = PolylinePoints();

  @override
  void onInit() {
    super.onInit();
    markerIconSet();
  }

  void onMapCreated(GoogleMapController controller) {
    gMapcontroller = controller;
  }

  markerIconSet() {
    BitmapDescriptor.fromAssetImage(
            const ImageConfiguration(
              size: Size(10, 10), //10,10
            ),
            "assets/images/DrupImage.png")
        .then((value) {
      userLocationIcon = value;
    });
    BitmapDescriptor.fromAssetImage(
            const ImageConfiguration(
              size: Size(10, 10), //10,10
            ),
            "assets/images/driverLocation.png")
        .then((value) {
      driverLocationIcon = value;
      // markers['driverLocationMarker'] = Marker(
      //   markerId: MarkerId('driverLocationMarker'),
      //   position: LatLng(22.3039, 70.8022),
      //   icon: driverLocationIcon!,
      // );
    });
    update();
  }

  //

  policreate(LatLng driverLocation, LatLng destination) async {
    List<LatLng> polylineCoordinates = [];

    PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
      'AIzaSyBCiNLh0ZNX51eFTnKk7DvTt5pxf-T18c0',

      PointLatLng(destination.latitude, destination.longitude), //kodinar
      PointLatLng(driverLocation.latitude, driverLocation.longitude), //rajkot
      travelMode: TravelMode.driving,
    );

    if (result.points.isNotEmpty) {
      for (var point in result.points) {
        polylineCoordinates.add(LatLng(point.latitude, point.longitude));
      }
    }
    markers['userLocationMarker'] = Marker(
      markerId: MarkerId('userLocationMarker'),
      position: destination,
      icon: userLocationIcon!,
    );
    markers['driverLocationMarker'] = Marker(
      markerId: MarkerId('driverLocationMarker'),
      position: driverLocation,
      icon: driverLocationIcon!,
    );
    addPolyLine(polylineCoordinates);
  }

  addPolyLine(List<LatLng> polylineCoordinates) {
    PolylineId id = const PolylineId("poly");
    Polyline polyline = Polyline(
      polylineId: id,
      color: AppColors.theme,
      points: polylineCoordinates,
      width: 4,
      geodesic: true,
    );
    polyLines[id] = polyline;
    updateCameraLocation(
        polylineCoordinates.first, polylineCoordinates.last, gMapcontroller);
    update();
  }

  Future<void> updateCameraLocation(
    LatLng source,
    LatLng destination,
    GoogleMapController? mapController,
  ) async {
    if (mapController == null) return;

    LatLngBounds bounds;

    if (source.latitude > destination.latitude &&
        source.longitude > destination.longitude) {
      bounds = LatLngBounds(southwest: destination, northeast: source);
    } else if (source.longitude > destination.longitude) {
      bounds = LatLngBounds(
          southwest: LatLng(source.latitude, destination.longitude),
          northeast: LatLng(destination.latitude, source.longitude));
    } else if (source.latitude > destination.latitude) {
      bounds = LatLngBounds(
          southwest: LatLng(destination.latitude, source.longitude),
          northeast: LatLng(source.latitude, destination.longitude));
    } else {
      bounds = LatLngBounds(southwest: source, northeast: destination);
    }

    CameraUpdate cameraUpdate = CameraUpdate.newLatLngBounds(bounds, 30);
    // CameraUpdate cameraUpdate = CameraUpdate.newLatLngBounds(bounds, 100);

    return checkCameraLocation(cameraUpdate, mapController);
  }

  Future<void> checkCameraLocation(
      CameraUpdate cameraUpdate, GoogleMapController mapController) async {
    mapController.animateCamera(cameraUpdate);
    LatLngBounds l1 = await mapController.getVisibleRegion();
    LatLngBounds l2 = await mapController.getVisibleRegion();

    if (l1.southwest.latitude == -90 || l2.southwest.latitude == -90) {
      return checkCameraLocation(cameraUpdate, mapController);
    }
    update();
  }

  RxDouble latitude = 0.0.obs;
  RxDouble longitude = 0.0.obs;

  Future<void> getCurrentLoc(
      BuildContext context, LatLng destinationLatLng) async {
    LocationPermission permission;
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.deniedForever) {
        return Future.error('Location Not Available');
      }
    }
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);

    latitude.value = position.latitude;
    longitude.value = position.longitude;
    //polyLines = {};
    policreate(LatLng(latitude.value, longitude.value), destinationLatLng);
  }

  String distanceLeft = "";
  String timeLeft = "";
  getTimeAndDistanceFromAddress(
      String startingAddress, String endingAddress) async {
    var request = http.Request(
        'GET',
        Uri.parse(
            'https://maps.googleapis.com/maps/api/distancematrix/json?origins=$startingAddress&destinations=$endingAddress&departure_time=now&mode=driving&key=AIzaSyA0mRlUvgR2LbYdrkqaGmJjaSO5LSgz7d8'));

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      final res = await http.Response.fromStream(response);
      final Map<String, dynamic> json = await jsonDecode(res.body);
      print(res.body.toString() + "DISTANCE RESP");
      distanceLeft = json["rows"][0]["elements"][0]["distance"]["text"];
      timeLeft = json["rows"][0]["elements"][0]["duration"]["text"];
      update();
    } else {
      print(response.reasonPhrase);
    }
  }

  Future<String> getAddressFromLatLng(LatLng addressLatLng) async {
    List<Placemark> placemark = await placemarkFromCoordinates(
        double.parse("22.763232"), double.parse("75.8713685"),
        localeIdentifier: "en");

    print(placemark.toList().toString() + "ADDRESSS");

    var address = (placemark[0].name ?? "") +
        " " +
        (placemark[0].subLocality! ?? "") +
        (placemark[0].locality! ?? "") +
        (placemark[0].administrativeArea! ?? "") +
        (placemark[0].postalCode! ?? "");
    // var stateName =
    //     stateAbbreviationMapFunction(placemark[0].administrativeArea!);

    // name.value = placemark[0].locality!;
    // area.value = placemark[0].subLocality!;
    return address;
  }
}
