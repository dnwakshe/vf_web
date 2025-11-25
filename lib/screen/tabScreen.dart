import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:vf_app/constants/app_colors.dart';
import 'package:vf_app/screen/Dashboard/dashboard_screen.dart';
import 'package:vf_app/screen/login/login_screen.dart';
import 'package:vf_app/utils/widgets/UIComponents/commonApp.dart';

class BottomNavScreen extends StatefulWidget {
  const BottomNavScreen({super.key});

  @override
  State<BottomNavScreen> createState() => _BottomNavScreenState();
}

class _BottomNavScreenState extends State<BottomNavScreen> {
  int _selectedIndex = 0;

  final List<Widget> _pages = const [
    DashboardScreen(),
    Center(child: Text('Search Screen')),
    Center(child: Text('Favourite Screen')),
    LoginScreen(),
    // Center(child: Text('Profile Screen')),

    // this is mobile profile screen
    // ProfileOptionsWidget(),
  ];
  final List<String> _titles = [
    'Home',
    'Search',
    'Favourite',
    'Profile',
    "login",
  ];
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final List<IconData> _icons = [
    Icons.home,
    Icons.search,
    Icons.favorite,
    Icons.person,
    Icons.login,
  ];

  // Web-style top navigation bar with icons
  PreferredSizeWidget _buildWebAppBar() {
    return AppBar(
      title: const Text('Vishwanayak Foundation'),
      flexibleSpace: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFF2E7D32),
              Colors.white,
              Color(0xFFFFD54F), // #FF9B63
            ],
            stops: [0.1025, 0.300, 1.4000],
            begin: Alignment.centerLeft,  // Start from left
      end: Alignment.centerRight, 
          ),
        ),
      ),
      actions: List.generate(_titles.length, (index) {
        final isSelected = _selectedIndex == index;
        final title = _titles[index];

        if (title == 'Profile') {
          return PopupMenuButton<String>(
            tooltip: "Profile Menu",
            icon: Icon(
              _icons[index],
              color: isSelected ? AppColors.white : Colors.grey,
            ),
            onSelected: (value) {
              debugPrint("Selected: $value");
              // Handle each action
            },
            itemBuilder: (context) => [
              const PopupMenuItem(
                value: 'account',
                child: ListTile(
                  leading: Icon(Icons.person),
                  title: Text('My Account'),
                ),
              ),
              const PopupMenuItem(
                value: 'orders',
                child: ListTile(
                  leading: Icon(Icons.shopping_bag),
                  title: Text('Orders'),
                ),
              ),
              const PopupMenuItem(
                value: 'wishlist',
                child: ListTile(
                  leading: Icon(Icons.favorite),
                  title: Text('Wishlist'),
                ),
              ),
              const PopupMenuItem(
                value: 'payments',
                child: ListTile(
                  leading: Icon(Icons.credit_card),
                  title: Text('Payment Methods'),
                ),
              ),
              const PopupMenuItem(
                value: 'addresses',
                child: ListTile(
                  leading: Icon(Icons.location_on),
                  title: Text('Addresses'),
                ),
              ),
              const PopupMenuItem(
                value: 'settings',
                child: ListTile(
                  leading: Icon(Icons.settings),
                  title: Text('Settings'),
                ),
              ),
              const PopupMenuItem(
                value: 'support',
                child: ListTile(
                  leading: Icon(Icons.support_agent),
                  title: Text('Contact Support'),
                ),
              ),
              PopupMenuItem(
                onTap: () {
                  // sharedPrefs.clear();
                  // Navigator.of(context).pushReplacement(
                  //     MaterialPageRoute(builder: (context) => AuthScreen()));
                },
                value: 'logout',
                child: ListTile(
                  leading: Icon(Icons.logout),
                  title: Text('Logout'),
                ),
              ),
            ],
          );
        }

        return TextButton.icon(
          onPressed: () => _onItemTapped(index),
          icon: Icon(
            _icons[index],
            color: isSelected ? AppColors.black : AppColors.iconColor,
          ),
          label: Text(
            title,
            style: TextStyle(
              color: isSelected ? AppColors.black : AppColors.iconColor,
              fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
            ),
          ),
        );
      }),
    );
  }

  // Mobile-style bottom navigation bar
  Widget _buildBottomNavBar() {
    return BottomNavigationBar(
      currentIndex: _selectedIndex,
      onTap: _onItemTapped,
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
        BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
        BottomNavigationBarItem(icon: Icon(Icons.favorite), label: 'Favourite'),
        BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),

        // BottomNavigationBarItem(icon: Icon(Icons.login), label: 'Login'),
      ],
      selectedItemColor: AppColors.primary,
      unselectedItemColor: Colors.grey,
      type: BottomNavigationBarType.fixed,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: kIsWeb
          ? _buildWebAppBar()
          : const CommonAppBar(title: 'Vishwanayak Foundation'),
      body: _pages[_selectedIndex],
      bottomNavigationBar: kIsWeb ? null : _buildBottomNavBar(),
    );
  }
}
