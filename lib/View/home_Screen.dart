import 'package:flutter/material.dart';
import 'package:zakira/Utils/colors.dart';
import 'package:zakira/View/Cart/cart_screen.dart';
import 'package:zakira/View/homeScreen/home.dart';
import 'package:zakira/View/ShortsScreen/shorts_screen.dart';
import 'package:zakira/View/chat%20screen/messanger_screen.dart';
import 'package:zakira/View/profile_info/profile_info.dart';
import 'package:zakira/View/profile_list/profile_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    super.key,
  });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;
  late PageController _pageController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SizedBox.expand(
          child: PageView(
            physics: const NeverScrollableScrollPhysics(),
            controller: _pageController,
            onPageChanged: (index) {
              setState(() {
                _currentIndex = index;
              });
            },
            children:  [
              HomePage(),
              ShortsScreen(),
              Massengercreen(),
              ProfileBaseScreen(productQuantity: ""),
              ProfileScreen()
            ],
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
            showUnselectedLabels: true,
            selectedItemColor: orangeColor,
            unselectedItemColor: Colors.grey,
            selectedLabelStyle: const TextStyle(fontWeight: FontWeight.w500),
            unselectedFontSize: 13,
            unselectedIconTheme: const IconThemeData(color: Colors.grey),
            currentIndex: _currentIndex,
            onTap: (index) {
              setState(() {
                _pageController.jumpToPage(index);
              });
            },
            unselectedLabelStyle: TextStyle(color: orangeColor),
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                label: "Home",
                icon: Icon(
                  Icons.home_filled,
                ),
              ),
              BottomNavigationBarItem(
                label: "Shorts",
                icon: Icon(
                  Icons.remove_red_eye_rounded,
                ),
              ),
              BottomNavigationBarItem(
                label: "Chat",
                icon: Icon(
                  Icons.message,
                ),
              ),
              BottomNavigationBarItem(
                label: "Profile",
                icon: Icon(
                  Icons.account_circle_rounded,
                ),
              ),
              BottomNavigationBarItem(
                label: "My Zakhira",
                icon: Icon(
                  Icons.shopping_bag_rounded,
                ),
              ),
            ]));
  }
}
