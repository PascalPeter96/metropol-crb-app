import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:metropol_mawanda_peter/features/auth/data/auth_repository.dart';
import 'package:metropol_mawanda_peter/features/auth/presentation/controllers/auth_controller.dart';
import 'package:metropol_mawanda_peter/features/dashboard/presentation/screens/dashboard_logout_screen.dart';
import 'package:metropol_mawanda_peter/features/dashboard/presentation/screens/dashboard_screen.dart';
import 'package:metropol_mawanda_peter/theme/app_theme.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shared_preferences/shared_preferences.dart';



class DashboardBottomNavBar extends ConsumerStatefulWidget {
  const DashboardBottomNavBar({super.key});

  @override
  ConsumerState createState() => _DashboardBottomNavBarState();
}

class _DashboardBottomNavBarState extends ConsumerState<DashboardBottomNavBar> {

  int currentIndex = 0;

  selectedIndex(int value) {
    setState(() {
      currentIndex = value;
    });
  }

  String token = '';

  updateData() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? fcm = prefs.getString('fcm');
    checkAndAddUserFcmToken(ref.watch(currentUserProvider)!.uid, fcm.toString());
    debugPrint('dash fcm $fcm');
  }

  Future<void> requestNotificationPermissions() async {
    final PermissionStatus status = await Permission.notification.request();
    if (status.isGranted) {
      // Notification permissions granted
    } else if (status.isDenied) {
      // Notification permissions denied
    } else if (status.isPermanentlyDenied) {
      // Notification permissions permanently denied, open app settings
      await openAppSettings();
    }
  }

  checkAwesomePermissions() async {
    await AwesomeNotifications().isNotificationAllowed().then((isAllowed) {
      if (!isAllowed) {//
        // This is just a basic example. For real apps, you must show some
        // friendly dialog box before call the request method.
        // This is very important to not harm the user experience
        AwesomeNotifications().requestPermissionToSendNotifications();
      }
    });
  }


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    updateData();
    checkAwesomePermissions();
    requestNotificationPermissions();
  }

  @override
  Widget build(BuildContext context) {

    final screens = [
      DashboardScreen(),
      Scaffold(body: Image.asset('assets/images/metropol10years.jpg', fit: BoxFit.fill, height: MediaQuery.sizeOf(context).height,),),
      DashboardLogoutScreen()

    ];

    return Scaffold(
      // extendBody: true,
      backgroundColor: Colors.white,
      body: screens[currentIndex],
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 2.h),
          child: GNav(
            rippleColor: Colors.grey[300]!,
            hoverColor: Colors.grey[100]!,
            gap: 8,
            activeColor: AppTheme.primaryColor,
            iconSize: 24,
            padding: EdgeInsets.symmetric(horizontal: 1.w, vertical: 1.h),

            duration: Duration(milliseconds: 400),
            tabBackgroundColor: Colors.grey[100]!,
            color: Colors.black,
            tabs: [
              GButton(
                icon: Icons.home,
                text: 'Dashboard',
              ),
              GButton(
                icon: Icons.settings,
                text: 'Settings',
              ),
              GButton(
                icon: Icons.logout,
                text: 'Log Out',
              ),

            ],
            selectedIndex: currentIndex,
            onTabChange: (index) {
              selectedIndex(index);
            },
          ),
        ),
      ),
    );
  }
}
