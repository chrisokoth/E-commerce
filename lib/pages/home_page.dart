import 'package:first_app/models/shoe.dart';
import 'package:first_app/pages/cart_page.dart';
import 'package:first_app/pages/shop_page.dart';
import 'package:flutter/material.dart';
import '../components/bottom_nav_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  int _selectedIndex = 0;

  // List to hold the items in the cart
  final List<Shoe> _cartItems = [];

  // Method to update the selected index for the bottom navigation
  void navigationBottomBar(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  // Method to add an item to the cart
  void _addToCart(Shoe shoe) {
    setState(() {
      _cartItems.add(shoe);
    });
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('${shoe.name} added to cart!'),
        duration: const Duration(seconds: 2),
      ),
    );
  }

  // List of pages to display based on the selected bottom navigation index
  late final List<Widget> _pages;

  @override
  void initState() {
    super.initState();
    _pages = [
  ShopPage(onAddToCart: _addToCart), // Pass the add to cart callback
  CartPage(cartItems: _cartItems),   // Pass the cart items to CartPage
];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Colors.grey.shade100,

      appBar: AppBar(
        backgroundColor: Colors.blue,
        elevation: 0,
        leading: IconButton(
          icon: Padding(
            padding: const EdgeInsets.only(left: 12.0),
            child: const Icon(Icons.menu, color: Colors.white),
          ),
          onPressed: () {
            _scaffoldKey.currentState?.openDrawer();
          },
        ),
      ),

      drawer: Drawer(
        backgroundColor: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Image.asset(
                    'lib/images/nikelogo.png',
                    height: 240,
                  ),
                ),
                const SizedBox(height: 48),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Divider(color: Colors.grey[800]),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 25.0),
                  child: ListTile(
                    leading: const Icon(Icons.home, color: Colors.black),
                    title: const Text('HOME', style: TextStyle(color: Colors.black)),
                    onTap: () {
                      Navigator.pop(context);
                      Navigator.pushNamed(context, '/homepage');
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 25.0),
                  child: ListTile(
                    leading: const Icon(Icons.info, color: Colors.black),
                    title: const Text('ABOUT', style: TextStyle(color: Colors.black)),
                    onTap: () {
                      Navigator.pop(context);
                      Navigator.pushNamed(context, '/settingspage');
                    },
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 25.0),
              child: ListTile(
                leading: const Icon(Icons.logout, color: Colors.black),
                title: const Text('LOGOUT', style: TextStyle(color: Colors.black)),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.pushNamed(context, '/settingspage');
                },
              ),
            ),
          ],
        ),
      ),

      bottomNavigationBar: BottomNavBar(
        onTabChange: navigationBottomBar,
      ),

      body: _pages[_selectedIndex],
    );
  }
}
