import 'package:flutter/material.dart';
import 'package:shopapp/provider/cart.dart';

class OrderItem {
  final String id;
  final double price;

  final List<CartItem> products;
  final DateTime dateTime;

  OrderItem({
    required this.id,
    required this.price,
    required this.products,
    required this.dateTime,
  });
}

class Order with ChangeNotifier {
  List<OrderItem> _orders = [];

  List<OrderItem> get orders {
    return [..._orders];
  }

  void addOrder(double totalAmount, List<CartItem> cartProducts) {
    _orders.insert(
      0,
      OrderItem(
        id: DateTime.now().toString(),
        price: totalAmount,
        products: cartProducts,
        dateTime: DateTime.now(),
      ),
    );
  }
}
