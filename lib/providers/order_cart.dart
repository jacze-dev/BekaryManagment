import 'package:flutter/material.dart';

class OrderItem {
  final String itemId;
  final String name;
  final int quantity;
  final double price;

  OrderItem({
    required this.itemId,
    required this.name,
    this.quantity = 1,
    required this.price,
  });
}

class OrderItems with ChangeNotifier {
  Map<String, OrderItem> _orderedItems = {
    'it1': OrderItem(itemId: 'it1', name: 'dfo', price: 10, quantity: 2),
  };

  Map<String, OrderItem> get orderedItem {
    return {..._orderedItems};
  }

  void addToCart(String itemId, String name, double price) {
    if (_orderedItems.containsKey(itemId)) {
      _orderedItems.update(
          itemId,
          (existed) => OrderItem(
                itemId: existed.itemId,
                name: existed.name,
                price: existed.price,
                quantity: existed.quantity + 1,
              ));
    } else {
      _orderedItems.putIfAbsent(
          itemId,
          () => OrderItem(
                itemId: itemId,
                name: name,
                price: price,
              ));
    }
    // clear();
    notifyListeners();
    // clear();
  }

  double totalAmount() {
    var totalAmount = 0.0;
    for (var i = 0; i < _orderedItems.values.toList().length; i++) {
      totalAmount += _orderedItems.values.toList()[i].price *
          _orderedItems.values.toList()[i].quantity;
    }
    notifyListeners();
    return totalAmount;
  }

  void clear() {
    _orderedItems = {};
  }
}
