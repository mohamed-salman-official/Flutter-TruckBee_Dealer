import 'package:flutter/material.dart';
import 'package:truckbee_flut/Screens/BookingScreens/booking_list.dart';
import 'package:truckbee_flut/Screens/Dashboard/dashboard.dart';
import 'package:truckbee_flut/Screens/InboxScreens/inbox.dart';
import 'package:truckbee_flut/Screens/ProfileScreen/profile.dart';
import 'package:truckbee_flut/SupportFiles/asset_config.dart';
import 'package:truckbee_flut/SupportFiles/colors.dart';

class NavigationControllerScreen extends StatefulWidget {
  const NavigationControllerScreen({super.key});

  @override
  State<NavigationControllerScreen> createState() =>
      _NavigationControllerScreenState();
}

class _NavigationControllerScreenState
    extends State<NavigationControllerScreen> {
  int currentIndex = 0;

  void _changeTab(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  final mainScreens = [
    DashBoardScreen(),
    BookingListScreen(),
    InboxScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: currentIndex,
        children: mainScreens,
      ),
      bottomNavigationBar: Theme(
        data: (ThemeData(canvasColor: primaryColor)),
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: primaryColor,
          currentIndex: currentIndex,
          onTap: (index) => _changeTab(index),
          showSelectedLabels: false,
          showUnselectedLabels: false,
          selectedItemColor: secondaryColor,
          unselectedItemColor: Colors.white,
          iconSize: 30,
          items: [
            BottomNavigationBarItem(
                icon: ImageIcon(
                  AssetImage(HOME_NAV_ICON),
                ),
                label: "Home"),
            BottomNavigationBarItem(
                icon: ImageIcon(
                  AssetImage(BOOKING_NAV_ICON),
                ),
                label: "Booking"),
            BottomNavigationBarItem(
                icon: ImageIcon(
                  AssetImage(INBOX_NAV_ICON),
                ),
                label: "Inbox"),
            BottomNavigationBarItem(
                icon: ImageIcon(
                  AssetImage(PROFILE_NAV_ICON),
                ),
                label: "Profile"),
          ],
        ),
      ),
    );
  }
}
