import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/order.dart';
import '../widgets/order_item_ticket.dart';

class OrderArchiveScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final orderData = Provider.of<Orders>(context).orders;
    return Container(
      child: ListView.builder(
        itemCount: orderData.length,
        itemBuilder: (context, index) {
          return OrderItemTicket(orderData[index]);
        },
      ),
    );
  }
}
