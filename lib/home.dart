import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pham/product_model.dart';
import 'package:pham/tabs.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final List<Widget> bodyList = [
      HomeBody(context),
      CartBody(),
      WishListBody(context)
    ];

    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentIndex,
        selectedIconTheme: IconThemeData(color: Color(0Xff242424)),
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        iconSize: 30.0,
        items: const [
          BottomNavigationBarItem(
              label: "",
              icon: Icon(CupertinoIcons.house_alt),
              activeIcon: Icon(CupertinoIcons.house_alt_fill)),
          BottomNavigationBarItem(
            label: "",
            icon: Icon(CupertinoIcons.cart),
            activeIcon: Icon(CupertinoIcons.cart_fill),
          ),
          BottomNavigationBarItem(
            label: "",
            icon: Icon(CupertinoIcons.bookmark),
            activeIcon: Icon(CupertinoIcons.bookmark_fill),
          )
        ],
      ),
      body: bodyList[_currentIndex],
    );
  }
}
