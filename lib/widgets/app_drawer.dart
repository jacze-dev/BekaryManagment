import 'package:flutter/material.dart';

import '../screens/archive_screen.dart';
import '../screens/daily_sells_screen.dart';
import '../screens/loans_screen.dart';
import '../screens/withdrwal_screen.dart';
import '../screens/order_screen.dart';
import '../screens/product_screen.dart';

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Scaffold(
        appBar: AppBar(title: Text('Bakery'), automaticallyImplyLeading: false),
        body: Column(
          children: [
            SizedBox(
              height: 40,
            ),
            InkWell(
              onTap: () {
                Navigator.of(context).pushNamed(DailySellsScreen.routeName);
              },
              child: Row(
                children: [
                  SizedBox(
                    width: 40,
                  ),
                  Icon(Icons.shop),
                  SizedBox(
                    width: 10,
                  ),
                  Text('Daily sells')
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            InkWell(
              onTap: () {
                Navigator.of(context)
                    .pushReplacementNamed(LoanScreen.routeName);
              },
              child: Row(
                children: [
                  SizedBox(
                    width: 40,
                  ),
                  Icon(Icons.credit_score),
                  SizedBox(
                    width: 10,
                  ),
                  Text('Loans')
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            InkWell(
              onTap: () {
                Navigator.of(context)
                    .pushReplacementNamed(WithdrwalScreen.routeName);
              },
              child: Row(
                children: [
                  SizedBox(
                    width: 40,
                  ),
                  Icon(Icons.money_off),
                  SizedBox(
                    width: 10,
                  ),
                  Text('Withdrwals')
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            InkWell(
              onTap: () {
                Navigator.of(context)
                    .pushReplacementNamed(OrderScreen.routeName);
              },
              child: Row(
                children: [
                  SizedBox(
                    width: 40,
                  ),
                  Icon(Icons.shopping_basket),
                  SizedBox(
                    width: 10,
                  ),
                  Text('Orders')
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            InkWell(
              onTap: () {
                Navigator.of(context)
                    .pushReplacementNamed(ArchiveScreen.routeName);
              },
              child: Row(
                children: [
                  SizedBox(
                    width: 40,
                  ),
                  Icon(Icons.archive),
                  SizedBox(
                    width: 10,
                  ),
                  Text('Archive')
                ],
              ),
            ),
            const Divider(),
            const SizedBox(
              height: 20,
            ),
            InkWell(
              onTap: () {
                Navigator.of(context).pushNamed(ProductScreern.routeName);
              },
              child: Row(
                children: [
                  SizedBox(
                    width: 40,
                  ),
                  Icon(Icons.person),
                  SizedBox(
                    width: 10,
                  ),
                  Text('profile')
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
