import 'package:flutter/material.dart';
import 'package:kal_dabo/widgets/loan_ticket.dart';
import 'package:provider/provider.dart';

import '../providers/loan.dart';

class LoanSrchiveScreen extends StatelessWidget {
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
    final loans = Provider.of<Loans>(context, listen: false);
    return showCondition(loans);
  }
}
