import 'package:flutter/material.dart';
import 'package:samvaad/screens/message_screen.dart';
import 'package:samvaad/utils/app_colors.dart';
import 'package:samvaad/pages/dashboard_page.dart';
import 'package:samvaad/pages/ai_companion_page.dart';
import 'package:samvaad/pages/community_page.dart';
import 'package:samvaad/pages/journal_page.dart';
import 'package:samvaad/pages/help_page.dart';
import 'package:samvaad/screens/profile_screen.dart';
import 'package:samvaad/screens/rorschach_test_screen.dart';
import 'package:samvaad/screens/ai_reflections_screen.dart';
import 'package:samvaad/screens/message_screen.dart';
import 'package:samvaad/utils/app_routes.dart';
class MainWrapper extends StatefulWidget {
  static const String routeName = '/main-wrapper';
  const MainWrapper({super.key});

  @override
  State<MainWrapper> createState() => _MainWrapperState();
}

class _MainWrapperState extends State<MainWrapper> {
  int _currentIndex = 0;

  // The pages corresponding to the bottom navigation bar items
  final List<Widget> _pages = [
    const DashboardPage(),
    const AICompanionPage(),
    const CommunityPage(),
    const JournalPage(),
    const HelpPage(),
  ];

  void _onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  // Helper function to get the correct AppBar title
  String _getAppBarTitle(int index) {
    switch (index) {
      case 0:
        return 'Samvaad';
      case 1:
        return 'Choose Your Companion';
      case 2:
        return 'Communities';
      case 3:
        return 'Daily Journal';
      case 4:
        return 'Professional Help';
      default:
        return 'Samvaad';
    }
  }

  // The custom Drawer menu shown in the video
  Widget _buildDrawer(BuildContext context) {
    // List of drawer items based on the video
    final List<Map<String, dynamic>> navigateItems = [
      {'title': 'Dashboard', 'route': MainWrapper.routeName},
      {'title': 'Rorschach', 'route': RorschachTestScreen.routeName},
      {'title': 'Mood Tracker', 'route': AIReflectionsScreen.routeName}, // Reusing AI Reflections for Mood Tracker example
      {'title': 'Quick Action', 'route': MainWrapper.routeName}, // Stays on Dashboard for quick action
    ];

    final List<Map<String, dynamic>> profileItems = [
      {'title': 'User Profile', 'route': ProfileScreen.routeName},
      {'title': 'Edit Profile', 'route': '/edit-profile-placeholder'},
      {'title': 'Settings', 'route': '/settings-placeholder'},
      {'title': 'Subscription', 'route': '/premium-placeholder'},
      {'title': 'Help & Feedback', 'route': '/help'},
    ];

    return Drawer(
      backgroundColor: AppColors.background,
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Close Button
              Align(
                alignment: Alignment.topRight,
                child: IconButton(
                  icon: const Icon(Icons.close, color: AppColors.darkText),
                  onPressed: () => Navigator.of(context).pop(),
                ),
              ),
              const Text(
                'Navigate to different sections of the app',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: AppColors.greyText,
                ),
              ),
              const Divider(),
              // Navigate Section
              _buildDrawerSection(context, 'Navigate', navigateItems),
              const Divider(),
              // Profile Section
              _buildDrawerSection(context, 'Profile', profileItems),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDrawerSection(
      BuildContext context,
      String title,
      List<Map<String, dynamic>> items,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 8.0, bottom: 4.0),
          child: Text(
            title,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: AppColors.darkText,
            ),
          ),
        ),
        ...items.map((item) {
          // Highlight 'Quick Action' as shown in the video, or the current route if it matches
          final bool isHighlighted = (item['title'] == 'Quick Action' || item['route'] == ModalRoute.of(context)?.settings.name) && _currentIndex == 0;

          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 4.0),
            child: InkWell(
              onTap: () {
                Navigator.of(context).pop(); // Close drawer
                // For main tabs, change the index. For sub-screens, navigate.
                if (item['route'] == MainWrapper.routeName) {
                  _onTabTapped(0); // Go back to dashboard if it's the main route
                } else if (item['route'] == '/edit-profile-placeholder') {
                  Navigator.of(context).pushNamed(ProfileScreen.routeName);
                } else if (item['route'] == '/settings-placeholder') {
                  Navigator.of(context).pushNamed(ProfileScreen.routeName);
                } else if (item['route'] == '/premium-placeholder') {
                  Navigator.of(context).pushNamed(ProfileScreen.routeName);
                }
                else if (item['route'] == '/help') {
                  Navigator.of(context).pushNamed(AppRoutes.helpPage);
                }
                else {
                  Navigator.of(context).pushNamed(item['route']);
                }
              },
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 16.0),
                decoration: BoxDecoration(
                  color: isHighlighted ? AppColors.accent.withOpacity(0.1) : Colors.transparent,
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Text(
                  item['title'],
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: isHighlighted ? FontWeight.bold : FontWeight.normal,
                    color: isHighlighted ? AppColors.primary : AppColors.darkText,
                  ),
                ),
              ),
            ),
          );
        }).toList(),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    // Determine if a back button is needed instead of the drawer icon
    final bool showBackButton = _currentIndex != 0;

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: Text(_getAppBarTitle(_currentIndex)),
        centerTitle: true,
        leading: Builder(
          builder: (context) {
            // For the Home page (index 0), show the menu/drawer icon
            if (_currentIndex == 0) {
              return IconButton(
                icon: const Icon(Icons.menu),
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
              );
            }
            // For other main pages, show a back arrow (if needed, though the video implies it stays on the screen)
            // I'll use a back arrow here for a consistent UI pattern as seen in sub-screens
            return IconButton(
              icon: const Icon(Icons.arrow_back_ios),
              onPressed: () => _onTabTapped(0), // Back to home page
            );
          },
        ),
        actions: [
          // Action button (e.g., Message icon in the video)
          if (_currentIndex == 0)
            IconButton(
              icon: const Icon(Icons.send_rounded, color: AppColors.primary),
              onPressed: () {
                Navigator.of(context).pushNamed(MessagesScreen.routeName);},
            ),
          // Profile avatar for Home page
          if (_currentIndex == 0)
            Padding(
              padding: const EdgeInsets.only(right: 16.0),
              child: InkWell(
                onTap: () {
                  Navigator.of(context).pushNamed(ProfileScreen.routeName);
                },
                child: const CircleAvatar(
                  backgroundColor: AppColors.primary,
                  radius: 18,
                  child: Text('AJ', style: TextStyle(color: Colors.white, fontSize: 14)),
                ),
              ),
            ),
        ],
      ),
      drawer: _buildDrawer(context),
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: _onTabTapped,
        selectedItemColor: AppColors.primary,
        unselectedItemColor: AppColors.greyText,
        backgroundColor: Colors.white,
        type: BottomNavigationBarType.fixed,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        elevation: 10,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            activeIcon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bubble_chart_outlined),
            activeIcon: Icon(Icons.bubble_chart),
            label: 'AI Chat',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.group_outlined),
            activeIcon: Icon(Icons.group),
            label: 'Community',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.book_outlined),
            activeIcon: Icon(Icons.book),
            label: 'Journal',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.medical_services_outlined),
            activeIcon: Icon(Icons.medical_services),
            label: 'Help',
          ),
        ],
      ),
    );
  }
}
