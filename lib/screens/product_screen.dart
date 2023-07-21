import 'package:flutter/material.dart';
import 'package:kal_dabo/providers/items.dart';

import '../screens/product_edit_screen.dart';
import 'package:provider/provider.dart';
import '../widgets/app_drawer.dart';
import '../widgets/products_item_tickets.dart';

class ProductScreern extends StatefulWidget {
  static const routeName = '/products';

  @override
  State<ProductScreern> createState() => _ProductScreernState();
}

class _ProductScreernState extends State<ProductScreern> {
  @override
  Widget build(BuildContext context) {
    final itemsData = Provider.of<Items>(context).Itemlist as List<Item>;
    return Scaffold(
      appBar: AppBar(
        title: Text('Products'),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.of(context)
                    .pushNamed(ProductEditScreen.routeName, arguments: 'new');
              },
              icon: Icon(Icons.add))
        ],
      ),
      drawer: AppDrawer(),
      body: Container(
        child: ListView.builder(
          itemCount: itemsData.length,
          itemBuilder: (context, index) {
            return ProductItemTicket(
                id: itemsData[index].id,
                name: itemsData[index].title,
                price: itemsData[index].itemPrice);
          },
        ),
      ),
    );
  }
}
