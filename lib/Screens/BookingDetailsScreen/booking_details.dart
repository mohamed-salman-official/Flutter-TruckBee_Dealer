import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:truckbee_flut/SupportFiles/asset_config.dart';
import 'package:truckbee_flut/SupportFiles/colors.dart';

import '../../CommonWidgets/custom_container.dart';
import '../../CommonWidgets/custom_text.dart';
import 'booking_details_controller.dart';

class BookingDetailScreen extends GetView<BookingDetailsController> {
  @override
  final BookingDetailsController controller =
      Get.put(BookingDetailsController());

  BookingDetailScreen({super.key});

  final Color greyColor = Colors.grey.shade100;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<BookingDetailsController>(
        init: BookingDetailsController(),
        builder: (controller) {
          return WillPopScope(
            onWillPop: () async => Future.value(true),
            child: GestureDetector(
              child: CustomContainer(
                boxColor: Colors.white,
                childWidget: Scaffold(
                  appBar: AppBar(
                    title: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Expanded(
                          child: CustomText(
                            "Booking Details",
                            alignment: TextAlign.left,
                            textColor: primaryColor,
                            textFamily: POPPINS_MEDIUM,
                            textSize: 16.sp,
                          ),
                        ),
                      ],
                    ),
                    backgroundColor: Colors.white,
                    elevation: 0,
                    leading: Semantics(
                      child: Container(
                        padding: EdgeInsets.only(left: 10.0),
                        child: Transform.scale(
                          scale: 1.2,
                          child: IconButton(
                            icon: Image.asset(
                              BACK_ICON,
                              color: primaryColor,
                            ),
                            color: primaryColor,
                            onPressed: () {
                              Get.back();
                            },
                          ),
                        ),
                      ),
                    ),
                  ),
                  backgroundColor: Colors.transparent,
                  body: !controller.isApiLoaded
                      ? const SizedBox()
                      : SafeArea(
                          child: Column(
                            children: [
                              const Divider(
                                thickness: 2,
                              ),
                              CustomContainer(
                                height: 50.h,
                                childWidget: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 15),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      CustomText(
                                        "Booking ID",
                                        alignment: TextAlign.left,
                                        textColor:
                                            primaryColor.withOpacity(0.8),
                                        textFamily: POPPINS_MEDIUM,
                                        textSize: 15.sp,
                                      ),
                                      CustomText(
                                        controller.bookingDetailsData.id,
                                        alignment: TextAlign.left,
                                        textColor: primaryColor,
                                        textFamily: POPPINS_MEDIUM,
                                        textSize: 16.sp,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              bookingDetailsListViewWidget(context)
                            ],
                          ),
                        ),
                  bottomNavigationBar: controller.isButtonEnable!
                      ? BottomAppBar(
                          child: GestureDetector(
                            child: CustomContainer(
                              height: 40.h,
                              boxColor: secondaryColor,
                              borderRound: 10,
                              childWidget: CustomText(
                                "Assign Truck and Driver",
                                textColor: Colors.white,
                                textFamily: POPPINS_REGULAR,
                                textSize: 16.sp,
                              ),
                            ),
                            onTap: () {
                              // Get.toNamed(RouteName.ASSIGN_TRUCK_AND_DRIVER,
                              //     arguments:
                              //         controller.bookingDetailsData.id);
                              //TODO-Assign Truck and Driver
                            },
                          ),
                        )
                      : Wrap(),
                ),
              ),
            ),
          );
        });
  }

  Widget bookingDetailsListViewWidget(BuildContext context) {
    return Expanded(
      child: CustomContainer(
        childWidget: ListView(
          children: [
            requestDetailsWidget(),
            customerInfoWidget(context),
            receiverInfoWidget(context),
            paymentDetailsWidget()
          ],
        ),
      ),
    );
  }

  Widget requestDetailsWidget() {
    return GestureDetector(
      child: Padding(
        padding: EdgeInsets.only(left: 15, top: 10, right: 15, bottom: 10),
        child: CustomContainer(
          childWidget: controller.expandableArray[0] == true
              ? CustomContainer(
                  boxColor: lineColor,
                  borderColor: primaryColor,
                  borderWidth: 0.5,
                  borderRound: 10,
                  childWidget: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Column(
                      children: [
                        GestureDetector(
                          child: CustomContainer(
                            height: 50.h,
                            childWidget: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  CustomText(
                                    "Request Details",
                                    alignment: TextAlign.left,
                                    textColor: primaryColor,
                                    textFamily: POPPINS_MEDIUM,
                                    textSize: 17.sp,
                                  ),
                                  CustomContainer(
                                      width: 40.h,
                                      height: 40.h,
                                      childWidget: Transform.scale(
                                        scale: 0.7,
                                        child: Image.asset(DOWN_ARROW_ICON),
                                      ))
                                ],
                              ),
                            ),
                          ),
                          onTap: () {
                            refreshExpandableArray(0);
                          },
                        ),
                        const Divider(thickness: 1),
                        requestDetailsItemsWidget(
                          DATE_ICON,
                          "Pickup Date",
                          controller.convertStringDateToDifferentFormat(
                              "yyyy-MM-dd",
                              "EEE, dd MMM yyyy",
                              controller.bookingDetailsData.pickupDate ?? ""),
                        ),
                        drawDivider(),
                        requestDetailsPickupAndDropWidget(),
                        drawDivider(),
                        requestDetailsItemsWidget(TRUCK_TYPE_ICON, "Truck Type",
                            controller.bookingDetailsData.truckType ?? ""),
                        drawDivider(),
                        requestDetailsItemsWidget(
                            TRANSPORT_MODE_ICON,
                            "Transport Mode",
                            controller.bookingDetailsData.transportMode ?? ""),
                        drawDivider(),
                        requestDetailsItemsWidget(
                            CAR_TYPE_ICON,
                            "Car Type",
                            controller.bookingDetailsData.customergarage
                                    ?.carType ??
                                ""),
                        drawDivider(),
                        requestDetailsItemsWidget(
                            CAR_TYPE_ICON,
                            "Car Model",
                            controller.bookingDetailsData.customergarage
                                    ?.carModel ??
                                ""),
                      ],
                    ),
                  ),
                )
              : GestureDetector(
                  child: CustomContainer(
                    boxColor: lineColor,
                    borderColor: primaryColor,
                    borderWidth: 0.5,
                    borderRound: 10,
                    height: 50.h,
                    childWidget: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomText(
                            "Request Details",
                            alignment: TextAlign.left,
                            textColor: primaryColor,
                            textFamily: POPPINS_MEDIUM,
                            textSize: 17.sp,
                          ),
                          CustomContainer(
                              width: 40.h,
                              height: 40.h,
                              childWidget: Transform.scale(
                                scale: 0.7,
                                child: Image.asset(DOWN_ARROW_ICON),
                              ))
                        ],
                      ),
                    ),
                  ),
                  onTap: () {
                    refreshExpandableArray(0);
                  },
                ),
        ),
      ),
    );
  }

  Widget requestDetailsItemsWidget(
      String iconName, String title, String description) {
    return CustomContainer(
      height: 60.h,
      childWidget: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Row(
          children: [
            CustomContainer(
              height: 45.h,
              width: 45.h,
              childWidget: Transform.scale(
                scale: 1.5.h,
                child: CircleAvatar(
                  backgroundColor: Colors.white,
                  child: Image.asset(
                    iconName,
                    fit: BoxFit.fitHeight,
                    width: 30.h,
                    height: 30.h,
                  ),
                ),
              ),
            ),
            const SizedBox(width: 20),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Flexible(
                  child: CustomText(
                    title,
                    alignment: TextAlign.left,
                    textColor: primaryColor,
                    textFamily: POPPINS_MEDIUM,
                    textSize: 16.sp,
                  ),
                ),
                Flexible(
                  child: CustomText(
                    description,
                    alignment: TextAlign.left,
                    textColor: primaryColor.withOpacity(0.7),
                    textFamily: POPPINS_MEDIUM,
                    textSize: 15.sp,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget requestDetailsPickupAndDropWidget() {
    return CustomContainer(
      height: 170.h,
      childWidget: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomContainer(
                    height: 45.h,
                    width: 45.h,
                    childWidget: CircleAvatar(
                      backgroundColor: Colors.white,
                      child: Image.asset(
                        PIN_START_ICON,
                        width: 30.h,
                        height: 30.h,
                      ),
                    ),
                  ),
                  Expanded(
                    child: VerticalDivider(
                      color: primaryColor,
                    ),
                  ),
                  CustomContainer(
                    height: 45.h,
                    width: 45.h,
                    childWidget: CircleAvatar(
                      backgroundColor: Colors.white,
                      child: Image.asset(
                        PIN_END_ICON,
                        width: 30.h,
                        height: 30.h,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 20),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomContainer(
                    height: 85.h,
                    alignment: Alignment.centerLeft,
                    childWidget: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Flexible(
                          child: CustomText(
                            "Pickup Address",
                            textColor: primaryColor,
                            textFamily: POPPINS_MEDIUM,
                            textSize: 16.sp,
                          ),
                        ),
                        Flexible(
                          child: CustomText(
                            controller.bookingDetailsData.pickupLocation ?? "",
                            alignment: TextAlign.left,
                            textColor: primaryColor.withOpacity(0.7),
                            textFamily: POPPINS_MEDIUM,
                            textSize: 14.sp,
                            maxLine: 2,
                          ),
                        ),
                      ],
                    ),
                  ),
                  CustomContainer(
                    height: 85.h,
                    alignment: Alignment.centerLeft,
                    childWidget: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Flexible(
                          child: CustomText(
                            "Delivery Address",
                            textColor: primaryColor,
                            textFamily: POPPINS_MEDIUM,
                            textSize: 16.sp,
                          ),
                        ),
                        Flexible(
                          child: CustomText(
                            controller.bookingDetailsData.dropoffLocation ?? "",
                            alignment: TextAlign.left,
                            textColor: primaryColor.withOpacity(0.7),
                            textFamily: POPPINS_MEDIUM,
                            textSize: 14.sp,
                            maxLine: 2,
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget drawDivider() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15),
      child: Divider(thickness: 1, color: primaryColor.withOpacity(0.11)),
    );
  }

  Widget customerInfoWidget(BuildContext context) {
    return GestureDetector(
      child: Padding(
        padding: EdgeInsets.only(left: 15, top: 10, right: 15, bottom: 10),
        child: CustomContainer(
          childWidget: controller.expandableArray[1] == true
              ? CustomContainer(
                  boxColor: lineColor,
                  borderColor: primaryColor,
                  borderWidth: 0.5,
                  borderRound: 10,
                  childWidget: Column(
                    children: [
                      GestureDetector(
                        child: CustomContainer(
                          height: 50.h,
                          childWidget: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                CustomText(
                                  "Customer Info",
                                  alignment: TextAlign.left,
                                  textColor: primaryColor,
                                  textFamily: POPPINS_MEDIUM,
                                  textSize: 17.sp,
                                ),
                                CustomContainer(
                                    width: 40.h,
                                    height: 40.h,
                                    childWidget: Transform.scale(
                                      scale: 0.7,
                                      child: Image.asset(DOWN_ARROW_ICON),
                                    ))
                              ],
                            ),
                          ),
                        ),
                        onTap: () {
                          refreshExpandableArray(1);
                        },
                      ),
                      const Divider(thickness: 1),
                      CustomContainer(
                        height: 120.h,
                        childWidget: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.only(left: 15),
                                child: CustomContainer(
                                  alignment: Alignment.centerLeft,
                                  childWidget: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      CustomText(
                                        "Customer Name",
                                        alignment: TextAlign.left,
                                        textColor:
                                            Colors.black.withOpacity(0.65),
                                        textFamily: POPPINS_MEDIUM,
                                        textSize: 16.sp,
                                      ),
                                      const SizedBox(height: 10),
                                      CustomText(
                                        controller.bookingDetailsData.customer
                                                ?.name ??
                                            "",
                                        alignment: TextAlign.left,
                                        textColor: Colors.black,
                                        textFamily: POPPINS_MEDIUM,
                                        textSize: 16.sp,
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            GestureDetector(
                              child: CustomContainer(
                                width: 80.w,
                                alignment: Alignment.center,
                                childWidget: CustomContainer(
                                  width: 50.w,
                                  height: 50.h,
                                  borderRound: 25.r,
                                  boxColor: Colors.green,
                                  childWidget: Transform.scale(
                                    scale: 1,
                                    child: Icon(Icons.call_outlined),
                                  ),
                                ),
                              ),
                              onTap: () {
                                controller.openDialPad(
                                    "${controller.bookingDetailsData.customer?.phone ?? ""}");
                              },
                            ),
                            GestureDetector(
                              child: CustomContainer(
                                width: 80.w,
                                alignment: Alignment.center,
                                childWidget: CustomContainer(
                                  width: 50.w,
                                  height: 50.h,
                                  borderRound: 25.r,
                                  boxColor: Colors.blue,
                                  childWidget: Transform.scale(
                                    scale: 1,
                                    child: Icon(Icons.message_outlined),
                                  ),
                                ),
                              ),
                              onTap: () {
                                controller.sendMessage(context,
                                    "${controller.bookingDetailsData.customer?.phone ?? ""}");
                              },
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                )
              : GestureDetector(
                  child: CustomContainer(
                    boxColor: lineColor,
                    borderColor: primaryColor,
                    borderWidth: 0.5,
                    borderRound: 10,
                    height: 50.h,
                    childWidget: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomText(
                            "Customer Info",
                            alignment: TextAlign.left,
                            textColor: primaryColor,
                            textFamily: POPPINS_MEDIUM,
                            textSize: 17.sp,
                          ),
                          CustomContainer(
                              width: 40.h,
                              height: 40.h,
                              childWidget: Transform.scale(
                                scale: 0.7,
                                child: Image.asset(DOWN_ARROW_ICON),
                              ))
                        ],
                      ),
                    ),
                  ),
                  onTap: () {
                    refreshExpandableArray(1);
                  },
                ),
        ),
      ),
    );
  }

  Widget receiverInfoWidget(BuildContext context) {
    return GestureDetector(
      child: Padding(
        padding: EdgeInsets.only(left: 15, top: 10, right: 15, bottom: 10),
        child: CustomContainer(
          childWidget: controller.expandableArray[2] == true
              ? CustomContainer(
                  boxColor: lineColor,
                  borderColor: primaryColor,
                  borderWidth: 0.5,
                  borderRound: 10,
                  childWidget: Column(
                    children: [
                      GestureDetector(
                        child: CustomContainer(
                          height: 50.h,
                          childWidget: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                CustomText(
                                  "Receiver Info",
                                  alignment: TextAlign.left,
                                  textColor: primaryColor,
                                  textFamily: POPPINS_MEDIUM,
                                  textSize: 17.sp,
                                ),
                                CustomContainer(
                                    width: 40.w,
                                    height: 40.h,
                                    childWidget: Transform.scale(
                                      scale: 0.7,
                                      child: Image.asset(DOWN_ARROW_ICON),
                                    ))
                              ],
                            ),
                          ),
                        ),
                        onTap: () {
                          refreshExpandableArray(2);
                        },
                      ),
                      const Divider(thickness: 1),
                      CustomContainer(
                        height: 120.h,
                        childWidget: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 15),
                                child: CustomContainer(
                                  alignment: Alignment.centerLeft,
                                  childWidget: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      CustomText(
                                        "Receiver Name",
                                        alignment: TextAlign.left,
                                        textColor:
                                            Colors.black.withOpacity(0.65),
                                        textFamily: POPPINS_MEDIUM,
                                        textSize: 16.sp,
                                      ),
                                      const SizedBox(height: 10),
                                      CustomText(
                                        controller.bookingDetailsData.receiver
                                                ?.name ??
                                            "Null",
                                        alignment: TextAlign.left,
                                        textColor: Colors.black,
                                        textFamily: POPPINS_MEDIUM,
                                        textSize: 16.sp,
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            GestureDetector(
                              child: CustomContainer(
                                width: 80.w,
                                alignment: Alignment.center,
                                childWidget: CustomContainer(
                                  width: 50.w,
                                  height: 50.h,
                                  borderRound: 25.r,
                                  boxColor: Colors.green,
                                  childWidget: Transform.scale(
                                    scale: 1,
                                    child: Icon(Icons.call_outlined),
                                  ),
                                ),
                              ),
                              onTap: () {
                                controller.openDialPad(
                                    "${controller.bookingDetailsData.receiver?.phone ?? ""}");
                              },
                            ),
                            GestureDetector(
                              child: CustomContainer(
                                width: 80.w,
                                alignment: Alignment.center,
                                childWidget: CustomContainer(
                                  width: 50.w,
                                  height: 50.h,
                                  borderRound: 25.r,
                                  boxColor: Colors.blue,
                                  childWidget: Transform.scale(
                                    scale: 1,
                                    child: Icon(Icons.message_outlined),
                                  ),
                                ),
                              ),
                              onTap: () {
                                controller.sendMessage(context,
                                    "${controller.bookingDetailsData.receiver?.phone ?? ""}");
                              },
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                )
              : GestureDetector(
                  child: CustomContainer(
                    boxColor: lineColor,
                    borderColor: primaryColor,
                    borderWidth: 0.5,
                    borderRound: 10,
                    height: 50.h,
                    childWidget: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomText(
                            "Receiver Info",
                            alignment: TextAlign.left,
                            textColor: primaryColor,
                            textFamily: POPPINS_MEDIUM,
                            textSize: 17.sp,
                          ),
                          CustomContainer(
                              width: 40.w,
                              height: 40.h,
                              childWidget: Transform.scale(
                                scale: 0.7,
                                child: Image.asset(DOWN_ARROW_ICON),
                              ))
                        ],
                      ),
                    ),
                  ),
                  onTap: () {
                    refreshExpandableArray(2);
                  },
                ),
        ),
      ),
    );
  }

  Widget paymentDetailsWidget() {
    return GestureDetector(
      child: Padding(
        padding: EdgeInsets.only(left: 15, top: 10, right: 15, bottom: 10),
        child: CustomContainer(
          childWidget: controller.expandableArray[3] == true
              ? CustomContainer(
                  boxColor: lineColor,
                  borderColor: primaryColor,
                  borderWidth: 0.5,
                  borderRound: 10,
                  childWidget: Column(
                    children: [
                      GestureDetector(
                        child: CustomContainer(
                          height: 50.h,
                          childWidget: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                CustomText(
                                  "Payment Details",
                                  alignment: TextAlign.left,
                                  textColor: primaryColor,
                                  textFamily: POPPINS_MEDIUM,
                                  textSize: 17.sp,
                                ),
                                CustomContainer(
                                    width: 40.w,
                                    height: 40.h,
                                    childWidget: Transform.scale(
                                      scale: 0.7,
                                      child: Image.asset(DOWN_ARROW_ICON),
                                    ))
                              ],
                            ),
                          ),
                        ),
                        onTap: () {
                          refreshExpandableArray(3);
                        },
                      ),
                      const Divider(thickness: 1),
                      CustomContainer(
                        height: 100.h,
                        childWidget: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  CustomText(
                                    "Quote Amount",
                                    alignment: TextAlign.left,
                                    textColor: primaryColor.withOpacity(0.7),
                                    textFamily: POPPINS_MEDIUM,
                                    textSize: 15.sp,
                                  ),
                                  CustomText(
                                    "\$ ${controller.bookingDetailsData.amount}",
                                    alignment: TextAlign.left,
                                    textColor: primaryColor,
                                    textFamily: POPPINS_MEDIUM,
                                    textSize: 16.sp,
                                  )
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  CustomText(
                                    "50% Amount Paid",
                                    alignment: TextAlign.left,
                                    textColor: Colors.green,
                                    textFamily: POPPINS_MEDIUM,
                                    textSize: 15.sp,
                                  ),
                                  CustomText(
                                    "\$ ${((controller.bookingDetailsData.amount ?? 0) / 2).toInt()}",
                                    alignment: TextAlign.left,
                                    textColor: Colors.green,
                                    textFamily: POPPINS_MEDIUM,
                                    textSize: 16.sp,
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              : GestureDetector(
                  child: CustomContainer(
                    boxColor: lineColor,
                    borderColor: primaryColor,
                    borderWidth: 0.5,
                    borderRound: 10,
                    height: 50.h,
                    childWidget: Padding(
                      padding: const EdgeInsets.only(left: 10, right: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomText(
                            "Payment Details",
                            alignment: TextAlign.left,
                            textColor: primaryColor,
                            textFamily: POPPINS_MEDIUM,
                            textSize: 17.sp,
                          ),
                          CustomContainer(
                              width: 40.w,
                              height: 40.h,
                              childWidget: Transform.scale(
                                scale: 0.7,
                                child: Image.asset(DOWN_ARROW_ICON),
                              ))
                        ],
                      ),
                    ),
                  ),
                  onTap: () {
                    refreshExpandableArray(3);
                  },
                ),
        ),
      ),
    );
  }

  refreshExpandableArray(int index) {
    if (!controller.expandableArray[index]) {
      controller.expandableArray.replaceRange(
          0,
          controller.expandableArray.length,
          controller.expandableArray.map((element) => false));
      controller.expandableArray[index] = !controller.expandableArray[index];
    } else {
      controller.expandableArray[index] = !controller.expandableArray[index];
    }
    controller.update();
  }
}
