import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hello_dish_driver/screens/home/controller/OrderTrackingController.dart';
import 'package:hello_dish_driver/screens/order/model/orderModel.dart';
import 'package:hello_dish_driver/utils/api_manager/apis.dart';
import 'package:hello_dish_driver/utils/utils.dart';
import 'package:iconsax/iconsax.dart';

import '../../../utils/AppColors.dart';
import '../../../utils/const.dart';
import '../../../utils/mediaQuery.dart';
import '../../../utils/sizedBox.dart';
import '../components/item_detail_card.dart';
import '../components/rating_card.dart';

class OrderStatus extends StatefulWidget {
  final DatumOrders list;

  OrderStatus({Key? key, required this.list}) : super(key: key);

  @override
  State<OrderStatus> createState() => _OrderStatusState();
}

class _OrderStatusState extends State<OrderStatus> {
  final OrderTrackingController orderTrackingController =
      Get.put(OrderTrackingController());

  getTime() async {
    orderTrackingController.getTimeAndDistanceFromAddress(
      await orderTrackingController.getAddressFromLatLng(
        LatLng(widget.list.lat, widget.list.long),
      ),
      await orderTrackingController.getAddressFromLatLng(LatLng(
          widget.list.restaurantId.restaurantLat,
          widget.list.restaurantId.restaurantLong)),
    );
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    getTime();
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            IconButton(
              iconSize: 25,
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.zero,
              onPressed: () {
                Get.back();
              },
              icon: Icon(Iconsax.arrow_left_2),
            ),
            Text(
              'Order Details',
              style: GoogleFonts.poppins(
                fontSize: 18.0,
              ),
            ),
          ],
        ),
      ),
      body: ListView(
        children: [
          boxA3(),
          Row(
            children: [
              Container(
                height: SizeConfig.Height * 0.024,
                width: SizeConfig.Width * 0.01,
                decoration: BoxDecoration(
                  color: AppColors.redGradient,
                  borderRadius: BorderRadius.circular(100.0),
                ),
              ),
              Text(
                "Order ready to pick",
                style: GoogleFonts.poppins(
                    fontSize: 12, fontWeight: FontWeight.w500),
              ).paddingOnly(left: 12.0)
            ],
          ),
          boxA2(),
          for (int i = 0; i < widget.list.orderItems.length; i++)
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        flex: 3,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text(
                                  "${widget.list.orderItems[i].quantity} X ",
                                  style: GoogleFonts.poppins(
                                    fontSize: 12,
                                  ),
                                ),
                                Text(widget.list.orderItems[i].item,
                                    style: GoogleFonts.poppins(
                                        fontWeight: FontWeight.w500))
                              ],
                            ),
                            Text(
                              "₹ " + widget.list.orderItems[i].price,
                              style: GoogleFonts.poppins(fontSize: 12),
                            ),
                            boxA2(),
                          ],
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: SizedBox(
                          height: SizeConfig.Height * 0.09,
                          width: SizeConfig.Width * 0.18,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(22.0),
                            child: CachedNetworkImage(
                              fit: BoxFit.cover,
                              imageUrl: APIs.imageUrl +
                                  widget.list.orderItems[i].image,
                              placeholder: (context, url) =>
                                  const CircularProgressIndicator(),
                              errorWidget: (context, url, error) => Image.network(
                                  "https://assets.gqindia.com/photos/6213cbed18140d747a9b0a6e/16:9/w_1920,h_1080,c_limit/new%20restaurant%20menus%20in%20Mumbai.jpg"),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                customDevider(),
              ],
            ),
          customDevider(),
          boxA1(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Text(
                    "₹ ${widget.list.totalCost.toStringAsFixed(2)} /- ",
                    style: GoogleFonts.poppins(fontSize: 12),
                  ),
                  Text(
                      widget.list.paymentType == "prepayment"
                          ? "Paid"
                          : "Unpaid",
                      style: GoogleFonts.poppins(
                          color: AppColors.textBlack,
                          fontWeight: FontWeight.w400))
                ],
              ),
              Text(Utils.convertTimestamp(widget.list.createdAt.toString()),
                  style:
                      GoogleFonts.poppins(color: AppColors.grey, fontSize: 12))
            ],
          ),
          boxA1(),
          boxA3(),
          customDevider(),
          boxA3(),
          Row(
            children: [
              Column(
                children: [
                  Container(
                    height: 8,
                    width: 8,
                    decoration: BoxDecoration(
                      color: AppColors.redGradient,
                      shape: BoxShape.circle,
                    ),
                  ),
                  Container(
                    height: 24,
                    width: 2,
                    color: AppColors.redGradient,
                  ),
                  Container(
                    height: 8,
                    width: 8,
                    decoration: BoxDecoration(
                      color: AppColors.redGradient,
                      shape: BoxShape.circle,
                    ),
                  ),
                ],
              ),
              boxB1(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Outlet',
                    style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w500, fontSize: 12),
                  ),
                  boxA1(),
                  Text(
                    orderTrackingController.timeLeft,
                    style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w500, fontSize: 12),
                  ),
                ],
              ),
              boxB1(),
              Expanded(
                flex: 2,
                child: Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              widget.list.restaurantId.restaurantName +
                                  " (" +
                                  widget.list.restaurantId.restaurantAddress +
                                  ")",
                              style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 12,
                                  color: AppColors.grey),
                            ),
                          ],
                        ),
                        boxA1(),
                        RichText(
                          text: TextSpan(
                            children: <TextSpan>[
                              TextSpan(
                                  text:
                                      'Delivery at  🏡 ${widget.list.customerLocationId.locationSaveAs.toString()} by',
                                  style: GoogleFonts.poppins(
                                      fontSize: 10,
                                      fontWeight: FontWeight.w400,
                                      color: AppColors.grey)),
                              TextSpan(
                                  text: ' ${widget.list.customerId.name}',
                                  style: GoogleFonts.poppins(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.black)),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          boxA3(),
          customDevider(),
          boxA3(),
          ItemDetailCard(
            totalPrice: (widget.list.orderPrice + widget.list.discountAmount)
                .toString(),
            deliveryCharge: widget.list.deliveryCharge.toStringAsFixed(2),
            gstCharge: widget.list.gstCharge.toStringAsFixed(2),
            packingCharge: widget.list.packingCharge.toString(),
            discountCharge: widget.list.discountAmount.toString(),
            paidTotal: widget.list.totalCost.toStringAsFixed(2),
          ),
          boxA3(),
          YourRating(
            rating: widget.list.driverRating.toDouble(),
            ratingText: '',
          ),
        ],
      ).paddingSymmetric(horizontal: 12),
    );
  }
}
