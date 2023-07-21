import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';

import '../providers/loan.dart';
import '../providers/loan_cart.dart';

class LoanTicket extends StatefulWidget {
  final Loan loans;
  LoanTicket(this.loans);
  @override
  State<LoanTicket> createState() => _LoanTicketState();
}

class _LoanTicketState extends State<LoanTicket> {
  var isExpanded = false;

  @override
  Widget build(BuildContext context) {
    final loansdata = Provider.of<Loans>(context);
    return Dismissible(
      background: Container(
        margin: const EdgeInsets.all(5),
        color: Colors.red,
        child: Icon(
          Icons.delete,
          color: Colors.white,
        ),
        alignment: Alignment.centerRight,
      ),
      key: Key(widget.loans.id),
      direction: DismissDirection.endToStart,
      onDismissed: (direction) => loansdata.removeLoan(widget.loans.id),
      confirmDismiss: (direction) {
        return showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text(
                'are you sure to delete ?',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              content: Text(
                'the item will be permanently deleted !',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              actions: [
                TextButton(
                    onPressed: () {
                      Navigator.of(context).pop(false);
                    },
                    child: const Text('NO')),
                TextButton(
                    onPressed: () {
                      Navigator.of(context).pop(true);
                    },
                    child: const Text('YES'))
              ],
            );
          },
        );
      },
      child: Card(
        margin: EdgeInsets.all(5),
        child: Column(
          children: [
            ListTile(
              leading: CircleAvatar(
                child: FittedBox(
                  child: Text(
                    '\$${widget.loans.amount}',
                    style: TextStyle(
                        color: Theme.of(context).colorScheme.background),
                  ),
                ),
              ),
              title: Text(
                widget.loans.name,
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              subtitle: Text(
                DateFormat.yMMMMd().format(widget.loans.dateTime),
                style: Theme.of(context).textTheme.bodySmall,
              ),
              trailing: IconButton(
                onPressed: () {
                  setState(() {
                    isExpanded = !isExpanded;
                    print(isExpanded.toString());
                  });
                },
                icon: Icon(isExpanded ? Icons.expand_less : Icons.expand_more),
              ),
            ),
            if (isExpanded)
              Column(
                children: [
                  Container(
                    padding: EdgeInsets.all(5),
                    height: widget.loans.items.length * 20.0 + 10,
                    child: ListView.builder(
                      itemCount: widget.loans.items.length,
                      itemBuilder: (context, index) {
                        return Container(
                          margin: EdgeInsets.symmetric(horizontal: 5),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                widget.loans.items[index].name,
                                style: TextStyle(
                                    fontFamily: 'RobotoCondensed',
                                    fontSize: 20),
                              ),
                              Text(
                                  '${widget.loans.items[index].quantity} X ${widget.loans.items[index].price}'),
                              Text(
                                  '${(widget.loans.items[index].quantity * widget.loans.items[index].price)}'),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Container(
                    padding: EdgeInsets.all(5),
                    margin: EdgeInsets.symmetric(horizontal: 7),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Total:'),
                        Text('\$${widget.loans.amount}'),
                      ],
                    ),
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }
}
