import 'package:first_app/components/shoe_tile.dart';
import 'package:first_app/models/shoe.dart';
import 'package:first_app/pages/cart_page.dart'; // Import CartPage
import 'package:first_app/pages/login_page.dart';
import 'package:first_app/pages/signup_page.dart';
import 'package:flutter/material.dart';

class ShopPage extends StatefulWidget {
  final Function(Shoe) onAddToCart; // Add this line

  const ShopPage({super.key, required this.onAddToCart}); // Update constructor

  @override
  State<ShopPage> createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {
  // List of shoes to display
  final List<Shoe> _shoes = [
    Shoe(name: 'AirJordan', price: '240', description: 'cool shoe', imagepath: 'lib/images/j1.png'),
    Shoe(name: 'Heels', price: '100', description: 'stylish heels', imagepath: 'lib/images/heel.png'),
    Shoe(name: 'AirJordan 4', price: '360', description: 'cool shoe', imagepath: 'lib/images/j4.png'),
  ];

  List<Shoe> _userCart = []; // Cart to hold added shoes

  void _addToCart(Shoe shoe) {
    setState(() {
      _userCart.add(shoe);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Shop'),
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_cart),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CartPage(cartItems: _userCart)),
              );
            },
          ),
          TextButton(
  onPressed: () {
    Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage()));
  },
  child: Text('Login', style: TextStyle(backgroundColor: Colors.grey, color: Colors.black)),
),
TextButton(
  onPressed: () {
    Navigator.push(context, MaterialPageRoute(builder: (context) => SignupPage()));
  },
  child: Text('Sign Up', style: TextStyle(backgroundColor: Colors.grey, color: Colors.black)),
),

        ],
      ),
      body: Column(
        children: <Widget>[
          // Search bar
          Container(
            padding: const EdgeInsets.all(12),
            margin: const EdgeInsets.symmetric(horizontal: 25, vertical: 25),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: Colors.grey[200],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text(
                  'Search',
                  style: TextStyle(color: Colors.grey),
                ),
                Icon(
                  Icons.search,
                  color: Colors.grey,
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),

          // Nice message
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 25, vertical: 25),
            child: Text(
              'Everyone flies, some flies longer than others',
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
          ),

          // Hot picks section
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: const [
                Text(
                  'Hot Picks',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                Text(
                  'See all',
                  style: TextStyle(color: Colors.blue),
                ),
              ],
            ),
          ),

          // Display shoes in a horizontal ListView
          const SizedBox(height: 10),
          Expanded(
  child: ListView.builder(
    itemCount: _shoes.length,
    scrollDirection: Axis.horizontal,
    itemBuilder: (context, index) {
      return ShoeTile(
        shoe: _shoes[index],
        onAddToCart: widget.onAddToCart, // Use the onAddToCart callback
      );
              },
            ),
          ),

          // Bottom padding and divider
          const Padding(padding: EdgeInsets.only(top: 25, left: 25, right: 25)),
          const Divider(color: Colors.white),
        ],
      ),
    );
  }
}
