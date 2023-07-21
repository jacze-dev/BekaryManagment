import 'package:flutter/material.dart';

class LoanItem {
  final String itemId;
  final String name;
  final int quantity;
  final double price;

  LoanItem({
    required this.itemId,
    required this.name,
    this.quantity = 1,
    required this.price,
  });
}

class LoanItems with ChangeNotifier {
  var total = 0.0;
  Map<String, LoanItem> _loanItems = {};
  Map<String, LoanItem> get loanItems {
    return {..._loanItems};
  }

  void addItemsList(String productId, String name, double price) {
    if (_loanItems.containsKey(productId)) {
      _loanItems.update(
        productId,
        (value) => LoanItem(
          itemId: value.itemId,
          name: value.name,
          quantity: value.quantity + 1,
          price: value.price,
        ),
      );
    } else {
      _loanItems.putIfAbsent(
        productId,
        () => LoanItem(
          itemId: DateTime.now().toString(),
          name: name,
          quantity: 1,
          price: price,
        ),
      );
    }
    notifyListeners();
  }

  double get totalAmount {
    var _totalAmount = 0.0;
    for (var i = 0; i < loanItems.values.length; i++) {
      _totalAmount += (loanItems.values.toList()[i].price *
          loanItems.values.toList()[i].quantity);
    }
    return _totalAmount;
  }

  void clearList() {
    _loanItems = {};
  }
}
