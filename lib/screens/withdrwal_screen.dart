import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';

import '../widgets/app_drawer.dart';
import '../widgets/new_withdrwal.dart';
import '../providers/withdrwal.dart';
import '../widgets/withdrwal_item.dart';

class WithdrwalScreen extends StatelessWidget {
  static const routeName = '/withd_screen';

  void _addNewWithdrwals(BuildContext ctx) {
    showModalBottomSheet(
      context: ctx,
      builder: (context) {
        return NewWithdrwal();
      },
    );
  }

  Widget showConditions(Withdrwals withdData) {
    if (withdData.withdrwal.isEmpty) {
      return const Center(
        child: Text('No Withdrwals!'),
      );
    }
    return ListView.builder(
      itemCount: withdData.withdrwal.length,
      itemBuilder: (context, index) {
        return WithdrwalItem((withdData.withdrwal.values.toList())[index]);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final withdData = Provider.of<Withdrwals>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Wthidrwals'),
      ),
      drawer: AppDrawer(),
      body: showConditions(withdData),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          return _addNewWithdrwals(context);
        },
        child: Icon(Icons.add),
        foregroundColor: Theme.of(context).colorScheme.background,
      ),
    );
  }
}
