import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hello_dish_driver/screens/order/ui/completed_otrders.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../utils/AppColors.dart';
import '../../../../utils/const.dart';
import '../../../../utils/mediaQuery.dart';
import '../../../../utils/sizedBox.dart';
import '../../controller/getalllcontroller.dart';

driverOrderCard(int index, onPressed,quantity,item,price,imgurl,productPrice,date,orderId) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Row(
        children: [
          Expanded(
            flex: 3,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      height: SizeConfig.Height * 0.024,
                      width: SizeConfig.Width * 0.01,
                      decoration: BoxDecoration(
                          color: AppColors.redGradient, borderRadius: BorderRadius.circular(100.0)),
                    ),
                    Text(
                      "Order not placed",
                      style: GoogleFonts.poppins(fontSize: 14, fontWeight: FontWeight.w500),
                    ).paddingOnly(left: 12.0)
                  ],
                ),
                boxA2(),
                Row(children: [
                  Text(
                    "$quantity X ",
                    style: GoogleFonts.poppins(fontSize: 12),
                  ),
                  Text(item, style: GoogleFonts.poppins(fontWeight: FontWeight.w500))
                ]),
                Text("₹ $price"),
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
                  imageUrl: imgurl??"https://assets.gqindia.com/photos/6213cbed18140d747a9b0a6e/16:9/w_1920,h_1080,c_limit/new%20restaurant%20menus%20in%20Mumbai.jpg",
                  placeholder: (context, url) => const CircularProgressIndicator(),
                  errorWidget: (context, url, error) => const Icon(Iconsax.user),
                ),
              ),
            ),
          ),
        ],
      ),
      Divider(
        color: AppColors.grey,
      ),
      Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Text("₹ $productPrice /- "),
        Text(formatDate(date),
            style: GoogleFonts.poppins(color: AppColors.grey, fontSize: 12))
      ]),
      boxA1(),
      boxA1(),
      Row(
        children: [
          InkWell(
            onTap: () {},
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white,
                  border: Border.all(color: AppColors.redGradient)),
              child: Text(
                'Reject (60 sec)',
                style: GoogleFonts.poppins(fontSize: 12, fontWeight: FontWeight.w500),
              ),
            ),
          ),
          boxB1(),
          ElevatedButton(
            onPressed: (){
              Get.find<GetAllOrderController>().getCollectOrder(orderId, 1);
              Get.find<GetAllOrderController>().getOrderList();
            },
            style: ButtonStyle(backgroundColor: MaterialStateProperty.all(AppColors.redGradient)),
            child: const Text("Accept"),
          ),
        ],
      ),
      boxA3(),
      customDevider(),
      boxA3(),
    ],
  );
}

driverOrdersCard({btn, onPressed}) {
  return GetBuilder<GetAllOrderController>(
    builder: (c) {
      if (c.allHomeOrderList?.value != null) {
        return ListView.builder(
            itemCount: c.allHomeOrderList?.value.data.length,
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            physics: const BouncingScrollPhysics(),
            itemBuilder: (BuildContext context, int index) {
              if(c.allHomeOrderList!=null){
              final list= c.allHomeOrderList!.value.data[index];
              return driverOrderCard(index, onPressed,list.orderItems[0].quantity,
                  list.orderItems[0].item,
                  list.orderItems[0].price,
                  list.orderItems[0].image,list.orderPrice,list.createdAt,list.id);}
              else{
                return Container();
              }
            });
      }
    else {
        return Container();
      }
  }
  );
}
