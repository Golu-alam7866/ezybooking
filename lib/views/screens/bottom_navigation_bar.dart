import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import 'home/home_screen.dart';
import 'booking/booking_screen.dart';
import 'search/search_screen.dart';
import 'profile/profile_screen.dart';
import 'service/service_screen.dart';

class BottomNavBarWidget extends StatefulWidget {
  const BottomNavBarWidget({super.key});

  @override
  State<BottomNavBarWidget> createState() => _BottomNavBarWidgetState();
}

class _BottomNavBarWidgetState extends State<BottomNavBarWidget> {
  int _selectedIndex = 0;

  final List<Widget> _screens = [
    HomeScreen(),
    BookingScreen(),
    SearchScreen(),
    ServicesScreen(),
    ProfileScreen(),
  ];


  Future<bool> _onWillPop()async{
    if(_selectedIndex == 4 || _selectedIndex == 3 || _selectedIndex == 2 || _selectedIndex == 1){
      setState(() {
        _selectedIndex = 0;
      });
      return false;
    }else if(_selectedIndex == 0){
      return true;
    }else{
      setState(() {
        _selectedIndex = 0;
      });
      return false;
    }
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        body: _screens[_selectedIndex],
        bottomNavigationBar: Container(
          decoration: BoxDecoration(
            color: Colors.black,
            boxShadow: [
              BoxShadow(
                color: Colors.black26,
                blurRadius: 10,
                spreadRadius: 2,
              ),
            ],
          ),
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: SalomonBottomBar(
            currentIndex: _selectedIndex,
            onTap: _onItemTapped,
            selectedItemColor: Colors.blueAccent,
            unselectedItemColor: Colors.grey.shade600,
            margin: const EdgeInsets.symmetric(vertical: 10),
            curve: Curves.easeInOut,
            items: [
              SalomonBottomBarItem(
                icon: const Icon(Icons.home),
                title: const Text("Home"),
                selectedColor: Colors.blueAccent,
              ),
              SalomonBottomBarItem(
                icon: const Icon(CupertinoIcons.briefcase_fill),
                title: const Text("Booking"),
                selectedColor: Colors.greenAccent,
              ),
              SalomonBottomBarItem(
                icon: const Icon(Icons.search),
                title: const Text("Search"),
                selectedColor: Colors.orangeAccent,
              ),
              SalomonBottomBarItem(
                icon: const Icon(Icons.settings_input_svideo_rounded),
                title: const Text("Services"),
                selectedColor: Colors.purpleAccent,
              ),
              SalomonBottomBarItem(
                icon: const Icon(Icons.person),
                title: const Text("Profile"),
                selectedColor: Colors.redAccent,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
