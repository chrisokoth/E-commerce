
import 'package:flutter/material.dart';
import 'shoe.dart';

class CartProvider with ChangeNotifier {
  // List of items in the user's cart
  final List<Shoe> _userCart = [];

  List<Shoe> get userCart => _userCart;

  // Add item to the cart and notify listeners
  void addItemToCart(Shoe shoe) {
    _userCart.add(shoe);
    notifyListeners();
  }

  // Remove item from the cart and notify listeners
  void removeItemFromCart(Shoe shoe) {
    _userCart.remove(shoe);
    notifyListeners();
  }
}




// import 'package:first_app/models/shoe.dart';

// class Cart {
//   // List of shoes for sale
//   List <Shoe> shoeShop = [
//     Shoe(name: 'Heels', price: '100', description: 'stylish heels', imagepath: 'lib/images/heel.png'),
//      Shoe(name: 'AirJordan', price: '240', description: 'cool shoe', imagepath: 'lib/images/j1.png'),
    
//      Shoe(name: 'AirJordan 4', price: '360', description: 'cool shoe', imagepath: 'lib/images/j4.png'),
    

    
//   ];
//   // list of items in users cart
//   List <Shoe> useCart = [];

//   // get list of shoes for sale
// List <Shoe> getShoeList (){
//   return shoeShop;}

//   // get cart
//   List <Shoe> getUserCart ()  {
//     return useCart;
//   }
//   // add items to cart

//   void addItemToCart (Shoe shoe) {
//     useCart.add(shoe);
//   }
//   // remove item from cart
//   void removeItemFromCart (Shoe shoe){
//     useCart.remove(shoe);

//   }
// }



