import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../SupportFiles/asset_config.dart';
import '../../SupportFiles/colors.dart';
import '../../SupportFiles/sizeconfig.dart';
import 'payments_controller.dart';

class PaymentScreen extends GetView<PaymentController> {
  final PaymentController controller = Get.put(PaymentController());
  PaymentScreen({super.key});

  final List _paymentTitle = [
    "Paid to Dealer Madhura transport",
    "Paid to Vehicle Insurance",
    "Paid to Fast Tag",
    "Paid to Vehicle Insurance",
    "Paid to Dealer Madhura transport",
    "Paid to Vehicle Insurance",
    "Paid to Fast Tag",
    "Paid to Vehicle Insurance",
    "Paid to Dealer Madhura transport",
    "Paid to Vehicle Insurance",
    "Paid to Fast Tag",
    "Paid to Vehicle Insurance",
  ];
  final List _paymentDate = [
    "26 Dec, 04: 20 PM",
    "26 Dec, 04: 20 PM",
    "26 Dec, 04: 20 PM",
    "26 Dec, 04: 20 PM",
    "26 Dec, 04: 20 PM",
    "26 Dec, 04: 20 PM",
    "26 Dec, 04: 20 PM",
    "26 Dec, 04: 20 PM",
    "26 Dec, 04: 20 PM",
    "26 Dec, 04: 20 PM",
    "26 Dec, 04: 20 PM",
    "26 Dec, 04: 20 PM",
  ];

  final List _paymentAmount = [
    "₹ 30,000",
    "₹ 30,000",
    "₹ 30,000",
    "₹ 30,000",
    "₹ 30,000",
    "₹ 30,000",
    "₹ 30,000",
    "₹ 30,000",
    "₹ 30,000",
    "₹ 30,000",
    "₹ 30,000",
    "₹ 30,000",
  ];

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PaymentController>(
      init: PaymentController(),
      builder: (controller) {
        SizeConfig().init(context);
        return Scaffold(
          body: Container(
            width: SizeConfig.screenW,
            height: SizeConfig.screenH,
            color: primaryColor,
            child: SafeArea(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    color: Colors.white,
                    height: SizeConfig.screenH! * 0.1,
                    width: SizeConfig.screenW,
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Row(
                      children: [
                        Container(
                          child: IconButton(
                              icon: ImageIcon(
                                AssetImage(BACK_ICON),
                              ),
                              iconSize: 50,
                              onPressed: () {
                                Get.back(); // And this!
                              }),
                        ),
                        SizedBox(width: 10),
                        Container(
                          child: Text(
                            "Payments",
                            style: TextStyle(
                                fontFamily: POPPINS_MEDIUM, fontSize: 16),
                          ),
                        ),
                        Spacer(),
                        Container(
                          child: IconButton(
                              icon: ImageIcon(
                                AssetImage(BACK_ICON),
                              ),
                              iconSize: 50,
                              onPressed: () {
                                // Get.back(); // And this!
                              }),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 2,
                    color: lineColor,
                  ),
                  Expanded(
                    child: Container(
                      width: SizeConfig.screenW,
                      padding: EdgeInsets.symmetric(vertical: 10),
                      color: Colors.white,
                      child: ListView.separated(
                        separatorBuilder: (context, index) => Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          child: Divider(
                            color: dividerColor.withOpacity(0.18),
                          ),
                        ),
                        itemCount: _paymentTitle.length,
                        itemBuilder: (BuildContext context, int index) {
                          return PaymentListItems(
                            title: _paymentTitle[index],
                            date: _paymentDate[index],
                            amount: _paymentAmount[index],
                          );
                        },
                      ),
                    ),
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

class PaymentListItems extends StatelessWidget {
  final String title;
  final String date;
  final String amount;

  const PaymentListItems(
      {super.key,
      required this.title,
      required this.date,
      required this.amount});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, top: 5, right: 10, bottom: 5),
      child: Container(
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10), color: lineColor),
        child: Row(
          children: [
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                        fontFamily: POPPINS_MEDIUM,
                        fontSize: 12,
                        color: primaryColor),
                  ),
                  Text(
                    date,
                    style: TextStyle(
                        fontFamily: POPPINS_REGULAR,
                        fontSize: 11,
                        color: primaryColor.withOpacity(0.65)),
                  ),
                ],
              ),
            ),
            Spacer(),
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    amount,
                    style: TextStyle(
                        fontFamily: POPPINS_MEDIUM,
                        fontSize: 16,
                        color: Colors.red),
                  ),
                  Row(
                    children: [
                      Text(
                        "Paid from",
                        style: TextStyle(
                            fontFamily: POPPINS_REGULAR,
                            fontSize: 9,
                            color: primaryColor.withOpacity(0.65)),
                      ),
                      SizedBox(width: 4),
                      CircleAvatar(
                        radius: 7,
                        backgroundImage: AssetImage(LANDING_BANNER_IMAGE_1),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
