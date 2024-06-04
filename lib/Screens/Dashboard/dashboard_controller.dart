import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Navigations/route_config.dart';
import '../../SupportFiles/asset_config.dart';

class DashBoardController extends GetxController with WidgetsBindingObserver {
  Future<void> onInit() async {
    super.onInit();
    WidgetsBinding.instance.addObserver(this);
  }

  List<MenuItem> quickAccessMenus = [
    MenuItem(
        name: "Trucks",
        iconName: TRUCKS_ICON,
        navigate: RouteName.TRUCKS_ROUTE,
        isVisible: true,
        argument: null),
    MenuItem(
        name: "Drivers",
        iconName: DRIVERS_ICON,
        navigate: RouteName.DRIVERS_ROUTE,
        isVisible: true,
        argument: null),
    MenuItem(
        name: "Fasttag",
        iconName: FASTTAG_ICON,
        navigate: RouteName.FASTTAG_ROUTE,
        isVisible: true,
        argument: null),
    MenuItem(
        name: "Payments",
        iconName: PAYMENT_ICON,
        navigate: RouteName.PAYMENTS_ROUTE,
        isVisible: true,
        argument: null),
  ];

  List<MenuItem> truckMenus = [
    MenuItem(
        name: "Add Truck",
        iconName: ADD_TRUCK_ICON,
        navigate: RouteName.ADD_TRUCK_ROUTE,
        isVisible: true,
        argument: null),
    MenuItem(
        name: "FC Trucks",
        iconName: FC_TRUCK_ICON,
        navigate: RouteName.FC_TRUCKS_ROUTE,
        isVisible: true,
        argument: null),
    MenuItem(
        name: "Truck Insurance",
        iconName: TRUCK_INSURANCE_ICON,
        navigate: RouteName.TRUCKS_INSURANCE_ROUTE,
        isVisible: true,
        argument: null),
  ];
  List<MenuItem> driverMenus = [
    MenuItem(
        name: "Add Driver",
        iconName: ADD_DRIVER_ICON,
        navigate: RouteName.ADD_DRIVER_ROUTE,
        isVisible: true,
        argument: null),
    MenuItem(
        name: "Expired Licences",
        iconName: EXPIRED_LICENSE_ICON,
        navigate: RouteName.EXPIRED_LISENCES_ROUTE,
        isVisible: true,
        argument: null),
    MenuItem(
        name: "Health Insurance",
        iconName: HEALTH_INSURANCE_ICON,
        navigate: RouteName.HEALTH_INSURANCE_ROUTE,
        isVisible: true,
        argument: null),
  ];

  int pageIndicatorIndex = 0;
  int tagSelected = 0;

  List<MenuItem> getMenus() {
    switch (tagSelected) {
      case 0:
        return quickAccessMenus;
      case 1:
        return truckMenus;
      case 2:
        return driverMenus;
      default:
        return []; // Default case
    }
  }

  final items = [
    Image.asset(LANDING_BANNER_IMAGE_1),
    Image.asset(LANDING_BANNER_IMAGE_2),
    Image.asset(LANDING_BANNER_IMAGE_3),
  ];

  int getItemRowHeight(int count) {
    if (count <= 3) {
      return 0 * 120;
    } else if (count <= 6) {
      return 1 * 120;
    } else if (count <= 9) {
      return 2 * 120;
    } else {
      return 0 * 120;
    }
  }
}

class MenuItem {
  String? name;
  String? iconName;
  String? navigate;
  bool? isVisible;
  dynamic argument;

  MenuItem(
      {this.name, this.iconName, this.navigate, this.isVisible, this.argument});

  MenuItem.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    iconName = json['iconName'];
    navigate = json['navigate'];
    isVisible = json['isVisible'];
    argument = json['argument'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['name'] = name;
    data['iconName'] = iconName;
    data['navigate'] = navigate;
    data['isVisible'] = isVisible;
    data['argument'] = argument;
    return data;
  }
}
