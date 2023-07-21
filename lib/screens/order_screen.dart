import 'package:flutter/material.dart';
import 'package:kal_dabo/screens/edit_order_screen.dart';
import 'package:provider/provider.dart';

import '../providers/order_cart.dart';
import '../widgets/app_drawer.dart';
import '../providers/order.dart';
import '../widgets/order_item_ticket.dart';

class OrderScreen extends StatelessWidget {
  static const routeName = '/orders-screen';

  Widget showConditions(Orders ordersData) {
    if (ordersData.orders.isEmpty) {
      return const Center(
        child: Text('No orders added yet!'),
      );
    }
    return ListView.builder(
      itemCount: ordersData.orders.length,
      itemBuilder: (context, index) {
        return OrderItemTicket(ordersData.orders[index]);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final orderItemData = Provider.of<OrderItems>(context);
    final orderData = Provider.of<Orders>(context);

    return Scaffold(
      appBar: AppBar(title: const Text('Orders')),
      drawer: AppDrawer(),
      body: showConditions(orderData),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pushNamed(
            EditOrderScreen.routeName,
            arguments: 'false',
          );
        },
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }
}
