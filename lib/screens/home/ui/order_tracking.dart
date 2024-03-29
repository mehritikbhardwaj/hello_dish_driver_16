import 'dart:async';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hello_dish_driver/screens/home/model/activeOrdersModel.dart';
import 'package:iconsax/iconsax.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../utils/AppColors.dart';
import '../../../utils/const.dart';
import '../../../utils/mediaQuery.dart';
import '../../../utils/sizedBox.dart';
import '../controller/OrderTrackingController.dart';

class DriverOrderTrackingScreen extends StatefulWidget {
  final DatumOrderActive list;

  const DriverOrderTrackingScreen({super.key, required this.list});

  @override
  State<DriverOrderTrackingScreen> createState() =>
      _DriverOrderTrackingScreenState();
}

class _DriverOrderTrackingScreenState extends State<DriverOrderTrackingScreen> {
  final OrderTrackingController orderTrackingController = Get.put(
    OrderTrackingController(),
  );
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    orderTrackingController.getCurrentLoc(
        context,
        widget.list.status == 4
            ? LatLng(widget.list.lat, widget.list.long)
            : LatLng(widget.list.restaurantId.restaurantLat,
                widget.list.restaurantId.restaurantLong));
    getTImeDISTANCE();

    Timer.periodic(Duration(seconds: 20), (timer) {
      orderTrackingController.getCurrentLoc(
          context,
          widget.list.status == 4
              ? LatLng(widget.list.lat, widget.list.long)
              : LatLng(widget.list.restaurantId.restaurantLat,
                  widget.list.restaurantId.restaurantLong));
      getTImeDISTANCE();
    });

    orderTrackingController.getAddressFromLatLng(LatLng(
        widget.list.restaurantId.restaurantLat,
        widget.list.restaurantId.restaurantLong));
  }

  getTImeDISTANCE() async {
    orderTrackingController.getTimeAndDistanceFromAddress(
      await orderTrackingController.getAddressFromLatLng(
        LatLng(orderTrackingController.latitude.value,
            orderTrackingController.longitude.value),
      ),
      await orderTrackingController.getAddressFromLatLng(widget.list.status == 4
          ? LatLng(widget.list.lat, widget.list.long)
          : LatLng(widget.list.restaurantId.restaurantLat,
              widget.list.restaurantId.restaurantLong)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OrderTrackingController>(
        builder: (orderTrackingController) {
      var greenGradient;
      return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: AppColors.white,
          foregroundColor: Colors.black,
          centerTitle: true,
          title: Row(
            children: [
              IconButton(
                  padding: EdgeInsets.zero,
                  onPressed: () {
                    Get.back();
                  },
                  icon: Icon(Iconsax.arrow_left_2)),
              Text(
                orderTrackingController.distanceLeft,
                style: GoogleFonts.poppins(
                    color: Colors.black,
                    fontSize: 14,
                    fontWeight: FontWeight.w500),
              ),
              boxB1(),
              //  boxB1(),
              Text(
                "~ ${orderTrackingController.timeLeft} to ${(widget.list.status == 4 ? "Deliver" : "Pick")}",
                style: GoogleFonts.poppins(
                    color: Colors.black,
                    fontSize: 14,
                    fontWeight: FontWeight.w500),
              ),
            ],
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: SizeConfig.Height * 0.58,
                width: double.infinity,
                child: GoogleMap(
                  zoomControlsEnabled: false,
                  myLocationButtonEnabled: true,
                  zoomGesturesEnabled: true,
                  onMapCreated: orderTrackingController.onMapCreated,
                  // myLocationEnabled: true,
                  // myLocationButtonEnabled: true,
                  onTap: (_) {},
                  compassEnabled: true,
                  markers: orderTrackingController.markers.values.toSet(),
                  initialCameraPosition: CameraPosition(
                    target: LatLng(20.8009, 70.6960),
                    zoom: 14.0,
                  ),
                  polylines: Set<Polyline>.of(
                      orderTrackingController.polyLines.values),
                ),
              ),

              boxA2(),
              // RESTAURANT

              widget.list.status != 4
                  ? customContainer(
                      margin: EdgeInsets.only(left: 18.0, right: 18.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "RESTAURANT",
                            style: GoogleFonts.poppins(
                                color: AppColors.grey, fontSize: 12),
                          ),
                          boxA1(),
                          Row(
                            children: [
                              CircleAvatar(
                                radius: SizeConfig.Height * 0.024,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(100.0),
                                  child: CachedNetworkImage(
                                    fit: BoxFit.cover,
                                    imageUrl:
                                        "https://img.jakpost.net/c/2016/09/29/2016_09_29_12990_1475116504._large.jpg",
                                    placeholder: (context, url) =>
                                        const CircularProgressIndicator(),
                                    errorWidget: (context, url, error) =>
                                        const Icon(Iconsax.user),
                                  ),
                                ),
                              ),
                              boxB1(),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    widget.list.restaurantId.restaurantName,
                                    style: GoogleFonts.poppins(fontSize: 15.0),
                                  ).paddingOnly(bottom: 3.0),
                                  Text(
                                    widget.list.restaurantId.restaurantAddress,
                                    style: GoogleFonts.poppins(fontSize: 12.0),
                                  ),
                                ],
                              ),
                              Spacer(),
                              GestureDetector(
                                  onTap: () async {
                                    final call = Uri.parse(
                                        'tel:+91 ${widget.list.restaurantId.phone}');
                                    if (await canLaunchUrl(call)) {
                                      launchUrl(call);
                                    } else {
                                      throw 'Could not launch $call';
                                    }
                                  },
                                  child: Icon(Iconsax.call))
                            ],
                          ),
                          boxA1(),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    width: MediaQuery.of(context).size.width *
                                        0.42,
                                    child: Text(
                                      "ORDER ID \n#${widget.list.id}",
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 2,
                                      style: GoogleFonts.poppins(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w400),
                                    ),
                                  ),
                                  Row(children: [
                                    Text(
                                      "${widget.list.orderItems.first.quantity} X ",
                                      style: GoogleFonts.poppins(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w400),
                                    ),
                                    Text(widget.list.orderItems.first.item,
                                        style: GoogleFonts.poppins(
                                            fontWeight: FontWeight.w500))
                                  ]),
                                ],
                              ),
                              ElevatedButton(
                                style: ButtonStyle(
                                    backgroundColor: MaterialStateProperty.all(
                                        AppColors.redGradient)),
                                onPressed: () {},
                                child: Text(
                                  (widget.list.driverAcceptStatus == 1 &&
                                          widget.list.status == 3)
                                      ? "Pick Order"
                                      : "Preparing",
                                  style: GoogleFonts.poppins(fontSize: 12),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    )
                  : customContainer(
                      margin: EdgeInsets.only(left: 18.0, right: 18.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Deliver Here",
                            style: GoogleFonts.poppins(
                                color: AppColors.grey, fontSize: 12),
                          ),
                          boxA1(),
                          Row(
                            children: [
                              CircleAvatar(
                                radius: SizeConfig.Height * 0.024,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(100.0),
                                  child: CachedNetworkImage(
                                    fit: BoxFit.cover,
                                    imageUrl:
                                        "https://img.freepik.com/photos-premium/memoji-homme-heureux-fond-blanc-emoji_826801-6831.jpg",
                                    placeholder: (context, url) =>
                                        const CircularProgressIndicator(),
                                    errorWidget: (context, url, error) =>
                                        const Icon(Iconsax.user),
                                  ),
                                ),
                              ),
                              boxB1(),
                              Text(
                                "${widget.list.customerId.name}",
                                style: GoogleFonts.poppins(fontSize: 15.0),
                              ).paddingOnly(bottom: 3.0),
                              Spacer(),
                              GestureDetector(
                                  onTap: () async {
                                    final call = Uri.parse(
                                        'tel:+91 ${widget.list.customerId.phone}');
                                    if (await canLaunchUrl(call)) {
                                      launchUrl(call);
                                    } else {
                                      throw 'Could not launch $call';
                                    }
                                  },
                                  child: Icon(Iconsax.call))
                            ],
                          ),
                          boxA1(),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                      "Delivery at  \n🏡 ${widget.list.customerLocationId.locationSaveAs}",
                                      style: GoogleFonts.poppins(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w500)),
                                  Container(
                                    width: SizeConfig.Width * 0.45,
                                    child: Text(
                                      widget.list.customerLocationId.houseNo +
                                          " " +
                                          widget.list.customerLocationId.area +
                                          "\n" +
                                          widget
                                              .list.customerLocationId.address,
                                      style: GoogleFonts.poppins(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w400),
                                    ),
                                  ),
                                ],
                              ),
                              InkWell(
                                onTap: () {},
                                child: Container(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 10, vertical: 10),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      color: Colors.white,
                                      border: Border.all(
                                        color: AppColors.redGradient,
                                      )),
                                  child: Text(
                                    widget.list.status == 4
                                        ? "Deliver Order"
                                        : 'Order Delivered',
                                    style: GoogleFonts.poppins(
                                        fontSize: 12,
                                        color: AppColors.textBlack),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),

              //   boxA2(),
              //   // ITS YOU
              //  boxA3(),
              //   boxA3(),
            ],
          ),
        ),
      );
    });
  }
}
