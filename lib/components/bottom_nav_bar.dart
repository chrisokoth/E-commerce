import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class BottomNavBar extends StatelessWidget {
  final void Function(int)? onTabChange; // Define onTabChange as final

  const BottomNavBar({super.key, this.onTabChange});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      color: Colors.white,
      child: GNav(
        // Original color of the items in the navbar
        color: Colors.grey[400],
        // The color the items in the navbar will turn into when selected
        activeColor: Colors.grey.shade700,
        // Adding a border around the items
        tabActiveBorder: Border.all(color: Colors.white),
        tabBackgroundColor: Colors.grey.shade100,
        mainAxisAlignment: MainAxisAlignment.center,
        tabBorderRadius: 16,
        
        onTabChange: (value) => onTabChange?.call(value), // Use ?.call here
        
        gap: 8,
        iconSize: 24,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        tabs: [
          GButton(
            icon: Icons.home,
            text: 'Shop',
          ),
          GButton(
            icon: Icons.shopping_bag_rounded,
            text: 'Cart',
          ),
        ],
      ),
    );
  }
}
