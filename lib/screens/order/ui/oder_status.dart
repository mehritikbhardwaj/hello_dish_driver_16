// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:hello_dish_driver/screens/order/components/rating_card.dart';
// import 'package:iconsax/iconsax.dart';

// import '../../../utils/AppColors.dart';
// import '../../../utils/const.dart';
// import '../../../utils/mediaQuery.dart';
// import '../../../utils/sizedBox.dart';
// import '../components/item_detail_card.dart';

// class OrderStatus extends StatelessWidget {
//   const OrderStatus({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         automaticallyImplyLeading: false,
//         title: Row(
//           mainAxisAlignment: MainAxisAlignment.start,
//           children: [
//             IconButton(
//                 iconSize: 25,
//                 alignment: Alignment.centerLeft,
//                 padding: EdgeInsets.zero,
//                 onPressed: () {
//                   Get.back();
//                 },
//                 icon: Icon(Iconsax.arrow_left_2)),
//             Text(
//               'Order #56664',
//               style: GoogleFonts.poppins(
//                 fontSize: 18.0,
//               ),
//             ),
//           ],
//         ),
//       ),
//       body: ListView(
//         children: [
//           boxA3(),
//           Row(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Expanded(
//                 flex: 3,
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Row(
//                       children: [
//                         Container(
//                           height: SizeConfig.Height * 0.024,
//                           width: SizeConfig.Width * 0.01,
//                           decoration: BoxDecoration(
//                               color: AppColors.redGradient,
//                               borderRadius: BorderRadius.circular(100.0)),
//                         ),
//                         Text(
//                           "Order ready to pick",
//                           style: GoogleFonts.poppins(fontSize: 12, fontWeight: FontWeight.w500),
//                         ).paddingOnly(left: 12.0)
//                       ],
//                     ),
//                     boxA2(),
//                     Row(children: [
//                       Text(
//                         "6 X ",
//                         style: GoogleFonts.poppins(
//                           fontSize: 12,
//                         ),
//                       ),
//                       Text("Dal fry", style: GoogleFonts.poppins(fontWeight: FontWeight.w500))
//                     ]),
//                     Text(
//                       "₹ 100",
//                       style: GoogleFonts.poppins(fontSize: 12),
//                     ),
//                     boxA2(),
//                   ],
//                 ),
//               ),
//               Expanded(
//                 flex: 1,
//                 child: SizedBox(
//                   height: SizeConfig.Height * 0.09,
//                   width: SizeConfig.Width * 0.18,
//                   child: ClipRRect(
//                     borderRadius: BorderRadius.circular(22.0),
//                     child: CachedNetworkImage(
//                       fit: BoxFit.cover,
//                       imageUrl:
//                           "https://assets.gqindia.com/photos/6213cbed18140d747a9b0a6e/16:9/w_1920,h_1080,c_limit/new%20restaurant%20menus%20in%20Mumbai.jpg",
//                       placeholder: (context, url) => const CircularProgressIndicator(),
//                       errorWidget: (context, url, error) => const Icon(Iconsax.user),
//                     ),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Row(children: [
//                 Text(
//                   "₹ 600 /- ",
//                   style: GoogleFonts.poppins(fontSize: 12),
//                 ),
//                 Text("Paid",
//                     style: GoogleFonts.poppins(
//                         color: AppColors.textBlack, fontWeight: FontWeight.w400))
//               ]),
//               Text("03 Feb 2023 at 11:07PM",
//                   style: GoogleFonts.poppins(color: AppColors.grey, fontSize: 12))
//             ],
//           ),
//           boxA1(),
//           boxA3(),
//           customDevider(),
//           boxA3(),
//           Row(
//             children: [
//               Column(
//                 children: [
//                   Container(
//                     height: 8,
//                     width: 8,
//                     decoration: BoxDecoration(
//                       color: AppColors.redGradient,
//                       shape: BoxShape.circle,
//                     ),
//                   ),
//                   Container(
//                     height: 24,
//                     width: 2,
//                     color: AppColors.redGradient,
//                   ),
//                   Container(
//                     height: 8,
//                     width: 8,
//                     decoration: BoxDecoration(
//                       color: AppColors.redGradient,
//                       shape: BoxShape.circle,
//                     ),
//                   ),
//                 ],
//               ),
//               boxB1(),
//               Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.start,
//                     children: [
//                       Text(
//                         'Outlet',
//                         style: GoogleFonts.poppins(fontWeight: FontWeight.w500, fontSize: 12),
//                       ),
//                       boxB2(),
//                       Text(
//                         'Bhakti nagar Circle',
//                         style: GoogleFonts.poppins(
//                             fontWeight: FontWeight.w400, fontSize: 12, color: AppColors.grey),
//                       ),
//                     ],
//                   ),
//                   boxA1(),
//                   Row(
//                     children: [
//                       Text(
//                         '31 mins',
//                         style: GoogleFonts.poppins(fontWeight: FontWeight.w500, fontSize: 12),
//                       ),
//                       boxB2(),
//                       RichText(
//                           text: TextSpan(
//                         children: <TextSpan>[
//                           TextSpan(
//                               text: 'Delivery at  🏡 Home by',
//                               style: GoogleFonts.poppins(
//                                   fontSize: 12,
//                                   fontWeight: FontWeight.w400,
//                                   color: AppColors.grey)),
//                           TextSpan(
//                               text: ' marasiya aakash',
//                               style: GoogleFonts.poppins(
//                                   fontSize: 12, fontWeight: FontWeight.w400, color: Colors.black)),
//                         ],
//                       )),
//                     ],
//                   ),
//                 ],
//               )
//             ],
//           ),
//           boxA3(),
//           customDevider(),
//           boxA3(),
//           ItemDetailCard(),
//           boxA3(),
//           YourRating(),
//         ],
//       ).paddingSymmetric(horizontal: 12),
//     );
//   }
// }
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';

import '../../../utils/AppColors.dart';
import '../../../utils/const.dart';
import '../../../utils/mediaQuery.dart';
import '../../../utils/sizedBox.dart';
import '../components/item_detail_card.dart';
import '../components/rating_card.dart';

class OrderStatus extends StatelessWidget {
  const OrderStatus({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
              'Order #56664',
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
            crossAxisAlignment: CrossAxisAlignment.start,
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
                            color: AppColors.redGradient,
                            borderRadius: BorderRadius.circular(100.0),
                          ),
                        ),
                        Text(
                          "Order ready to pick",
                          style: GoogleFonts.poppins(fontSize: 12, fontWeight: FontWeight.w500),
                        ).paddingOnly(left: 12.0)
                      ],
                    ),
                    boxA2(),
                    Row(
                      children: [
                        Text(
                          "6 X ",
                          style: GoogleFonts.poppins(
                            fontSize: 12,
                          ),
                        ),
                        Text("Dal fry", style: GoogleFonts.poppins(fontWeight: FontWeight.w500))
                      ],
                    ),
                    Text(
                      "₹ 100",
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
                      imageUrl:
                          "https://assets.gqindia.com/photos/6213cbed18140d747a9b0a6e/16:9/w_1920,h_1080,c_limit/new%20restaurant%20menus%20in%20Mumbai.jpg",
                      placeholder: (context, url) => const CircularProgressIndicator(),
                      errorWidget: (context, url, error) => const Icon(Iconsax.user),
                    ),
                  ),
                ),
              ),
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
                    "₹ 600 /- ",
                    style: GoogleFonts.poppins(fontSize: 12),
                  ),
                  Text("Paid",
                      style: GoogleFonts.poppins(
                          color: AppColors.textBlack, fontWeight: FontWeight.w400))
                ],
              ),
              Text("03 Feb 2023 at 11:07PM",
                  style: GoogleFonts.poppins(color: AppColors.grey, fontSize: 12))
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
                    style: GoogleFonts.poppins(fontWeight: FontWeight.w500, fontSize: 12),
                  ),
                  boxA1(),
                  Text(
                    '31 mins',
                    style: GoogleFonts.poppins(fontWeight: FontWeight.w500, fontSize: 12),
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
                              'Bhakti nagar Circle',
                              style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w400, fontSize: 12, color: AppColors.grey),
                            ),
                          ],
                        ),
                        boxA1(),
                        RichText(
                          text: TextSpan(
                            children: <TextSpan>[
                              TextSpan(
                                  text: 'Delivery at  🏡 Home by',
                                  style: GoogleFonts.poppins(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400,
                                      color: AppColors.grey)),
                              TextSpan(
                                  text: ' marasiya aakash',
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
          ItemDetailCard(),
          boxA3(),
          YourRating(),
        ],
      ).paddingSymmetric(horizontal: 12),
    );
  }
}
