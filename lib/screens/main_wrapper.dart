import 'package:flutter/material.dart';
import '../utils/app_colors.dart';
import '../pages/dashboard_page.dart';
import 'message_screen.dart';
import 'profile_screen.dart';

class MainWrapper extends StatefulWidget {
final String userName;

const MainWrapper({super.key, required this.userName});

@override
State<MainWrapper> createState() => _MainWrapperState();
}

class _MainWrapperState extends State<MainWrapper> {
int _selectedIndex = 0;

late final List<Widget> _pages;

@override
void initState() {
super.initState();
_pages = [
DashboardPage(userName: widget.userName),
const MessagesScreen(),
const ProfileScreen(),
];
}

void _onItemTapped(int index) {
setState(() => _selectedIndex = index);
}

@override
Widget build(BuildContext context) {
return Scaffold(
body: _pages[_selectedIndex],
bottomNavigationBar: BottomNavigationBar(
backgroundColor: Colors.white,
currentIndex: _selectedIndex,
selectedItemColor: AppColors.primary,
unselectedItemColor: AppColors.greyText,
onTap: _onItemTapped,
items: const [
BottomNavigationBarItem(
icon: Icon(Icons.home_outlined),
label: "Home",
),
BottomNavigationBarItem(
icon: Icon(Icons.message_outlined),
label: "Messages",
),
BottomNavigationBarItem(
icon: Icon(Icons.person_outline),
label: "Profile",
),
],
),
);
}
}
