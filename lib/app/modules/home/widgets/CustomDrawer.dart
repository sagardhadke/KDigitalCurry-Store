import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kdigital_curry_ecom/app/utils/constants/app_colors.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../routes/app_pages.dart';
import '../../../services/auth_service.dart';

class CustomDrawer extends StatefulWidget {
  @override
  State<CustomDrawer> createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  final FirebaseService authService = Get.find<FirebaseService>();
  RxString userName = ''.obs;
  RxString email = ''.obs;
  @override
  void initState() {
    super.initState();
    fetchUser();
    print("username $userName");
    print("email $email");
  }

  Future<void> fetchUser() async {
    final pref = await SharedPreferences.getInstance();
    email.value = pref.getString("Email") ?? 'abc@gmail.com';
    userName.value = pref.getString("userName") ?? '';
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          UserAccountsDrawerHeader(
            accountName: Obx(
              () => Text(
                userName.value,
                style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
              ),
            ),
            accountEmail: Obx(
              () => Text(
                email.value,
                style: TextStyle(fontSize: 16.sp),
              ),
            ),
            currentAccountPicture: CircleAvatar(
              backgroundColor: MyAppColors.primaryColor,
              backgroundImage: AssetImage("assets/icons/kDigitalCurryLogo.png"),
            ),
            decoration: BoxDecoration(
              color: MyAppColors.primaryColor,
            ),
          ),
          _drawerItem(Icons.shopping_bag_outlined, "My Orders",
              () => Get.toNamed(Routes.ADD_TO_CART)),
          _drawerItem(Icons.favorite_border, "My Wishlist", () => {}),
          _drawerItem(Icons.location_on_outlined, "My Address", () {}),
          _drawerItem(Icons.headset_mic_outlined, "Contact Us", () {}),
          Divider(thickness: 1, color: Colors.grey[300]),
          _drawerItem(Icons.exit_to_app, "Logout", () {
            Get.defaultDialog(
              title: "Logout",
              middleText: "Are you sure you want to logout?",
              textConfirm: "Yes",
              textCancel: "No",
              confirmTextColor: Colors.white,
              buttonColor: Colors.red,
              onConfirm: () async {
                await authService.logout();
                Get.offAllNamed(Routes.LOGIN);
                final pref = await SharedPreferences.getInstance();
                pref.remove('Email');
                pref.remove('userName');
              },
            );
          }),
        ],
      ),
    );
  }

  Widget _drawerItem(IconData icon, String text, VoidCallback onTap) {
    return ListTile(
      leading: Icon(icon, size: 26, color: Colors.black54),
      title: Text(
        text,
        style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w500),
      ),
      onTap: onTap,
    );
  }
}
