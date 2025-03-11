import 'package:connectivity_plus/connectivity_plus.dart';
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
    UserProfileScreen(),
  ];

  @override
  void initState() {
    super.initState();
  }

  // Handle bottom navigation item selection
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: StreamBuilder(
          stream: Connectivity().onConnectivityChanged, 
          builder: (context, AsyncSnapshot<ConnectivityResult> snapshot) {
            print(snapshot);
            if(snapshot.hasData) {
              ConnectivityResult? result = snapshot.data;
              if(result == ConnectivityResult.mobile) {
                return buildConnected("Mobile");
              } else if(result == ConnectivityResult.wifi){
                return  _pages[_selectedIndex];
              }
            }
            return buildNoConenction();
          }
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
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home, size: 32),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart, size: 32),
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
          ),
        ],
      ),
    );
  }
}

Widget buildLoadingWidget() {
  return Center(
    child: CircularProgressIndicator(
      valueColor: AlwaysStoppedAnimation<Color>(AppColors.primaryColor),
    ),
  );
}

Widget buildConnected(String type) {
  return Center(
    child: Text("${type} Connected "),
  );
}

Widget buildNoConenction() {
  return Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(Icons.signal_wifi_statusbar_connected_no_internet_4_outlined, size: 100, color: AppColors.primaryColor),
        SizedBox(height: 20),
        Text(
          'No Internet Connection',
          style: TextStyle(fontSize: 20, color: Colors.red),
        ),
        Text(
          "Please check your network connection",
          style: TextStyle(
            color: Colors.grey
          ),
        ),
        SizedBox(height: ConfigConstants.sizebox1),
        OutlinedButton.icon(
          style: OutlinedButton.styleFrom(
            elevation: 0
          ),
          onPressed: () async {
            ConnectivityResult result = await Connectivity().checkConnectivity();
            print(result.toString());
          }, 
          icon: Icon(Icons.refresh),
          label: Text("Try again")
        )
      ],
    ),
  );
}