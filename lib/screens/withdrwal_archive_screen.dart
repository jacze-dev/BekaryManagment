import 'package:flutter/material.dart';
import 'package:kal_dabo/providers/withdrwal.dart';
import 'package:provider/provider.dart';

import '../widgets/withdrwal_item.dart';

class WithdrwalArchiveScreen extends StatelessWidget {
  Widget showConditions(Withdrwals withdData) {
    if (withdData.withdrwal.isEmpty) {
      return const Center(
        child: Text('No Withdrwals!'),
      );
    }
    return ListView.builder(
      itemCount: withdData.withdrwal.length,
      itemBuilder: (context, index) {
        return WithdrwalItem(withdData.withdrwal.values.toList()[index]);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final withdData = Provider.of<Withdrwals>(context);
    return showConditions(withdData);
  }
}
