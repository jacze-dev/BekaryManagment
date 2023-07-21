import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/items.dart';

class DailySoldTable extends StatelessWidget {
  final String id;
  final String title;
  final int passed;
  final int maked;
  final int stale;
  final int sold;
  final double soldPrice;

  DailySoldTable(this.id, this.title, this.passed, this.maked, this.stale,
      this.sold, this.soldPrice);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Container(
              height: 30,
              padding: EdgeInsets.all(3),
              decoration: BoxDecoration(border: Border.all(width: 1)),
              child: FittedBox(
                child: Text(title),
              ),
            ),
          ),
          Expanded(
            child: Container(
              height: 30,
              padding: EdgeInsets.all(3),
              decoration: BoxDecoration(border: Border.all(width: 1)),
              child: FittedBox(
                child: Text('$passed'),
              ),
            ),
          ),
          Expanded(
            child: Container(
              height: 30,
              padding: EdgeInsets.all(3),
              decoration: BoxDecoration(border: Border.all(width: 1)),
              child: FittedBox(
                child: Text('$maked'),
              ),
            ),
          ),
          Expanded(
            child: Container(
              height: 30,
              padding: EdgeInsets.all(3),
              decoration: BoxDecoration(border: Border.all(width: 1)),
              child: FittedBox(
                child: Text('$stale'),
              ),
            ),
          ),
          Expanded(
            child: Container(
              height: 30,
              padding: EdgeInsets.all(3),
              decoration: BoxDecoration(border: Border.all(width: 1)),
              child: FittedBox(
                child: Text('$sold'),
              ),
            ),
          ),
          Expanded(
            child: Container(
              height: 30,
              padding: EdgeInsets.all(3),
              decoration: BoxDecoration(border: Border.all(width: 1)),
              child: FittedBox(
                child: Text('$soldPrice'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
