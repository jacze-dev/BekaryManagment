import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:kal_dabo/providers/items.dart';
import 'package:kal_dabo/screens/product_edit_screen.dart';
import 'package:provider/provider.dart';

import '../screens/product_detail.dart';

class ProductItemTicket extends StatelessWidget {
  final String name;
  final double price;
  final String id;

  ProductItemTicket({
    required this.id,
    required this.name,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    final itemData = Provider.of<Items>(context);
    return InkWell(
      onTap: () {
        Navigator.of(context).pushNamed(ProductDetail.routeName, arguments: id);
      },
      child: ListTile(
        title: Text(name),
        leading: CircleAvatar(
          child: FittedBox(child: Text('\$${price}')),
        ),
        trailing: Container(
          width: 100,
          child: Row(
            children: [
              IconButton(
                  onPressed: () {
                    Navigator.of(context)
                        .pushNamed(ProductEditScreen.routeName, arguments: id);
                  },
                  icon: Icon(Icons.edit)),
              IconButton(
                  onPressed: () {
                    itemData.deleteItem(id);
                  },
                  icon: Icon(Icons.delete)),
            ],
          ),
        ),
      ),
    );
  }
}
