import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grupchat/features/app/screens/screens.home/home.dart';
import 'package:grupchat/features/app/screens/screens.pools/pools.dart';
import 'package:grupchat/features/app/screens/screens.profile/profile.dart';
import 'package:grupchat/features/app/screens/screens.transactions/transactions.dart';

class BottomNavMenu extends StatelessWidget {
  const BottomNavMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final NavigationController navigationController =
        Get.put(NavigationController());

    return Scaffold(
      body: Obx(() => navigationController
          .screens[navigationController.selectedIndex.value]),
      bottomNavigationBar: Obx(
        () => NavigationBar(
          backgroundColor: Colors.white,
          indicatorColor: Colors.grey[300],
          selectedIndex: navigationController.selectedIndex.value,
          onDestinationSelected: (index) {
            navigationController.selectedIndex.value = index;
          },
          elevation: 0,
          destinations: const [
            NavigationDestination(
                icon: Icon(Icons.home_rounded), label: "Home"),
            NavigationDestination(
                icon: Icon(Icons.bubble_chart_rounded), label: "Pools"),
            NavigationDestination(
                icon: Icon(Icons.list), label: "Transactions"),
            NavigationDestination(icon: Icon(Icons.person), label: "Profile"),
          ],
        ),
      ),
    );
  }
}

class NavigationController extends GetxController {
  final RxInt selectedIndex = 0.obs;
  final screens = [
    HomeScreen(),
    PoolsScreen(),
    TransactionsScreen(),
    ProfileScreen(),
  ];
}
