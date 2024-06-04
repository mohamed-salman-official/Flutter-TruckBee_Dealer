import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:truckbee_flut/SupportFiles/asset_config.dart';
import 'package:truckbee_flut/SupportFiles/colors.dart';

import '../../CommonWidgets/custom_container.dart';
import '../../CommonWidgets/custom_text.dart';
import 'booking_list_controller.dart';
import 'cancelled_booking_list.dart';
import 'confirmed_booking_list.dart';
import 'waiting_booking_list.dart';

class BookingListScreen extends GetView<BookingListController> {
  final BookingListController controller = Get.put(BookingListController());
  BookingListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(430, 899),
      minTextAdapt: true,
      splitScreenMode: true,
      child: GetBuilder<BookingListController>(
          init: BookingListController(),
          builder: (controller) {
            return GestureDetector(
              child: DefaultTabController(
                length: 3,
                child: Scaffold(
                  appBar: AppBar(
                    backgroundColor: primaryColor,
                    title: CustomContainer(
                      alignment: Alignment.centerLeft,
                      margin: EdgeInsets.only(top: 10),
                      childWidget: CustomText(
                        "Bookings",
                        textColor: Colors.white,
                        textFamily: POPPINS_MEDIUM,
                        textSize: 20.sp,
                      ),
                    ),
                    bottom: TabBar(
                      tabAlignment: TabAlignment.center,
                      indicatorColor: secondaryColor,
                      labelColor: Colors.white,
                      tabs: [
                        Tab(
                          child: CustomContainer(
                            childWidget: Row(
                              children: [
                                CustomText(
                                  "Waiting",
                                  textColor: Colors.white,
                                  textFamily: POPPINS_MEDIUM,
                                  textSize: 13.sp,
                                  maxLine: 1,
                                ),
                                CustomContainer(
                                  boxColor: secondaryColor,
                                  borderRound: 10,
                                  height: 18,
                                  margin: EdgeInsets.only(left: 2),
                                  childWidget: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 5),
                                    child: CustomText(
                                      '${controller.waitingList.length}',
                                      textColor: Colors.white,
                                      textFamily: POPPINS_REGULAR,
                                      textSize: 11.sp,
                                      maxLine: 1,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Tab(
                          child: CustomContainer(
                            childWidget: Row(
                              children: [
                                CustomText(
                                  "Confirmed",
                                  textColor: Colors.white,
                                  textFamily: POPPINS_MEDIUM,
                                  textSize: 13.sp,
                                  maxLine: 1,
                                ),
                                CustomContainer(
                                  boxColor: secondaryColor,
                                  borderRound: 10,
                                  height: 18,
                                  margin: EdgeInsets.only(left: 2),
                                  childWidget: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 5),
                                    child: CustomText(
                                      '${controller.confirmedList.length}',
                                      textColor: Colors.white,
                                      textFamily: POPPINS_REGULAR,
                                      textSize: 11.sp,
                                      maxLine: 1,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Tab(
                          child: CustomContainer(
                            childWidget: Row(
                              children: [
                                CustomText(
                                  "Cancelled",
                                  textColor: Colors.white,
                                  textFamily: POPPINS_MEDIUM,
                                  textSize: 13.sp,
                                  maxLine: 1,
                                ),
                                CustomContainer(
                                  boxColor: secondaryColor,
                                  borderRound: 10,
                                  height: 18,
                                  margin: EdgeInsets.only(left: 2),
                                  childWidget: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 5),
                                    child: CustomText(
                                      '${controller.cancelledList.length}',
                                      textColor: Colors.white,
                                      textFamily: POPPINS_REGULAR,
                                      textSize: 11.sp,
                                      maxLine: 1,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  body: TabBarView(
                    children: [
                      WaitingBookingList(controller: controller),
                      ConfirmedBookingList(controller: controller),
                      CancelledBookingList(controller: controller),
                    ],
                  ),
                ),
              ),
            );
          }),
    );
  }
}
