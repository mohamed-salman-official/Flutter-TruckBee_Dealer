import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../CommonWidgets/custom_text.dart';
import '../../CommonWidgets/search_widgets.dart';
import '../../SupportFiles/asset_config.dart';
import '../../SupportFiles/colors.dart';
import 'booking_list_controller.dart';

class ConfirmedBookingList extends StatefulWidget {
  ConfirmedBookingList({super.key, required this.controller});
  final BookingListController controller;

  @override
  State<StatefulWidget> createState() => _ConfirmedBookingList();
}

class _ConfirmedBookingList extends State<ConfirmedBookingList> {
  final BookingListController controller = Get.put(BookingListController());

  var query;
  @override
  void initState() {
    super.initState();
    // controller.getBookingConfirmedList();
  }

  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        itemCount: controller.confirmedList.length,
        scrollDirection: Axis.vertical,
        itemBuilder: (BuildContext context, int index) {
          var data = controller.confirmedList[index];
          return Container(
            margin: EdgeInsets.only(left: 15, top: 10, right: 15, bottom: 10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(
                    Radius.circular(10.0)), // Set rounded corner radius
                boxShadow: [
                  BoxShadow(color: Colors.grey.withOpacity(0.25))
                ] // Make rounded corner of border
                ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin:
                      EdgeInsets.only(left: 15, top: 15, right: 15, bottom: 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomText(
                              "Date",
                              textColor: primaryColor.withOpacity(0.7),
                              textFamily: POPPINS_MEDIUM,
                              textSize: 14.sp,
                              maxLine: 2,
                              alignment: TextAlign.left,
                            ),
                            CustomText(
                              controller.convertBookingDateFormat(
                                  "yyyy-MM-dd", "dd MMM yyyy", data.pickupDate),
                              textColor: primaryColor,
                              textWeight: FontWeight.w500,
                              textFamily: POPPINS_MEDIUM,
                              textSize: 16.sp,
                              maxLine: 2,
                              alignment: TextAlign.left,
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.40,
                        margin: EdgeInsets.only(
                            left: 5, top: 0, right: 0, bottom: 0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            CustomText(
                              data.truckType,
                              textColor: primaryColor.withOpacity(0.7),
                              textFamily: POPPINS_MEDIUM,
                              textSize: 14.sp,
                              maxLine: 2,
                              alignment: TextAlign.right,
                            ),
                            Container(
                              child: CustomText(
                                "BMW Q7",
                                textColor: primaryColor,
                                textFamily: POPPINS_MEDIUM,
                                textSize: 15.sp,
                                alignment: TextAlign.right,
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),
                Container(
                  margin:
                      EdgeInsets.only(left: 10, top: 10, right: 10, bottom: 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Column(
                            children: [
                              CircleAvatar(
                                backgroundColor: Colors.green,
                                radius: 5,
                              ),
                              SizedBox(
                                height: 60.h,
                                child: VerticalDivider(
                                  color: Colors.grey,
                                  thickness: 1,
                                ),
                              ),
                              CircleAvatar(
                                radius: 5,
                                backgroundColor: Colors.red,
                              ),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Pick up Address",
                                style: TextStyle(
                                  color: primaryColor.withOpacity(0.7),
                                  fontFamily: POPPINS_REGULAR,
                                  fontSize: 12.sp,
                                ),
                                textAlign: TextAlign.left,
                                maxLines: 1,
                              ),
                              SizedBox(
                                width: 160.w,
                                child: Text(
                                  data.pickupLocation ?? "",
                                  style: TextStyle(
                                    color: primaryColor,
                                    fontFamily: POPPINS_REGULAR,
                                    fontSize: 14.sp,
                                  ),
                                  textAlign: TextAlign.left,
                                  softWrap: true,
                                ),
                              ),
                              SizedBox(
                                height: 30,
                              ),
                              Text(
                                "Drop off Address",
                                style: TextStyle(
                                  color: primaryColor.withOpacity(0.7),
                                  fontFamily: POPPINS_REGULAR,
                                  fontSize: 12.sp,
                                ),
                                textAlign: TextAlign.left,
                                maxLines: 1,
                              ),
                              SizedBox(
                                width: 160.w,
                                child: Text(
                                  data.dropoffLocation ?? "",
                                  style: TextStyle(
                                    color: primaryColor,
                                    fontFamily: POPPINS_REGULAR,
                                    fontSize: 14.sp,
                                  ),
                                  textAlign: TextAlign.left,
                                  softWrap: true,
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                      Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                "Approx.kms",
                                style: TextStyle(
                                  color: primaryColor.withOpacity(0.7),
                                  fontFamily: POPPINS_REGULAR,
                                  fontSize: 12.sp,
                                ),
                                textAlign: TextAlign.right,
                                maxLines: 1,
                              ),
                              SizedBox(
                                width: 100.w,
                                height: 36.h,
                                child: Text(
                                  data.totalkm.toString(),
                                  style: TextStyle(
                                    color: primaryColor,
                                    fontFamily: POPPINS_REGULAR,
                                    fontSize: 14.sp,
                                  ),
                                  textAlign: TextAlign.right,
                                  maxLines: 2,
                                ),
                              ),
                              SizedBox(
                                height: 30,
                              ),
                              Text(
                                "Quote Amt",
                                style: TextStyle(
                                  color: primaryColor.withOpacity(0.7),
                                  fontFamily: POPPINS_REGULAR,
                                  fontSize: 12.sp,
                                ),
                                textAlign: TextAlign.right,
                                maxLines: 1,
                              ),
                              SizedBox(
                                width: 100.w,
                                height: 36.h,
                                child: Text(
                                  data.amount != null
                                      ? "\$" + '${data.amount}'
                                      : "nil",
                                  style: TextStyle(
                                    color: primaryColor,
                                    fontFamily: POPPINS_REGULAR,
                                    fontSize: 14.sp,
                                  ),
                                  textAlign: TextAlign.right,
                                  maxLines: 2,
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 5.h,
                ),
                Divider(
                  thickness: 1,
                ),
                Container(
                  height: 75.h,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          'Cancel',
                          style: TextStyle(color: Colors.red),
                        ),
                      ),
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          'Waiting for customer payment',
                          style: TextStyle(
                            color: Colors.green,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          );
        });
  }

  Widget buildSearch() => SearchWidget(
        text: query,
        hintText: 'Search',
        onChanged: searchBook,
      );

  void searchBook(String query) {
    final bookings;
    // if (query.isNotEmpty) {
    //   bookings = controller.bookingList.where((book) {
    //     final pickupLower = book.bookings?.toLowerCase();
    //     final dropLower = book.bookings?.toLowerCase();
    //     final statusLower = book.status?.toLowerCase();
    //     final searchLower = query.toLowerCase();
    //
    //     return pickupLower!.contains(searchLower) ||
    //         dropLower!.contains(searchLower) ||
    //         statusLower!.contains(searchLower);
    //   }).toList();
    // } else {
    //   bookings = controller.getBookingList() as List<Results>;
    // }

    this.query = query;
    // controller.bookingList = bookings;
    controller.update();
  }
}
