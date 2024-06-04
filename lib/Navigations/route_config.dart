import 'package:get/get.dart';
import 'package:truckbee_flut/Navigations/binding.dart';
import 'package:truckbee_flut/Screens/BookingScreens/booking_list.dart';
import 'package:truckbee_flut/Screens/Dashboard/dashboard.dart';
import 'package:truckbee_flut/Screens/Dashboard/membership.dart';
import 'package:truckbee_flut/Screens/DriverMenuScreens/add_driver.dart';
import 'package:truckbee_flut/Screens/DriverMenuScreens/expired_licenses.dart';
import 'package:truckbee_flut/Screens/DriverMenuScreens/health_insurance.dart';
import 'package:truckbee_flut/Screens/InboxScreens/inbox.dart';
import 'package:truckbee_flut/Screens/LoginScreens/forget_password.dart';
import 'package:truckbee_flut/Screens/LoginScreens/new_password.dart';
import 'package:truckbee_flut/Screens/LoginScreens/otp_verification.dart';
import 'package:truckbee_flut/Screens/ProfileScreen/edit_profile.dart';
import 'package:truckbee_flut/Screens/ProfileScreen/profile.dart';
import 'package:truckbee_flut/Screens/QuickAccessMenuScreens/drivers.dart';
import 'package:truckbee_flut/Screens/QuickAccessMenuScreens/fasttag.dart';
import 'package:truckbee_flut/Screens/QuickAccessMenuScreens/payments.dart';
import 'package:truckbee_flut/Screens/QuickAccessMenuScreens/trucks.dart';
import 'package:truckbee_flut/Screens/TruckMenuScreens/add_Truck.dart';
import 'package:truckbee_flut/Screens/TruckMenuScreens/fc_truck.dart';
import 'package:truckbee_flut/Screens/TruckMenuScreens/truck_insurance.dart';

import '../Screens/BookingDetailsScreen/booking_details.dart';
import '../Screens/LoginScreens/login.dart';
import '../Screens/navigation_controller.dart';

abstract class RouteName {
  // Login Routes
  static const LOGIN_ROUTE = '/login_screen';
  static const FORGOT_PASSWORD_ROUTE = '/forgot_password_screen';
  static const NEW_PASSWORD_ROUTE = '/new_password_screen';
  static const OTP_VERIFICATION_ROUTE = '/otp_screen';

  static const NAVIGATION_CONTROLLER_ROUTE = '/navigation_controller_screen';

  // Navigation Bar Routes
  static const DASHBOARD_ROUTE = '/dashboard_screen';
  static const BOOKING_List_ROUTE = '/booking_list_screen';
  static const INBOX_ROUTE = '/inbox_screen';
  static const PROFILE_ROUTE = '/profile_screen';

  // Booking Screen Routes
  static const BOOKING_DETAILS_ROUTE = '/booking_details_screen';
  static const ASSIGN_TRUCK_DRIVER_ROUTE = '/assign_truck_driver_screen';

  // MemberShip Routes
  static const MEMBERSHIP_ROUTE = '/membership_screen';
  // Edit Profile Screen
  static const EDITPROFILE_ROUTE = '/editprofile_screen';

  /* Quick Access menu Screens*/
  static const TRUCKS_ROUTE = '/trucks_screen';
  static const DRIVERS_ROUTE = '/drivers_screen';
  static const FASTTAG_ROUTE = '/fasttag_screen';
  static const PAYMENTS_ROUTE = '/payments_screen';

  /* Trucks menu Screens*/
  static const ADD_TRUCK_ROUTE = '/add_truck_screen';
  static const FC_TRUCKS_ROUTE = '/fc_trucks_screen';
  static const TRUCKS_INSURANCE_ROUTE = '/truck_insurance_screen';

  /* Drivers menu Screens*/
  static const ADD_DRIVER_ROUTE = '/add_driver_screen';
  static const EXPIRED_LISENCES_ROUTE = '/expired_license_screen';
  static const HEALTH_INSURANCE_ROUTE = '/health_insurance_screen';
}

class RouteCollection {
  static final routeCollections = [
    GetPage(
      name: RouteName.LOGIN_ROUTE,
      page: () => LoginScreen(),
      binding: LoginScreenBinding(),
    ),
    GetPage(
      name: RouteName.FORGOT_PASSWORD_ROUTE,
      page: () => ForgetPasswordScreen(),
    ),
    GetPage(
      name: RouteName.NEW_PASSWORD_ROUTE,
      page: () => NewPasswordScreen(),
    ),
    GetPage(
      name: RouteName.OTP_VERIFICATION_ROUTE,
      page: () => OTPVerificationScreen(),
    ),
    GetPage(
      name: RouteName.NAVIGATION_CONTROLLER_ROUTE,
      page: () => NavigationControllerScreen(),
    ),
    GetPage(
      name: RouteName.DASHBOARD_ROUTE,
      page: () => DashBoardScreen(),
      binding: DashBoardScreenBinding(),
    ),
    GetPage(
      name: RouteName.MEMBERSHIP_ROUTE,
      page: () => MembershipScreen(),
    ),
    GetPage(
      name: RouteName.BOOKING_List_ROUTE,
      page: () => BookingListScreen(),
    ),
    GetPage(
      name: RouteName.BOOKING_DETAILS_ROUTE,
      page: () => BookingDetailScreen(),
      binding: BookingDetailBinding(),
    ),
    GetPage(
      name: RouteName.INBOX_ROUTE,
      page: () => InboxScreen(),
    ),
    GetPage(
      name: RouteName.PROFILE_ROUTE,
      page: () => ProfileScreen(),
    ),
    GetPage(
      name: RouteName.EDITPROFILE_ROUTE,
      page: () => EditProfileScreen(),
    ),
    /* Quick Access menu Screens*/
    GetPage(
      name: RouteName.TRUCKS_ROUTE,
      page: () => TrucksScreen(),
    ),
    GetPage(
      name: RouteName.DRIVERS_ROUTE,
      page: () => DriversScreen(),
    ),
    GetPage(
      name: RouteName.FASTTAG_ROUTE,
      page: () => FastTagScreen(),
    ),
    GetPage(
      name: RouteName.PAYMENTS_ROUTE,
      page: () => PaymentScreen(),
    ),

    /* Truck menu Screens*/
    GetPage(
      name: RouteName.ADD_TRUCK_ROUTE,
      page: () => AddTruckScreen(),
    ),
    GetPage(
      name: RouteName.FC_TRUCKS_ROUTE,
      page: () => FCTruckScreen(),
    ),
    GetPage(
      name: RouteName.TRUCKS_INSURANCE_ROUTE,
      page: () => TruckInsuranceScreen(),
    ),

    /* Driver menu Screens*/
    GetPage(
      name: RouteName.ADD_DRIVER_ROUTE,
      page: () => AddDriverScreen(),
    ),
    GetPage(
      name: RouteName.EXPIRED_LISENCES_ROUTE,
      page: () => ExpiredLicenseScreen(),
    ),
    GetPage(
      name: RouteName.HEALTH_INSURANCE_ROUTE,
      page: () => HealthInsuranceScreen(),
    ),
  ];
}
