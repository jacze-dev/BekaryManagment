import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';

import '../widgets/app_drawer.dart';
import '../providers/loan.dart';
import '../widgets/bottom_sheet.dart';
import '../widgets/loan_ticket.dart';

class LoanScreen extends StatefulWidget {
  static const routeName = '/loanScreen';

  @override
  State<LoanScreen> createState() => _LoanScreenState();
}

class _LoanScreenState extends State<LoanScreen> {
  void _startNewLoan(BuildContext ctx) {
    showModalBottomSheet(
      context: ctx,
      builder: (context) {
        return LoanBottomSheet();
      },
    );
  }

  Widget showCondition(Loans loansItem) {
    if (loansItem.loans.isEmpty) {
      return Center(
        child: Text('No loan added yet!'),
      );
    }
    return ListView.builder(
      itemCount: loansItem.loans.length,
      itemBuilder: (context, index) {
        return LoanTicket(loansItem.loans[index]);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Loans'),
        actions: [
          IconButton(
              onPressed: () {
                _startNewLoan(context);
              },
              icon: Icon(Icons.add))
        ],
      ),
      drawer: AppDrawer(),
      body: Consumer<Loans>(
        builder: (ctx, loanData, child) => Container(
          child: showCondition(loanData),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _startNewLoan(context);
        },
        child: Icon(Icons.add),
        foregroundColor: Theme.of(context).colorScheme.background,
      ),
    );
  }
}
