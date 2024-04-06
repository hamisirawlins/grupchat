import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:grupchat/features/auth/screens/screens.onboarding/verify_email.dart';
import 'package:grupchat/utils/constants/colors.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {

//Bottom Nav functionalities
  bool showAddButton = true;
  int _selectedIndex = 0;
  final List<Widget> _pageList = <Widget>[
    const Center(
      child: VerifyEmailScreen(),
    ),
    const Center(
      child: Text("Create"),
    ),
    const Center(
      child: Text("Stats"),
    ),
    Center(
      child: GestureDetector(
          onTap: () async {
            await FirebaseAuth.instance.signOut();
          },
          child: const Text("Profile")),
    ),
  ];

  void _onNavTap(int index) {
    setState(() {
      _selectedIndex = index;

      //Show Add Button Conditionally
      if (index != 0) {
        showAddButton = false;
      } else {
        showAddButton = true;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: _pageList.elementAt(_selectedIndex)),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
                color: kPrimaryColor,
              ),
              label: "Home"),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.group_add_outlined,
                color: kPrimaryColor,
              ),
              label: "Create"),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.bubble_chart,
                color: kPrimaryColor,
              ),
              label: "Stats"),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person,
              color: kPrimaryColor,
            ),
            label: "Profile",
          )
        ],
        currentIndex: _selectedIndex,
        onTap: _onNavTap,
      ),
    );
  }
}
