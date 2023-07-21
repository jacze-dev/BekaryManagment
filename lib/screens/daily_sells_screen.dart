import 'package:flutter/material.dart';

import '/widgets/app_drawer.dart';

class DailySellsScreen extends StatelessWidget {
  static const routeName = 'dailySells';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Daily Sells'),
      ),
      drawer: AppDrawer(),
      body: const Center(child: Text('sells')),
    );
  }
}
