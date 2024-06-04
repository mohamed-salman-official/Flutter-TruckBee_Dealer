import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:truckbee_flut/Navigations/route_config.dart';
import 'package:truckbee_flut/Screens/Dashboard/dashboard_controller.dart';
import 'package:truckbee_flut/SupportFiles/asset_config.dart';
import 'package:truckbee_flut/SupportFiles/colors.dart';
import 'package:truckbee_flut/SupportFiles/sizeconfig.dart';

import '../../CommonWidgets/alert_dialog.dart';
import '../../CommonWidgets/custom_container.dart';
import '../../SupportFiles/common_utils.dart';

class DashBoardScreen extends GetView<DashBoardController> {
  @override
  final DashBoardController controller = Get.put(DashBoardController());
  DashBoardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return GetBuilder<DashBoardController>(
        init: DashBoardController(),
        builder: (controller) {
          SizeConfig().init(context);
          return GestureDetector(
            child: CustomContainer(
              boxColor: Colors.grey[300],
              childWidget: Scaffold(
                drawer: NavigationDrawer(),
                appBar: AppBar(
                  leading: Builder(builder: (context) {
                    return IconButton(
                      icon: ImageIcon(
                        AssetImage(MENU_ICON),
                        color: Colors.white,
                      ),
                      iconSize: 20,
                      onPressed: () =>
                          Scaffold.of(context).openDrawer(), // And this!
                    );
                  }),
                  backgroundColor: primaryColor,
                  title: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                                text: 'Truck',
                                style: TextStyle(
                                    fontSize: 23,
                                    fontWeight: FontWeight.bold,
                                    color: secondaryColor)),
                            TextSpan(
                              text: ' bee',
                              style: TextStyle(
                                  fontSize: 23,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.green),
                            ),
                          ],
                        ),
                      ),
                      Text(' Dealer',
                          style: TextStyle(fontSize: 12, color: Colors.white)),
                    ],
                  ),
                  actions: <Widget>[
                    IconButton(
                      icon: ImageIcon(
                        AssetImage(NOTIFICATION_ICON),
                        color: Colors.white,
                      ),
                      iconSize: 20,
                      onPressed: () {
                        // do something
                      },
                    )
                  ],
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.vertical(
                      bottom: Radius.circular(5),
                    ),
                  ),
                ),
                body: Container(
                  width: double.infinity,
                  height: double.infinity,
                  color: Colors.white,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: SafeArea(
                      child: Column(
                        children: [
                          SizedBox(height: 15),
                          Container(
                            width: double.infinity,
                            margin: EdgeInsets.symmetric(horizontal: 15),
                            decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(6)),
                                color: primaryColor),
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 10, top: 10, right: 5, bottom: 10),
                                  child: Row(
                                    children: [
                                      Container(
                                        width: 25,
                                        height: 25,
                                        child: Image.asset(
                                          ALERT_EXCLAM_MARK,
                                        ),
                                      ),
                                      SizedBox(width: 10),
                                      Text(
                                        "Assigned quote amount was",
                                        style: TextStyle(
                                            color: Colors.grey,
                                            fontSize: 12.sp,
                                            fontFamily: POPPINS_REGULAR),
                                      ),
                                      Text(
                                        "₹ 39, 999",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 12.sp,
                                            fontFamily: POPPINS_MEDIUM),
                                      ),
                                      Expanded(child: SizedBox.shrink()),
                                      Container(
                                        width: 30,
                                        height: 30,
                                        child: IconButton(
                                          onPressed: () {},
                                          icon: ImageIcon(
                                              AssetImage(ALERT_CLOSE_ICON)),
                                          color: secondaryColor,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 15),
                                  child: Row(
                                    children: [
                                      Container(
                                        width: 40,
                                        height: 40,
                                        child: Image.asset(
                                          ALERT_TRUCK_ICON,
                                        ),
                                      ),
                                      SizedBox(width: 10),
                                      Text(
                                        "Open Truck",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 12.sp,
                                            fontFamily: POPPINS_MEDIUM),
                                      ),
                                      Expanded(child: SizedBox.shrink()),
                                      Container(
                                        width: 20,
                                        height: 20,
                                        child: Image.asset(
                                          ALERT_ROUTE_ICON,
                                        ),
                                      ),
                                      SizedBox(width: 5),
                                      Text(
                                        "Coimbatore",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 12.sp,
                                            fontFamily: POPPINS_MEDIUM),
                                      ),
                                      SizedBox(width: 5),
                                      Container(
                                        width: 25,
                                        height: 25,
                                        child: Image.asset(
                                          ALERT_RIGHT_ARROW_ICON,
                                        ),
                                      ),
                                      SizedBox(width: 5),
                                      Text(
                                        "Chennai",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 12.sp,
                                            fontFamily: POPPINS_MEDIUM),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(15),
                                  child: Row(
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text("Ride starts at",
                                              style: TextStyle(
                                                  color: Colors.grey,
                                                  fontSize: 12.sp,
                                                  fontFamily: POPPINS_LIGHT)),
                                          SizedBox(height: 2),
                                          Text(
                                            "13 Feb 2023",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 12.sp,
                                                fontFamily: POPPINS_REGULAR),
                                          ),
                                        ],
                                      ),
                                      Expanded(child: SizedBox.shrink()),
                                      ElevatedButton(
                                        child: Text(
                                          "Assign Truck and Driver",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 12.sp,
                                              fontFamily: POPPINS_REGULAR),
                                        ),
                                        style: ElevatedButton.styleFrom(
                                            backgroundColor: secondaryColor,
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(4))),
                                        onPressed: () {
                                          // Get.toNamed(RouteName.MEMBERSHIP_ROUTE);
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 15),
                          Container(
                            child: CarouselSlider.builder(
                              options: CarouselOptions(
                                viewportFraction: 0.8,
                                autoPlay: false,
                                aspectRatio: 18 / 8,
                                enlargeCenterPage: true,
                                onPageChanged: (index, reason) {
                                  controller.pageIndicatorIndex = index;
                                  controller.update();
                                },
                              ),
                              itemCount: controller.items.length,
                              itemBuilder: (context, index, realindex) =>
                                  Container(child: controller.items[index]),
                            ),
                          ),
                          DotsIndicator(
                            dotsCount: controller.items.length,
                            position: controller.pageIndicatorIndex.toDouble(),
                            decorator: DotsDecorator(
                              color: Colors.grey,
                              activeColor: Colors.black,
                              size: Size(7, 7),
                            ),
                          ),
                          SizedBox(height: 15),
                          Container(
                            width: double.infinity,
                            height: 80,
                            margin: EdgeInsets.symmetric(horizontal: 15),
                            decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(6)),
                              gradient: LinearGradient(
                                begin: AlignmentDirectional.centerStart,
                                end: Alignment.centerRight,
                                colors: [lenearStart, lenearEnd],
                              ),
                            ),
                            child: Row(
                              children: [
                                SizedBox(width: 10),
                                Container(
                                  alignment: Alignment(0, -70),
                                  width: 20,
                                  height: 20,
                                  child: Image.asset(MEMBERSHIP_GLITTER_BLACK),
                                ),
                                SizedBox(width: 10),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Membership Plan",
                                      style: TextStyle(fontSize: 15),
                                    ),
                                    Text(
                                      "Active plan today.",
                                      style: TextStyle(fontSize: 11),
                                    )
                                  ],
                                ),
                                SizedBox(width: 10),
                                Container(
                                  alignment: Alignment(0, 70),
                                  width: 20,
                                  height: 20,
                                  child: Image.asset(MEMBERSHIP_GLITTER_WHITE),
                                ),
                                Expanded(child: SizedBox.shrink()),
                                ElevatedButton(
                                  child: Text(
                                    "Buy Now",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor: secondaryColor,
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10))),
                                  onPressed: () {
                                    Get.toNamed(RouteName.MEMBERSHIP_ROUTE);
                                  },
                                ),
                                SizedBox(width: 10),
                              ],
                            ),
                          ),
                          SizedBox(height: 15),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                  color: Colors.grey.shade300),
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              child: Column(
                                children: [
                                  SizedBox(height: 10),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Container(
                                        width:
                                            MediaQuery.of(context).size.width /
                                                    3 -
                                                25,
                                        child: TextButton(
                                          onPressed: () {
                                            controller.tagSelected = 0;
                                            controller.update();
                                          },
                                          style: ButtonStyle(
                                              backgroundColor:
                                                  MaterialStateProperty.all(
                                                      controller.tagSelected ==
                                                              0
                                                          ? primaryColor
                                                          : buttonGreyColor)),
                                          child: Text(
                                            "Quick Access",
                                            style: TextStyle(
                                                fontSize: 11,
                                                color:
                                                    controller.tagSelected == 0
                                                        ? Colors.white
                                                        : Colors.black),
                                          ),
                                        ),
                                      ),
                                      Container(
                                        width:
                                            MediaQuery.of(context).size.width /
                                                    3 -
                                                25,
                                        child: TextButton(
                                          style: ButtonStyle(
                                              backgroundColor:
                                                  MaterialStateProperty.all(
                                                      controller.tagSelected ==
                                                              1
                                                          ? primaryColor
                                                          : buttonGreyColor)),
                                          onPressed: () {
                                            controller.tagSelected = 1;
                                            controller.update();
                                          },
                                          child: Text(
                                            "Truck",
                                            style: TextStyle(
                                                fontSize: 11,
                                                color:
                                                    controller.tagSelected == 1
                                                        ? Colors.white
                                                        : Colors.black),
                                          ),
                                        ),
                                      ),
                                      Container(
                                        width:
                                            MediaQuery.of(context).size.width /
                                                    3 -
                                                25,
                                        child: TextButton(
                                          style: ButtonStyle(
                                              backgroundColor:
                                                  MaterialStateProperty.all(
                                                      controller.tagSelected ==
                                                              2
                                                          ? primaryColor
                                                          : buttonGreyColor)),
                                          onPressed: () {
                                            controller.tagSelected = 2;
                                            controller.update();
                                          },
                                          child: Text(
                                            "Driver",
                                            style: TextStyle(
                                                fontSize: 11,
                                                color:
                                                    controller.tagSelected == 2
                                                        ? Colors.white
                                                        : Colors.black),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 10),
                                  Container(
                                    height: (controller.getItemRowHeight(
                                            controller.getMenus().length)) +
                                        120,
                                    child: GridView.builder(
                                      itemCount: controller.getMenus().length,
                                      gridDelegate:
                                          SliverGridDelegateWithFixedCrossAxisCount(
                                              crossAxisCount: 3,
                                              crossAxisSpacing: 10,
                                              mainAxisSpacing: 20),
                                      itemBuilder: (context, index) {
                                        final item = controller
                                            .getMenus()
                                            .elementAt(index);
                                        return GestureDetector(
                                          onTap: () {
                                            if (item.isVisible!) {
                                              if (item.argument != null) {
                                                Get.toNamed(item.navigate!,
                                                    arguments: item.argument);
                                              } else {
                                                Get.toNamed(item.navigate!);
                                              }
                                            }
                                          },
                                          child: Card(
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Image.asset(
                                                  item.iconName!,
                                                  height: 25,
                                                  width: 50,
                                                ),
                                                SizedBox(height: 5),
                                                Text(
                                                  item.name!,
                                                  style:
                                                      TextStyle(fontSize: 10),
                                                ),
                                              ],
                                            ),
                                          ),
                                        );
                                      },
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                          SizedBox(height: 10),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          );
        });
  }
}

class NavigationDrawer extends StatelessWidget {
  const NavigationDrawer({super.key});

  @override
  Widget build(BuildContext context) => Drawer(
        child: Expanded(
          child: SingleChildScrollView(
            child: Column(
              children: [buildHeader(context), buildMenuItems(context)],
            ),
          ),
        ),
      );

  Widget buildHeader(BuildContext context) => Container(
        height: SizeConfig.screenH! * 0.2,
        child: SafeArea(
          child: Padding(
            padding:
                const EdgeInsets.only(top: 10, bottom: 10, left: 15, right: 15),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: primaryColor,
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    padding: EdgeInsets.all(10),
                    child: CircleAvatar(
                      radius: 40,
                      backgroundImage: AssetImage(LANDING_BANNER_IMAGE_1),
                    ),
                  ),
                  Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "John Doe",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontFamily: POPPINS_MEDIUM),
                        ),
                        SizedBox(height: 5),
                        Text(
                          "+91 677564543",
                          style: TextStyle(
                              color: Colors.white.withOpacity(0.64),
                              fontSize: 13,
                              fontFamily: POPPINS_REGULAR),
                        ),
                      ],
                    ),
                  ),
                  Spacer(),
                  Container(
                    child: IconButton(
                      icon: ImageIcon(
                        AssetImage(RIGHT_ARROW_WHITE_ICON),
                        color: Colors.white,
                      ),
                      iconSize: 20,
                      onPressed: () {},
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
  Widget buildMenuItems(BuildContext context) => Container(
      height: SizeConfig.screenH! * 0.75,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(15),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.grey.withOpacity(0.3),
              ),
              child: Column(
                children: [
                  ListTile(
                    trailing: ImageIcon(
                      AssetImage(RIGHT_ARROW_WHITE_ICON),
                      color: primaryColor,
                      size: 15,
                    ),
                    title: Text(
                      "Bookings",
                      style:
                          TextStyle(fontFamily: POPPINS_REGULAR, fontSize: 14),
                    ),
                    onTap: () {},
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Divider(color: Colors.grey.withOpacity(0.5)),
                  ),
                  ListTile(
                    trailing: ImageIcon(
                      AssetImage(RIGHT_ARROW_WHITE_ICON),
                      color: primaryColor,
                      size: 15,
                    ),
                    title: Text(
                      "Booking Request",
                      style:
                          TextStyle(fontFamily: POPPINS_REGULAR, fontSize: 14),
                    ),
                    onTap: () {},
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Divider(color: Colors.grey.withOpacity(0.5)),
                  ),
                  ListTile(
                    trailing: ImageIcon(
                      AssetImage(RIGHT_ARROW_WHITE_ICON),
                      color: primaryColor,
                      size: 15,
                    ),
                    title: Text(
                      "Manage Membership",
                      style:
                          TextStyle(fontFamily: POPPINS_REGULAR, fontSize: 14),
                    ),
                    onTap: () {},
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Divider(color: Colors.grey.withOpacity(0.5)),
                  ),
                  ListTile(
                    trailing: ImageIcon(
                      AssetImage(RIGHT_ARROW_WHITE_ICON),
                      color: primaryColor,
                      size: 15,
                    ),
                    title: Text(
                      "Help and Support",
                      style:
                          TextStyle(fontFamily: POPPINS_REGULAR, fontSize: 14),
                    ),
                    onTap: () {},
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Divider(color: Colors.grey.withOpacity(0.5)),
                  ),
                  ListTile(
                    trailing: ImageIcon(
                      AssetImage(RIGHT_ARROW_WHITE_ICON),
                      color: primaryColor,
                      size: 15,
                    ),
                    title: Text(
                      "Contact Us",
                      style:
                          TextStyle(fontFamily: POPPINS_REGULAR, fontSize: 14),
                    ),
                    onTap: () {},
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Divider(color: Colors.grey.withOpacity(0.5)),
                  ),
                  ListTile(
                    trailing: ImageIcon(
                      AssetImage(RIGHT_ARROW_WHITE_ICON),
                      color: primaryColor,
                      size: 15,
                    ),
                    title: Text(
                      "Settings",
                      style:
                          TextStyle(fontFamily: POPPINS_REGULAR, fontSize: 14),
                    ),
                    onTap: () {},
                  )
                ],
              ),
            ),
          ),
          Expanded(
            child: Padding(
                padding: const EdgeInsets.all(15),
                child: Container(
                  child: Column(
                    children: [
                      Spacer(),
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: secondaryColor),
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                        child: TextButton(
                          onPressed: () {
                            CustomAlert(context,
                                titleText: TitleText(
                                    name: "",
                                    sematics: "",
                                    key: 'logout_alert_title_text'),
                                contentText: ContentText(
                                    name: "Are you sure you want to logout?",
                                    sematics: "",
                                    key: 'logout_alert_description_text'),
                                okButton: OKButton(
                                    name: "YES",
                                    action: () async {
                                      Session().logout();
                                    },
                                    sematics: "YES",
                                    key: 'logout_yes_alert_btn'),
                                cancelButton: CancelButton(
                                    name: "NO",
                                    action: () {
                                      Get.back();
                                    },
                                    sematics: "NO",
                                    key: 'logout_no_alert_btn'),
                                valKey: 'logout_alert');
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              ImageIcon(
                                AssetImage(LOGOUT_ICON),
                                color: secondaryColor,
                              ),
                              Spacer(),
                              Text(
                                "Log Out",
                                style: TextStyle(
                                    fontSize: 16,
                                    fontFamily: POPPINS_MEDIUM,
                                    color: secondaryColor),
                              ),
                              Spacer(),
                            ],
                          ),
                        ),
                      ),
                      Container(
                          padding: EdgeInsets.symmetric(vertical: 10),
                          child: Text(
                            "V_0.0.1",
                            style: (TextStyle(
                                fontFamily: POPPINS_REGULAR, fontSize: 14)),
                          ))
                    ],
                  ),
                )),
          ),
        ],
      ));
}
