import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:kal_dabo/providers/items.dart';
import 'package:provider/provider.dart';

class ProductDetail extends StatelessWidget {
  static const routeName = '/proDetails';
  @override
  Widget build(BuildContext context) {
    final id = ModalRoute.of(context)!.settings.arguments.toString();
    final item = Provider.of<Items>(context).findById(id);
    return Scaffold(
        appBar: AppBar(
          title: Text(item.title),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [const Text('title'), Text(item.title)],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [const Text('price'), Text(item.itemPrice.toString())],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [const Text('quantity'), Text(item.maked.toString())],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [const Text('passed'), Text(item.passed.toString())],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [const Text('stale'), Text(item.stale.toString())],
            ),
          ],
        ));
  }
}
