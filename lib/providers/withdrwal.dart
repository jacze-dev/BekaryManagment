import 'package:flutter/material.dart';

class Withdrwal {
  final String id;
  final String title;
  final String reason;
  final double amount;
  final DateTime dateTime;

  Withdrwal({
    required this.id,
    required this.title,
    required this.reason,
    required this.amount,
    required this.dateTime,
  });
}

class Withdrwals with ChangeNotifier {
  Map<String, Withdrwal> _withdrwals = {};
  Map<String, Withdrwal> get withdrwal {
    return {..._withdrwals};
  }

  void addWithdrwal(String id, String title, String reason, String amount) {
    if (_withdrwals.containsKey(id)) {
      _withdrwals.update(
        id,
        (existingWith) => Withdrwal(
          id: existingWith.id,
          title: existingWith.title,
          reason: existingWith.reason,
          amount: existingWith.amount,
          dateTime: DateTime.now(),
        ),
      );
    } else {
      _withdrwals.putIfAbsent(
        id,
        () => Withdrwal(
          id: DateTime.now().toString(),
          title: title,
          reason: reason,
          amount: double.parse(amount),
          dateTime: DateTime.now(),
        ),
      );
    }
    notifyListeners();
  }

  void removeWithdrwals(String id) {
    _withdrwals.removeWhere((key, value) => value.id == id);
    notifyListeners();
  }
}
