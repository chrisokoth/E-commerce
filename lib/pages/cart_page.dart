import 'package:first_app/models/shoe.dart';
import 'package:flutter/material.dart';

class CartPage extends StatelessWidget {
  final List<Shoe> cartItems; // List to hold cart items

  const CartPage({super.key, required this.cartItems});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Cart'),
      ),
      body: cartItems.isEmpty
          ? const Center(
              child: Text(
                'Your cart is empty!',
                style: TextStyle(fontSize: 18, color: Colors.grey),
              ),
            )
          : ListView.builder(
              itemCount: cartItems.length,
              itemBuilder: (context, index) {
                final shoe = cartItems[index];
                return ListTile(
                  leading: Image.asset(shoe.imagepath, width: 50, fit: BoxFit.cover),
                  title: Text(
                    shoe.name,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(
                    '\$${shoe.price}',
                    style: const TextStyle(color: Colors.grey),
                  ),
                );
              },
            ),
    );
  }
}
