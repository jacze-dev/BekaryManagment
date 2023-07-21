import 'package:flutter/material.dart';
import './loan_cart.dart';

class Loan {
  final String id;
  final String name;
  final DateTime dateTime;
  final List<LoanItem> items;
  final double amount;

  Loan({
    required this.id,
    required this.name,
    required this.items,
    required this.dateTime,
    required this.amount,
  });
}

class Loans with ChangeNotifier {
  List<Loan> _loans = [];

  List<Loan> get loans {
    return [..._loans];
  }

  void addLoanItems(String name, List<LoanItem> items, double amount) {
    _loans.insert(
      0,
      Loan(
          id: DateTime.now().toString(),
          name: name,
          items: items,
          dateTime: DateTime.now(),
          amount: amount),
    );

    notifyListeners();
  }

  void removeLoan(String id) {
    _loans.removeWhere((loan) => loan.id == id);
  }
}
