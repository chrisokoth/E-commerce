import 'package:first_app/models/shoe.dart';
import 'package:flutter/material.dart';

class ShoeTile extends StatelessWidget {
  final Shoe shoe;
  final Function(Shoe) onAddToCart; // Callback for adding to cart

  const ShoeTile({super.key, required this.shoe, required this.onAddToCart});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 25),
      width: 280,
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Shoe picture
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.asset(shoe.imagepath, fit: BoxFit.cover, height: 180, width: 280),
          ),

          // Shoe description
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
            child: Text(
              shoe.description,
              style: TextStyle(color: Colors.grey[600]),
              textAlign: TextAlign.center,
            ),
          ),

          // Price + Details
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Shoe name and price
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Shoe name
                    Text(
                      shoe.name,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    const SizedBox(height: 5),
                    // Shoe price
                    Text(
                      '\$${shoe.price}',
                      style: const TextStyle(color: Colors.grey),
                    ),
                  ],
                ),

                // Add to cart button
                GestureDetector(
                  onTap: () {
                    onAddToCart(shoe); // Call the add to cart function
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('${shoe.name} added to cart!'),
                      ),
                    );
                  },
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    decoration: const BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(12),
                        bottomRight: Radius.circular(12),
                      ),
                    ),
                    child: const Icon(
                      Icons.add,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
