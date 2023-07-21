import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/items.dart';

class dailyTableHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.symmetric(
                horizontal: 5,
                vertical: 2,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Container(
                      height: 30,
                      padding: EdgeInsets.all(3),
                      decoration: BoxDecoration(border: Border.all(width: 1)),
                      child: FittedBox(
                        child: Text(
                          'Items',
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      height: 30,
                      padding: EdgeInsets.all(3),
                      decoration: BoxDecoration(border: Border.all(width: 1)),
                      child: FittedBox(
                        child: Text(
                          'Passed',
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      height: 30,
                      padding: EdgeInsets.all(3),
                      decoration: BoxDecoration(border: Border.all(width: 1)),
                      child: FittedBox(
                        child: Text(
                          'Maked',
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      height: 30,
                      padding: EdgeInsets.all(3),
                      decoration: BoxDecoration(border: Border.all(width: 1)),
                      child: FittedBox(
                        child: Text(
                          'Stale',
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      height: 30,
                      padding: EdgeInsets.all(3),
                      decoration: BoxDecoration(border: Border.all(width: 1)),
                      child: FittedBox(
                        child: Text(
                          'Sold',
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      height: 30,
                      padding: EdgeInsets.all(3),
                      decoration: BoxDecoration(border: Border.all(width: 1)),
                      child: FittedBox(
                        child: Text(
                          'Sold price',
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
