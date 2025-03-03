import 'package:ecomerce_app/constants/theme_constants.dart';
import 'package:ecomerce_app/views/bag_screen.dart';
import 'package:ecomerce_app/views/favorites_screen.dart';
import 'package:ecomerce_app/views/home_screen.dart';
import 'package:ecomerce_app/views/shop_screen.dart';
import 'package:ecomerce_app/views/user_profile_screen.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    HomeScreen(),
    ShopScreen(),
    BagScreen(),
    FavoritesScreen(),
    UserProfileScreen()
  ];

  void _onItemTapped(int index){
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child:  Container(
          child: _pages[_selectedIndex],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        elevation: 0,
        backgroundColor: Colors.white,
        selectedItemColor: AppColors.primaryColor,
        unselectedItemColor: Colors.grey,
        items: <BottomNavigationBarItem> [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              size: 32,
            ),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.shopping_cart,
              size: 32,
            ),
            label: "Shop",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_bag, size: 32),
            label: "Bag",          
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite, size: 32),
            label: "Favorites",          
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_pin_circle_sharp, size: 32),
            label: "Profile",          
          )
        ],
      ),
    );
  }
}