import 'package:flutter/widgets.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../utils/AppColors.dart';

class OrderTrackingController extends GetxController {
  GoogleMapController? gMapcontroller;
  BitmapDescriptor? driverLocationIcon;
  BitmapDescriptor? userLocationIcon;
  final Map<String, Marker> markers = {};
  Map<PolylineId, Polyline> polyLines = {};
  PolylinePoints polylinePoints = PolylinePoints();

  @override
  void onInit() {
    // TODO: implement onInit
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
    policreate();
    update();
  }

  //

  policreate({workLocationLatLng}) async {
    List<LatLng> polylineCoordinates = [];

    PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
      'AIzaSyBCiNLh0ZNX51eFTnKk7DvTt5pxf-T18c0',

      PointLatLng(20.8009, 70.6960), //kodinar
      PointLatLng(22.3039, 70.8022), //rajkot
      travelMode: TravelMode.driving,
    );

    if (result.points.isNotEmpty) {
      for (var point in result.points) {
        polylineCoordinates.add(LatLng(point.latitude, point.longitude));
      }
    }
    markers['userLocationMarker'] = Marker(
      markerId: MarkerId('userLocationMarker'),
      position: LatLng(20.8009, 70.6960),
      icon: userLocationIcon!,
    );
    markers['driverLocationMarker'] = Marker(
      markerId: MarkerId('driverLocationMarker'),
      position: LatLng(22.3039, 70.8022),
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
  //
}
