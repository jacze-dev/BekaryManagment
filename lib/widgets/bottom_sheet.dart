import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/items.dart';
import '../providers/loan.dart';
import '../providers/loan_cart.dart';

class LoanBottomSheet extends StatefulWidget {
  @override
  State<LoanBottomSheet> createState() => _LoanBottomSheetState();
}

class _LoanBottomSheetState extends State<LoanBottomSheet> {
  final nameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final itemsData = Provider.of<Items>(context, listen: false);
    final loanData = Provider.of<Loans>(context, listen: false);
    final loanItemsData = Provider.of<LoanItems>(context, listen: false);

    final name = nameController.text;

    return ChangeNotifierProvider(
      create: (BuildContext context) {
        LoanItems();
      },
      child: SingleChildScrollView(
        child: Container(
          color: Theme.of(context).colorScheme.secondary,
          padding: EdgeInsets.only(
              bottom: MediaQuery.of(context).padding.bottom + 50),
          child: Column(
            children: [
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'New Loan',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  TextButton(
                      onPressed: () {
                        loanData.addLoanItems(
                            name,
                            loanItemsData.loanItems.values.toList(),
                            loanItemsData.totalAmount);
                        loanItemsData.clearList();
                        Navigator.of(context).pop();
                      },
                      child: Text('Save loan',
                          style: Theme.of(context).textTheme.bodyLarge))
                ],
              ),
              TextField(
                decoration: InputDecoration(
                  label: Text('Name:',
                      style: Theme.of(context).textTheme.titleSmall),
                ),
                controller: nameController,
              ),
              SizedBox(
                height: 20,
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                height: 320,
                padding: EdgeInsets.only(
                    left: 10,
                    right: 10,
                    bottom: MediaQuery.of(context).padding.bottom + 50),
                child: ListView.builder(
                  itemCount: itemsData.Itemlist.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        loanItemsData.addItemsList(
                            itemsData.Itemlist[index].id,
                            itemsData.Itemlist[index].title,
                            itemsData.Itemlist[index].itemPrice);
                      },
                      child: Card(
                        color: Theme.of(context).colorScheme.surface,
                        child: Container(
                          height: 70,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 10,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                itemsData.Itemlist[index].title,
                                style: Theme.of(context).textTheme.titleMedium,
                              ),
                              Text(
                                '\$${(itemsData.Itemlist[index].itemPrice)}',
                                style: Theme.of(context).textTheme.titleSmall,
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
