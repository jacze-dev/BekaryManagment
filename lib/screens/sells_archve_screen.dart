import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widgets/daily_table_header.dart';
import '../providers/items.dart';
import '../widgets/daily_sold_table.dart';

class SellsArchiveScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          dailyTableHeader(),
          Consumer<Items>(
            builder: (context, itemsData, child) => Container(
              height: 500,
              child: ListView.builder(
                itemBuilder: (context, index) {
                  return DailySoldTable(
                      itemsData.Itemlist[index].id,
                      itemsData.Itemlist[index].title,
                      itemsData.Itemlist[index].passed,
                      itemsData.Itemlist[index].maked,
                      itemsData.Itemlist[index].stale,
                      itemsData.getSold(index),
                      itemsData.getPrice(index));
                },
                itemCount: itemsData.Itemlist.length,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
