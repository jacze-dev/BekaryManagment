import 'package:flutter/material.dart';

import './order_cart.dart';
import './items.dart';
import './order_cart.dart';

class Order {
  final String id;
  final String name;
  final int phoneNumber;
  final double kebd;
  final double keri;
  final List<OrderItem> items;
  final double amount;
  final DateTime orderedDate;
  final DateTime deliveredDate;
  final now = DateTime.now();

  Order({
    required this.id,
    required this.name,
    required this.phoneNumber,
    required this.kebd,
    this.keri = 0,
    required this.items,
    this.amount = 0,
    required this.orderedDate,
    required this.deliveredDate,
  });
}

class Orders with ChangeNotifier {
  // ignore: prefer_final_fields
  List<Order> _orders = [
    Order(
      id: '$DateTime.now()',
      name: 'abebe',
      phoneNumber: 0910534091,
      kebd: 5,
      items: [OrderItem(itemId: 'it1', name: 'dfo', price: 10, quantity: 2)],
      orderedDate: DateTime.now(),
      amount: 20.0,
      keri: 15.0,
      deliveredDate: DateTime.now(),
    ),
  ];

  List<Order> get orders {
    return [..._orders];
  }

  void addOrder(Order order) {
    final newProduct = Order(
      id: DateTime.now().toString(),
      name: order.name,
      phoneNumber: order.phoneNumber,
      kebd: order.kebd,
      keri: order.amount - order.kebd,
      items: order.items,
      amount: order.amount,
      orderedDate: DateTime.now(),
      deliveredDate: order.deliveredDate,
    );
    _orders.insert(0, newProduct);
    notifyListeners();
  }

  void removeOrder(String id) {
    _orders.removeWhere((order) => order.id == id);
    notifyListeners();
  }

  void updateOrder(String id, Order order) {
    var index = _orders.indexOf(findById(id));
    _orders[index] = order;
  }

  Order findById(String id) {
    var order = _orders.firstWhere((element) => element.id == id);
    return order;
  }
}
