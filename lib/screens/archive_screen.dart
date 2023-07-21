import 'package:flutter/material.dart';
import 'package:kal_dabo/screens/order_archive_screen.dart';
import 'package:kal_dabo/widgets/app_drawer.dart';
import 'package:kal_dabo/widgets/daily_sold_table.dart';
import 'package:provider/provider.dart';

import '../providers/items.dart';
import '../widgets/daily_table_header.dart';
import './loan_archive_screen.dart';
import './sells_archve_screen.dart';
import './withdrwal_archive_screen.dart';

enum show {
  _sells,
  _withdrwal,
  _loan,
}

class ArchiveScreen extends StatefulWidget {
  static const routeName = '/dailySellScreen';

  @override
  State<ArchiveScreen> createState() => _ArchiveScreenState();
}

class _ArchiveScreenState extends State<ArchiveScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Archive'),
          bottom: TabBar(tabs: [
            Tab(
              text: 'Sells',
            ),
            Tab(
              text: 'loans',
            ),
            Tab(
              text: 'withdrwals',
            ),
            Tab(
              text: 'orders',
            )
          ]),
        ),
        drawer: AppDrawer(),
        body: TabBarView(
          children: [
            SellsArchiveScreen(),
            LoanSrchiveScreen(),
            WithdrwalArchiveScreen(),
            OrderArchiveScreen(),
          ],
        ),
      ),
    );
  }
}
